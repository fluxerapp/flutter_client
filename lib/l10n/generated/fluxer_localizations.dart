import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'fluxer_localizations_ar.dart';
import 'fluxer_localizations_cs.dart';
import 'fluxer_localizations_da.dart';
import 'fluxer_localizations_de.dart';
import 'fluxer_localizations_el.dart';
import 'fluxer_localizations_en.dart';
import 'fluxer_localizations_es.dart';
import 'fluxer_localizations_fi.dart';
import 'fluxer_localizations_fr.dart';
import 'fluxer_localizations_hu.dart';
import 'fluxer_localizations_it.dart';
import 'fluxer_localizations_ja.dart';
import 'fluxer_localizations_ko.dart';
import 'fluxer_localizations_lt.dart';
import 'fluxer_localizations_nb.dart';
import 'fluxer_localizations_pl.dart';
import 'fluxer_localizations_pt.dart';
import 'fluxer_localizations_ru.dart';
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
    Locale('ar'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en', 'GB'),
    Locale('en', 'US'),
    Locale('es'),
    Locale('es', '419'),
    Locale('fi'),
    Locale('fr'),
    Locale('hu'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('lt'),
    Locale('nb'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ru'),
    Locale('sv'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh'),
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

  /// Toast shown when the stored session is rejected by the server and the user is signed out to the login screen.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get sessionExpiredToast;

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

  /// CTA on maintenance and other nagbars that open an external link.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get nagbarLearnMore;

  /// Maintenance nagbar before planned work begins.
  ///
  /// In en, this message translates to:
  /// **'Maintenance is scheduled for {localizedTime}. Expected duration: {duration}.'**
  String nagbarMaintenanceScheduled(String localizedTime, String duration);

  /// Maintenance nagbar while work is active.
  ///
  /// In en, this message translates to:
  /// **'Maintenance is in progress. Expected duration: {duration}.'**
  String nagbarMaintenanceInProgress(String duration);

  /// Maintenance nagbar after planned work finishes.
  ///
  /// In en, this message translates to:
  /// **'Maintenance is complete.'**
  String get nagbarMaintenanceComplete;

  /// Unclaimed account nagbar body.
  ///
  /// In en, this message translates to:
  /// **'Hey {displayName}, claim your account to prevent losing access.'**
  String nagbarUnclaimedAccountMessage(String displayName);

  /// Email verification nagbar body.
  ///
  /// In en, this message translates to:
  /// **'Hey {displayName}, please verify your email address.'**
  String nagbarEmailVerificationMessage(String displayName);

  /// Nagbar CTA that opens user settings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get nagbarOpenSettings;

  /// Title for the system permission settings prompt modal.
  ///
  /// In en, this message translates to:
  /// **'Enable permission'**
  String get systemPermissionSettingsTitle;

  /// Primary action that opens the device app settings for a blocked permission.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get systemPermissionSettingsOpenSettings;

  /// Body text when microphone access must be enabled in system settings.
  ///
  /// In en, this message translates to:
  /// **'Fluxer doesn\'t have access to your microphone. You can enable it in your device privacy settings.'**
  String get systemPermissionMicrophoneMessage;

  /// Body text when camera access must be enabled in system settings.
  ///
  /// In en, this message translates to:
  /// **'Fluxer doesn\'t have access to your camera. You can enable it in your device privacy settings.'**
  String get systemPermissionCameraMessage;

  /// Body text when notification permission must be enabled in system settings.
  ///
  /// In en, this message translates to:
  /// **'Fluxer doesn\'t have permission to send notifications. You can enable it in your device settings.'**
  String get systemPermissionNotificationsMessage;

  /// Premium grace period nagbar body.
  ///
  /// In en, this message translates to:
  /// **'Your subscription failed to renew, but you still have access to {productName} perks until {graceDate}. Take action now or you\'ll lose all perks.'**
  String nagbarPremiumGracePeriod(String productName, String graceDate);

  /// Premium expired nagbar body.
  ///
  /// In en, this message translates to:
  /// **'Your {productName} subscription has expired. Renew now to keep your perks.'**
  String nagbarPremiumExpired(String productName);

  /// Nagbar CTA that opens the billing portal.
  ///
  /// In en, this message translates to:
  /// **'Manage subscription'**
  String get nagbarManageSubscription;

  /// Premium onboarding nagbar default body.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {productFullName}. Explore your {productName} perks and manage your subscription.'**
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  );

  /// Premium onboarding nagbar CTA.
  ///
  /// In en, this message translates to:
  /// **'View {productName} features'**
  String nagbarViewPremiumFeatures(String productName);

  /// Gift inventory nagbar when one unread gift exists.
  ///
  /// In en, this message translates to:
  /// **'You have a new gift code waiting in your gift inventory.'**
  String get nagbarGiftInventoryOne;

  /// Gift inventory nagbar when multiple unread gifts exist.
  ///
  /// In en, this message translates to:
  /// **'You have {count} new gift codes waiting in your gift inventory.'**
  String nagbarGiftInventoryMany(int count);

  /// Gift inventory nagbar CTA.
  ///
  /// In en, this message translates to:
  /// **'View gift inventory'**
  String get nagbarViewGiftInventory;

  /// Visionary MFA nagbar body.
  ///
  /// In en, this message translates to:
  /// **'Enable two-factor authentication to protect your Visionary account.'**
  String get nagbarVisionaryMfa;

  /// Visionary MFA nagbar CTA.
  ///
  /// In en, this message translates to:
  /// **'Enable 2FA'**
  String get nagbarEnableMfa;

  /// Terms acceptance nagbar body.
  ///
  /// In en, this message translates to:
  /// **'We\'ve updated our terms. Please review and accept them to continue.'**
  String get nagbarTermsAcceptance;

  /// Terms acceptance nagbar CTA.
  ///
  /// In en, this message translates to:
  /// **'Review terms'**
  String get nagbarReviewTerms;

  /// Official community membership nagbar body.
  ///
  /// In en, this message translates to:
  /// **'Join {communityName} to chat with the team and stay up to date.'**
  String nagbarGuildMembershipCta(String communityName);

  /// Official community membership nagbar CTA.
  ///
  /// In en, this message translates to:
  /// **'Join {communityName}'**
  String nagbarJoinCommunity(String communityName);

  /// Push notification permission nagbar body.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications so you don\'t miss messages and mentions.'**
  String get nagbarPushNotification;

  /// Push notification permission nagbar CTA.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications'**
  String get nagbarEnableNotifications;

  /// Toast when opening the billing portal from a nagbar fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open the billing portal. Please try again in a moment.'**
  String get nagbarBillingPortalFailed;

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

  /// Button label that starts single sign-on.
  ///
  /// In en, this message translates to:
  /// **'Continue with {provider}'**
  String continueWithSso(String provider);

  /// Short sign-in note shown when the instance requires single sign-on.
  ///
  /// In en, this message translates to:
  /// **'SSO is required to access this instance.'**
  String get ssoRequired;

  /// Description shown when sign-in is restricted to the configured SSO provider.
  ///
  /// In en, this message translates to:
  /// **'Sign in with your organization\'s single sign-on provider.'**
  String get organizationSsoProvider;

  /// Login flow error shown when the single sign-on redirect cannot be started.
  ///
  /// In en, this message translates to:
  /// **'Failed to start SSO'**
  String get failedToStartSso;

  /// Shown when the user cancels the single sign-on browser flow.
  ///
  /// In en, this message translates to:
  /// **'SSO login was cancelled'**
  String get ssoCancelled;

  /// Optional sign-in note when SSO is available but not required.
  ///
  /// In en, this message translates to:
  /// **'Prefer using SSO? Continue with {provider}.'**
  String preferSso(String provider);

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

  /// Button to join a group DM from an invite embed card.
  ///
  /// In en, this message translates to:
  /// **'Join group'**
  String get embedInviteJoinGroup;

  /// Disabled button label on a group DM invite embed when the user is already a member.
  ///
  /// In en, this message translates to:
  /// **'Already joined'**
  String get embedInviteAlreadyJoined;

  /// Title of the invite accept modal.
  ///
  /// In en, this message translates to:
  /// **'You\'ve been invited to join'**
  String get inviteAcceptTitle;

  /// Primary action to join a community from the invite modal.
  ///
  /// In en, this message translates to:
  /// **'Join Community'**
  String get inviteAcceptJoinButton;

  /// Primary action when the user is already a member of the invited community.
  ///
  /// In en, this message translates to:
  /// **'Go to Community'**
  String get inviteAcceptGoToButton;

  /// Disabled action label when community invites are paused.
  ///
  /// In en, this message translates to:
  /// **'Invites Paused'**
  String get inviteAcceptInvitesPaused;

  /// Title when an invite link is expired or invalid.
  ///
  /// In en, this message translates to:
  /// **'Invite Invalid'**
  String get inviteAcceptNotFoundTitle;

  /// Description when an invite link is expired or invalid.
  ///
  /// In en, this message translates to:
  /// **'This invite may be expired or invalid.'**
  String get inviteAcceptNotFoundDescription;

  /// Title when a deep link or route cannot be opened in the app.
  ///
  /// In en, this message translates to:
  /// **'Link couldn\'t be opened'**
  String get invalidDeepLinkTitle;

  /// Explanation shown when a deep link or route cannot be opened in the app.
  ///
  /// In en, this message translates to:
  /// **'This link may be broken, only available on the web, or you might not have access. Check the link and try again.'**
  String get invalidDeepLinkDescription;

  /// Primary action on the invalid deep link screen to return to the home tab.
  ///
  /// In en, this message translates to:
  /// **'Go to home'**
  String get invalidDeepLinkGoHomeButton;

  /// Primary action to join a group DM from the invite modal.
  ///
  /// In en, this message translates to:
  /// **'Join group'**
  String get inviteAcceptJoinGroupButton;

  /// Description for a group DM invite in the accept modal.
  ///
  /// In en, this message translates to:
  /// **'You\'ve been invited to join a group DM by {inviterName}'**
  String inviteAcceptGroupDmDescription(String inviterName);

  /// Fallback inviter name when the inviter is unknown.
  ///
  /// In en, this message translates to:
  /// **'someone'**
  String get inviteAcceptSomeone;

  /// Label for an emoji pack invite.
  ///
  /// In en, this message translates to:
  /// **'Emoji pack'**
  String get inviteAcceptEmojiPack;

  /// Label for a sticker pack invite.
  ///
  /// In en, this message translates to:
  /// **'Sticker pack'**
  String get inviteAcceptStickerPack;

  /// Primary action to install an emoji pack from an invite.
  ///
  /// In en, this message translates to:
  /// **'Install emoji pack'**
  String get inviteAcceptInstallEmojiPack;

  /// Primary action to install a sticker pack from an invite.
  ///
  /// In en, this message translates to:
  /// **'Install sticker pack'**
  String get inviteAcceptInstallStickerPack;

  /// Note shown on expression pack invites before accepting.
  ///
  /// In en, this message translates to:
  /// **'Accepting this invite installs the pack automatically.'**
  String get inviteAcceptPackInstallNote;

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

  /// Gift duration title for a lifetime Visionary entitlement.
  ///
  /// In en, this message translates to:
  /// **'Visionary (lifetime {productName})'**
  String embedGiftVisionaryLifetime(String productName);

  /// Gift duration title in days.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day of {productName}} other{{count} days of {productName}}}'**
  String embedGiftDurationDays(int count, String productName);

  /// Gift duration title in weeks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 week of {productName}} other{{count} weeks of {productName}}}'**
  String embedGiftDurationWeeks(int count, String productName);

  /// Gift duration title in months.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month of {productName}} other{{count} months of {productName}}}'**
  String embedGiftDurationMonths(int count, String productName);

  /// Gift duration title in years.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year of {productName}} other{{count} years of {productName}}}'**
  String embedGiftDurationYears(int count, String productName);

  /// Sender label on a gift code embed.
  ///
  /// In en, this message translates to:
  /// **'From {creatorTag}'**
  String embedGiftFrom(String creatorTag);

  /// Help text on a redeemable gift embed.
  ///
  /// In en, this message translates to:
  /// **'Click to claim your gift!'**
  String get embedGiftClaimHelp;

  /// Help text when a gift code has already been claimed.
  ///
  /// In en, this message translates to:
  /// **'Already redeemed'**
  String get embedGiftAlreadyRedeemed;

  /// Help text on a gift embed for unclaimed accounts.
  ///
  /// In en, this message translates to:
  /// **'Claim your account to redeem this gift.'**
  String get embedGiftClaimAccountHelp;

  /// Primary button on a redeemable gift embed.
  ///
  /// In en, this message translates to:
  /// **'Claim gift'**
  String get embedGiftClaim;

  /// Disabled button label after a gift is claimed.
  ///
  /// In en, this message translates to:
  /// **'Gift claimed'**
  String get embedGiftClaimed;

  /// Button on a gift embed for unclaimed accounts.
  ///
  /// In en, this message translates to:
  /// **'Claim account to redeem'**
  String get embedGiftClaimAccount;

  /// Title when a gift code cannot be resolved.
  ///
  /// In en, this message translates to:
  /// **'Unknown gift'**
  String get embedGiftUnknownTitle;

  /// Subtitle when a gift code cannot be resolved.
  ///
  /// In en, this message translates to:
  /// **'This gift code is invalid or already claimed.'**
  String get embedGiftUnknownSubtitle;

  /// Disabled button when a gift cannot be claimed.
  ///
  /// In en, this message translates to:
  /// **'Gift unavailable'**
  String get embedGiftUnavailable;

  /// Help text on the gift accept modal for a claimable gift.
  ///
  /// In en, this message translates to:
  /// **'Claim your gift to activate your {productName} subscription!'**
  String giftAcceptClaimSubscription(String productName);

  /// Help text on the gift accept modal when already redeemed.
  ///
  /// In en, this message translates to:
  /// **'This gift has already been claimed.'**
  String get giftAcceptAlreadyClaimed;

  /// Secondary dismiss button on the gift accept modal.
  ///
  /// In en, this message translates to:
  /// **'Maybe later'**
  String get giftAcceptMaybeLater;

  /// Success toast after redeeming a gift code.
  ///
  /// In en, this message translates to:
  /// **'Gift redeemed!'**
  String get giftRedeemedToast;

  /// Error modal title for an invalid gift code.
  ///
  /// In en, this message translates to:
  /// **'Invalid gift code'**
  String get giftRedeemInvalidTitle;

  /// Error modal body for an invalid gift code.
  ///
  /// In en, this message translates to:
  /// **'This code is invalid or already used.'**
  String get giftRedeemInvalidMessage;

  /// Error modal title when a gift was already redeemed.
  ///
  /// In en, this message translates to:
  /// **'Gift already redeemed'**
  String get giftRedeemAlreadyRedeemedTitle;

  /// Error modal body when a gift was already redeemed.
  ///
  /// In en, this message translates to:
  /// **'This code was already redeemed.'**
  String get giftRedeemAlreadyRedeemedMessage;

  /// Error modal title when a gift code does not exist.
  ///
  /// In en, this message translates to:
  /// **'Gift not found'**
  String get giftRedeemNotFoundTitle;

  /// Error modal body when a gift code does not exist.
  ///
  /// In en, this message translates to:
  /// **'This code doesn\'t exist.'**
  String get giftRedeemNotFoundMessage;

  /// Generic gift redeem error modal title.
  ///
  /// In en, this message translates to:
  /// **'Failed to redeem gift'**
  String get giftRedeemFailedTitle;

  /// Generic gift redeem error modal body.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t redeem this gift. Try again.'**
  String get giftRedeemFailedMessage;

  /// Error modal title when a Visionary user cannot redeem Plutonium.
  ///
  /// In en, this message translates to:
  /// **'Can\'t redeem this gift'**
  String get giftVisionaryCannotRedeemTitle;

  /// Error modal body when a Visionary user cannot redeem Plutonium.
  ///
  /// In en, this message translates to:
  /// **'Visionary accounts can\'t redeem Plutonium gifts. Copy the link to share it with a friend instead.'**
  String get giftVisionaryCannotRedeemMessage;

  /// Button to copy a gift share URL.
  ///
  /// In en, this message translates to:
  /// **'Copy gift link'**
  String get giftCopyLink;

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

  /// Radio option to inherit notification settings from the channel category.
  ///
  /// In en, this message translates to:
  /// **'Use Category Default'**
  String get notificationUseCategoryDefault;

  /// Radio option to inherit notification settings from the community.
  ///
  /// In en, this message translates to:
  /// **'Use Community Default'**
  String get notificationUseCommunityDefault;

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
  /// **'Edit group'**
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

  /// Fallback title for a group DM without a custom name.
  ///
  /// In en, this message translates to:
  /// **'Unnamed group'**
  String get dmUnnamedGroup;

  /// Fallback title when the current user is the only participant in a group DM.
  ///
  /// In en, this message translates to:
  /// **'{resolvedName}\'s group'**
  String dmOwnersGroup(String resolvedName);

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

  /// Category context menu action to debug category data.
  ///
  /// In en, this message translates to:
  /// **'Debug Category'**
  String get dmDebugCategory;

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

  /// Error when no user matches the entered username.
  ///
  /// In en, this message translates to:
  /// **'No user found with that username.'**
  String get addFriendNoUserFound;

  /// Error when the username format is invalid.
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

  /// Title for the username change bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Change Your Username'**
  String get changeYourFluxerTag;

  /// Label above the username and discriminator input fields.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get fluxerTagInputLabel;

  /// Base description text on the username change sheet.
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
  /// **'Username Already Taken'**
  String get fluxerTagAlreadyTaken;

  /// Body text when the requested username is taken.
  ///
  /// In en, this message translates to:
  /// **'The username {username}#{discriminator} is already taken. Continuing will reroll your discriminator automatically.'**
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
  /// **'If you save this username, your custom 4-digit tag will revert to a random number when your Plutonium subscription ends. If your subscription fails to renew, you\'ll have a 3-day grace period before the tag changes.'**
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

  /// Success toast after username change.
  ///
  /// In en, this message translates to:
  /// **'Username updated'**
  String get fluxerTagUpdated;

  /// Error message when username update fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to update username. Please try again.'**
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

  /// Tooltip when unverified user hovers the disabled Change Username button.
  ///
  /// In en, this message translates to:
  /// **'Claim your account to change your username'**
  String get claimAccountToChangeFluxerTag;

  /// Button label to open the username change flow.
  ///
  /// In en, this message translates to:
  /// **'Change Username'**
  String get changeFluxerTag;

  /// Tooltip on the crown upsell button next to the username button.
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
  /// **'PNG, JPEG, WebP, GIF. Max 10MB. Recommended: 512×512px'**
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
  /// **'PNG, JPEG, WebP, GIF. Max 10MB. Minimum: 960×540px (16:9)'**
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
  /// **'Manage your phone number.'**
  String get securityPhoneSectionDescription;

  /// Label for phone number row.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get securityPhoneLabel;

  /// Shown when no phone number is set.
  ///
  /// In en, this message translates to:
  /// **'No phone number added.'**
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

  /// Toast after phone removed.
  ///
  /// In en, this message translates to:
  /// **'Phone number removed'**
  String get securityPhoneRemoved;

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
  /// **'We\'ll send an SMS code when available. Your number is not linked to your account. We keep only an encrypted marker, with no user ID, to allow at most 2 verifications in about 30 days.'**
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

  /// Toast after phone verified.
  ///
  /// In en, this message translates to:
  /// **'Phone number verified'**
  String get phoneAddSuccess;

  /// Label for country selector in phone verification.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get phoneCountryLabel;

  /// Search hint for country selector.
  ///
  /// In en, this message translates to:
  /// **'Search countries...'**
  String get phoneSearchCountries;

  /// Validation error when phone number is empty.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneNumberRequired;

  /// Validation error for invalid phone format.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid mobile phone number.'**
  String get phoneEnterValidNumber;

  /// API error when phone number is rejected.
  ///
  /// In en, this message translates to:
  /// **'This phone number cannot be used. Try another mobile number or contact support.'**
  String get phoneCannotBeUsed;

  /// API error when phone number was reused.
  ///
  /// In en, this message translates to:
  /// **'This phone number has already been used. Try another number or contact support.'**
  String get phoneAlreadyUsed;

  /// API error for invalid verification code.
  ///
  /// In en, this message translates to:
  /// **'That code didn\'t work. Check it and try again.'**
  String get phoneCodeDidNotWork;

  /// Rate limit error for phone verification.
  ///
  /// In en, this message translates to:
  /// **'Too many attempts. Wait a bit, then try again.'**
  String get phoneTooManyAttempts;

  /// SMS provider unavailable error.
  ///
  /// In en, this message translates to:
  /// **'SMS verification is unavailable right now. Try again later or contact support.'**
  String get phoneSmsUnavailable;

  /// Account not eligible for phone verification.
  ///
  /// In en, this message translates to:
  /// **'Phone verification is not available for this account. Use another method or contact support.'**
  String get phoneNotEligible;

  /// Captcha required for phone verification.
  ///
  /// In en, this message translates to:
  /// **'A browser check is required before phone verification. Try again from the sign-in page or contact support.'**
  String get phoneCaptchaRequired;

  /// Generic phone verification error.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Try again.'**
  String get phoneSomethingWentWrong;

  /// Inbound challenge reason for expensive destinations.
  ///
  /// In en, this message translates to:
  /// **'Sending an SMS to this phone number is too expensive, so we need you to send us an SMS instead. You can also contact support to have us lift this requirement from your account.'**
  String get phoneInboundExpensiveDescription;

  /// Default inbound challenge description.
  ///
  /// In en, this message translates to:
  /// **'We need you to send us an SMS to verify your phone number.'**
  String get phoneInboundDefaultDescription;

  /// Inbound verification step 1.
  ///
  /// In en, this message translates to:
  /// **'Open your phone\'s messaging app and create a new text message.'**
  String get phoneInboundStepOpenMessaging;

  /// Inbound verification step 2.
  ///
  /// In en, this message translates to:
  /// **'Send the code {code} to {number}.'**
  String phoneInboundStepSendCode(String code, String number);

  /// Inbound verification step 3.
  ///
  /// In en, this message translates to:
  /// **'Wait for us to receive your message. This can take a minute.'**
  String get phoneInboundStepWait;

  /// Button to refresh inbound challenge.
  ///
  /// In en, this message translates to:
  /// **'Get new code'**
  String get phoneInboundGetNewCode;

  /// Label for inbound challenge code.
  ///
  /// In en, this message translates to:
  /// **'Code to send'**
  String get phoneInboundChallengeCodeLabel;

  /// Label for inbound destination number.
  ///
  /// In en, this message translates to:
  /// **'Send to'**
  String get phoneInboundOurNumberLabel;

  /// Title for required action blocking modal.
  ///
  /// In en, this message translates to:
  /// **'Account verification required'**
  String get requiredActionTitle;

  /// Generic required action intro.
  ///
  /// In en, this message translates to:
  /// **'Complete the required verification to continue using Fluxer.'**
  String get requiredActionIntroGeneric;

  /// Phone-only required action intro.
  ///
  /// In en, this message translates to:
  /// **'Your registration needs an extra anti-spam check before you can continue.'**
  String get requiredActionIntroPhone;

  /// Email or phone required action intro.
  ///
  /// In en, this message translates to:
  /// **'Verify your email or phone to continue using Fluxer.'**
  String get requiredActionIntroEmailOrPhone;

  /// Email and phone required action intro.
  ///
  /// In en, this message translates to:
  /// **'Complete the required email and phone verification steps below to continue using Fluxer.'**
  String get requiredActionIntroEmailAndPhone;

  /// Title when user can pick email or phone.
  ///
  /// In en, this message translates to:
  /// **'Choose a verification method'**
  String get requiredActionChooseMethodTitle;

  /// Description when user can pick email or phone.
  ///
  /// In en, this message translates to:
  /// **'Complete one of the verification paths below to continue using Fluxer.'**
  String get requiredActionChooseMethodDescription;

  /// Button to choose email verification.
  ///
  /// In en, this message translates to:
  /// **'Use email'**
  String get requiredActionUseEmail;

  /// Button to choose phone verification.
  ///
  /// In en, this message translates to:
  /// **'Use phone'**
  String get requiredActionUsePhone;

  /// Title for email verification instructions.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get requiredActionCheckEmailTitle;

  /// Description for email verification instructions.
  ///
  /// In en, this message translates to:
  /// **'We sent a verification link to your email address. Open it to continue.'**
  String get requiredActionCheckEmailDescription;

  /// Button to resend verification email.
  ///
  /// In en, this message translates to:
  /// **'Resend verification email'**
  String get requiredActionResendVerificationEmail;

  /// Toast after resending verification email.
  ///
  /// In en, this message translates to:
  /// **'Verification email sent. Check your inbox.'**
  String get requiredActionVerificationEmailSent;

  /// Sign out button in required action modal.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get requiredActionSignOut;

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

  /// Title for the guild ownership warning modal when trying to delete account.
  ///
  /// In en, this message translates to:
  /// **'Cannot delete account'**
  String get dangerZoneDeleteCannotDeleteAccount;

  /// Warning message shown when user owns communities and tries to delete account.
  ///
  /// In en, this message translates to:
  /// **'You cannot delete your account while you own communities. Transfer ownership of the following communities first:'**
  String get dangerZoneDeleteOwnsCommunities;

  /// Shown when user owns more than 3 communities.
  ///
  /// In en, this message translates to:
  /// **'and {count} more'**
  String dangerZoneDeleteAndXMore(int count);

  /// Instructions for transferring community ownership.
  ///
  /// In en, this message translates to:
  /// **'To transfer ownership, go to {settingsPath} and use the transfer ownership option.'**
  String dangerZoneDeleteTransferInstructions(String settingsPath);

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
  /// **'Copy username'**
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

  /// Accessible label for the user profile skeleton while profile data is loading.
  ///
  /// In en, this message translates to:
  /// **'Loading profile'**
  String get userProfileLoading;

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

  /// Button label on the composer barrier shown when messaging a blocked user.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get blockedUserComposerBarrierAction;

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

  /// Section header for a member's community roles on their profile.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get userProfileRoles;

  /// Button label to add a role to a member.
  ///
  /// In en, this message translates to:
  /// **'Add role'**
  String get memberRoleAdd;

  /// Button label to remove a role from a member.
  ///
  /// In en, this message translates to:
  /// **'Remove role {roleName}'**
  String memberRoleRemove(String roleName);

  /// Empty state when a member has no assigned roles.
  ///
  /// In en, this message translates to:
  /// **'This user has no roles in this community.'**
  String get userProfileNoRolesInCommunity;

  /// Empty state in the role picker when the community has no roles.
  ///
  /// In en, this message translates to:
  /// **'No roles yet. Add roles in {rolesSettingsPath}'**
  String memberRolesNoRolesYet(String rolesSettingsPath);

  /// Title when there are no roles to assign.
  ///
  /// In en, this message translates to:
  /// **'No roles available'**
  String get memberRolesNoRolesAvailable;

  /// Body when there are no roles to assign.
  ///
  /// In en, this message translates to:
  /// **'There are no roles to assign in this community at this time, but you can create a new role in {rolesSettingsPath}.'**
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath);

  /// Root label for community settings.
  ///
  /// In en, this message translates to:
  /// **'Community settings'**
  String get guildSettingsTitle;

  /// Community settings tab label for roles.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get guildSettingsRolesTab;

  /// Confirm button for the no roles available dialog.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get memberRolesConfirmOk;

  /// Profile section title for a user's local time.
  ///
  /// In en, this message translates to:
  /// **'Local time'**
  String get userProfileLocalTime;

  /// Profile timezone difference when the target matches the viewer.
  ///
  /// In en, this message translates to:
  /// **'Same time as you'**
  String get userProfileSameTimeAsYou;

  /// Profile timezone difference when the target is ahead of the viewer.
  ///
  /// In en, this message translates to:
  /// **'{duration} ahead of you'**
  String userProfileTimeAheadOfYou(String duration);

  /// Profile timezone difference when the target is behind the viewer.
  ///
  /// In en, this message translates to:
  /// **'{duration} behind you'**
  String userProfileTimeBehindYou(String duration);

  /// Duration phrase in the profile timezone section.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =1{1 hour} other{{hours} hours}} {minutes, plural, =1{1 minute} other{{minutes} minutes}}'**
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes);

  /// Hours-only duration phrase in the profile timezone section.
  ///
  /// In en, this message translates to:
  /// **'{hours, plural, =1{1 hour} other{{hours} hours}}'**
  String userProfileTimezoneDurationHours(int hours);

  /// Minutes-only duration phrase in the profile timezone section.
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, =1{1 minute} other{{minutes} minutes}}'**
  String userProfileTimezoneDurationMinutes(int minutes);

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

  /// Title of the simple community-report sheet.
  ///
  /// In en, this message translates to:
  /// **'Report community'**
  String get iarReportGuildTitle;

  /// Body shown in the pre-confirm dialog before opening the community report sheet.
  ///
  /// In en, this message translates to:
  /// **'If this report is about a specific message in this community, report that message instead. Message reports give our safety team the clearest context, and adding details in the comments can help us review it faster. Only continue with reporting the community as a whole if reporting a message would not capture the broader issue.'**
  String get iarReportGuildPreconfirmBody;

  /// Primary button in the community report pre-confirm dialog.
  ///
  /// In en, this message translates to:
  /// **'Continue to report community'**
  String get iarContinueToReportCommunity;

  /// Subtitle shown under the community name in the IAR preview card.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get iarPreviewCommunitySubtitle;

  /// Community-report reason label for harassment or targeted abuse.
  ///
  /// In en, this message translates to:
  /// **'Harassment or targeted abuse'**
  String get iarReasonHarassmentGuildLabel;

  /// Community-report reason description for harassment or targeted abuse.
  ///
  /// In en, this message translates to:
  /// **'Community facilitates pile-ons or targeted abuse.'**
  String get iarReasonHarassmentGuildDescription;

  /// Community-report reason description for hate speech.
  ///
  /// In en, this message translates to:
  /// **'Promotes hatred against protected groups.'**
  String get iarReasonHateGuildDescription;

  /// Community-report reason label for terrorism or violent extremism.
  ///
  /// In en, this message translates to:
  /// **'Terrorism or violent extremism'**
  String get iarReasonTerrorismLabel;

  /// Community-report reason description for terrorism or violent extremism.
  ///
  /// In en, this message translates to:
  /// **'Promotes, recruits for, or coordinates violent extremist activity.'**
  String get iarReasonTerrorismDescription;

  /// Community-report reason label for mature content or unsafe gating.
  ///
  /// In en, this message translates to:
  /// **'Mature content or unsafe gating'**
  String get iarReasonMatureContentGuildLabel;

  /// Community-report reason description for mature content or unsafe gating.
  ///
  /// In en, this message translates to:
  /// **'Mature content without proper gating.'**
  String get iarReasonMatureContentGuildDescription;

  /// Community-report reason description for child safety.
  ///
  /// In en, this message translates to:
  /// **'Endangers minors or hosts child-exploitation content.'**
  String get iarReasonChildSafetyGuildDescription;

  /// Community-report reason label for raid coordination.
  ///
  /// In en, this message translates to:
  /// **'Raid coordination'**
  String get iarReasonRaidLabel;

  /// Community-report reason description for raid coordination.
  ///
  /// In en, this message translates to:
  /// **'Coordinates raids, brigading, or harassment against people or communities.'**
  String get iarReasonRaidDescription;

  /// Community-report reason description for spam, scams, or phishing.
  ///
  /// In en, this message translates to:
  /// **'Community exists to spam, scam, or abuse the platform.'**
  String get iarReasonSpamGuildDescription;

  /// Community-report reason label for malware distribution.
  ///
  /// In en, this message translates to:
  /// **'Malware distribution'**
  String get iarReasonMalwareGuildLabel;

  /// Community-report reason description for malware distribution.
  ///
  /// In en, this message translates to:
  /// **'Distributes malware, credential theft, or harmful files.'**
  String get iarReasonMalwareGuildDescription;

  /// Community-report reason label for privacy violation or doxxing.
  ///
  /// In en, this message translates to:
  /// **'Privacy violation or doxxing'**
  String get iarReasonPrivacyGuildLabel;

  /// Community-report reason description for privacy violation or doxxing.
  ///
  /// In en, this message translates to:
  /// **'Shares personal info, stalks users, or coordinates privacy abuse.'**
  String get iarReasonPrivacyGuildDescription;

  /// Community-report reason label for self-harm encouragement.
  ///
  /// In en, this message translates to:
  /// **'Encourages self-harm'**
  String get iarReasonSelfHarmGuildLabel;

  /// Community-report reason description for self-harm encouragement.
  ///
  /// In en, this message translates to:
  /// **'Encourages suicide, self-harm, or eating disorders.'**
  String get iarReasonSelfHarmGuildDescription;

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

  /// Accessibility hint when increasing voice message seek position.
  ///
  /// In en, this message translates to:
  /// **'Seek forward'**
  String get voiceMessageSeekForward;

  /// Accessibility hint when decreasing voice message seek position.
  ///
  /// In en, this message translates to:
  /// **'Seek backward'**
  String get voiceMessageSeekBackward;

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

  /// Toast shown after an attachment is saved to the device.
  ///
  /// In en, this message translates to:
  /// **'Saved to photos'**
  String get chatAttachmentDownloadedToast;

  /// Toast shown when an attachment download fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t download attachment'**
  String get chatAttachmentDownloadFailedToast;

  /// Tooltip when a file attachment link is no longer available.
  ///
  /// In en, this message translates to:
  /// **'Attachment expired'**
  String get chatAttachmentExpiredTooltip;

  /// Expand button for textual attachment preview by line count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Expand ({count} line)} other{Expand ({count} lines)}}'**
  String chatTextualPreviewExpandLines(int count);

  /// Collapse button for textual attachment preview by line count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Collapse ({count} line)} other{Collapse ({count} lines)}}'**
  String chatTextualPreviewCollapseLines(int count);

  /// Expand button for CSV attachment preview by row count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Expand ({count} row)} other{Expand ({count} rows)}}'**
  String chatTextualPreviewExpandRows(int count);

  /// Collapse button for CSV attachment preview by row count.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{Collapse ({count} row)} other{Collapse ({count} rows)}}'**
  String chatTextualPreviewCollapseRows(int count);

  /// Suffix when inline textual preview truncates expanded content.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{... ({count} line left)} other{... ({count} lines left)}}'**
  String chatTextualPreviewRemainingLines(int count);

  /// Suffix when inline CSV preview truncates expanded rows.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{... ({count} row left)} other{... ({count} rows left)}}'**
  String chatTextualPreviewRemainingRows(int count);

  /// Opens fullscreen textual attachment preview.
  ///
  /// In en, this message translates to:
  /// **'View whole file'**
  String get chatTextualPreviewViewWholeFile;

  /// Opens language picker for textual attachment syntax highlighting.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get chatTextualPreviewChangeLanguage;

  /// Search field hint in textual preview language picker.
  ///
  /// In en, this message translates to:
  /// **'Search language…'**
  String get chatTextualPreviewSearchLanguage;

  /// Title for textual preview language picker.
  ///
  /// In en, this message translates to:
  /// **'Syntax highlighting'**
  String get chatTextualPreviewSyntaxHighlighting;

  /// Empty state when language search matches nothing.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get chatTextualPreviewNoLanguagesFound;

  /// Accessibility label for textual preview overflow menu.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get chatTextualPreviewMoreOptions;

  /// Toggle soft-wrapping in textual attachment previews.
  ///
  /// In en, this message translates to:
  /// **'Wrap text'**
  String get chatTextualPreviewWrapText;

  /// Error when attachment exceeds textual preview size limit.
  ///
  /// In en, this message translates to:
  /// **'File is too large for inline preview (limit {previewLimitKb} KB).'**
  String chatTextualPreviewSizeError(int previewLimitKb);

  /// Error when textual attachment content cannot be fetched.
  ///
  /// In en, this message translates to:
  /// **'Unable to load preview.'**
  String get chatTextualPreviewLoadError;

  /// Label for plaintext syntax highlighting option.
  ///
  /// In en, this message translates to:
  /// **'Plain text'**
  String get chatTextualPreviewLanguagePlaintext;

  /// Copy textual attachment preview contents to clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get chatTextualPreviewCopy;

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

  /// Tooltip for pasting a file attachment from the clipboard.
  ///
  /// In en, this message translates to:
  /// **'Paste file from clipboard'**
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

  /// Section title for the theme saturation slider on the accessibility settings page.
  ///
  /// In en, this message translates to:
  /// **'Saturation'**
  String get accessibilitySaturationTitle;

  /// Section description for the theme saturation slider on the accessibility settings page.
  ///
  /// In en, this message translates to:
  /// **'Adjust how vivid theme colors appear across the app.'**
  String get accessibilitySaturationDescription;

  /// Section title for visual accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Visual'**
  String get accessibilityVisualGroupTitle;

  /// Toggle label for always underlining links in messages.
  ///
  /// In en, this message translates to:
  /// **'Always underline links'**
  String get accessibilityAlwaysUnderlineLinksLabel;

  /// Toggle label for dimming strikethrough text in messages.
  ///
  /// In en, this message translates to:
  /// **'Dim strikethrough text'**
  String get accessibilityDimStrikethroughTextLabel;

  /// Section title for DM message preview accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'DM message previews'**
  String get accessibilityDmMessagePreviewGroupTitle;

  /// Section description for DM message preview accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Control when message previews are shown in the DM list.'**
  String get accessibilityDmMessagePreviewGroupDescription;

  /// Accessibility label for the DM message preview mode radio group.
  ///
  /// In en, this message translates to:
  /// **'DM message preview mode'**
  String get accessibilityDmMessagePreviewModeLabel;

  /// Radio option name for showing DM previews for all conversations.
  ///
  /// In en, this message translates to:
  /// **'All messages'**
  String get accessibilityDmMessagePreviewAllName;

  /// Radio option description for showing DM previews for all conversations.
  ///
  /// In en, this message translates to:
  /// **'Show message previews for all DM conversations'**
  String get accessibilityDmMessagePreviewAllDescription;

  /// Radio option name for showing DM previews only when unread.
  ///
  /// In en, this message translates to:
  /// **'Unread DMs only'**
  String get accessibilityDmMessagePreviewUnreadOnlyName;

  /// Radio option description for showing DM previews only when unread.
  ///
  /// In en, this message translates to:
  /// **'Only show message previews for DMs with unread messages'**
  String get accessibilityDmMessagePreviewUnreadOnlyDescription;

  /// Radio option name for hiding DM message previews.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get accessibilityDmMessagePreviewNoneName;

  /// Radio option description for hiding DM message previews.
  ///
  /// In en, this message translates to:
  /// **'Don\'t show message previews in the DM list'**
  String get accessibilityDmMessagePreviewNoneDescription;

  /// Section title for screen reader accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Screen reader'**
  String get accessibilityScreenReaderGroupTitle;

  /// Section description for screen reader accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Control how Fluxer works with screen readers.'**
  String get accessibilityScreenReaderGroupDescription;

  /// Toggle label for announcing incoming messages to screen readers.
  ///
  /// In en, this message translates to:
  /// **'Announce new messages'**
  String get accessibilityScreenReaderAnnounceNewMessagesLabel;

  /// Toggle description for announcing incoming messages to screen readers.
  ///
  /// In en, this message translates to:
  /// **'Let screen readers announce new messages as they arrive in the open channel. Notification sounds are unaffected.'**
  String get accessibilityScreenReaderAnnounceNewMessagesDescription;

  /// Section title for text-to-speech accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Text-to-speech'**
  String get accessibilityTtsGroupTitle;

  /// Description under the speech playback speed label.
  ///
  /// In en, this message translates to:
  /// **'Choose a speed for spoken text.'**
  String get accessibilityTtsGroupDescription;

  /// Label for the TTS speech rate selector.
  ///
  /// In en, this message translates to:
  /// **'Speech playback speed'**
  String get accessibilityTtsSpeechPlaybackSpeedLabel;

  /// Button label to play the TTS sample line.
  ///
  /// In en, this message translates to:
  /// **'Play sample'**
  String get accessibilityTtsPlaySampleLabel;

  /// Button label to stop the TTS sample playback.
  ///
  /// In en, this message translates to:
  /// **'Silence sample'**
  String get accessibilityTtsSilenceSampleLabel;

  /// Label for the no-op preview button on the accessibility settings page.
  ///
  /// In en, this message translates to:
  /// **'Preview button'**
  String get accessibilityPreviewButtonLabel;

  /// Sample message content in the accessibility preview.
  ///
  /// In en, this message translates to:
  /// **'This shows how links appear: {linkPreviewExampleUrl}'**
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl);

  /// Fallback display name for the accessibility preview message author.
  ///
  /// In en, this message translates to:
  /// **'Preview User'**
  String get accessibilityPreviewUserName;

  /// Section title for keyboard accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Keyboard'**
  String get accessibilityKeyboardGroupTitle;

  /// Toggle label for showing a focus ring on the chat textarea.
  ///
  /// In en, this message translates to:
  /// **'Show focus ring on chat textarea'**
  String get accessibilityShowTextareaFocusRingLabel;

  /// Toggle label for Escape exiting keyboard mode.
  ///
  /// In en, this message translates to:
  /// **'Escape key exits keyboard mode'**
  String get accessibilityEscapeExitsKeyboardModeLabel;

  /// Toggle label for showing keyboard shortcuts in context menus.
  ///
  /// In en, this message translates to:
  /// **'Show context menu shortcuts'**
  String get accessibilityShowContextMenuShortcutsLabel;

  /// Toggle label for confirming before starting calls.
  ///
  /// In en, this message translates to:
  /// **'Confirm before starting calls'**
  String get accessibilityConfirmBeforeStartingCallsLabel;

  /// Section title for animation accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Animation'**
  String get accessibilityAnimationGroupTitle;

  /// Note shown above animation controls when reduced motion is active.
  ///
  /// In en, this message translates to:
  /// **'Reduced motion is on, so content animations are paused by default. You can still turn any of these back on to keep it playing.'**
  String get accessibilityReducedMotionActiveNote;

  /// Toggle label for playing animated emojis.
  ///
  /// In en, this message translates to:
  /// **'Play animated emojis'**
  String get accessibilityPlayAnimatedEmojisLabel;

  /// Toggle label for GIF autoplay on mobile.
  ///
  /// In en, this message translates to:
  /// **'Automatically play GIFs'**
  String get accessibilityAutoPlayGifsMobileLabel;

  /// Toggle label for GIF autoplay on desktop.
  ///
  /// In en, this message translates to:
  /// **'Automatically play GIFs when {productName} is focused'**
  String accessibilityAutoPlayGifsDesktopLabel(String productName);

  /// Description when an animation setting overrides reduced motion.
  ///
  /// In en, this message translates to:
  /// **'Playing despite reduced motion.'**
  String get accessibilityPlayingDespiteReducedMotion;

  /// Description for emoji toggle while reduced motion is active.
  ///
  /// In en, this message translates to:
  /// **'Paused by reduced motion. Turn on to keep animated emojis playing.'**
  String get accessibilityPausedEmojiByReducedMotion;

  /// Description for GIF toggle while reduced motion is active.
  ///
  /// In en, this message translates to:
  /// **'Paused by reduced motion. Turn on to keep GIFs playing.'**
  String get accessibilityPausedGifByReducedMotion;

  /// Helper text for GIF autoplay default on mobile.
  ///
  /// In en, this message translates to:
  /// **'Defaults to off on mobile to preserve battery life and data usage.'**
  String get accessibilityGifDefaultsOffOnMobile;

  /// Subsection title for sticker animation preference.
  ///
  /// In en, this message translates to:
  /// **'Sticker animations'**
  String get accessibilityStickerAnimationsTitle;

  /// Accessibility label for the sticker animation radio group.
  ///
  /// In en, this message translates to:
  /// **'Sticker animation preference'**
  String get accessibilityStickerAnimationPreferenceLabel;

  /// Radio option for always animating stickers.
  ///
  /// In en, this message translates to:
  /// **'Always animate'**
  String get accessibilityStickerAlwaysAnimateName;

  /// Description for always animating stickers.
  ///
  /// In en, this message translates to:
  /// **'Stickers will always animate'**
  String get accessibilityStickerAlwaysAnimateDescription;

  /// Radio option for animating stickers on interaction.
  ///
  /// In en, this message translates to:
  /// **'Animate on interaction'**
  String get accessibilityStickerAnimateOnInteractionName;

  /// Description for sticker animate-on-press on touch devices.
  ///
  /// In en, this message translates to:
  /// **'Stickers will animate when you press them'**
  String get accessibilityStickerAnimateOnPressDescription;

  /// Description for sticker animate-on-hover on desktop.
  ///
  /// In en, this message translates to:
  /// **'Stickers will animate when you hover or interact with them'**
  String get accessibilityStickerAnimateOnHoverDescription;

  /// Radio option for never animating stickers.
  ///
  /// In en, this message translates to:
  /// **'Never animate'**
  String get accessibilityStickerNeverAnimateName;

  /// Description for never animating stickers.
  ///
  /// In en, this message translates to:
  /// **'Stickers will never animate'**
  String get accessibilityStickerNeverAnimateDescription;

  /// Description when stickers always-animate overrides reduced motion.
  ///
  /// In en, this message translates to:
  /// **'Always animating despite reduced motion.'**
  String get accessibilityStickersAlwaysDespiteReducedMotion;

  /// Description for stickers while reduced motion is active.
  ///
  /// In en, this message translates to:
  /// **'Reduced motion limits stickers to animate on interaction. Choose always animate to override.'**
  String get accessibilityStickersReducedMotionHint;

  /// Helper text for sticker animation default on mobile.
  ///
  /// In en, this message translates to:
  /// **'Defaults to animate on interaction on mobile to preserve battery life.'**
  String get accessibilityStickersDefaultsOnMobile;

  /// Section title for motion accessibility settings.
  ///
  /// In en, this message translates to:
  /// **'Motion'**
  String get accessibilityMotionGroupTitle;

  /// Toggle label for syncing reduced motion with the operating system setting.
  ///
  /// In en, this message translates to:
  /// **'Sync reduced motion setting with system'**
  String get accessibilitySyncReducedMotionWithSystemLabel;

  /// Toggle description for syncing reduced motion with the operating system setting.
  ///
  /// In en, this message translates to:
  /// **'Use this device\'s system reduced motion preference, or customize it below.'**
  String get accessibilitySyncReducedMotionWithSystemDescription;

  /// Toggle label for reducing motion in Fluxer.
  ///
  /// In en, this message translates to:
  /// **'Reduce motion'**
  String get accessibilityReducedMotionOverrideLabel;

  /// Reduce motion description while synced with system.
  ///
  /// In en, this message translates to:
  /// **'Disable animations and transitions. Currently controlled by your system setting.'**
  String get accessibilityReducedMotionOverrideSyncedDescription;

  /// Reduce motion description when not synced with system.
  ///
  /// In en, this message translates to:
  /// **'Disable animations and transitions throughout the app.'**
  String get accessibilityReducedMotionOverrideManualDescription;

  /// Extra hint under reduce motion while reduced motion is active.
  ///
  /// In en, this message translates to:
  /// **'Animated emojis, GIFs and stickers stay under your control in the Animation tab.'**
  String get accessibilityReducedMotionAnimationTabHint;

  /// Title for the confirm-before-starting-calls dialog.
  ///
  /// In en, this message translates to:
  /// **'Start call?'**
  String get accessibilityConfirmStartCallTitle;

  /// Description for the confirm-before-starting-calls dialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to start this call?'**
  String get accessibilityConfirmStartCallDescription;

  /// Confirm button for starting a call.
  ///
  /// In en, this message translates to:
  /// **'Start call'**
  String get accessibilityConfirmStartCallConfirmLabel;

  /// Description for the TTS sample playback controls.
  ///
  /// In en, this message translates to:
  /// **'Hear the sample line spoken with your chosen speed.'**
  String get accessibilityTtsSampleDescription;

  /// Sample line spoken when previewing TTS speed.
  ///
  /// In en, this message translates to:
  /// **'Doc, I\'m from the future. I came here in a time machine that you invented. Now, I need your help to get back to the year 1985.'**
  String get accessibilityTtsSampleText;

  /// Shown when TTS preview cannot run on the device.
  ///
  /// In en, this message translates to:
  /// **'Speech synthesis is unavailable on this device.'**
  String get accessibilityTtsUnsupportedDescription;

  /// Shown when TTS playback fails.
  ///
  /// In en, this message translates to:
  /// **'Speech playback failed. Try again, or check that audio output is working.'**
  String get accessibilityTtsPlaybackFailedDescription;

  /// TTS substitution for unresolved user mentions.
  ///
  /// In en, this message translates to:
  /// **'unknown user'**
  String get ttsSubstitutionUnknownUser;

  /// TTS substitution for unresolved role mentions.
  ///
  /// In en, this message translates to:
  /// **'unknown role'**
  String get ttsSubstitutionUnknownRole;

  /// TTS substitution for unresolved channel mentions.
  ///
  /// In en, this message translates to:
  /// **'unknown channel'**
  String get ttsSubstitutionUnknownChannel;

  /// TTS substitution for fenced code blocks.
  ///
  /// In en, this message translates to:
  /// **'code block'**
  String get ttsSubstitutionCodeBlock;

  /// TTS substitution for spoiler content.
  ///
  /// In en, this message translates to:
  /// **'spoiler'**
  String get ttsSubstitutionSpoiler;

  /// TTS substitution for custom emoji.
  ///
  /// In en, this message translates to:
  /// **'emoji {emojiName}'**
  String ttsSubstitutionEmoji(String emojiName);

  /// TTS substitution for slash command invocations.
  ///
  /// In en, this message translates to:
  /// **'slash {commandName}'**
  String ttsSubstitutionSlashCommand(String commandName);

  /// TTS sentence for a normal message.
  ///
  /// In en, this message translates to:
  /// **'{authorName} said: {formatted}'**
  String ttsAuthorSaid(String authorName, String formatted);

  /// TTS sentence for a reply message.
  ///
  /// In en, this message translates to:
  /// **'Replying to {replyAuthorName}, {authorName} said: {formatted}'**
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  );

  /// TTS sentence for non-text-only messages.
  ///
  /// In en, this message translates to:
  /// **'{authorName} {description}'**
  String ttsAuthorDescription(String authorName, String description);

  /// TTS phrase for sticker-only messages.
  ///
  /// In en, this message translates to:
  /// **'sent a sticker'**
  String get ttsSentSticker;

  /// TTS phrase for a single attachment-only message.
  ///
  /// In en, this message translates to:
  /// **'sent an attachment'**
  String get ttsSentAttachment;

  /// TTS phrase for multi-attachment messages.
  ///
  /// In en, this message translates to:
  /// **'sent {count} attachments'**
  String ttsSentAttachments(int count);

  /// TTS phrase for embed-only messages.
  ///
  /// In en, this message translates to:
  /// **'sent an embed'**
  String get ttsSentEmbed;

  /// Screen reader announcement spoken when a new message arrives.
  ///
  /// In en, this message translates to:
  /// **'{author} sent {summary}'**
  String messageScreenReaderAnnouncement(String author, String summary);

  /// DM list row preview text when the most recent message has only attachments.
  ///
  /// In en, this message translates to:
  /// **'Sent an attachment'**
  String get dmListSentAnAttachment;

  /// Plaintext DM list preview for a pin system message.
  ///
  /// In en, this message translates to:
  /// **'{username} pinned a message to this channel.'**
  String systemPreviewPinnedMessage(String username);

  /// Plaintext DM list preview when a member adds another user to a group DM.
  ///
  /// In en, this message translates to:
  /// **'{username} added {userName} to the group.'**
  String systemPreviewAddedToGroup(String username, String userName);

  /// Plaintext DM list preview when a member adds an unresolved user to a group DM.
  ///
  /// In en, this message translates to:
  /// **'{username} added someone to the group.'**
  String systemPreviewAddedSomeoneToGroup(String username);

  /// Plaintext DM list preview when a member leaves a group DM.
  ///
  /// In en, this message translates to:
  /// **'{username} has left the group.'**
  String systemPreviewHasLeftGroup(String username);

  /// Plaintext DM list preview when a member removes another user from a group DM.
  ///
  /// In en, this message translates to:
  /// **'{username} removed {userName} from the group.'**
  String systemPreviewRemovedFromGroup(String username, String userName);

  /// Plaintext DM list preview when a member removes an unresolved user from a group DM.
  ///
  /// In en, this message translates to:
  /// **'{username} removed someone from the group.'**
  String systemPreviewRemovedSomeoneFromGroup(String username);

  /// Plaintext DM list preview when a group DM is renamed.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the channel name to {newName}.'**
  String systemPreviewChangedChannelNameTo(String username, String newName);

  /// Plaintext DM list preview when a group DM is renamed without a known new name.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the channel name.'**
  String systemPreviewChangedChannelName(String username);

  /// Plaintext DM list preview when a group DM icon changes.
  ///
  /// In en, this message translates to:
  /// **'{username} changed the channel icon.'**
  String systemPreviewChangedChannelIcon(String username);

  /// Plaintext DM list preview when a call starts.
  ///
  /// In en, this message translates to:
  /// **'{username} started a call.'**
  String systemPreviewStartedCall(String username);

  /// Call-to-action button label on an in-progress call system message.
  ///
  /// In en, this message translates to:
  /// **'Join the call'**
  String get systemCallJoinTheCall;

  /// System message when a call has ended and the viewer participated.
  ///
  /// In en, this message translates to:
  /// **'{username} started a call that lasted {duration}.'**
  String systemCallStartedThatLasted(String username, String duration);

  /// System message when the viewer missed a call that had a measurable duration.
  ///
  /// In en, this message translates to:
  /// **'You missed a call from {username} that lasted {duration}.'**
  String systemCallMissedWithDuration(String username, String duration);

  /// System message when the viewer missed a call.
  ///
  /// In en, this message translates to:
  /// **'You missed a call from {username}.'**
  String systemCallMissed(String username);

  /// Duration label for a very short elapsed call.
  ///
  /// In en, this message translates to:
  /// **'a few seconds'**
  String get systemCallDurationFewSeconds;

  /// Duration label when a call lasted about one minute.
  ///
  /// In en, this message translates to:
  /// **'a minute'**
  String get systemCallDurationMinute;

  /// Duration label when a call lasted about one year.
  ///
  /// In en, this message translates to:
  /// **'1 year'**
  String get systemCallDurationOneYear;

  /// Duration label when a call lasted about one month.
  ///
  /// In en, this message translates to:
  /// **'1 month'**
  String get systemCallDurationOneMonth;

  /// Duration label when a call lasted about one week.
  ///
  /// In en, this message translates to:
  /// **'1 week'**
  String get systemCallDurationOneWeek;

  /// Duration label when a call lasted about one day.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get systemCallDurationOneDay;

  /// Duration label when a call lasted about one hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get systemCallDurationOneHour;

  /// Duration label for multiple years in a call duration.
  ///
  /// In en, this message translates to:
  /// **'{count} years'**
  String systemCallDurationYears(int count);

  /// Duration label for multiple months in a call duration.
  ///
  /// In en, this message translates to:
  /// **'{count} months'**
  String systemCallDurationMonths(int count);

  /// Duration label for multiple weeks in a call duration.
  ///
  /// In en, this message translates to:
  /// **'{count} weeks'**
  String systemCallDurationWeeks(int count);

  /// Duration label for multiple days in a call duration.
  ///
  /// In en, this message translates to:
  /// **'{count} days'**
  String systemCallDurationDays(int count);

  /// Duration label for multiple hours in a call duration.
  ///
  /// In en, this message translates to:
  /// **'{count} hours'**
  String systemCallDurationHours(int count);

  /// Duration label for multiple minutes in a call duration.
  ///
  /// In en, this message translates to:
  /// **'{count} minutes'**
  String systemCallDurationMinutes(int count);

  /// Fallback system message when the client does not recognize the message type.
  ///
  /// In en, this message translates to:
  /// **'Update {productName} to view this message.'**
  String systemUnknownMessage(String productName);

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

  /// Title for the modal shown when a voice join attempt fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t Join Voice'**
  String get voiceJoinFailedTitle;

  /// Shown when switch-to-this-device times out waiting for other sessions to leave.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t disconnect your other devices. Try again in a moment.'**
  String get voiceMultiDeviceDisconnectFailed;

  /// Empty state body when viewing a guild voice channel while not in the call.
  ///
  /// In en, this message translates to:
  /// **'This is a voice channel. Connect to start talking!'**
  String get voiceChannelEmptyDescription;

  /// Primary action to connect to a voice channel from the empty state.
  ///
  /// In en, this message translates to:
  /// **'Join voice channel'**
  String get voiceChannelJoin;

  /// Primary CTA in the DM or group DM pre-join call empty state.
  ///
  /// In en, this message translates to:
  /// **'Join call'**
  String get voiceCallJoin;

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

  /// Tooltip: switch between front and back camera while video is on.
  ///
  /// In en, this message translates to:
  /// **'Flip camera'**
  String get voiceControlFlipCamera;

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

  /// Short status label shown when the user is currently connected to voice chat.
  ///
  /// In en, this message translates to:
  /// **'In voice chat'**
  String get voiceInChat;

  /// Voice connection status when the most recent attempt to join the channel failed.
  ///
  /// In en, this message translates to:
  /// **'Connection failed'**
  String get voiceConnectionFailed;

  /// Button that retries connecting to the voice channel after a failed attempt.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get voiceConnectionRetry;

  /// Button that dismisses the failed voice connection status banner.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get voiceConnectionDismiss;

  /// Voice connection status when not connected.
  ///
  /// In en, this message translates to:
  /// **'Disconnected'**
  String get voiceConnectionDisconnected;

  /// Compact latency badge on the voice control bar.
  ///
  /// In en, this message translates to:
  /// **'Ping: {currentLatency}ms'**
  String voicePingMs(int currentLatency);

  /// Tooltip on the latency badge while voice latency is still being sampled.
  ///
  /// In en, this message translates to:
  /// **'Measuring latency...'**
  String get voiceMeasuringLatency;

  /// Tooltip on a button that jumps to the channel.
  ///
  /// In en, this message translates to:
  /// **'Jump to {channelSourceLabel}'**
  String voiceJumpToChannel(String channelSourceLabel);

  /// Voice status popout title.
  ///
  /// In en, this message translates to:
  /// **'Voice connection'**
  String get voiceConnectionTitle;

  /// Disclosure button label in the voice connection status popout.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get voiceConnectionAdvancedStats;

  /// Developer voice status menu option for displaying participant avatars.
  ///
  /// In en, this message translates to:
  /// **'Show call avatars'**
  String get voiceShowCallAvatars;

  /// Developer voice status menu option for displaying the voice connection identifier.
  ///
  /// In en, this message translates to:
  /// **'Show connection ID'**
  String get voiceShowConnectionId;

  /// Tooltip for the audio processing button in the voice connection status.
  ///
  /// In en, this message translates to:
  /// **'Audio processing'**
  String get voiceAudioProcessing;

  /// Section title for session stats in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Session'**
  String get voiceConnectionSessionSection;

  /// Row label for voice session duration in the connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get voiceConnectionDurationLabel;

  /// Row label for participant count in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Participants'**
  String get voiceConnectionParticipantsLabel;

  /// Section title for network stats in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get voiceConnectionNetworkSection;

  /// Row label for ping latency in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Ping'**
  String get voiceConnectionPingLabel;

  /// Row label for jitter in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Jitter'**
  String get voiceConnectionJitterLabel;

  /// Row label for outbound bandwidth in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get voiceConnectionSendLabel;

  /// Row label for inbound bandwidth in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get voiceConnectionReceiveLabel;

  /// Placeholder when a voice connection stat is not available.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get voiceConnectionUnavailable;

  /// Formatted voice session duration in the connection details popout.
  ///
  /// In en, this message translates to:
  /// **'{minutes}m {seconds}s'**
  String voiceConnectionDuration(int minutes, int seconds);

  /// Formatted ping latency value in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'{latency} ms'**
  String voiceConnectionLatencyMs(int latency);

  /// Formatted jitter value in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'{jitter} ms'**
  String voiceConnectionJitterMs(String jitter);

  /// Formatted bandwidth value in the voice connection details popout.
  ///
  /// In en, this message translates to:
  /// **'{bandwidth} kbps'**
  String voiceConnectionBandwidthKbps(String bandwidth);

  /// Tooltip for the mute button in the desktop user area.
  ///
  /// In en, this message translates to:
  /// **'Mute microphone'**
  String get userAreaMuteMicrophone;

  /// Tooltip for the unmute button in the desktop user area.
  ///
  /// In en, this message translates to:
  /// **'Unmute microphone'**
  String get userAreaUnmuteMicrophone;

  /// Tooltip for the settings button in the desktop user area.
  ///
  /// In en, this message translates to:
  /// **'User settings'**
  String get userAreaUserSettings;

  /// Voice participant context menu item to open the user's profile.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get voiceParticipantMenuViewProfile;

  /// Voice participant context menu item to pin a participant tile in focus layout.
  ///
  /// In en, this message translates to:
  /// **'Focus this person'**
  String get voiceParticipantMenuFocus;

  /// Voice participant context menu item to return to grid layout.
  ///
  /// In en, this message translates to:
  /// **'Unfocus'**
  String get voiceParticipantMenuUnfocus;

  /// Voice participant context menu item to community-mute another member.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get voiceParticipantMenuCommunityMute;

  /// Voice participant context menu item to community-deafen another member.
  ///
  /// In en, this message translates to:
  /// **'Deafen'**
  String get voiceParticipantMenuCommunityDeafen;

  /// Voice participant context menu slider label for per-user volume.
  ///
  /// In en, this message translates to:
  /// **'User volume'**
  String get voiceParticipantMenuUserVolume;

  /// Voice participant context menu slider label for screen share audio volume.
  ///
  /// In en, this message translates to:
  /// **'Stream volume'**
  String get voiceParticipantMenuStreamVolume;

  /// Toast shown when a voice participant moderation action fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update that member. Please try again.'**
  String get voiceParticipantModerationFailed;

  /// Label for the chat button in voice lobby and call control surfaces.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get voiceControlChat;

  /// Section header for in-call voice settings in the expandable control panel.
  ///
  /// In en, this message translates to:
  /// **'Voice settings'**
  String get voicePanelSettingsSectionTitle;

  /// Switch label to route voice call audio through the phone earpiece instead of the speaker.
  ///
  /// In en, this message translates to:
  /// **'Use earpiece'**
  String get voicePanelUseEarpieceLabel;

  /// Switch label to hide voice participants who do not have their camera on.
  ///
  /// In en, this message translates to:
  /// **'Only show videos'**
  String get voicePanelOnlyShowVideosLabel;

  /// Description for the only-show-videos switch in the voice call panel.
  ///
  /// In en, this message translates to:
  /// **'Only show participants who have their camera on.'**
  String get voicePanelOnlyShowVideosDescription;

  /// Switch label to show or hide the local camera tile in the voice call grid.
  ///
  /// In en, this message translates to:
  /// **'Show my own camera'**
  String get voicePanelShowOwnCameraLabel;

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

  /// Fluxerbot system message when a DM cannot be delivered due to privacy restrictions.
  ///
  /// In en, this message translates to:
  /// **'Your message could not be delivered. This is usually because you don\'t share a community with the recipient or the recipient is only accepting direct messages from friends. You may also need to adjust your own direct message privacy settings in {settingsPath}.'**
  String chatSendFailureDmRestricted(String settingsPath);

  /// Fluxerbot system message when an unclaimed account tries to send a DM.
  ///
  /// In en, this message translates to:
  /// **'Your message could not be delivered. You need to claim your account to send direct messages.'**
  String get chatSendFailureUnclaimedDm;

  /// Fluxerbot system message when an unclaimed account tries to send a message.
  ///
  /// In en, this message translates to:
  /// **'Your message could not be delivered. You need to claim your account to send messages.'**
  String get chatSendFailureUnclaimedGeneral;

  /// Fluxerbot system message when message content is blocked by safety systems.
  ///
  /// In en, this message translates to:
  /// **'Your message could not be delivered because it was flagged by our safety systems. If you believe this is a mistake, please contact support.'**
  String get chatSendFailureContentBlocked;

  /// Fluxerbot system message when mature emoji or stickers are blocked.
  ///
  /// In en, this message translates to:
  /// **'Your message could not be delivered because it contains mature emoji or stickers that are not allowed in this context.'**
  String get chatSendFailureNsfwEmojiSticker;

  /// Footer on ephemeral Fluxerbot client system messages.
  ///
  /// In en, this message translates to:
  /// **'Only you can see this message.'**
  String get chatClientSystemOnlyYouCanSee;

  /// Action to remove an ephemeral Fluxerbot client system message locally.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get chatClientSystemDismiss;

  /// Section title for communication privacy settings in the privacy dashboard.
  ///
  /// In en, this message translates to:
  /// **'Communication'**
  String get privacyDashboardCommunicationSection;

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

  /// Notice shown in the forward sheet when send is blocked because a selected destination is cooling down.
  ///
  /// In en, this message translates to:
  /// **'Waiting for slowmode in one or more selected channels to expire.'**
  String get forwardSendSlowmodeBlocked;

  /// Title for the modal shown when slowmode blocks sending a message.
  ///
  /// In en, this message translates to:
  /// **'Slowmode active'**
  String get slowmodeRateLimitedTitle;

  /// Body for the modal shown when slowmode blocks sending a message. {duration} is a formatted countdown.
  ///
  /// In en, this message translates to:
  /// **'Slowmode is on — wait {duration} before sending another.'**
  String slowmodeRateLimitedMessage(String duration);

  /// Overlay hint when shift-to-send is blocked because slowmode is active.
  ///
  /// In en, this message translates to:
  /// **'Direct upload is disabled during slowmode.'**
  String get chatAttachmentDropSlowmodeDisabled;

  /// Title of the share-media bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Share to'**
  String get shareMediaTitle;

  /// Placeholder for the optional message field in the share-media sheet.
  ///
  /// In en, this message translates to:
  /// **'Add an optional message…'**
  String get shareMediaMessageHint;

  /// Share-media sheet send button label.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get shareMediaSendButton;

  /// Toast shown after shared media is sent to all selected destinations.
  ///
  /// In en, this message translates to:
  /// **'Media shared'**
  String get shareMediaSuccessToast;

  /// Toast shown when shared media is sent to some but not all selected destinations.
  ///
  /// In en, this message translates to:
  /// **'Shared to {count} destinations'**
  String shareMediaPartialSuccessToast(int count);

  /// Toast shown when sharing media to all destinations fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to share media'**
  String get shareMediaFailedToast;

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

  /// Action label for reading a message aloud.
  ///
  /// In en, this message translates to:
  /// **'Speak message'**
  String get chatMessageSpeak;

  /// Action label for stopping TTS playback.
  ///
  /// In en, this message translates to:
  /// **'Stop speaking'**
  String get chatMessageStopSpeaking;

  /// Action label for pinning a message.
  ///
  /// In en, this message translates to:
  /// **'Pin message'**
  String get chatMessagePin;

  /// Action label for unpinning a message.
  ///
  /// In en, this message translates to:
  /// **'Unpin message'**
  String get chatMessageUnpin;

  /// Primary button label on the unpin confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Unpin it'**
  String get chatMessageUnpinIt;

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

  /// Toast shown when the server rejects adding a reaction after an optimistic update.
  ///
  /// In en, this message translates to:
  /// **'Failed to add reaction'**
  String get chatReactionAddFailed;

  /// Toast shown when the server rejects removing a reaction after an optimistic update.
  ///
  /// In en, this message translates to:
  /// **'Failed to remove reaction'**
  String get chatReactionRemoveFailed;

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

  /// Action label for deleting an attachment from a sent message.
  ///
  /// In en, this message translates to:
  /// **'Delete Attachment'**
  String get chatMessageDeleteAttachment;

  /// Action label for editing the alt text of a message attachment.
  ///
  /// In en, this message translates to:
  /// **'Edit Alt Text'**
  String get chatMessageEditAttachmentAltText;

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

  /// Label in the channel and chat reply preview. Keep the tone plain and specific.
  ///
  /// In en, this message translates to:
  /// **'Original message was deleted'**
  String get chatReplyOriginalDeleted;

  /// Error message in the channel and chat reply preview.
  ///
  /// In en, this message translates to:
  /// **'Original message failed to load'**
  String get chatReplyOriginalFailedToLoad;

  /// Label in the channel and chat reply preview.
  ///
  /// In en, this message translates to:
  /// **'Message contains attached media'**
  String get chatReplyAttachedMedia;

  /// Collapsed summary label for consecutive messages from blocked users.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 blocked message} other{{count} blocked messages}}'**
  String chatBlockedMessagesCollapsed(int count);

  /// Collapsed summary label for consecutive messages from spammer-flagged users.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 potential spammer message} other{{count} potential spammer messages}}'**
  String chatSpammerMessagesCollapsed(int count);

  /// Reply preview placeholder when the referenced author is blocked.
  ///
  /// In en, this message translates to:
  /// **'Reply hidden because the original author is blocked.'**
  String get chatReplyHiddenBlockedAuthor;

  /// Reply preview placeholder when the referenced author is marked as a spammer.
  ///
  /// In en, this message translates to:
  /// **'Reply hidden because the original author is marked as a spammer.'**
  String get chatReplyHiddenSpammerAuthor;

  /// Developer menu option to locally mark a user as spam.
  ///
  /// In en, this message translates to:
  /// **'Mark as spam locally'**
  String get devMarkAsSpamLocally;

  /// Developer menu option to ignore the server spammer flag for a user.
  ///
  /// In en, this message translates to:
  /// **'Ignore spam flag'**
  String get devIgnoreSpamFlag;

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
  /// **'ON'**
  String get chatReplyMentionOn;

  /// Off state suffix appended to the reply bar mention toggle label.
  ///
  /// In en, this message translates to:
  /// **'OFF'**
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

  /// Tooltip on the bell-slash icon beside a silent message. "@silent" is the literal command keyword and must not be translated.
  ///
  /// In en, this message translates to:
  /// **'This was a @silent message.'**
  String get chatMessageSilent;

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

  /// Title and accessibility label for the overflow menu in the mobile media viewer.
  ///
  /// In en, this message translates to:
  /// **'Media options'**
  String get mediaViewerOptions;

  /// Media viewer action that copies the media URL to the clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get mediaViewerCopyLink;

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

  /// Accessibility label for a thumbnail in the media viewer strip.
  ///
  /// In en, this message translates to:
  /// **'Attachment {index}'**
  String mediaViewerAttachmentThumbnail(int index);

  /// Accessibility label for dismissing the media viewer by tapping the backdrop.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get mediaViewerDismissBackdrop;

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

  /// Shown when embedded or attachment video playback fails in the chat player.
  ///
  /// In en, this message translates to:
  /// **'Could not play this video.'**
  String get chatVideoPlaybackFailed;

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

  /// Title of the create-community sub-view in the add community modal.
  ///
  /// In en, this message translates to:
  /// **'Create a community'**
  String get addGuildCreateTitle;

  /// Body text on the create-community sub-view.
  ///
  /// In en, this message translates to:
  /// **'Create a community for you and your friends to chat.'**
  String get addGuildCreateDescription;

  /// Label for the community name input on the create sub-view.
  ///
  /// In en, this message translates to:
  /// **'Community name'**
  String get addGuildCreateNameLabel;

  /// Primary button label to submit the create-community form.
  ///
  /// In en, this message translates to:
  /// **'Create community'**
  String get addGuildCreateSubmit;

  /// Generic error when creating a community fails.
  ///
  /// In en, this message translates to:
  /// **'Could not create community. Please try again.'**
  String get addGuildCreateFailed;

  /// Gate title when the user must claim their account before creating a community.
  ///
  /// In en, this message translates to:
  /// **'Claim your account'**
  String get addGuildCreateClaimTitle;

  /// Gate description when the user must claim their account before creating a community.
  ///
  /// In en, this message translates to:
  /// **'You need to claim your account before you can create a community.'**
  String get addGuildCreateClaimDescription;

  /// Gate title when the user must verify email before creating a community.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get addGuildCreateVerifyTitle;

  /// Gate description when the user must verify email before creating a community.
  ///
  /// In en, this message translates to:
  /// **'You need to verify your email address before you can create a community.'**
  String get addGuildCreateVerifyDescription;

  /// Error when the user picks an animated image for a new community icon.
  ///
  /// In en, this message translates to:
  /// **'Animated icons are not supported when creating a new community. Use a static image.'**
  String get addGuildCreateAnimatedIconUnsupported;

  /// Text before the community guidelines link on the create sub-view.
  ///
  /// In en, this message translates to:
  /// **'By creating a community, you agree to follow and uphold the '**
  String get addGuildCreateGuidelinesBefore;

  /// Link label for community guidelines on the create sub-view.
  ///
  /// In en, this message translates to:
  /// **'{productName} community guidelines'**
  String addGuildCreateGuidelinesLink(String productName);

  /// Error when creation is blocked because the instance only allows one community.
  ///
  /// In en, this message translates to:
  /// **'This instance is a single community, so additional communities cannot be created.'**
  String get addGuildCreateSingleCommunityBlocked;

  /// Button label to replace the selected community icon.
  ///
  /// In en, this message translates to:
  /// **'Change icon'**
  String get addGuildCreateChangeIcon;

  /// Label for the optional community icon field on the create sub-view.
  ///
  /// In en, this message translates to:
  /// **'Community icon'**
  String get addGuildCreateIconLabel;

  /// Helper text under the community icon upload buttons listing accepted formats and size guidance.
  ///
  /// In en, this message translates to:
  /// **'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Max 10MB. Recommended: 512×512px'**
  String get addGuildCreateIconHint;

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
  /// **'Unpin message'**
  String get chatMessageUnpinConfirmTitle;

  /// Body text for the unpin message confirmation sheet.
  ///
  /// In en, this message translates to:
  /// **'Send this pin back in time?'**
  String get chatMessageUnpinConfirmDescription;

  /// System message when a user pins a message. Keep {username}, {messageLink}, and {allPinsLink} in place; translate the surrounding sentence.
  ///
  /// In en, this message translates to:
  /// **'{username} pinned {messageLink} to this channel. See {allPinsLink}.'**
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  );

  /// Link label in the pin system message for jumping to the pinned message.
  ///
  /// In en, this message translates to:
  /// **'a message'**
  String get systemPinMessageMessageLink;

  /// Link label in the pin system message for opening all pinned messages.
  ///
  /// In en, this message translates to:
  /// **'all pinned messages'**
  String get systemPinMessageAllPinsLink;

  /// Title shown when a channel has no pinned messages.
  ///
  /// In en, this message translates to:
  /// **'No pinned messages'**
  String get channelPinsEmptyTitle;

  /// Description shown when a channel has no pinned messages.
  ///
  /// In en, this message translates to:
  /// **'Pinned messages show up here.'**
  String get channelPinsEmptyDescription;

  /// Fallback title in channel details when no channel or DM name is available.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get channelDetailsFallbackTitle;

  /// Subtitle in channel details for a group DM showing member count.
  ///
  /// In en, this message translates to:
  /// **'Group DM · {count} members'**
  String channelDetailsGroupDmSubtitle(int count);

  /// Confirmation body when closing a 1:1 DM from channel details.
  ///
  /// In en, this message translates to:
  /// **'Close your conversation with {name}?'**
  String channelDetailsCloseDmDescription(String name);

  /// Confirmation body when leaving a group DM from channel details.
  ///
  /// In en, this message translates to:
  /// **'Leave {name}?'**
  String channelDetailsLeaveGroupDescription(String name);

  /// Title for the channel details overflow menu on guild channels.
  ///
  /// In en, this message translates to:
  /// **'Channel settings'**
  String get channelDetailsChannelSettingsTitle;

  /// Title for the channel details overflow menu on group DMs.
  ///
  /// In en, this message translates to:
  /// **'Group Settings'**
  String get channelDetailsGroupSettingsTitle;

  /// Title for the channel details overflow menu on 1:1 DMs.
  ///
  /// In en, this message translates to:
  /// **'DM Settings'**
  String get channelDetailsDmSettingsTitle;

  /// Channel details menu action to invite people.
  ///
  /// In en, this message translates to:
  /// **'Invite People'**
  String get channelDetailsInvitePeople;

  /// Channel details menu action to copy a channel link.
  ///
  /// In en, this message translates to:
  /// **'Copy Link'**
  String get channelDetailsCopyLink;

  /// Channel menu action to copy a link channel's channel link.
  ///
  /// In en, this message translates to:
  /// **'Copy channel link'**
  String get channelMenuCopyChannelLink;

  /// Channel menu action to copy a link channel's redirect URL.
  ///
  /// In en, this message translates to:
  /// **'Copy redirect link'**
  String get channelMenuCopyRedirectLink;

  /// Group DM menu action to add friends to the group.
  ///
  /// In en, this message translates to:
  /// **'Add friends to group'**
  String get channelDetailsAddFriendsToGroup;

  /// Group DM menu action to view group invites.
  ///
  /// In en, this message translates to:
  /// **'Group invites'**
  String get channelDetailsGroupInvites;

  /// Channel details menu action to edit a guild channel.
  ///
  /// In en, this message translates to:
  /// **'Edit channel'**
  String get channelDetailsEditChannel;

  /// Channel details menu action to delete a guild channel.
  ///
  /// In en, this message translates to:
  /// **'Delete channel'**
  String get channelDetailsDeleteChannel;

  /// Title for category settings modal.
  ///
  /// In en, this message translates to:
  /// **'Category settings'**
  String get channelSettingsCategorySettingsTitle;

  /// Context menu action to edit a category.
  ///
  /// In en, this message translates to:
  /// **'Edit category'**
  String get channelSettingsEditCategory;

  /// Channel settings tab for basic channel details.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get channelSettingsTabOverview;

  /// Channel settings tab for role and member permission overwrites.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get channelSettingsTabPermissions;

  /// Channel settings tab for invite management.
  ///
  /// In en, this message translates to:
  /// **'Invites'**
  String get channelSettingsTabInvites;

  /// Channel settings tab for configuring channel webhooks.
  ///
  /// In en, this message translates to:
  /// **'Webhooks'**
  String get channelSettingsTabWebhooks;

  /// Destructive footer button in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Delete channel'**
  String get channelSettingsDeleteChannel;

  /// Destructive confirmation for deleting a channel.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {channelName}? This cannot be undone.'**
  String channelSettingsDeleteChannelConfirm(String channelName);

  /// Destructive confirmation for deleting a category.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {categoryName}? This cannot be undone.'**
  String channelSettingsDeleteCategoryConfirm(String categoryName);

  /// Destructive footer button in category settings.
  ///
  /// In en, this message translates to:
  /// **'Delete category'**
  String get channelSettingsDeleteCategory;

  /// Success toast after saving channel settings.
  ///
  /// In en, this message translates to:
  /// **'Channel updated'**
  String get channelSettingsChannelUpdated;

  /// Label for channel name field in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Channel name'**
  String get channelSettingsChannelName;

  /// Label for category name field in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Category name'**
  String get channelSettingsCategoryName;

  /// Placeholder for category name field.
  ///
  /// In en, this message translates to:
  /// **'My category'**
  String get channelSettingsMyCategory;

  /// Context menu action to expand a collapsed channel category.
  ///
  /// In en, this message translates to:
  /// **'Expand category'**
  String get categoryExpandCategory;

  /// Context menu action to collapse an expanded channel category.
  ///
  /// In en, this message translates to:
  /// **'Collapse category'**
  String get categoryCollapseCategory;

  /// Context menu action to expand every collapsed channel category.
  ///
  /// In en, this message translates to:
  /// **'Expand all categories'**
  String get categoryExpandAllCategories;

  /// Context menu action to collapse every channel category.
  ///
  /// In en, this message translates to:
  /// **'Collapse all categories'**
  String get categoryCollapseAllCategories;

  /// Context menu action to mute a channel category.
  ///
  /// In en, this message translates to:
  /// **'Mute category'**
  String get categoryMuteCategory;

  /// Context menu action to unmute a channel category.
  ///
  /// In en, this message translates to:
  /// **'Unmute category'**
  String get categoryUnmuteCategory;

  /// Context menu action to copy a category ID to the clipboard.
  ///
  /// In en, this message translates to:
  /// **'Copy category ID'**
  String get categoryCopyCategoryId;

  /// Toast confirming the category ID was copied to the clipboard.
  ///
  /// In en, this message translates to:
  /// **'Category ID copied'**
  String get categoryIdCopied;

  /// Placeholder for channel name field in channel settings.
  ///
  /// In en, this message translates to:
  /// **'general'**
  String get channelSettingsChannelNamePlaceholder;

  /// Label for link channel URL field.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get channelSettingsUrl;

  /// Placeholder for link channel URL field in channel settings.
  ///
  /// In en, this message translates to:
  /// **'https://example.com'**
  String get channelSettingsUrlPlaceholder;

  /// Label for channel topic field.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get channelSettingsTopic;

  /// Placeholder for channel topic field.
  ///
  /// In en, this message translates to:
  /// **'Add a topic to this channel'**
  String get channelSettingsTopicPlaceholder;

  /// Accessibility label for the emoji button on the channel topic field.
  ///
  /// In en, this message translates to:
  /// **'Insert emoji'**
  String get channelSettingsInsertEmoji;

  /// Error modal title when channel topic exceeds maximum length.
  ///
  /// In en, this message translates to:
  /// **'Channel topic is too long.'**
  String get channelSettingsTopicTooLongTitle;

  /// Error modal body when channel topic exceeds maximum length.
  ///
  /// In en, this message translates to:
  /// **'Shorten the topic and try again.'**
  String get channelSettingsTopicTooLongMessage;

  /// Label for slowmode control in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Slowmode'**
  String get channelSettingsSlowmode;

  /// Description under the slowmode select in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Wait between messages. \"{bypassSlowmodePermissionLabel}\" can bypass it.'**
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  );

  /// Slowmode option for no rate limit.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get channelSettingsSlowmodeOff;

  /// Slowmode option label in seconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds'**
  String channelSettingsSlowmodeSeconds(int seconds);

  /// Slowmode option label in minutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes'**
  String channelSettingsSlowmodeMinutes(int minutes);

  /// Slowmode option label in hours.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours'**
  String channelSettingsSlowmodeHours(int hours);

  /// Slowmode option label for one minute.
  ///
  /// In en, this message translates to:
  /// **'{oneMinute} minute'**
  String channelSettingsSlowmodeOneMinute(int oneMinute);

  /// Slowmode option label for one hour.
  ///
  /// In en, this message translates to:
  /// **'{oneHour} hour'**
  String channelSettingsSlowmodeOneHour(int oneHour);

  /// Voice channel setting label for voice bitrate preset.
  ///
  /// In en, this message translates to:
  /// **'Voice quality'**
  String get channelSettingsVoiceQuality;

  /// Helper text for the voice quality slider in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Higher bitrate = better quality and higher bandwidth usage.'**
  String get channelSettingsVoiceQualityDescription;

  /// Voice channel bitrate option label.
  ///
  /// In en, this message translates to:
  /// **'{kilobits} kbps'**
  String channelSettingsVoiceQualityKbps(int kilobits);

  /// Voice channel setting label for maximum members.
  ///
  /// In en, this message translates to:
  /// **'Participant limit'**
  String get channelSettingsParticipantLimit;

  /// Helper text for the voice channel participant limit slider.
  ///
  /// In en, this message translates to:
  /// **'Maximum members who can join at once. 0 means unlimited.'**
  String get channelSettingsParticipantLimitDescription;

  /// Displayed value for voice channel participant limit slider.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0 {∞ No limit} =1 {1 participant} other {{count} participants}}'**
  String channelSettingsParticipantLimitValue(int count);

  /// Voice channel setting label for connection limit.
  ///
  /// In en, this message translates to:
  /// **'Connection limit'**
  String get channelSettingsConnectionLimit;

  /// Helper text for voice channel connection limit.
  ///
  /// In en, this message translates to:
  /// **'Maximum active connections one member can keep in this channel.'**
  String get channelSettingsConnectionLimitDescription;

  /// Displayed value for voice channel connection limit slider.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1 {1 connection} other {{count} connections}}'**
  String channelSettingsConnectionLimitValue(int count);

  /// Label for voice region picker.
  ///
  /// In en, this message translates to:
  /// **'Voice region'**
  String get channelSettingsVoiceRegion;

  /// Helper text for the voice region picker in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Select a voice region for this channel. Automatic uses the closest region.'**
  String get channelSettingsVoiceRegionDescription;

  /// Automatic voice region option.
  ///
  /// In en, this message translates to:
  /// **'Automatic'**
  String get channelSettingsVoiceRegionAutomatic;

  /// Error modal title when voice regions fail to load.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load voice regions'**
  String get channelSettingsVoiceRegionsLoadFailed;

  /// Error modal body when voice regions fail to load in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Try again in a moment.'**
  String get channelSettingsVoiceRegionsLoadFailedDescription;

  /// Tooltip for reset buttons on channel settings sliders.
  ///
  /// In en, this message translates to:
  /// **'Reset slider to default value'**
  String get channelSettingsResetSlider;

  /// Collapsible advanced section title in channel overview.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get channelSettingsAdvanced;

  /// Accessibility label for mature content override control.
  ///
  /// In en, this message translates to:
  /// **'Mature content override'**
  String get channelSettingsMatureContentOverride;

  /// Section description for mature content settings in channel overview.
  ///
  /// In en, this message translates to:
  /// **'Override the {scopeLevel}-level setting for this channel. Mature content is shown behind a gate before entry.'**
  String channelSettingsMatureContentSectionDescription(String scopeLevel);

  /// Mature content option that uses parent or community setting.
  ///
  /// In en, this message translates to:
  /// **'Inherit'**
  String get channelSettingsMatureContentInherit;

  /// Mature content option that marks channel for mature content.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get channelSettingsMatureContentOn;

  /// Mature content option that leaves channel ungated.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get channelSettingsMatureContentOff;

  /// Description for the mature content on override option.
  ///
  /// In en, this message translates to:
  /// **'Marks this channel for mature content.'**
  String get channelSettingsMatureContentOnDescription;

  /// Description for the mature content off override option.
  ///
  /// In en, this message translates to:
  /// **'Leave this channel ungated for mature content.'**
  String get channelSettingsMatureContentOffDescription;

  /// Mature content summary when inherited setting is enabled.
  ///
  /// In en, this message translates to:
  /// **'Inherited from {inheritedSourceLabel}: on'**
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel);

  /// Mature content summary when inherited setting is disabled.
  ///
  /// In en, this message translates to:
  /// **'Inherited from {inheritedSourceLabel}: off'**
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel);

  /// Lowercase source label for inherited mature content from category.
  ///
  /// In en, this message translates to:
  /// **'category'**
  String get channelSettingsMatureContentCategorySource;

  /// Lowercase source label for inherited mature content from community.
  ///
  /// In en, this message translates to:
  /// **'community'**
  String get channelSettingsMatureContentCommunitySource;

  /// Capitalized scope label when mature content inherits from a category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get channelSettingsMatureContentCategoryScope;

  /// Capitalized scope label when mature content inherits from the community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get channelSettingsMatureContentCommunityScope;

  /// Toggle for showing content warning in channel.
  ///
  /// In en, this message translates to:
  /// **'Show a content warning in this channel'**
  String get channelSettingsContentWarningToggle;

  /// Description for the channel content warning toggle.
  ///
  /// In en, this message translates to:
  /// **'Turns on a consent prompt before entering this channel.'**
  String get channelSettingsContentWarningToggleDescription;

  /// Label for custom content warning text field.
  ///
  /// In en, this message translates to:
  /// **'Custom warning text'**
  String get channelSettingsContentWarningText;

  /// Default content warning text placeholder.
  ///
  /// In en, this message translates to:
  /// **'This contains sensitive content.'**
  String get channelSettingsContentWarningDefault;

  /// Error when user lacks manage channels permission for channel permissions tab.
  ///
  /// In en, this message translates to:
  /// **'You need the \"{manageChannelsPermissionLabel}\" permission to edit these permissions.'**
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  );

  /// Error when user lacks manage roles permission for channel permissions tab.
  ///
  /// In en, this message translates to:
  /// **'You need the \"{manageRolesPermissionLabel}\" permission to edit these permissions.'**
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  );

  /// Fallback label for unknown role in permission overwrites.
  ///
  /// In en, this message translates to:
  /// **'Unknown role'**
  String get channelSettingsUnknownRole;

  /// Fallback label for unknown user in permission overwrites.
  ///
  /// In en, this message translates to:
  /// **'Unknown user'**
  String get channelSettingsUnknownUser;

  /// Label for the default @everyone role overwrite in channel permissions.
  ///
  /// In en, this message translates to:
  /// **'@everyone'**
  String get channelSettingsEveryoneRole;

  /// Sidebar title for channel permission overwrite list.
  ///
  /// In en, this message translates to:
  /// **'Access overrides'**
  String get channelSettingsPermissionsAccessOverrides;

  /// Title for channel permission editor panel.
  ///
  /// In en, this message translates to:
  /// **'Edit access for {name}'**
  String channelSettingsPermissionsEditAccessFor(String name);

  /// Mobile back button label on channel permission editor.
  ///
  /// In en, this message translates to:
  /// **'Back to overrides'**
  String get channelSettingsPermissionsBackToOverrides;

  /// Subtitle when editing @everyone channel permissions.
  ///
  /// In en, this message translates to:
  /// **'Configure base access for this channel'**
  String get channelSettingsPermissionsConfigureBaseAccess;

  /// Subtitle when editing a role channel permission overwrite.
  ///
  /// In en, this message translates to:
  /// **'Configure overrides for this role'**
  String get channelSettingsPermissionsConfigureRoleOverrides;

  /// Subtitle when editing a member channel permission overwrite.
  ///
  /// In en, this message translates to:
  /// **'Configure overrides for this member'**
  String get channelSettingsPermissionsConfigureMemberOverrides;

  /// Placeholder for channel permissions search field.
  ///
  /// In en, this message translates to:
  /// **'Search permissions…'**
  String get channelSettingsPermissionsSearchPlaceholder;

  /// Success toast after saving channel permission overwrites.
  ///
  /// In en, this message translates to:
  /// **'Channel access updated'**
  String get channelSettingsPermissionsChannelAccessUpdated;

  /// Page title for the channel permissions settings tab.
  ///
  /// In en, this message translates to:
  /// **'Access control'**
  String get channelSettingsPermissionsTitle;

  /// Prefix for the synced-with-parent banner in channel permissions.
  ///
  /// In en, this message translates to:
  /// **'This channel is synced with the parent category '**
  String get channelSettingsPermissionsSyncedWithParentPrefix;

  /// Suffix for the synced-with-parent banner in channel permissions.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get channelSettingsPermissionsSyncedWithParentSuffix;

  /// Prefix for the not-synced-with-parent banner in channel permissions.
  ///
  /// In en, this message translates to:
  /// **'This channel is not synced with the parent category '**
  String get channelSettingsPermissionsNotSyncedWithParentPrefix;

  /// Suffix for the not-synced-with-parent banner in channel permissions.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get channelSettingsPermissionsNotSyncedWithParentSuffix;

  /// Button label to sync channel permissions with the parent category.
  ///
  /// In en, this message translates to:
  /// **'Sync with category'**
  String get channelSettingsPermissionsSyncWithCategory;

  /// Success toast after syncing channel permissions with the parent category.
  ///
  /// In en, this message translates to:
  /// **'Channel synced with parent category'**
  String get channelSettingsPermissionsSyncedWithParentToast;

  /// Button label to add a new channel permission override.
  ///
  /// In en, this message translates to:
  /// **'Add override'**
  String get channelSettingsPermissionsAddOverride;

  /// Placeholder for the add override search field.
  ///
  /// In en, this message translates to:
  /// **'Search roles or members…'**
  String get channelSettingsPermissionsSearchRolesOrMembers;

  /// Section title in the add override picker.
  ///
  /// In en, this message translates to:
  /// **'Roles and members'**
  String get channelSettingsPermissionsRolesAndMembers;

  /// Action to delete a channel invite.
  ///
  /// In en, this message translates to:
  /// **'Delete invite'**
  String get channelSettingsDeleteInvite;

  /// Confirmation message for deleting a channel invite.
  ///
  /// In en, this message translates to:
  /// **'Delete this invite? Can\'t be undone.'**
  String get channelSettingsDeleteInviteConfirm;

  /// Action to copy invite code.
  ///
  /// In en, this message translates to:
  /// **'Copy invite code'**
  String get channelSettingsCopyInviteCode;

  /// Action to copy invite URL.
  ///
  /// In en, this message translates to:
  /// **'Copy invite URL'**
  String get channelSettingsCopyInviteUrl;

  /// Success toast after creating a webhook.
  ///
  /// In en, this message translates to:
  /// **'Webhook created'**
  String get channelSettingsWebhookCreated;

  /// Error toast when webhook creation fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to create webhook'**
  String get channelSettingsWebhookCreateFailed;

  /// Button to create a new webhook in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Create webhook'**
  String get channelSettingsCreateWebhook;

  /// Description for the channel invites settings tab.
  ///
  /// In en, this message translates to:
  /// **'Manage invite links for this channel.'**
  String get channelSettingsInvitesDescription;

  /// Button to create a new invite in channel settings.
  ///
  /// In en, this message translates to:
  /// **'Create invite'**
  String get channelSettingsInvitesCreate;

  /// Empty state title for channel invites.
  ///
  /// In en, this message translates to:
  /// **'No invite links'**
  String get channelSettingsInvitesEmpty;

  /// Empty state description for channel invites.
  ///
  /// In en, this message translates to:
  /// **'This channel doesn\'t have any invite links yet. Create one to invite people to this channel.'**
  String get channelSettingsInvitesEmptyDescription;

  /// Error description when channel invites fail to load.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading the invite links for this channel. Try again.'**
  String get channelSettingsInvitesLoadFailedDescription;

  /// Description for the channel webhooks settings tab.
  ///
  /// In en, this message translates to:
  /// **'Manage incoming webhooks that can post messages into this channel.'**
  String get channelSettingsWebhooksDescription;

  /// Empty state title for channel webhooks.
  ///
  /// In en, this message translates to:
  /// **'No webhooks'**
  String get channelSettingsWebhooksEmpty;

  /// Empty state description for channel webhooks.
  ///
  /// In en, this message translates to:
  /// **'There are no webhooks configured for this channel. Create a webhook to allow external applications to post messages.'**
  String get channelSettingsWebhooksEmptyDescription;

  /// Message when the channel type does not support webhooks.
  ///
  /// In en, this message translates to:
  /// **'This channel does not support webhooks.'**
  String get channelSettingsWebhooksUnsupported;

  /// Permission denial message on the channel webhooks tab.
  ///
  /// In en, this message translates to:
  /// **'You need the \"{permission}\" permission to view and edit webhooks for this channel.'**
  String channelSettingsWebhooksPermissionRequired(String permission);

  /// Error title when channel webhooks fail to load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load webhooks'**
  String get channelSettingsWebhooksLoadFailedTitle;

  /// Error description when channel webhooks fail to load.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading the webhooks for this channel. Try again.'**
  String get channelSettingsWebhooksLoadFailedDescription;

  /// Webhook list metadata line.
  ///
  /// In en, this message translates to:
  /// **'Created by {creator} on {date}'**
  String channelSettingsWebhooksCreatedBy(String creator, String date);

  /// Fallback label when webhook creator is unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unknown user'**
  String get channelSettingsWebhooksUnknownUser;

  /// Label for webhook avatar field.
  ///
  /// In en, this message translates to:
  /// **'Avatar'**
  String get channelSettingsWebhooksAvatar;

  /// Button to upload a webhook avatar.
  ///
  /// In en, this message translates to:
  /// **'Upload image'**
  String get channelSettingsWebhooksUploadImage;

  /// Button to remove webhook avatar.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get channelSettingsWebhooksRemove;

  /// Label for webhook name field.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get channelSettingsWebhooksName;

  /// Placeholder for webhook name field.
  ///
  /// In en, this message translates to:
  /// **'Webhook name'**
  String get channelSettingsWebhooksNamePlaceholder;

  /// Label for webhook channel picker.
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get channelSettingsWebhooksChannel;

  /// Label for read-only webhook URL field.
  ///
  /// In en, this message translates to:
  /// **'Webhook URL'**
  String get channelSettingsWebhooksUrl;

  /// Button to copy webhook URL.
  ///
  /// In en, this message translates to:
  /// **'Copy webhook URL'**
  String get channelSettingsWebhooksCopyUrl;

  /// Danger button to delete a webhook.
  ///
  /// In en, this message translates to:
  /// **'Delete webhook'**
  String get channelSettingsWebhooksDelete;

  /// Error when webhook deletion fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t delete this webhook'**
  String get channelSettingsWebhooksDeleteFailed;

  /// Confirmation when deleting a webhook.
  ///
  /// In en, this message translates to:
  /// **'Delete this webhook? Can\'t be undone.'**
  String get channelSettingsWebhooksDeleteConfirm;

  /// Generic retry hint for webhook errors.
  ///
  /// In en, this message translates to:
  /// **'Try again in a moment.'**
  String get channelSettingsWebhookTryAgainInAMoment;

  /// Guild channel menu action that opens a voice channel chat without joining voice.
  ///
  /// In en, this message translates to:
  /// **'Open chat'**
  String get channelMenuOpenChat;

  /// Guild channel menu action to duplicate the selected channel.
  ///
  /// In en, this message translates to:
  /// **'Duplicate channel'**
  String get channelMenuDuplicateChannel;

  /// Developer tool action that forgets a local mature-content gate acknowledgement.
  ///
  /// In en, this message translates to:
  /// **'Reset mature content agreement state'**
  String get channelMenuResetMatureContentAgreeState;

  /// Confirmation title for deleting all of the caller's messages in a channel.
  ///
  /// In en, this message translates to:
  /// **'Delete your messages in this channel?'**
  String get channelMenuDeleteMyMessagesTitle;

  /// Confirmation description for deleting all of the caller's messages in a channel.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete every message you have ever sent in this channel. This cannot be undone.'**
  String get channelMenuDeleteMyMessagesDescription;

  /// Confirm button for deleting all of the caller's messages in a channel.
  ///
  /// In en, this message translates to:
  /// **'Delete My Messages'**
  String get channelMenuDeleteMyMessagesConfirm;

  /// Success toast after deleting messages in a channel.
  ///
  /// In en, this message translates to:
  /// **'Deleted your messages'**
  String get channelMenuDeletedYourMessages;

  /// Error toast when deleting messages in a channel fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t delete your messages'**
  String get channelMenuCouldNotDeleteYourMessages;

  /// Subtitle in channel details for a system DM recipient.
  ///
  /// In en, this message translates to:
  /// **'System message'**
  String get channelDetailsSystemMessage;

  /// Channel type subtitle for text channels.
  ///
  /// In en, this message translates to:
  /// **'Text channel'**
  String get channelDetailsTextChannel;

  /// Channel type subtitle for voice channels.
  ///
  /// In en, this message translates to:
  /// **'Voice channel'**
  String get channelDetailsVoiceChannel;

  /// Channel type subtitle for categories.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get channelDetailsCategory;

  /// Channel type subtitle for link channels.
  ///
  /// In en, this message translates to:
  /// **'Link channel'**
  String get channelDetailsLinkChannel;

  /// Generic channel type subtitle fallback.
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get channelDetailsGenericChannel;

  /// Toast after muting a DM conversation from channel details.
  ///
  /// In en, this message translates to:
  /// **'Muted conversation'**
  String get channelDetailsMutedConversation;

  /// Toast after unmuting a DM conversation from channel details.
  ///
  /// In en, this message translates to:
  /// **'Unmuted conversation'**
  String get channelDetailsUnmutedConversation;

  /// Toast after muting a guild channel from channel details.
  ///
  /// In en, this message translates to:
  /// **'Muted channel'**
  String get channelDetailsMutedChannel;

  /// Toast after unmuting a guild channel from channel details.
  ///
  /// In en, this message translates to:
  /// **'Unmuted channel'**
  String get channelDetailsUnmutedChannel;

  /// Toast after updating notification settings from channel details.
  ///
  /// In en, this message translates to:
  /// **'Notification settings updated'**
  String get channelDetailsNotificationSettingsUpdated;

  /// Members tab label in channel details.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get channelDetailsTabMembers;

  /// Pins tab label in channel details.
  ///
  /// In en, this message translates to:
  /// **'Pins'**
  String get channelDetailsTabPins;

  /// Mute action button label in channel details.
  ///
  /// In en, this message translates to:
  /// **'Mute'**
  String get channelDetailsActionMute;

  /// Unmute action button label in channel details.
  ///
  /// In en, this message translates to:
  /// **'Unmute'**
  String get channelDetailsActionUnmute;

  /// Search action button label in channel details.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get channelDetailsActionSearch;

  /// More action button label in channel details.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get channelDetailsActionMore;

  /// Empty state title when channel details has no members loaded.
  ///
  /// In en, this message translates to:
  /// **'No members to show'**
  String get channelDetailsMembersEmptyTitle;

  /// Empty state body when channel details has no members loaded.
  ///
  /// In en, this message translates to:
  /// **'Members will appear here once the community data is loaded.'**
  String get channelDetailsMembersEmptyBody;

  /// Error title when pinned messages fail to load in channel details.
  ///
  /// In en, this message translates to:
  /// **'Pins could not be loaded'**
  String get channelDetailsPinsLoadFailedTitle;

  /// Footer hint at the end of the pins list in guild channels.
  ///
  /// In en, this message translates to:
  /// **'Members with the \"Pin Messages\" permission can pin messages for everyone to see.'**
  String get channelDetailsPinsGuildEndHint;

  /// Footer hint at the end of the pins list in DM channels.
  ///
  /// In en, this message translates to:
  /// **'You can pin messages in this conversation for everyone to see.'**
  String get channelDetailsPinsDmEndHint;

  /// Footer label when the user has scrolled through all pinned messages.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the end'**
  String get channelDetailsPinsEndReached;

  /// Accessibility label for the channel header title area.
  ///
  /// In en, this message translates to:
  /// **'Open channel details'**
  String get channelHeaderOpenDetails;

  /// Toolbar button label for pinned messages.
  ///
  /// In en, this message translates to:
  /// **'Pinned messages'**
  String get channelHeaderPinnedMessages;

  /// Toolbar button label when pinned messages have unread items.
  ///
  /// In en, this message translates to:
  /// **'Pinned messages, unread'**
  String get channelHeaderPinnedMessagesUnread;

  /// Toolbar button label for toggling the member list panel.
  ///
  /// In en, this message translates to:
  /// **'Member list'**
  String get channelHeaderMemberList;

  /// Toolbar button label for the inbox popout.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get channelHeaderInbox;

  /// Toolbar button label for notification settings when the channel is muted.
  ///
  /// In en, this message translates to:
  /// **'Notification settings, muted'**
  String get channelHeaderNotificationSettingsMuted;

  /// Title for the channel search bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get channelDetailsSearchTitle;

  /// Search field hint in channel details message search.
  ///
  /// In en, this message translates to:
  /// **'Search Messages'**
  String get channelDetailsSearchHint;

  /// Author filter chip label in channel message search.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get channelDetailsSearchFilterFrom;

  /// Content filter chip label in channel message search.
  ///
  /// In en, this message translates to:
  /// **'Has'**
  String get channelDetailsSearchFilterHas;

  /// Sort filter chip label in channel message search.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get channelDetailsSearchFilterSort;

  /// Section header for inline channel search filter shortcuts.
  ///
  /// In en, this message translates to:
  /// **'Search Filters'**
  String get channelHeaderSearchFiltersTitle;

  /// Section header for inline channel search history.
  ///
  /// In en, this message translates to:
  /// **'Recent Searches'**
  String get channelHeaderSearchRecentTitle;

  /// Section title for user filter autocomplete
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get channelHeaderSearchUsersTitle;

  /// Section title for channel filter autocomplete
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get channelHeaderSearchChannelsTitle;

  /// Section title for filter value autocomplete
  ///
  /// In en, this message translates to:
  /// **'Values'**
  String get channelHeaderSearchValuesTitle;

  /// Section title for date filter autocomplete
  ///
  /// In en, this message translates to:
  /// **'Dates'**
  String get channelHeaderSearchDatesTitle;

  /// Badge shown on default filter value options
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get channelHeaderSearchDefaultBadge;

  /// Button to clear recent channel search history.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get channelHeaderSearchClearHistory;

  /// Description for the from: search filter.
  ///
  /// In en, this message translates to:
  /// **'a user'**
  String get channelHeaderSearchFilterDescFrom;

  /// Description for the mentions: search filter.
  ///
  /// In en, this message translates to:
  /// **'a user'**
  String get channelHeaderSearchFilterDescMentions;

  /// Description for the has: search filter.
  ///
  /// In en, this message translates to:
  /// **'link, embed, image, video, sound, file, sticker, …'**
  String get channelHeaderSearchFilterDescHas;

  /// Description for the before: search filter.
  ///
  /// In en, this message translates to:
  /// **'a date or date range'**
  String get channelHeaderSearchFilterDescBefore;

  /// Description for the on: search filter.
  ///
  /// In en, this message translates to:
  /// **'a date or date range'**
  String get channelHeaderSearchFilterDescOn;

  /// Description for the during: search filter.
  ///
  /// In en, this message translates to:
  /// **'a date or date range'**
  String get channelHeaderSearchFilterDescDuring;

  /// Description for the after: search filter.
  ///
  /// In en, this message translates to:
  /// **'a date or date range'**
  String get channelHeaderSearchFilterDescAfter;

  /// Description for the in: search filter.
  ///
  /// In en, this message translates to:
  /// **'a channel'**
  String get channelHeaderSearchFilterDescIn;

  /// Description for the pinned: search filter.
  ///
  /// In en, this message translates to:
  /// **'true or false'**
  String get channelHeaderSearchFilterDescPinned;

  /// Description for the author-type: search filter.
  ///
  /// In en, this message translates to:
  /// **'user, bot, or webhook'**
  String get channelHeaderSearchFilterDescAuthorType;

  /// Description for the link-from: search filter.
  ///
  /// In en, this message translates to:
  /// **'a hostname, e.g. example.com'**
  String get channelHeaderSearchFilterDescLinkFrom;

  /// Description for the file-name: search filter.
  ///
  /// In en, this message translates to:
  /// **'part of an attachment filename'**
  String get channelHeaderSearchFilterDescFileName;

  /// Description for the file-type: search filter.
  ///
  /// In en, this message translates to:
  /// **'a file extension, e.g. png'**
  String get channelHeaderSearchFilterDescFileType;

  /// Description for the sort: search filter.
  ///
  /// In en, this message translates to:
  /// **'timestamp or relevance'**
  String get channelHeaderSearchFilterDescSort;

  /// Description for the order: search filter.
  ///
  /// In en, this message translates to:
  /// **'asc or desc'**
  String get channelHeaderSearchFilterDescOrder;

  /// Result count label in channel message search.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Result} other{{count} Results}}'**
  String channelDetailsSearchResultCount(int count);

  /// Title for the author filter sheet in channel message search.
  ///
  /// In en, this message translates to:
  /// **'Filter by user'**
  String get channelDetailsSearchFilterByUser;

  /// Title for the content filter sheet in channel message search.
  ///
  /// In en, this message translates to:
  /// **'Filter by content'**
  String get channelDetailsSearchFilterByContent;

  /// Title for the sort filter sheet in channel message search.
  ///
  /// In en, this message translates to:
  /// **'Sort results by'**
  String get channelDetailsSearchSortBy;

  /// Title for the search scope filter sheet in channel message search.
  ///
  /// In en, this message translates to:
  /// **'Search In'**
  String get channelDetailsSearchIn;

  /// Empty state title before the user runs a channel message search.
  ///
  /// In en, this message translates to:
  /// **'Search this conversation'**
  String get channelDetailsSearchEmptyTitle;

  /// Empty state body before the user runs a channel message search.
  ///
  /// In en, this message translates to:
  /// **'Enter text, an author, or a content filter to find messages.'**
  String get channelDetailsSearchEmptyBody;

  /// Title when channel message search is still indexing.
  ///
  /// In en, this message translates to:
  /// **'Messages are indexing'**
  String get channelDetailsSearchIndexingTitle;

  /// Body when channel message search is still indexing.
  ///
  /// In en, this message translates to:
  /// **'Try again shortly once search finishes indexing this scope.'**
  String get channelDetailsSearchIndexingBody;

  /// Title when a channel message search returns no results.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get channelDetailsSearchNoResultsTitle;

  /// Body when a channel message search returns no results.
  ///
  /// In en, this message translates to:
  /// **'Try different search terms or filters.'**
  String get channelDetailsSearchNoResultsBody;

  /// Online members section header in channel details.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get channelDetailsMembersOnline;

  /// Offline members section header in channel details.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get channelDetailsMembersOffline;

  /// Label for the current user in the channel details member list.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get channelDetailsMemberYou;

  /// Search field hint in channel details user picker sheets.
  ///
  /// In en, this message translates to:
  /// **'Search users'**
  String get channelDetailsSearchUsersHint;

  /// Prompt shown before the user types in the member search picker.
  ///
  /// In en, this message translates to:
  /// **'Type to search members'**
  String get channelDetailsSearchUsersTypeToSearch;

  /// Empty state when member search returns no results.
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get channelDetailsSearchUsersEmpty;

  /// Empty state when no users are available in the member picker.
  ///
  /// In en, this message translates to:
  /// **'No users available'**
  String get channelDetailsSearchUsersNoAvailable;

  /// Done button label in channel details picker sheets.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get channelDetailsDone;

  /// Prompt above content filter options in channel message search.
  ///
  /// In en, this message translates to:
  /// **'Show messages that contain:'**
  String get channelDetailsHasFilterPrompt;

  /// Retry button label in channel details error states.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get channelDetailsRetry;

  /// Title for the pinned message action sheet in channel details.
  ///
  /// In en, this message translates to:
  /// **'Pinned Message'**
  String get channelDetailsPinnedMessageTitle;

  /// Title for the search result action sheet in channel details.
  ///
  /// In en, this message translates to:
  /// **'Search Result'**
  String get channelDetailsSearchResultTitle;

  /// Action to jump to a message from channel details.
  ///
  /// In en, this message translates to:
  /// **'Jump to Message'**
  String get channelDetailsJumpToMessage;

  /// Action to unpin a message from channel details.
  ///
  /// In en, this message translates to:
  /// **'Unpin Message'**
  String get channelDetailsUnpinMessage;

  /// Action to copy a message link from channel details.
  ///
  /// In en, this message translates to:
  /// **'Copy Message Link'**
  String get channelDetailsCopyMessageLink;

  /// Action to copy a message ID from channel details.
  ///
  /// In en, this message translates to:
  /// **'Copy Message ID'**
  String get channelDetailsCopyMessageId;

  /// Toast after unpinning a message from channel details.
  ///
  /// In en, this message translates to:
  /// **'Message unpinned'**
  String get channelDetailsMessageUnpinned;

  /// Search scope label for the current community.
  ///
  /// In en, this message translates to:
  /// **'Current Community'**
  String get channelDetailsSearchScopeCurrentCommunity;

  /// Search scope label for the current DM.
  ///
  /// In en, this message translates to:
  /// **'Current DM'**
  String get channelDetailsSearchScopeCurrentDm;

  /// Search scope label for all communities.
  ///
  /// In en, this message translates to:
  /// **'All Communities'**
  String get channelDetailsSearchScopeAllCommunities;

  /// Search scope label for all DMs when searching from a guild channel.
  ///
  /// In en, this message translates to:
  /// **'All DMs Only'**
  String get channelDetailsSearchScopeAllDmsOnlyGuild;

  /// Search scope label for all DMs when searching from a DM.
  ///
  /// In en, this message translates to:
  /// **'All DMs'**
  String get channelDetailsSearchScopeAllDms;

  /// Search scope label for open DMs when searching from a guild channel.
  ///
  /// In en, this message translates to:
  /// **'Open DMs Only'**
  String get channelDetailsSearchScopeOpenDmsOnlyGuild;

  /// Search scope label for open DMs when searching from a DM.
  ///
  /// In en, this message translates to:
  /// **'Open DMs'**
  String get channelDetailsSearchScopeOpenDms;

  /// Search scope label for all DMs and communities.
  ///
  /// In en, this message translates to:
  /// **'All DMs + Communities'**
  String get channelDetailsSearchScopeAllDmsAndCommunities;

  /// Search scope label for open DMs and communities.
  ///
  /// In en, this message translates to:
  /// **'Open DMs + Communities'**
  String get channelDetailsSearchScopeOpenDmsAndCommunities;

  /// Description for the current community search scope.
  ///
  /// In en, this message translates to:
  /// **'Search only in the current Community'**
  String get channelDetailsSearchScopeCurrentCommunityDescription;

  /// Description for the current DM search scope.
  ///
  /// In en, this message translates to:
  /// **'Search only in the current DM'**
  String get channelDetailsSearchScopeCurrentDmDescription;

  /// Description for the all communities search scope.
  ///
  /// In en, this message translates to:
  /// **'Across all Communities you\'re currently in'**
  String get channelDetailsSearchScopeAllCommunitiesDescription;

  /// Description for all DMs scope when searching from a guild channel.
  ///
  /// In en, this message translates to:
  /// **'Across all DMs you\'ve ever been in only'**
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription;

  /// Description for all DMs scope when searching from a DM.
  ///
  /// In en, this message translates to:
  /// **'Across all DMs you\'ve ever been in'**
  String get channelDetailsSearchScopeAllDmsDescription;

  /// Description for open DMs scope when searching from a guild channel.
  ///
  /// In en, this message translates to:
  /// **'Across all DMs you currently have open only'**
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription;

  /// Description for open DMs scope when searching from a DM.
  ///
  /// In en, this message translates to:
  /// **'Across all DMs you currently have open'**
  String get channelDetailsSearchScopeOpenDmsDescription;

  /// Description for the all DMs and communities search scope.
  ///
  /// In en, this message translates to:
  /// **'Across all DMs you\'ve ever been in + all Communities you\'re currently in'**
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription;

  /// Description for the open DMs and communities search scope.
  ///
  /// In en, this message translates to:
  /// **'Across all DMs you currently have open + all Communities you\'re currently in'**
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription;

  /// Sort option label for newest messages first.
  ///
  /// In en, this message translates to:
  /// **'Newest First'**
  String get channelDetailsSearchSortNewest;

  /// Sort option label for oldest messages first.
  ///
  /// In en, this message translates to:
  /// **'Oldest First'**
  String get channelDetailsSearchSortOldest;

  /// Sort option label for most relevant messages first.
  ///
  /// In en, this message translates to:
  /// **'Most Relevant'**
  String get channelDetailsSearchSortRelevance;

  /// Description for the newest-first sort option.
  ///
  /// In en, this message translates to:
  /// **'Show most recent messages first'**
  String get channelDetailsSearchSortNewestDescription;

  /// Description for the oldest-first sort option.
  ///
  /// In en, this message translates to:
  /// **'Show oldest messages first'**
  String get channelDetailsSearchSortOldestDescription;

  /// Description for the relevance sort option.
  ///
  /// In en, this message translates to:
  /// **'Show most relevant messages first'**
  String get channelDetailsSearchSortRelevanceDescription;

  /// Content filter label for uploaded images.
  ///
  /// In en, this message translates to:
  /// **'Image Upload'**
  String get channelDetailsSearchContentImage;

  /// Content filter label for uploaded videos.
  ///
  /// In en, this message translates to:
  /// **'Video Upload'**
  String get channelDetailsSearchContentVideo;

  /// Content filter label for uploaded audio.
  ///
  /// In en, this message translates to:
  /// **'Audio Upload'**
  String get channelDetailsSearchContentAudio;

  /// Content filter label for uploaded files.
  ///
  /// In en, this message translates to:
  /// **'File Upload'**
  String get channelDetailsSearchContentFile;

  /// Content filter label for typed links.
  ///
  /// In en, this message translates to:
  /// **'Link'**
  String get channelDetailsSearchContentLink;

  /// Content filter label for link previews and embeds.
  ///
  /// In en, this message translates to:
  /// **'Link Preview or Embed'**
  String get channelDetailsSearchContentEmbed;

  /// Content filter label for stickers.
  ///
  /// In en, this message translates to:
  /// **'Sticker'**
  String get channelDetailsSearchContentSticker;

  /// Description for the image content filter.
  ///
  /// In en, this message translates to:
  /// **'Uploaded image files only'**
  String get channelDetailsSearchContentImageDescription;

  /// Description for the video content filter.
  ///
  /// In en, this message translates to:
  /// **'Uploaded video files only'**
  String get channelDetailsSearchContentVideoDescription;

  /// Description for the audio content filter.
  ///
  /// In en, this message translates to:
  /// **'Uploaded audio files only'**
  String get channelDetailsSearchContentAudioDescription;

  /// Description for the file content filter.
  ///
  /// In en, this message translates to:
  /// **'Any uploaded attachment'**
  String get channelDetailsSearchContentFileDescription;

  /// Description for the link content filter.
  ///
  /// In en, this message translates to:
  /// **'Typed URL in the message text'**
  String get channelDetailsSearchContentLinkDescription;

  /// Description for the embed content filter.
  ///
  /// In en, this message translates to:
  /// **'Resolved previews and rich embeds, not uploads'**
  String get channelDetailsSearchContentEmbedDescription;

  /// Description for the sticker content filter.
  ///
  /// In en, this message translates to:
  /// **'Sticker attached to the message'**
  String get channelDetailsSearchContentStickerDescription;

  /// Chip label when multiple content filters are selected in channel message search.
  ///
  /// In en, this message translates to:
  /// **'{count} types'**
  String channelDetailsSearchContentTypesCount(int count);

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

  /// Welcome copy on the group DM hero at the start of chat history. {displayName} is rendered bold in the UI.
  ///
  /// In en, this message translates to:
  /// **'Welcome to {displayName}. Add friends to get the group going.'**
  String groupDmWelcome(String displayName);

  /// Secondary action on the group DM welcome hero.
  ///
  /// In en, this message translates to:
  /// **'Edit group'**
  String get groupDmWelcomeEditGroup;

  /// Primary action on the group DM welcome hero.
  ///
  /// In en, this message translates to:
  /// **'Add friends to group'**
  String get groupDmWelcomeAddFriends;

  /// Menu label for managing group DM invites.
  ///
  /// In en, this message translates to:
  /// **'Invites'**
  String get dmGroupInvites;

  /// Title for the edit group DM modal or sheet.
  ///
  /// In en, this message translates to:
  /// **'Edit group'**
  String get groupDmEditTitle;

  /// Tooltip on the desktop group DM header edit action.
  ///
  /// In en, this message translates to:
  /// **'Edit group details'**
  String get groupDmEditDetailsTooltip;

  /// Label for the group name field in edit group.
  ///
  /// In en, this message translates to:
  /// **'Group name'**
  String get groupDmGroupName;

  /// Placeholder for the group name field in edit group.
  ///
  /// In en, this message translates to:
  /// **'My group'**
  String get groupDmMyGroup;

  /// Validation error when group name is too long.
  ///
  /// In en, this message translates to:
  /// **'Group name must not exceed 100 characters'**
  String get groupDmGroupNameMaxLength;

  /// Label for the group icon section in edit group.
  ///
  /// In en, this message translates to:
  /// **'Group icon'**
  String get groupDmGroupIcon;

  /// Button to upload a group icon.
  ///
  /// In en, this message translates to:
  /// **'Upload icon'**
  String get groupDmUploadIcon;

  /// Button to change an existing group icon.
  ///
  /// In en, this message translates to:
  /// **'Change icon'**
  String get groupDmChangeIcon;

  /// Button to remove the group icon.
  ///
  /// In en, this message translates to:
  /// **'Remove icon'**
  String get groupDmRemoveIcon;

  /// Success toast after saving group changes.
  ///
  /// In en, this message translates to:
  /// **'Group updated'**
  String get groupDmUpdated;

  /// Error toast when group update fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update group. Try again.'**
  String get groupDmUpdateFailed;

  /// Error when user selects an animated group icon.
  ///
  /// In en, this message translates to:
  /// **'Animated icons are not supported. Use a static image.'**
  String get groupDmAnimatedIconNotSupported;

  /// Title when user selects an animated group icon.
  ///
  /// In en, this message translates to:
  /// **'Animated icons are not supported'**
  String get groupDmAnimatedIconNotSupportedTitle;

  /// Title when the selected group icon exceeds the size limit.
  ///
  /// In en, this message translates to:
  /// **'Icon file is too large'**
  String get groupDmIconFileTooLargeTitle;

  /// Body when the selected group icon exceeds the size limit.
  ///
  /// In en, this message translates to:
  /// **'Icon file is too large. Choose a file smaller than {maxSize}.'**
  String groupDmIconFileTooLargeBody(String maxSize);

  /// Title when the selected group icon format is unsupported.
  ///
  /// In en, this message translates to:
  /// **'Unsupported icon format'**
  String get groupDmUnsupportedIconFormat;

  /// Body when the selected group icon format is unsupported.
  ///
  /// In en, this message translates to:
  /// **'Unsupported file type.'**
  String get groupDmUnsupportedIconFormatBody;

  /// Title when a cropped group icon cannot be processed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t process image'**
  String get groupDmCouldntProcessImage;

  /// Body when a cropped group icon cannot be processed.
  ///
  /// In en, this message translates to:
  /// **'Failed to process the cropped image. Try again.'**
  String get groupDmFailedToProcessCroppedImage;

  /// Title when the selected group icon image cannot be used.
  ///
  /// In en, this message translates to:
  /// **'Invalid image'**
  String get groupDmInvalidImage;

  /// Body when the selected group icon image cannot be used.
  ///
  /// In en, this message translates to:
  /// **'That image is invalid. Try another one.'**
  String get groupDmInvalidImageBody;

  /// Button to add selected friends to a group DM.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get groupDmAddFriends;

  /// Label above the invite link field in add friends to group.
  ///
  /// In en, this message translates to:
  /// **'or send an invite to a friend:'**
  String get groupDmOrSendInvite;

  /// Placeholder for the invite link field before generation.
  ///
  /// In en, this message translates to:
  /// **'Generate invite link'**
  String get groupDmGenerateInviteLink;

  /// Button to create a group DM invite link.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get groupDmCreateInvite;

  /// Note below the invite link field in add friends to group.
  ///
  /// In en, this message translates to:
  /// **'Your invite expires in 24 hours'**
  String get groupDmInviteExpires24Hours;

  /// Error when adding a single friend to a group DM fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t add this friend to the group. Please try again.'**
  String get groupDmAddFriendFailed;

  /// Title when adding friends to a group DM fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t add to group'**
  String get groupDmAddFailed;

  /// Error when the group DM has no remaining member slots.
  ///
  /// In en, this message translates to:
  /// **'This group is full. Remove someone before adding more people.'**
  String get groupDmGroupFull;

  /// Error when add-friends requests are rate limited.
  ///
  /// In en, this message translates to:
  /// **'You\'re going too fast. Wait a moment and try again.'**
  String get groupDmRateLimited;

  /// Title when invite link generation fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t create invite link'**
  String get groupDmCreateInviteFailed;

  /// Body when invite link generation fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t generate an invite link. Please try again.'**
  String get groupDmCreateInviteFailedBody;

  /// Error when copying a group DM invite link fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to copy invite link'**
  String get groupDmCopyInviteFailed;

  /// Shown when a non-owner opens group invites management.
  ///
  /// In en, this message translates to:
  /// **'Only the group owner can manage invites.'**
  String get groupDmInvitesOwnerOnly;

  /// Empty state for group DM invites list.
  ///
  /// In en, this message translates to:
  /// **'No invites created'**
  String get groupDmNoInvitesCreated;

  /// Loading state for group DM invites list.
  ///
  /// In en, this message translates to:
  /// **'Loading invites...'**
  String get groupDmLoadingInvites;

  /// Inline error when group DM invites fail to load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load invites. Try again.'**
  String get groupDmInvitesLoadFailed;

  /// Confirmation body when revoking a group DM invite.
  ///
  /// In en, this message translates to:
  /// **'Revoke this invite? Can\'t be undone.'**
  String get groupDmInvitesRevokeConfirm;

  /// Success toast after revoking a group DM invite.
  ///
  /// In en, this message translates to:
  /// **'Invite revoked'**
  String get groupDmInviteRevoked;

  /// Mobile group invite row subtitle.
  ///
  /// In en, this message translates to:
  /// **'Created by {name}. Expires in {time}.'**
  String groupDmInviteCreatedByExpires(String name, String time);

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

  /// Placeholder in the message composer for a text channel.
  ///
  /// In en, this message translates to:
  /// **'Message #{channelName}'**
  String channelComposerHint(String channelName);

  /// Placeholder in the message composer for a one-to-one DM.
  ///
  /// In en, this message translates to:
  /// **'Message @{recipientName}'**
  String dmComposerHint(String recipientName);

  /// Placeholder in the message composer for a named group DM.
  ///
  /// In en, this message translates to:
  /// **'Message {groupName}'**
  String groupDmNamedComposerHint(String groupName);

  /// Placeholder in the message composer for a group DM without a custom name.
  ///
  /// In en, this message translates to:
  /// **'Message group'**
  String get groupDmComposerHint;

  /// Generic fallback placeholder in the message composer.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get composerHint;

  /// Accessibility label for the composer button that opens the emoji and media picker.
  ///
  /// In en, this message translates to:
  /// **'Open expression picker'**
  String get composerOpenExpressionPicker;

  /// Accessibility label for the composer button that closes the expression picker and shows the keyboard.
  ///
  /// In en, this message translates to:
  /// **'Show keyboard'**
  String get composerShowKeyboard;

  /// Screen reader label for a chat message row.
  ///
  /// In en, this message translates to:
  /// **'{author}, {summary}'**
  String messageAccessibilityLabel(String author, String summary);

  /// Screen reader suffix when a message is still sending.
  ///
  /// In en, this message translates to:
  /// **', sending'**
  String get messageAccessibilitySendingSuffix;

  /// Screen reader suffix when a message failed to send.
  ///
  /// In en, this message translates to:
  /// **', failed to send'**
  String get messageAccessibilityFailedSuffix;

  /// Screen reader summary for a message with attachments but no text.
  ///
  /// In en, this message translates to:
  /// **'an attachment'**
  String get messageAccessibilityAttachmentSummary;

  /// Screen reader summary for a message with multiple attachments and no text.
  ///
  /// In en, this message translates to:
  /// **'{count} attachments'**
  String messageAccessibilityAttachmentsSummary(int count);

  /// Screen reader summary for a message with an image attachment or embed.
  ///
  /// In en, this message translates to:
  /// **'an image'**
  String get messageAccessibilityImageSummary;

  /// Screen reader summary for a message with a video attachment or embed.
  ///
  /// In en, this message translates to:
  /// **'a video'**
  String get messageAccessibilityVideoSummary;

  /// Screen reader summary for a message with an audio attachment.
  ///
  /// In en, this message translates to:
  /// **'an audio file'**
  String get messageAccessibilityAudioSummary;

  /// Screen reader summary for a message with a sticker and no text.
  ///
  /// In en, this message translates to:
  /// **'sticker {name}'**
  String messageAccessibilityStickerSummary(String name);

  /// Screen reader summary for a message with a single file attachment and no text.
  ///
  /// In en, this message translates to:
  /// **'file {filename}'**
  String messageAccessibilityFileSummary(String filename);

  /// Screen reader summary for a message with a spoiler attachment and no text.
  ///
  /// In en, this message translates to:
  /// **'a spoiler attachment'**
  String get messageAccessibilitySpoilerAttachmentSummary;

  /// Screen reader summary for a message with embeds but no text.
  ///
  /// In en, this message translates to:
  /// **'an embed'**
  String get messageAccessibilityEmbedSummary;

  /// Screen reader summary fallback for a message without visible text.
  ///
  /// In en, this message translates to:
  /// **'a message'**
  String get messageAccessibilityEmptySummary;

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

  /// User settings navigation item for chat settings.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get userSettingsNavChat;

  /// User settings navigation item for audio and video settings.
  ///
  /// In en, this message translates to:
  /// **'Audio & Video'**
  String get userSettingsNavAudioAndVideo;

  /// Settings section title for audio settings in the voice and video tab.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audioAndVideoAudioSectionTitle;

  /// Settings section description for audio settings in the voice and video tab.
  ///
  /// In en, this message translates to:
  /// **'Configure your microphone, speakers, and voice processing.'**
  String get audioAndVideoAudioSectionDescription;

  /// Settings section title for video settings in the voice and video tab.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get audioAndVideoVideoSectionTitle;

  /// Settings section description for video settings in the voice and video tab.
  ///
  /// In en, this message translates to:
  /// **'Configure your camera and screen sharing quality.'**
  String get audioAndVideoVideoSectionDescription;

  /// Settings section title for in-call behavior prompts.
  ///
  /// In en, this message translates to:
  /// **'In-call behavior'**
  String get audioAndVideoInCallBehaviorSectionTitle;

  /// Settings section description for in-call behavior prompts.
  ///
  /// In en, this message translates to:
  /// **'Control confirmation prompts during voice and video calls.'**
  String get audioAndVideoInCallBehaviorSectionDescription;

  /// Label for microphone input device selection.
  ///
  /// In en, this message translates to:
  /// **'Input device'**
  String get audioAndVideoInputDeviceLabel;

  /// Label for speaker output device selection.
  ///
  /// In en, this message translates to:
  /// **'Output device'**
  String get audioAndVideoOutputDeviceLabel;

  /// Label for the system default audio or video device.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get audioAndVideoDefaultDeviceLabel;

  /// Switch label to route voice call audio through the device speaker.
  ///
  /// In en, this message translates to:
  /// **'Use speaker'**
  String get audioAndVideoUseSpeakerLabel;

  /// Description for the speaker output toggle on mobile.
  ///
  /// In en, this message translates to:
  /// **'When off, audio plays through the earpiece or connected headphones.'**
  String get audioAndVideoUseSpeakerDescription;

  /// Label for microphone input volume slider.
  ///
  /// In en, this message translates to:
  /// **'Input volume'**
  String get audioAndVideoInputVolumeLabel;

  /// Label for speaker output volume slider.
  ///
  /// In en, this message translates to:
  /// **'Output volume'**
  String get audioAndVideoOutputVolumeLabel;

  /// Subsection title for voice processing profile selection.
  ///
  /// In en, this message translates to:
  /// **'Voice processing'**
  String get audioAndVideoVoiceProcessingSectionTitle;

  /// Voice processing profile optimized for speech.
  ///
  /// In en, this message translates to:
  /// **'Focused voice'**
  String get audioAndVideoFocusedVoiceLabel;

  /// Description for the focused voice processing profile.
  ///
  /// In en, this message translates to:
  /// **'Recommended. Cleans up your mic for clear speech.'**
  String get audioAndVideoFocusedVoiceDescription;

  /// Voice processing profile that sends unprocessed audio.
  ///
  /// In en, this message translates to:
  /// **'Direct input'**
  String get audioAndVideoDirectInputLabel;

  /// Description for the direct input voice processing profile.
  ///
  /// In en, this message translates to:
  /// **'Sends your audio untouched. Best if you\'re using external audio software.'**
  String get audioAndVideoDirectInputDescription;

  /// Voice processing profile with manual controls.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get audioAndVideoCustomProfileLabel;

  /// Description for the custom voice processing profile.
  ///
  /// In en, this message translates to:
  /// **'Adjust each setting yourself: noise suppression, echo cancellation, and gain.'**
  String get audioAndVideoCustomProfileDescription;

  /// Subsection title for noise suppression tier selection.
  ///
  /// In en, this message translates to:
  /// **'Noise suppression'**
  String get audioAndVideoNoiseSuppressionSectionTitle;

  /// Enhanced noise suppression option using AI filtering.
  ///
  /// In en, this message translates to:
  /// **'Enhanced'**
  String get audioAndVideoNoiseSuppressionEnhancedLabel;

  /// Standard browser or platform noise suppression option.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get audioAndVideoNoiseSuppressionStandardLabel;

  /// No noise suppression option.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get audioAndVideoNoiseSuppressionNoneLabel;

  /// Toggle label for echo cancellation.
  ///
  /// In en, this message translates to:
  /// **'Echo cancellation'**
  String get audioAndVideoEchoCancellationLabel;

  /// Toggle label for automatic gain control.
  ///
  /// In en, this message translates to:
  /// **'Automatic gain control'**
  String get audioAndVideoAutomaticGainControlLabel;

  /// Description for automatic gain control toggle.
  ///
  /// In en, this message translates to:
  /// **'Evens out your mic volume. Off when enhanced suppression is on.'**
  String get audioAndVideoAutomaticGainControlDescription;

  /// Subsection title for microphone test controls.
  ///
  /// In en, this message translates to:
  /// **'Mic test'**
  String get audioAndVideoMicTestSectionTitle;

  /// Button label to start the microphone test.
  ///
  /// In en, this message translates to:
  /// **'Start mic test'**
  String get audioAndVideoMicTestStartLabel;

  /// Button label to stop the microphone test.
  ///
  /// In en, this message translates to:
  /// **'Stop mic test'**
  String get audioAndVideoMicTestStopLabel;

  /// Shown when microphone permission is required for the mic test.
  ///
  /// In en, this message translates to:
  /// **'{productName} needs microphone access to test your input.'**
  String audioAndVideoMicTestPermissionRequired(String productName);

  /// Label for camera device selection.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get audioAndVideoCameraLabel;

  /// Switch label for flipping the local camera preview horizontally.
  ///
  /// In en, this message translates to:
  /// **'Mirror camera'**
  String get audioAndVideoMirrorCameraLabel;

  /// Subsection title for camera resolution selection.
  ///
  /// In en, this message translates to:
  /// **'Camera quality'**
  String get audioAndVideoCameraQualitySectionTitle;

  /// Camera quality option for 480p resolution.
  ///
  /// In en, this message translates to:
  /// **'480p'**
  String get audioAndVideoCameraQuality480pLabel;

  /// Camera quality option for 720p resolution.
  ///
  /// In en, this message translates to:
  /// **'720p'**
  String get audioAndVideoCameraQuality720pLabel;

  /// Camera quality option for 1080p resolution.
  ///
  /// In en, this message translates to:
  /// **'1080p'**
  String get audioAndVideoCameraQuality1080pLabel;

  /// Subsection title for screen share resolution selection.
  ///
  /// In en, this message translates to:
  /// **'Screen share quality'**
  String get audioAndVideoScreenShareQualitySectionTitle;

  /// Subsection title for screen share frame rate selection.
  ///
  /// In en, this message translates to:
  /// **'Frame rate'**
  String get audioAndVideoFrameRateSectionTitle;

  /// Screen share frame rate option for 15 FPS.
  ///
  /// In en, this message translates to:
  /// **'15 FPS'**
  String get audioAndVideoFrameRate15Label;

  /// Screen share frame rate option for 30 FPS.
  ///
  /// In en, this message translates to:
  /// **'30 FPS'**
  String get audioAndVideoFrameRate30Label;

  /// Screen share frame rate option for 60 FPS.
  ///
  /// In en, this message translates to:
  /// **'60 FPS'**
  String get audioAndVideoFrameRate60Label;

  /// Note shown when higher video quality options require premium.
  ///
  /// In en, this message translates to:
  /// **'1080p and 60 FPS require {premiumProductName}.'**
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName);

  /// Note shown when instance limits block higher screen share quality.
  ///
  /// In en, this message translates to:
  /// **'This instance currently allows screen share up to 720p at 30 FPS.'**
  String get audioAndVideoInstanceVideoQualityLimit;

  /// Shown when microphone permission is required to enumerate audio input devices.
  ///
  /// In en, this message translates to:
  /// **'{productName} needs microphone access to list your devices.'**
  String audioAndVideoMicrophonePermissionRequired(String productName);

  /// Shown when camera permission is required to enumerate video devices.
  ///
  /// In en, this message translates to:
  /// **'{productName} needs camera access to list your devices.'**
  String audioAndVideoCameraPermissionRequired(String productName);

  /// Toggle to skip confirmation when hiding own camera during a call.
  ///
  /// In en, this message translates to:
  /// **'Don\'t ask when hiding my camera'**
  String get audioAndVideoSkipHideOwnCameraConfirmLabel;

  /// Toggle to skip confirmation when hiding own screen share during a call.
  ///
  /// In en, this message translates to:
  /// **'Don\'t ask when hiding my screen share'**
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel;

  /// User settings navigation item for notification settings.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get userSettingsNavNotifications;

  /// Notifications settings section title for general notification controls.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get notificationsGeneralSectionTitle;

  /// Toggle label for enabling push or system notifications.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications'**
  String get notificationsEnableNotificationsLabel;

  /// Description for the enable notifications toggle on mobile.
  ///
  /// In en, this message translates to:
  /// **'Get notified when you receive messages. You may need to allow notifications for {productName} in your device settings. For per-channel/per-community controls, open notification settings from a community\'s menu.'**
  String notificationsEnableNotificationsDescription(String productName);

  /// Toggle label for enabling desktop notifications.
  ///
  /// In en, this message translates to:
  /// **'Enable desktop notifications'**
  String get notificationsEnableDesktopNotificationsLabel;

  /// Description for the enable desktop notifications toggle.
  ///
  /// In en, this message translates to:
  /// **'Uses the OS notification center. For per-channel/per-community controls, right-click a community icon and open notification settings.'**
  String get notificationsEnableDesktopNotificationsDescription;

  /// Toggle label for enabling browser notifications.
  ///
  /// In en, this message translates to:
  /// **'Enable browser notifications'**
  String get notificationsEnableBrowserNotificationsLabel;

  /// Description for the enable browser notifications toggle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when you receive messages. You may need to allow notifications in your browser settings. For per-channel/per-community controls, right-click a community icon and open notification settings.'**
  String get notificationsEnableBrowserNotificationsDescription;

  /// Label for push notification inactive timeout setting.
  ///
  /// In en, this message translates to:
  /// **'Push notification inactive timeout'**
  String get notificationsPushInactiveTimeoutLabel;

  /// Description for push notification inactive timeout setting.
  ///
  /// In en, this message translates to:
  /// **'{productName} avoids sending push notifications to your mobile devices when you are at your computer. Choose how long you need to be inactive on desktop before you receive push notifications.'**
  String notificationsPushInactiveTimeoutDescription(String productName);

  /// Push notification inactive timeout option for one minute.
  ///
  /// In en, this message translates to:
  /// **'{oneMinute} minute'**
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute);

  /// Push notification inactive timeout option for multiple minutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes'**
  String notificationsPushInactiveTimeoutMinutes(int minutes);

  /// Notifications settings section title for reply mention preference.
  ///
  /// In en, this message translates to:
  /// **'Mention preference'**
  String get notificationsMentionPreferenceSectionTitle;

  /// Accessibility label for the reply mention preference radio group.
  ///
  /// In en, this message translates to:
  /// **'Reply mention preference'**
  String get notificationsReplyMentionPreferenceAriaLabel;

  /// Mention preference option: no preference.
  ///
  /// In en, this message translates to:
  /// **'No preference'**
  String get notificationsMentionNoPreferenceName;

  /// Description for the no preference mention option.
  ///
  /// In en, this message translates to:
  /// **'Respect the sender\'s intent, with no warning when they toggle the @ mention'**
  String get notificationsMentionNoPreferenceDescription;

  /// Mention preference option: prefer @mention.
  ///
  /// In en, this message translates to:
  /// **'Prefer @mention'**
  String get notificationsMentionPreferMentionName;

  /// Description for the prefer @mention option.
  ///
  /// In en, this message translates to:
  /// **'Default replies to @mention you, and warn the sender if they disable it'**
  String get notificationsMentionPreferMentionDescription;

  /// Mention preference option: prefer no @mention.
  ///
  /// In en, this message translates to:
  /// **'Prefer no @mention'**
  String get notificationsMentionPreferNoMentionName;

  /// Description for the prefer no @mention option.
  ///
  /// In en, this message translates to:
  /// **'Default replies to omit the @mention, and warn the sender if they enable it'**
  String get notificationsMentionPreferNoMentionDescription;

  /// Notifications settings section title for TTS controls.
  ///
  /// In en, this message translates to:
  /// **'Text-to-speech notifications'**
  String get notificationsTtsSectionTitle;

  /// Toggle label for enabling /tts speech playback.
  ///
  /// In en, this message translates to:
  /// **'Enable /tts speech playback'**
  String get notificationsTtsEnableCommandLabel;

  /// Toggle description for enabling /tts speech playback.
  ///
  /// In en, this message translates to:
  /// **'Let /tts read your message aloud. Disabling the setting keeps those commands as regular text.'**
  String get notificationsTtsEnableCommandDescription;

  /// Prefix before the Accessibility settings link in TTS notifications settings.
  ///
  /// In en, this message translates to:
  /// **'Adjust playback speed in '**
  String get notificationsTtsAccessibilityLinkPrefix;

  /// Link label that opens Accessibility settings from TTS notifications settings.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get notificationsTtsAccessibilityLinkLabel;

  /// Suffix after the Accessibility settings link in TTS notifications settings.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get notificationsTtsAccessibilityLinkSuffix;

  /// Title for automatic TTS narration mode settings.
  ///
  /// In en, this message translates to:
  /// **'Automatic message narration'**
  String get notificationsTtsAutoNarrationTitle;

  /// Description for automatic TTS narration mode settings.
  ///
  /// In en, this message translates to:
  /// **'Converts incoming content to speech, regardless of whether it came from /tts.'**
  String get notificationsTtsAutoNarrationDescription;

  /// TTS narration mode: speak messages from every channel.
  ///
  /// In en, this message translates to:
  /// **'Every channel'**
  String get notificationsTtsModeAllChannelsName;

  /// Description for speaking messages from every channel.
  ///
  /// In en, this message translates to:
  /// **'Let every incoming message be spoken, regardless of which channel is open.'**
  String get notificationsTtsModeAllChannelsDescription;

  /// TTS narration mode: speak only the active channel.
  ///
  /// In en, this message translates to:
  /// **'Active channel only'**
  String get notificationsTtsModeCurrentChannelName;

  /// Description for speaking only the active channel.
  ///
  /// In en, this message translates to:
  /// **'Narrates only the channel you\'re viewing. Narration follows you between channels.'**
  String get notificationsTtsModeCurrentChannelDescription;

  /// TTS narration mode: never speak automatically.
  ///
  /// In en, this message translates to:
  /// **'Never automatically'**
  String get notificationsTtsModeNeverName;

  /// Description for never speaking automatically.
  ///
  /// In en, this message translates to:
  /// **'Remain silent unless someone runs /tts manually.'**
  String get notificationsTtsModeNeverDescription;

  /// Accessibility label for the TTS narration mode radio group.
  ///
  /// In en, this message translates to:
  /// **'Speak all messages out loud'**
  String get notificationsTtsModeAriaLabel;

  /// Notifications settings section title for sound controls.
  ///
  /// In en, this message translates to:
  /// **'Sounds'**
  String get notificationsSoundsSectionTitle;

  /// Label for the master volume slider.
  ///
  /// In en, this message translates to:
  /// **'Master volume'**
  String get notificationsMasterVolumeLabel;

  /// Description for the master volume slider.
  ///
  /// In en, this message translates to:
  /// **'Sets the level for every sound effect. Per-sound overrides ignore this.'**
  String get notificationsMasterVolumeDescription;

  /// Accessibility label for resetting master volume to default.
  ///
  /// In en, this message translates to:
  /// **'Reset to default volume'**
  String get notificationsResetToDefaultVolume;

  /// Toggle label for disabling all notification sounds.
  ///
  /// In en, this message translates to:
  /// **'Disable all notification sounds'**
  String get notificationsDisableAllSoundsLabel;

  /// Description for the disable all notification sounds toggle.
  ///
  /// In en, this message translates to:
  /// **'Your existing notification sound settings will be preserved.'**
  String get notificationsDisableAllSoundsDescription;

  /// Button label to reveal additional sound effect toggles.
  ///
  /// In en, this message translates to:
  /// **'Show more sound effects'**
  String get notificationsShowMoreSoundEffects;

  /// Button label to hide additional sound effect toggles.
  ///
  /// In en, this message translates to:
  /// **'Show fewer sound effects'**
  String get notificationsShowFewerSoundEffects;

  /// Button label to preview a notification sound.
  ///
  /// In en, this message translates to:
  /// **'Preview sound'**
  String get notificationsPreviewSound;

  /// Accordion title for per-sound volume overrides.
  ///
  /// In en, this message translates to:
  /// **'Per-sound volume'**
  String get notificationsPerSoundVolumeTitle;

  /// Accordion description when no per-sound volume overrides exist.
  ///
  /// In en, this message translates to:
  /// **'Set custom volumes for individual sounds. Sounds without an override follow the master volume.'**
  String get notificationsPerSoundVolumeDescription;

  /// Accordion description when per-sound volume overrides exist.
  ///
  /// In en, this message translates to:
  /// **'Active custom sound volume overrides: {overrideCount}.'**
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount);

  /// Status text when a sound follows the master volume.
  ///
  /// In en, this message translates to:
  /// **'Following master • {effectiveValue}%'**
  String notificationsFollowingMasterVolume(int effectiveValue);

  /// Accessibility label for resetting a per-sound volume override.
  ///
  /// In en, this message translates to:
  /// **'Reset {label} to master volume'**
  String notificationsResetSoundToMasterVolume(String label);

  /// Button label to reset all per-sound volume overrides.
  ///
  /// In en, this message translates to:
  /// **'Reset all overrides'**
  String get notificationsResetAllOverrides;

  /// Accessibility label for muting a sound type.
  ///
  /// In en, this message translates to:
  /// **'Mute {label}'**
  String notificationsMuteSound(String label);

  /// Accessibility label for unmuting a sound type.
  ///
  /// In en, this message translates to:
  /// **'Unmute {label}'**
  String notificationsUnmuteSound(String label);

  /// Sound toggle label for community message notifications.
  ///
  /// In en, this message translates to:
  /// **'Community message notifications'**
  String get notificationsSoundMessage;

  /// Sound toggle label for direct message notifications.
  ///
  /// In en, this message translates to:
  /// **'Direct message notifications'**
  String get notificationsSoundDirectMessage;

  /// Sound toggle label for current channel message notifications.
  ///
  /// In en, this message translates to:
  /// **'Current channel message notifications'**
  String get notificationsSoundSameChannelMessage;

  /// Sound toggle label for voice mute.
  ///
  /// In en, this message translates to:
  /// **'Voice mute'**
  String get notificationsSoundMute;

  /// Sound toggle label for voice unmute.
  ///
  /// In en, this message translates to:
  /// **'Voice unmute'**
  String get notificationsSoundUnmute;

  /// Sound toggle label for voice deafen.
  ///
  /// In en, this message translates to:
  /// **'Voice deafen'**
  String get notificationsSoundDeaf;

  /// Sound toggle label for voice undeafen.
  ///
  /// In en, this message translates to:
  /// **'Voice undeafen'**
  String get notificationsSoundUndeaf;

  /// Sound toggle label for user joins channel.
  ///
  /// In en, this message translates to:
  /// **'User joins channel'**
  String get notificationsSoundUserJoin;

  /// Sound toggle label for user leaves channel.
  ///
  /// In en, this message translates to:
  /// **'User leaves channel'**
  String get notificationsSoundUserLeave;

  /// Sound toggle label for user moved channel.
  ///
  /// In en, this message translates to:
  /// **'User moved channel'**
  String get notificationsSoundUserMove;

  /// Sound toggle label for viewer joins stream.
  ///
  /// In en, this message translates to:
  /// **'Viewer joins stream'**
  String get notificationsSoundViewerJoin;

  /// Sound toggle label for viewer leaves stream.
  ///
  /// In en, this message translates to:
  /// **'Viewer leaves stream'**
  String get notificationsSoundViewerLeave;

  /// Sound toggle label for voice disconnected.
  ///
  /// In en, this message translates to:
  /// **'Voice disconnected'**
  String get notificationsSoundVoiceDisconnect;

  /// Sound toggle label for incoming call.
  ///
  /// In en, this message translates to:
  /// **'Incoming call'**
  String get notificationsSoundIncomingRing;

  /// Sound toggle label for camera on.
  ///
  /// In en, this message translates to:
  /// **'Camera on'**
  String get notificationsSoundCameraOn;

  /// Sound toggle label for camera off.
  ///
  /// In en, this message translates to:
  /// **'Camera off'**
  String get notificationsSoundCameraOff;

  /// Sound toggle label for screen share start.
  ///
  /// In en, this message translates to:
  /// **'Screen share start'**
  String get notificationsSoundScreenShareStart;

  /// Sound toggle label for screen share stop.
  ///
  /// In en, this message translates to:
  /// **'Screen share stop'**
  String get notificationsSoundScreenShareStop;

  /// Toast shown when push inactive timeout sync fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update push notification timeout. Try again.'**
  String get notificationsAfkTimeoutSyncFailed;

  /// Toast shown when mention preference update fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update mention preference. Try again.'**
  String get notificationsMentionPreferenceSyncFailed;

  /// Banner title when OS notification permission is denied.
  ///
  /// In en, this message translates to:
  /// **'Notifications blocked'**
  String get notificationsPermissionDeniedTitle;

  /// Toast shown when enabling notifications fails because permission was denied.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t enable notifications. Allow notification permission to continue.'**
  String get notificationsEnableNotificationsPermissionDenied;

  /// User settings navigation item for language and time settings.
  ///
  /// In en, this message translates to:
  /// **'Language & Time'**
  String get userSettingsNavLanguageAndTime;

  /// Settings section title for interface language preference.
  ///
  /// In en, this message translates to:
  /// **'Interface language'**
  String get languageAndTimeLanguageSectionTitle;

  /// Settings section description for interface language preference.
  ///
  /// In en, this message translates to:
  /// **'Choose the language used throughout the app'**
  String get languageAndTimeLanguageSectionDescription;

  /// Button that opens the system per-app language settings.
  ///
  /// In en, this message translates to:
  /// **'Open language settings'**
  String get languageAndTimeOpenLanguageSettings;

  /// Settings section title for time format preference.
  ///
  /// In en, this message translates to:
  /// **'Time format'**
  String get languageAndTimeTimeFormatSectionTitle;

  /// Settings section description for time format preference.
  ///
  /// In en, this message translates to:
  /// **'Choose how times are displayed throughout the app'**
  String get languageAndTimeTimeFormatSectionDescription;

  /// Accessibility label for the time format radio group.
  ///
  /// In en, this message translates to:
  /// **'Time format selection'**
  String get languageAndTimeTimeFormatSelectionLabel;

  /// Time format option that detects format from locale.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get languageAndTimeTimeFormatAuto;

  /// Time format option for 12-hour AM/PM display.
  ///
  /// In en, this message translates to:
  /// **'12-hour'**
  String get languageAndTimeTimeFormat12Hour;

  /// Time format option for 24-hour display.
  ///
  /// In en, this message translates to:
  /// **'24-hour'**
  String get languageAndTimeTimeFormat24Hour;

  /// Auto time format description using the app interface language.
  ///
  /// In en, this message translates to:
  /// **'App language: {format}'**
  String languageAndTimeTimeFormatAppLanguage(String format);

  /// Auto time format description using the device system locale.
  ///
  /// In en, this message translates to:
  /// **'System locale: {format}'**
  String languageAndTimeTimeFormatSystemLocale(String format);

  /// Toggle to use device system locale when auto-detecting time format.
  ///
  /// In en, this message translates to:
  /// **'Use system locale for time format'**
  String get languageAndTimeUseSystemLocaleForTimeFormat;

  /// Toast shown when saving the time format preference fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to update time format'**
  String get languageAndTimeTimeFormatSyncFailed;

  /// User settings navigation item for default app preferences.
  ///
  /// In en, this message translates to:
  /// **'Default Apps'**
  String get userSettingsNavDefaultApps;

  /// Title for the default web browser settings section.
  ///
  /// In en, this message translates to:
  /// **'Web Browser'**
  String get defaultAppsWebBrowserSectionTitle;

  /// Description for the default web browser settings section.
  ///
  /// In en, this message translates to:
  /// **'Choose which browser opens when you tap a link.'**
  String get defaultAppsWebBrowserSectionDescription;

  /// Footnote explaining that installed native apps take priority over the chosen browser.
  ///
  /// In en, this message translates to:
  /// **'If an app is installed for a site, links will open in that app first.'**
  String get defaultAppsWebBrowserNativeAppNote;

  /// Default web browser option for the in-app browser.
  ///
  /// In en, this message translates to:
  /// **'In-app browser'**
  String get defaultAppsWebBrowserInApp;

  /// Default web browser option for the system default browser.
  ///
  /// In en, this message translates to:
  /// **'External browser'**
  String get defaultAppsWebBrowserExternal;

  /// User settings navigation item for advanced settings.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get userSettingsNavAdvanced;

  /// Advanced settings section title for crash and performance reporting.
  ///
  /// In en, this message translates to:
  /// **'Performance reporting'**
  String get advancedPerformanceReportingTitle;

  /// Advanced settings section description for crash and performance reporting.
  ///
  /// In en, this message translates to:
  /// **'Help improve Fluxer by sharing anonymous crash and performance data.'**
  String get advancedPerformanceReportingSectionDescription;

  /// Toggle label for opting into crash and performance reporting.
  ///
  /// In en, this message translates to:
  /// **'Send crash and performance reports'**
  String get advancedPerformanceReportingLabel;

  /// Toggle description explaining anonymous self-hosted performance reporting.
  ///
  /// In en, this message translates to:
  /// **'All reported data is anonymous and is sent only to Fluxer\'s own monitoring service — no third-party providers are used.'**
  String get advancedPerformanceReportingDescription;

  /// Button label that opens a dedicated advanced settings modal.
  ///
  /// In en, this message translates to:
  /// **'Configure'**
  String get advancedSettingsConfigure;

  /// No description provided for @advancedSettingsCategoryPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get advancedSettingsCategoryPrivacy;

  /// No description provided for @advancedSettingsCategoryAppearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get advancedSettingsCategoryAppearance;

  /// No description provided for @advancedSettingsCategoryAccessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get advancedSettingsCategoryAccessibility;

  /// No description provided for @advancedSettingsCategoryChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get advancedSettingsCategoryChat;

  /// No description provided for @advancedSettingsCategoryMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get advancedSettingsCategoryMedia;

  /// No description provided for @advancedSettingsCategoryVoice.
  ///
  /// In en, this message translates to:
  /// **'Voice'**
  String get advancedSettingsCategoryVoice;

  /// No description provided for @advancedSettingsCategoryDeveloper.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get advancedSettingsCategoryDeveloper;

  /// No description provided for @advancedSettingEnableTextSelectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable text selection'**
  String get advancedSettingEnableTextSelectionLabel;

  /// No description provided for @advancedSettingEnableTextSelectionDescription.
  ///
  /// In en, this message translates to:
  /// **'Allow selecting text in the app'**
  String get advancedSettingEnableTextSelectionDescription;

  /// No description provided for @advancedSettingVideoSeekThumbnailsLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable video seek thumbnails'**
  String get advancedSettingVideoSeekThumbnailsLabel;

  /// No description provided for @advancedSettingVideoSeekThumbnailsDescription.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail or live frame while scrubbing video'**
  String get advancedSettingVideoSeekThumbnailsDescription;

  /// No description provided for @advancedSettingShowNekoLabel.
  ///
  /// In en, this message translates to:
  /// **'Show Neko'**
  String get advancedSettingShowNekoLabel;

  /// No description provided for @advancedSettingShowNekoDescription.
  ///
  /// In en, this message translates to:
  /// **'Neko cat that chases your cursor'**
  String get advancedSettingShowNekoDescription;

  /// No description provided for @advancedSettingShowNekoDescriptionTouch.
  ///
  /// In en, this message translates to:
  /// **'Show Neko on your chat input'**
  String get advancedSettingShowNekoDescriptionTouch;

  /// No description provided for @advancedSettingKeyboardHintsLabel.
  ///
  /// In en, this message translates to:
  /// **'Keyboard hints'**
  String get advancedSettingKeyboardHintsLabel;

  /// No description provided for @advancedSettingKeyboardHintsDescription.
  ///
  /// In en, this message translates to:
  /// **'Keyboard shortcut hints in tooltips'**
  String get advancedSettingKeyboardHintsDescription;

  /// No description provided for @advancedSettingEnableFavoritesLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable favorites'**
  String get advancedSettingEnableFavoritesLabel;

  /// No description provided for @advancedSettingEnableFavoritesDescription.
  ///
  /// In en, this message translates to:
  /// **'Show favorites throughout the app'**
  String get advancedSettingEnableFavoritesDescription;

  /// No description provided for @advancedSettingVoiceChannelJoinBehaviorLabel.
  ///
  /// In en, this message translates to:
  /// **'Voice channel join behavior'**
  String get advancedSettingVoiceChannelJoinBehaviorLabel;

  /// No description provided for @advancedSettingVoiceChannelJoinBehaviorDescription.
  ///
  /// In en, this message translates to:
  /// **'Confirmation or double-click for community voice joins'**
  String get advancedSettingVoiceChannelJoinBehaviorDescription;

  /// No description provided for @advancedSettingRequireDoubleClickJoinLabel.
  ///
  /// In en, this message translates to:
  /// **'Require double-click to join voice channels'**
  String get advancedSettingRequireDoubleClickJoinLabel;

  /// No description provided for @advancedSettingConfirmBeforeJoiningVoiceLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm before joining voice channels'**
  String get advancedSettingConfirmBeforeJoiningVoiceLabel;

  /// No description provided for @advancedSettingAutoSendGifsLabel.
  ///
  /// In en, this message translates to:
  /// **'Automatically send GIFs when selected'**
  String get advancedSettingAutoSendGifsLabel;

  /// No description provided for @advancedSettingAutoSendGifsDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically send GIFs from the picker without confirmation'**
  String get advancedSettingAutoSendGifsDescription;

  /// No description provided for @advancedSettingSaveGifFavoritesLabel.
  ///
  /// In en, this message translates to:
  /// **'Save GIF favorites as saved media'**
  String get advancedSettingSaveGifFavoritesLabel;

  /// No description provided for @advancedSettingSaveGifFavoritesDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose how starred GIF favorites are stored'**
  String get advancedSettingSaveGifFavoritesDescription;

  /// No description provided for @advancedSettingMediaButtonsLabel.
  ///
  /// In en, this message translates to:
  /// **'Media buttons'**
  String get advancedSettingMediaButtonsLabel;

  /// No description provided for @advancedSettingMediaButtonsDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize which buttons and indicators appear on media attachments and embeds'**
  String get advancedSettingMediaButtonsDescription;

  /// No description provided for @advancedSettingPreuploadAttachmentsLabel.
  ///
  /// In en, this message translates to:
  /// **'Upload attachments before sending'**
  String get advancedSettingPreuploadAttachmentsLabel;

  /// No description provided for @advancedSettingPreuploadAttachmentsDescription.
  ///
  /// In en, this message translates to:
  /// **'Start uploading attachments as soon as they are added to the message input'**
  String get advancedSettingPreuploadAttachmentsDescription;

  /// No description provided for @advancedSettingStripTrackingLabel.
  ///
  /// In en, this message translates to:
  /// **'Strip tracking parameters from URLs'**
  String get advancedSettingStripTrackingLabel;

  /// No description provided for @advancedSettingStripTrackingDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically remove tracking parameters from URLs in messages you send'**
  String get advancedSettingStripTrackingDescription;

  /// No description provided for @advancedSettingTrustAllLinksLabel.
  ///
  /// In en, this message translates to:
  /// **'Trust all external links'**
  String get advancedSettingTrustAllLinksLabel;

  /// No description provided for @advancedSettingTrustAllLinksDescription.
  ///
  /// In en, this message translates to:
  /// **'Skip the external link warning for all domains'**
  String get advancedSettingTrustAllLinksDescription;

  /// No description provided for @advancedSettingSearchEnginesLabel.
  ///
  /// In en, this message translates to:
  /// **'Search engines'**
  String get advancedSettingSearchEnginesLabel;

  /// No description provided for @advancedSettingSearchEnginesDescription.
  ///
  /// In en, this message translates to:
  /// **'Configure search engines used from selected text'**
  String get advancedSettingSearchEnginesDescription;

  /// No description provided for @advancedSettingTranslatorsLabel.
  ///
  /// In en, this message translates to:
  /// **'Translators'**
  String get advancedSettingTranslatorsLabel;

  /// No description provided for @advancedSettingTranslatorsDescription.
  ///
  /// In en, this message translates to:
  /// **'Configure translator providers used from selected text'**
  String get advancedSettingTranslatorsDescription;

  /// No description provided for @advancedSettingReverseImageSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Reverse image search'**
  String get advancedSettingReverseImageSearchLabel;

  /// No description provided for @advancedSettingReverseImageSearchDescription.
  ///
  /// In en, this message translates to:
  /// **'Reverse image search providers'**
  String get advancedSettingReverseImageSearchDescription;

  /// No description provided for @advancedSettingMessageActionBarLabel.
  ///
  /// In en, this message translates to:
  /// **'Message action bar'**
  String get advancedSettingMessageActionBarLabel;

  /// No description provided for @advancedSettingMessageActionBarDescription.
  ///
  /// In en, this message translates to:
  /// **'Customize the action bar that appears when hovering over messages'**
  String get advancedSettingMessageActionBarDescription;

  /// No description provided for @advancedSettingExpressionAutocompleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Expression autocomplete'**
  String get advancedSettingExpressionAutocompleteLabel;

  /// No description provided for @advancedSettingExpressionAutocompleteDescription.
  ///
  /// In en, this message translates to:
  /// **'Pick what appears when you type a colon in the message input'**
  String get advancedSettingExpressionAutocompleteDescription;

  /// No description provided for @advancedSettingInputButtonsLabel.
  ///
  /// In en, this message translates to:
  /// **'Message input buttons'**
  String get advancedSettingInputButtonsLabel;

  /// No description provided for @advancedSettingInputButtonsDescription.
  ///
  /// In en, this message translates to:
  /// **'Pick which buttons show in the message input'**
  String get advancedSettingInputButtonsDescription;

  /// No description provided for @advancedSettingScrollToBottomOnSendLabel.
  ///
  /// In en, this message translates to:
  /// **'Scroll to bottom when sending a message'**
  String get advancedSettingScrollToBottomOnSendLabel;

  /// No description provided for @advancedSettingScrollToBottomOnSendDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose how chat moves after you send a message'**
  String get advancedSettingScrollToBottomOnSendDescription;

  /// No description provided for @advancedSettingSkipMarkAllAsReadLabel.
  ///
  /// In en, this message translates to:
  /// **'Skip \"Mark all as read\" confirmation'**
  String get advancedSettingSkipMarkAllAsReadLabel;

  /// No description provided for @advancedSettingSkipMarkAllAsReadDescription.
  ///
  /// In en, this message translates to:
  /// **'Mark all unread inbox channels as read immediately, without asking to confirm'**
  String get advancedSettingSkipMarkAllAsReadDescription;

  /// No description provided for @advancedSettingHideMutedChannelsLabel.
  ///
  /// In en, this message translates to:
  /// **'Hide muted channels by default'**
  String get advancedSettingHideMutedChannelsLabel;

  /// No description provided for @advancedSettingHideMutedChannelsDescription.
  ///
  /// In en, this message translates to:
  /// **'Hide channels you\'ve muted from community sidebars'**
  String get advancedSettingHideMutedChannelsDescription;

  /// No description provided for @advancedSettingShowGifIndicatorLabel.
  ///
  /// In en, this message translates to:
  /// **'Show GIF indicator'**
  String get advancedSettingShowGifIndicatorLabel;

  /// No description provided for @advancedSettingShowAttachmentExpiryLabel.
  ///
  /// In en, this message translates to:
  /// **'Show attachment expiry indicator'**
  String get advancedSettingShowAttachmentExpiryLabel;

  /// No description provided for @advancedSettingShowMediaDeleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Show delete button'**
  String get advancedSettingShowMediaDeleteLabel;

  /// No description provided for @advancedSettingShowMediaDownloadLabel.
  ///
  /// In en, this message translates to:
  /// **'Show download button'**
  String get advancedSettingShowMediaDownloadLabel;

  /// No description provided for @advancedSettingShowMediaFavoriteLabel.
  ///
  /// In en, this message translates to:
  /// **'Show favorite button'**
  String get advancedSettingShowMediaFavoriteLabel;

  /// No description provided for @advancedSettingShowSuppressEmbedsLabel.
  ///
  /// In en, this message translates to:
  /// **'Show suppress embeds button'**
  String get advancedSettingShowSuppressEmbedsLabel;

  /// No description provided for @advancedSettingShowMessageActionBarLabel.
  ///
  /// In en, this message translates to:
  /// **'Show message action bar'**
  String get advancedSettingShowMessageActionBarLabel;

  /// No description provided for @advancedSettingShowOnlyMoreButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Show only more button'**
  String get advancedSettingShowOnlyMoreButtonLabel;

  /// No description provided for @advancedSettingShowQuickReactionsLabel.
  ///
  /// In en, this message translates to:
  /// **'Show quick reactions'**
  String get advancedSettingShowQuickReactionsLabel;

  /// No description provided for @advancedSettingEnableShiftToExpandLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable Shift to expand'**
  String get advancedSettingEnableShiftToExpandLabel;

  /// No description provided for @advancedSettingShowDefaultEmojisAutocompleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Show default emojis in expression autocomplete'**
  String get advancedSettingShowDefaultEmojisAutocompleteLabel;

  /// No description provided for @advancedSettingShowCustomEmojisAutocompleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Show custom emojis in expression autocomplete'**
  String get advancedSettingShowCustomEmojisAutocompleteLabel;

  /// No description provided for @advancedSettingShowStickersAutocompleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Show stickers in expression autocomplete'**
  String get advancedSettingShowStickersAutocompleteLabel;

  /// No description provided for @advancedSettingShowSavedMediaAutocompleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Show saved media in expression autocomplete'**
  String get advancedSettingShowSavedMediaAutocompleteLabel;

  /// No description provided for @advancedSettingShowGifsButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Show GIFs button'**
  String get advancedSettingShowGifsButtonLabel;

  /// No description provided for @advancedSettingShowMediaButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Show media button'**
  String get advancedSettingShowMediaButtonLabel;

  /// No description provided for @advancedSettingShowStickersButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Show stickers button'**
  String get advancedSettingShowStickersButtonLabel;

  /// No description provided for @advancedSettingShowEmojiButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Show emoji button'**
  String get advancedSettingShowEmojiButtonLabel;

  /// No description provided for @advancedSettingShowSendButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'Show send button'**
  String get advancedSettingShowSendButtonLabel;

  /// No description provided for @advancedSettingNewDeviceAlertsLabel.
  ///
  /// In en, this message translates to:
  /// **'Show new device alerts'**
  String get advancedSettingNewDeviceAlertsLabel;

  /// No description provided for @advancedSettingNewDeviceAlertsDescription.
  ///
  /// In en, this message translates to:
  /// **'Prompt for new audio devices'**
  String get advancedSettingNewDeviceAlertsDescription;

  /// No description provided for @advancedSettingConnectionVolumeControlsLabel.
  ///
  /// In en, this message translates to:
  /// **'Connection volume controls'**
  String get advancedSettingConnectionVolumeControlsLabel;

  /// No description provided for @advancedSettingConnectionVolumeControlsDescription.
  ///
  /// In en, this message translates to:
  /// **'Show per-device participant volume sliders in voice menus'**
  String get advancedSettingConnectionVolumeControlsDescription;

  /// No description provided for @advancedSettingScreenSharePreviewBehaviorLabel.
  ///
  /// In en, this message translates to:
  /// **'Screen share preview behavior'**
  String get advancedSettingScreenSharePreviewBehaviorLabel;

  /// No description provided for @advancedSettingScreenSharePreviewBehaviorDescription.
  ///
  /// In en, this message translates to:
  /// **'Preview, popout, and stream thumbnail behavior'**
  String get advancedSettingScreenSharePreviewBehaviorDescription;

  /// No description provided for @advancedSettingScreenShareCodecLabel.
  ///
  /// In en, this message translates to:
  /// **'Screen share codec'**
  String get advancedSettingScreenShareCodecLabel;

  /// No description provided for @advancedSettingScreenShareCodecDescription.
  ///
  /// In en, this message translates to:
  /// **'Video codec for screen sharing'**
  String get advancedSettingScreenShareCodecDescription;

  /// No description provided for @advancedSettingScreenShareCodecAuto.
  ///
  /// In en, this message translates to:
  /// **'Automatic (recommended)'**
  String get advancedSettingScreenShareCodecAuto;

  /// No description provided for @advancedSettingScreenShareCodecAv1.
  ///
  /// In en, this message translates to:
  /// **'AV1'**
  String get advancedSettingScreenShareCodecAv1;

  /// No description provided for @advancedSettingScreenShareCodecH265.
  ///
  /// In en, this message translates to:
  /// **'H.265'**
  String get advancedSettingScreenShareCodecH265;

  /// No description provided for @advancedSettingScreenShareCodecVp9.
  ///
  /// In en, this message translates to:
  /// **'VP9'**
  String get advancedSettingScreenShareCodecVp9;

  /// No description provided for @advancedSettingScreenShareCodecH264.
  ///
  /// In en, this message translates to:
  /// **'H.264'**
  String get advancedSettingScreenShareCodecH264;

  /// No description provided for @advancedSettingScreenShareCodecVp8.
  ///
  /// In en, this message translates to:
  /// **'VP8'**
  String get advancedSettingScreenShareCodecVp8;

  /// No description provided for @advancedSettingPauseScreenSharePreviewLabel.
  ///
  /// In en, this message translates to:
  /// **'Pause my screen share preview in the background'**
  String get advancedSettingPauseScreenSharePreviewLabel;

  /// No description provided for @advancedSettingHideStreamPreviewLabel.
  ///
  /// In en, this message translates to:
  /// **'Hide my stream preview thumbnail'**
  String get advancedSettingHideStreamPreviewLabel;

  /// No description provided for @advancedSettingDeveloperModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable developer mode'**
  String get advancedSettingDeveloperModeLabel;

  /// No description provided for @advancedSettingDeveloperModeDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable developer mode'**
  String get advancedSettingDeveloperModeDescription;

  /// No description provided for @advancedSettingSearchEngineGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get advancedSettingSearchEngineGoogle;

  /// No description provided for @advancedSettingSearchEngineDuckDuckGo.
  ///
  /// In en, this message translates to:
  /// **'DuckDuckGo'**
  String get advancedSettingSearchEngineDuckDuckGo;

  /// No description provided for @advancedSettingSearchEngineBing.
  ///
  /// In en, this message translates to:
  /// **'Bing'**
  String get advancedSettingSearchEngineBing;

  /// No description provided for @advancedSettingSearchEngineGoogleLens.
  ///
  /// In en, this message translates to:
  /// **'Google Lens'**
  String get advancedSettingSearchEngineGoogleLens;

  /// No description provided for @advancedSettingSearchEngineTinEye.
  ///
  /// In en, this message translates to:
  /// **'TinEye'**
  String get advancedSettingSearchEngineTinEye;

  /// No description provided for @advancedSettingTranslatorGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google Translate'**
  String get advancedSettingTranslatorGoogle;

  /// No description provided for @advancedSettingTranslatorDeepL.
  ///
  /// In en, this message translates to:
  /// **'DeepL'**
  String get advancedSettingTranslatorDeepL;

  /// No description provided for @advancedSettingDefaultSearchEngineLabel.
  ///
  /// In en, this message translates to:
  /// **'Default search engine'**
  String get advancedSettingDefaultSearchEngineLabel;

  /// No description provided for @advancedSettingDefaultSearchEngineDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose which search engine is used by default when searching selected text.'**
  String get advancedSettingDefaultSearchEngineDescription;

  /// No description provided for @advancedSettingBuiltInSearchEnginesLabel.
  ///
  /// In en, this message translates to:
  /// **'Built-in search engines'**
  String get advancedSettingBuiltInSearchEnginesLabel;

  /// No description provided for @advancedSettingBuiltInSearchEnginesDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable built-in search engines. Enabled engines appear in the message context menu when text is selected.'**
  String get advancedSettingBuiltInSearchEnginesDescription;

  /// No description provided for @advancedSettingCustomSearchEnginesLabel.
  ///
  /// In en, this message translates to:
  /// **'Custom search engines'**
  String get advancedSettingCustomSearchEnginesLabel;

  /// No description provided for @advancedSettingCustomSearchEnginesDescription.
  ///
  /// In en, this message translates to:
  /// **'Add your own search engines with a custom URL pattern. Use \'{query}\' as a placeholder for the search text.'**
  String advancedSettingCustomSearchEnginesDescription(Object query);

  /// No description provided for @advancedSettingAddSearchEngineLabel.
  ///
  /// In en, this message translates to:
  /// **'Add search engine'**
  String get advancedSettingAddSearchEngineLabel;

  /// No description provided for @advancedSettingEnableAtLeastOneSearchEngineLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable at least one search engine below.'**
  String get advancedSettingEnableAtLeastOneSearchEngineLabel;

  /// No description provided for @advancedSettingRemoveSearchEngineLabel.
  ///
  /// In en, this message translates to:
  /// **'Remove search engine'**
  String get advancedSettingRemoveSearchEngineLabel;

  /// No description provided for @advancedSettingDefaultTranslatorLabel.
  ///
  /// In en, this message translates to:
  /// **'Default translator'**
  String get advancedSettingDefaultTranslatorLabel;

  /// No description provided for @advancedSettingDefaultTranslatorDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose which translator is used by default when translating selected text.'**
  String get advancedSettingDefaultTranslatorDescription;

  /// No description provided for @advancedSettingBuiltInTranslatorsLabel.
  ///
  /// In en, this message translates to:
  /// **'Built-in translators'**
  String get advancedSettingBuiltInTranslatorsLabel;

  /// No description provided for @advancedSettingBuiltInTranslatorsDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable built-in translators. Enabled translators appear in the message context menu when text is selected.'**
  String get advancedSettingBuiltInTranslatorsDescription;

  /// No description provided for @advancedSettingCustomTranslatorsLabel.
  ///
  /// In en, this message translates to:
  /// **'Custom translators'**
  String get advancedSettingCustomTranslatorsLabel;

  /// No description provided for @advancedSettingCustomTranslatorsDescription.
  ///
  /// In en, this message translates to:
  /// **'Add your own translators with a custom URL pattern. Use \'{query}\' as a placeholder for the text to translate.'**
  String advancedSettingCustomTranslatorsDescription(Object query);

  /// No description provided for @advancedSettingAddTranslatorLabel.
  ///
  /// In en, this message translates to:
  /// **'Add translator'**
  String get advancedSettingAddTranslatorLabel;

  /// No description provided for @advancedSettingEnableAtLeastOneTranslatorLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable at least one translator below.'**
  String get advancedSettingEnableAtLeastOneTranslatorLabel;

  /// No description provided for @advancedSettingRemoveTranslatorLabel.
  ///
  /// In en, this message translates to:
  /// **'Remove translator'**
  String get advancedSettingRemoveTranslatorLabel;

  /// No description provided for @advancedSettingDefaultReverseImageSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Default reverse image search'**
  String get advancedSettingDefaultReverseImageSearchLabel;

  /// No description provided for @advancedSettingDefaultReverseImageSearchDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose which reverse image search service is used by default when searching an image.'**
  String get advancedSettingDefaultReverseImageSearchDescription;

  /// No description provided for @advancedSettingBuiltInReverseImageSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Built-in reverse image search'**
  String get advancedSettingBuiltInReverseImageSearchLabel;

  /// No description provided for @advancedSettingBuiltInReverseImageSearchDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable or disable built-in reverse image search providers. Enabled providers appear in the context menu of images, avatars, banners, stickers, and emoji.'**
  String get advancedSettingBuiltInReverseImageSearchDescription;

  /// No description provided for @advancedSettingCustomReverseImageSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Custom reverse image search'**
  String get advancedSettingCustomReverseImageSearchLabel;

  /// No description provided for @advancedSettingCustomReverseImageSearchDescription.
  ///
  /// In en, this message translates to:
  /// **'Add your own reverse image search providers with a custom URL pattern. Use \'{url}\' as a placeholder for the image URL.'**
  String advancedSettingCustomReverseImageSearchDescription(Object url);

  /// No description provided for @advancedSettingAddReverseImageSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Add reverse image search'**
  String get advancedSettingAddReverseImageSearchLabel;

  /// No description provided for @advancedSettingEnableAtLeastOneReverseImageSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Enable at least one reverse image search provider below.'**
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel;

  /// No description provided for @advancedSettingRemoveReverseImageSearchLabel.
  ///
  /// In en, this message translates to:
  /// **'Remove reverse image search'**
  String get advancedSettingRemoveReverseImageSearchLabel;

  /// No description provided for @advancedSettingAddSearchEngineTitle.
  ///
  /// In en, this message translates to:
  /// **'Add search engine'**
  String get advancedSettingAddSearchEngineTitle;

  /// No description provided for @advancedSettingEditSearchEngineTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit search engine'**
  String get advancedSettingEditSearchEngineTitle;

  /// No description provided for @advancedSettingAddTranslatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Add translation provider'**
  String get advancedSettingAddTranslatorTitle;

  /// No description provided for @advancedSettingEditTranslatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit translation provider'**
  String get advancedSettingEditTranslatorTitle;

  /// No description provided for @advancedSettingAddReverseImageSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Add reverse image search engine'**
  String get advancedSettingAddReverseImageSearchTitle;

  /// No description provided for @advancedSettingEditReverseImageSearchTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit reverse image search engine'**
  String get advancedSettingEditReverseImageSearchTitle;

  /// No description provided for @advancedSettingSearchProviderNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get advancedSettingSearchProviderNameLabel;

  /// No description provided for @advancedSettingSearchProviderUrlLabel.
  ///
  /// In en, this message translates to:
  /// **'URL pattern'**
  String get advancedSettingSearchProviderUrlLabel;

  /// No description provided for @advancedSettingSearchProviderNameTextPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'My search engine'**
  String get advancedSettingSearchProviderNameTextPlaceholder;

  /// No description provided for @advancedSettingSearchProviderNameTranslatePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'My translator'**
  String get advancedSettingSearchProviderNameTranslatePlaceholder;

  /// No description provided for @advancedSettingSearchProviderNameImagePlaceholder.
  ///
  /// In en, this message translates to:
  /// **'My reverse image search'**
  String get advancedSettingSearchProviderNameImagePlaceholder;

  /// No description provided for @advancedSettingSearchProviderUrlTextHint.
  ///
  /// In en, this message translates to:
  /// **'Use \'{query}\' where the search text should be inserted.'**
  String advancedSettingSearchProviderUrlTextHint(Object query);

  /// No description provided for @advancedSettingSearchProviderUrlTranslateHint.
  ///
  /// In en, this message translates to:
  /// **'Use \'{query}\' where the text to translate should be inserted.'**
  String advancedSettingSearchProviderUrlTranslateHint(Object query);

  /// No description provided for @advancedSettingSearchProviderUrlImageHint.
  ///
  /// In en, this message translates to:
  /// **'Use \'{url}\' where the image URL should be inserted.'**
  String advancedSettingSearchProviderUrlImageHint(Object url);

  /// No description provided for @advancedSettingSearchProviderNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required.'**
  String get advancedSettingSearchProviderNameRequired;

  /// No description provided for @advancedSettingSearchProviderUrlRequired.
  ///
  /// In en, this message translates to:
  /// **'URL pattern is required.'**
  String get advancedSettingSearchProviderUrlRequired;

  /// No description provided for @advancedSettingSearchProviderUrlMustContainQuery.
  ///
  /// In en, this message translates to:
  /// **'URL pattern must contain \'{query}\' placeholder.'**
  String advancedSettingSearchProviderUrlMustContainQuery(Object query);

  /// No description provided for @advancedSettingSearchProviderUrlMustContainUrl.
  ///
  /// In en, this message translates to:
  /// **'URL pattern must contain \'{url}\' placeholder.'**
  String advancedSettingSearchProviderUrlMustContainUrl(Object url);

  /// No description provided for @advancedSettingSearchProviderUrlMustBeValid.
  ///
  /// In en, this message translates to:
  /// **'URL pattern must be a valid URL.'**
  String get advancedSettingSearchProviderUrlMustBeValid;

  /// No description provided for @advancedSettingAddSearchProviderAction.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get advancedSettingAddSearchProviderAction;

  /// No description provided for @advancedSettingEditSearchProviderAction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get advancedSettingEditSearchProviderAction;

  /// No description provided for @advancedSettingRemoveSearchProviderConfirmAction.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get advancedSettingRemoveSearchProviderConfirmAction;

  /// No description provided for @advancedSettingRemoveSearchProviderConfirmDescription.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove {engineName}?'**
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  );

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

  /// Empty-state title on the saved messages page.
  ///
  /// In en, this message translates to:
  /// **'No bookmarks'**
  String get savedMessagesEmptyTitle;

  /// Empty-state body on the saved messages page.
  ///
  /// In en, this message translates to:
  /// **'Bookmark messages to save them for later.'**
  String get savedMessagesEmptyBody;

  /// End-of-list body on the saved messages page.
  ///
  /// In en, this message translates to:
  /// **'There\'s nothing more to see here.'**
  String get savedMessagesEndBody;

  /// Tooltip for removing a saved message bookmark.
  ///
  /// In en, this message translates to:
  /// **'Remove bookmark'**
  String get savedMessagesRemoveTooltip;

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

  /// Accessible label for the chat jump-to-bottom button.
  ///
  /// In en, this message translates to:
  /// **'Jump to bottom'**
  String get chatJumpToBottom;

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

  /// Body of the large role mention confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'This will notify {count} members with the {roleName} role. Continue?'**
  String mentionConfirmRoleBody(int count, String roleName);

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

  /// Tooltip for the button that resets the instance URL to the official Fluxer instance.
  ///
  /// In en, this message translates to:
  /// **'Reset to Fluxer'**
  String get resetToDefaultInstance;

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

  /// Generic toast when a feature is not yet available.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// Label for the direct messages entry in the guild navbar.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get guildNavbarDirectMessages;

  /// Label for the explore communities button in the guild navbar.
  ///
  /// In en, this message translates to:
  /// **'Explore Discoverable Communities'**
  String get guildNavbarExploreDiscoverableCommunities;

  /// Short label in the discovery page header.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get discoveryExplore;

  /// Main heading on the Discovery page.
  ///
  /// In en, this message translates to:
  /// **'Explore public communities'**
  String get discoveryExplorePublicCommunities;

  /// Subheading on the Discovery page explaining how to apply for listing.
  ///
  /// In en, this message translates to:
  /// **'Want to list your community on here? Apply if you meet the requirements in your community\'s settings > Discovery.'**
  String get discoveryListingSubheading;

  /// Accessible label and placeholder for the community search field.
  ///
  /// In en, this message translates to:
  /// **'Search communities'**
  String get discoverySearchCommunities;

  /// Label for the language filter on the discovery page.
  ///
  /// In en, this message translates to:
  /// **'Filter by language'**
  String get discoveryFilterByLanguage;

  /// Option label for showing communities in all languages.
  ///
  /// In en, this message translates to:
  /// **'All languages'**
  String get discoveryAllLanguages;

  /// Label for the all-categories tab on the discovery page.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get discoveryAllCategories;

  /// Discovery category label for gaming communities.
  ///
  /// In en, this message translates to:
  /// **'Gaming'**
  String get discoveryCategoryGaming;

  /// Discovery category label for music communities.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get discoveryCategoryMusic;

  /// Discovery category label for entertainment communities.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get discoveryCategoryEntertainment;

  /// Discovery category label for education communities.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get discoveryCategoryEducation;

  /// Discovery category label for science and technology communities.
  ///
  /// In en, this message translates to:
  /// **'Science & Technology'**
  String get discoveryCategoryScienceAndTechnology;

  /// Discovery category label for content creator communities.
  ///
  /// In en, this message translates to:
  /// **'Content Creator'**
  String get discoveryCategoryContentCreator;

  /// Discovery category label for anime and manga communities.
  ///
  /// In en, this message translates to:
  /// **'Anime & Manga'**
  String get discoveryCategoryAnimeAndManga;

  /// Discovery category label for movies and TV communities.
  ///
  /// In en, this message translates to:
  /// **'Movies & TV'**
  String get discoveryCategoryMoviesAndTv;

  /// Discovery category label for communities that do not fit other categories.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get discoveryCategoryOther;

  /// Empty-state text when no discovery communities match the filters.
  ///
  /// In en, this message translates to:
  /// **'No communities match.'**
  String get discoveryNoCommunitiesMatch;

  /// Button label to join a discovery community.
  ///
  /// In en, this message translates to:
  /// **'Join community'**
  String get discoveryJoinCommunity;

  /// Button label when the user is already in a discovery community.
  ///
  /// In en, this message translates to:
  /// **'Joined'**
  String get discoveryJoined;

  /// Online member count on a discovery guild card.
  ///
  /// In en, this message translates to:
  /// **'{count} online'**
  String discoveryOnlineCount(String count);

  /// Member count on a discovery guild card.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 member} other{{count} members}}'**
  String discoveryMemberCount(num count);

  /// Fallback text when a discovery guild has no description.
  ///
  /// In en, this message translates to:
  /// **'No description.'**
  String get discoveryNoDescription;

  /// Discovery sidebar section label for communities.
  ///
  /// In en, this message translates to:
  /// **'Communities'**
  String get discoveryCommunities;

  /// Discovery sidebar section label for apps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get discoveryApps;

  /// Title of the generic join error dialog on the discovery page.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t join this community'**
  String get discoveryJoinErrorGenericTitle;

  /// Body of the generic join error dialog on the discovery page.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again in a moment.'**
  String get discoveryJoinErrorGenericMessage;

  /// Title when a discovery community has reached its member limit.
  ///
  /// In en, this message translates to:
  /// **'This community is full'**
  String get discoveryJoinErrorFullTitle;

  /// Body when a discovery community has reached its member limit.
  ///
  /// In en, this message translates to:
  /// **'This community has reached its member limit, so you can\'t join right now.'**
  String get discoveryJoinErrorFullMessage;

  /// Title when the user is in the maximum number of communities.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the community limit'**
  String get discoveryJoinErrorMaxGuildsTitle;

  /// Body when the user is in the maximum number of communities.
  ///
  /// In en, this message translates to:
  /// **'You\'re in the maximum number of communities. Leave one and try again.'**
  String get discoveryJoinErrorMaxGuildsMessage;

  /// Title when the user is banned from a discovery community.
  ///
  /// In en, this message translates to:
  /// **'You can\'t join this community'**
  String get discoveryJoinErrorBannedTitle;

  /// Body when the user is banned from a discovery community.
  ///
  /// In en, this message translates to:
  /// **'You have been banned from this community.'**
  String get discoveryJoinErrorBannedMessage;

  /// Title when a discovery community is no longer joinable.
  ///
  /// In en, this message translates to:
  /// **'This community is no longer available'**
  String get discoveryJoinErrorNotAvailableTitle;

  /// Body when a discovery community is no longer joinable.
  ///
  /// In en, this message translates to:
  /// **'It may have left discovery or turned off new joins. Refresh the page and you won\'t see it again.'**
  String get discoveryJoinErrorNotAvailableMessage;

  /// Title when joining a discovery community is rate limited.
  ///
  /// In en, this message translates to:
  /// **'You\'re going too fast'**
  String get discoveryJoinErrorRateLimitTitle;

  /// Body when joining a discovery community is rate limited.
  ///
  /// In en, this message translates to:
  /// **'Please wait a moment and try again.'**
  String get discoveryJoinErrorRateLimitMessage;

  /// Label for the add community button in the guild navbar.
  ///
  /// In en, this message translates to:
  /// **'Add a Community'**
  String get guildNavbarAddCommunity;

  /// Label for the help button in the guild navbar.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get guildNavbarHelp;

  /// Scroll pill shown when unread guilds are off-screen in the guild navbar.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get scrollIndicatorNew;

  /// Scroll pill shown when unread channels are off-screen in the channel sidebar.
  ///
  /// In en, this message translates to:
  /// **'NEW MESSAGE'**
  String get scrollIndicatorNewMessage;

  /// Tooltip when collapsing a guild folder in the navbar.
  ///
  /// In en, this message translates to:
  /// **'Collapse {folderName}'**
  String guildNavbarCollapseFolder(String folderName);

  /// Screen reader suffix when a guild navbar item is selected.
  ///
  /// In en, this message translates to:
  /// **'selected'**
  String get guildNavbarGuildSelected;

  /// Screen reader suffix when a guild navbar item has unread channels.
  ///
  /// In en, this message translates to:
  /// **'unread'**
  String get guildNavbarGuildUnread;

  /// Screen reader suffix when a guild navbar item has mention notifications.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 mention} other{{count} mentions}}'**
  String guildNavbarGuildMentions(int count);

  /// Screen reader suffix when a channel, DM, or favorites item is muted.
  ///
  /// In en, this message translates to:
  /// **'muted'**
  String get navigationItemMuted;

  /// Screen reader label for the show-password toggle on auth forms.
  ///
  /// In en, this message translates to:
  /// **'Show password'**
  String get authShowPassword;

  /// Screen reader label for the hide-password toggle on auth forms.
  ///
  /// In en, this message translates to:
  /// **'Hide password'**
  String get authHidePassword;

  /// Screen reader label for the chat message list loading skeleton.
  ///
  /// In en, this message translates to:
  /// **'Loading messages'**
  String get chatLoadingMessages;

  /// Screen reader label for messaging a friend from the friends list.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get friendsMessageFriend;

  /// Screen reader label for the friend overflow menu button.
  ///
  /// In en, this message translates to:
  /// **'Friend actions'**
  String get friendsFriendActions;

  /// Screen reader label for accepting a friend request.
  ///
  /// In en, this message translates to:
  /// **'Accept friend request'**
  String get friendsAcceptRequest;

  /// Screen reader label for declining a friend request.
  ///
  /// In en, this message translates to:
  /// **'Decline friend request'**
  String get friendsDeclineRequest;

  /// Screen reader label for canceling an outgoing friend request.
  ///
  /// In en, this message translates to:
  /// **'Cancel friend request'**
  String get friendsCancelRequest;

  /// Screen reader label for the friends list inbox button.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get friendsOpenInbox;

  /// Screen reader label for removing a friend from a profile.
  ///
  /// In en, this message translates to:
  /// **'Remove friend'**
  String get profileRemoveFriend;

  /// Screen reader label for unblocking a user from a profile.
  ///
  /// In en, this message translates to:
  /// **'Unblock user'**
  String get profileUnblockUser;

  /// Screen reader label for accepting a friend request from a profile.
  ///
  /// In en, this message translates to:
  /// **'Accept friend request'**
  String get profileAcceptFriendRequest;

  /// Screen reader label for canceling an outgoing friend request from a profile.
  ///
  /// In en, this message translates to:
  /// **'Cancel friend request'**
  String get profileCancelFriendRequest;

  /// Screen reader label for sending a friend request from a profile.
  ///
  /// In en, this message translates to:
  /// **'Add friend'**
  String get profileSendFriendRequest;

  /// Screen reader label for the account row overflow menu.
  ///
  /// In en, this message translates to:
  /// **'Account options'**
  String get accountOverflowMenu;

  /// Bottom navigation label for the home tab.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom navigation label for the notifications tab.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get navNotifications;

  /// Bottom navigation label for the profile tab.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get navYou;

  /// Title of the community folder settings modal.
  ///
  /// In en, this message translates to:
  /// **'Folder settings'**
  String get guildFolderSettingsTitle;

  /// Label for the folder name input in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Folder name'**
  String get guildFolderNameLabel;

  /// Label for the folder color picker in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Folder color'**
  String get guildFolderColorLabel;

  /// Toggle label for showing the folder icon when collapsed.
  ///
  /// In en, this message translates to:
  /// **'Show icon when collapsed'**
  String get guildFolderShowIconWhenCollapsed;

  /// Label for the folder icon picker in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Folder icon'**
  String get guildFolderIconLabel;

  /// Destructive button that dissolves a community folder.
  ///
  /// In en, this message translates to:
  /// **'Delete folder'**
  String get guildFolderDelete;

  /// Folder icon option label in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Folder'**
  String get guildFolderIconFolder;

  /// Star folder icon option label in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Star'**
  String get guildFolderIconStar;

  /// Heart folder icon option label in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Heart'**
  String get guildFolderIconHeart;

  /// Bookmark folder icon option label in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get guildFolderIconBookmark;

  /// Game controller folder icon option label in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Game controller'**
  String get guildFolderIconGameController;

  /// Shield folder icon option label in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Shield'**
  String get guildFolderIconShield;

  /// Music note folder icon option label in folder settings.
  ///
  /// In en, this message translates to:
  /// **'Music note'**
  String get guildFolderIconMusicNote;

  /// Context menu action that marks every channel in the folder as read.
  ///
  /// In en, this message translates to:
  /// **'Mark folder as read'**
  String get guildFolderMarkAsRead;

  /// Submenu label for muting all communities in a folder.
  ///
  /// In en, this message translates to:
  /// **'Mute communities'**
  String get guildBulkMuteCommunities;

  /// Action that unmutes all communities in a folder.
  ///
  /// In en, this message translates to:
  /// **'Unmute communities'**
  String get guildBulkUnmuteCommunities;

  /// Submenu label for bulk notification settings in a folder.
  ///
  /// In en, this message translates to:
  /// **'Community notification settings'**
  String get guildBulkCommunityNotificationSettings;

  /// Submenu label for bulk privacy settings in a folder.
  ///
  /// In en, this message translates to:
  /// **'Community privacy settings'**
  String get guildBulkCommunityPrivacySettings;

  /// Bulk action that allows @everyone and @here mentions.
  ///
  /// In en, this message translates to:
  /// **'Allow @everyone and @here'**
  String get guildBulkAllowEveryoneAndHere;

  /// Bulk action that allows role mentions.
  ///
  /// In en, this message translates to:
  /// **'Allow role mentions'**
  String get guildBulkAllowRoleMentions;

  /// Bulk action that enables mobile push for folder communities.
  ///
  /// In en, this message translates to:
  /// **'Enable mobile push notifications'**
  String get guildBulkEnableMobilePush;

  /// Bulk action that disables mobile push for folder communities.
  ///
  /// In en, this message translates to:
  /// **'Disable mobile push notifications'**
  String get guildBulkDisableMobilePush;

  /// Bulk action that allows DMs from folder community members.
  ///
  /// In en, this message translates to:
  /// **'Allow direct messages'**
  String get guildBulkAllowDirectMessages;

  /// Bulk action that blocks DMs from folder community members.
  ///
  /// In en, this message translates to:
  /// **'Block direct messages'**
  String get guildBulkBlockDirectMessages;

  /// Bulk action that allows bot DMs from folder communities.
  ///
  /// In en, this message translates to:
  /// **'Allow bot direct messages'**
  String get guildBulkAllowBotDirectMessages;

  /// Bulk action that blocks bot DMs from folder communities.
  ///
  /// In en, this message translates to:
  /// **'Block bot direct messages'**
  String get guildBulkBlockBotDirectMessages;

  /// Secondary label for a group DM in the invite recipients list.
  ///
  /// In en, this message translates to:
  /// **'Group DM'**
  String get guildNavbarGroupDm;

  /// Title and confirm label for the create channel modal.
  ///
  /// In en, this message translates to:
  /// **'Create channel'**
  String get guildNavbarCreateChannel;

  /// Section label for channel type selection in create channel modal.
  ///
  /// In en, this message translates to:
  /// **'Channel type'**
  String get guildNavbarChannelType;

  /// Label for the text channel type option.
  ///
  /// In en, this message translates to:
  /// **'Text Channel'**
  String get guildNavbarTextChannel;

  /// Description for the text channel type option.
  ///
  /// In en, this message translates to:
  /// **'Send messages, images, GIFs, and emoji'**
  String get guildNavbarTextChannelDescription;

  /// Label for the voice channel type option.
  ///
  /// In en, this message translates to:
  /// **'Voice Channel'**
  String get guildNavbarVoiceChannel;

  /// Description for the voice channel type option.
  ///
  /// In en, this message translates to:
  /// **'Hang out together with voice, video, and screen share'**
  String get guildNavbarVoiceChannelDescription;

  /// Label for the link channel type option.
  ///
  /// In en, this message translates to:
  /// **'Link Channel'**
  String get guildNavbarLinkChannel;

  /// Description for the link channel type option.
  ///
  /// In en, this message translates to:
  /// **'Quick access to an external website or resource'**
  String get guildNavbarLinkChannelDescription;

  /// Label for name input fields in guild navbar modals.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get guildNavbarNameLabel;

  /// Placeholder hint for new channel name input.
  ///
  /// In en, this message translates to:
  /// **'new-channel'**
  String get guildNavbarNewChannelHint;

  /// Label for URL input in link channel creation.
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get guildNavbarUrlLabel;

  /// Placeholder hint for URL input in link channel creation.
  ///
  /// In en, this message translates to:
  /// **'https://example.com'**
  String get guildNavbarUrlHint;

  /// Accessibility label for channel type radio group in create channel modal.
  ///
  /// In en, this message translates to:
  /// **'Channel type selection'**
  String get guildNavbarChannelTypeSelection;

  /// Title and confirm label for the create category modal.
  ///
  /// In en, this message translates to:
  /// **'Create category'**
  String get guildNavbarCreateCategory;

  /// Placeholder hint for new category name input.
  ///
  /// In en, this message translates to:
  /// **'New category'**
  String get guildNavbarNewCategoryHint;

  /// Title for the invite members modal.
  ///
  /// In en, this message translates to:
  /// **'Invite friends to {communityName}'**
  String guildNavbarInviteFriendsTo(String communityName);

  /// Subtitle explaining which channel invite recipients land in.
  ///
  /// In en, this message translates to:
  /// **'Recipients will be taken to #{channelName}'**
  String guildNavbarInviteRecipientsChannel(String channelName);

  /// Search input hint in the invite members modal.
  ///
  /// In en, this message translates to:
  /// **'Search friends'**
  String get guildNavbarSearchFriends;

  /// Empty state when there are no friends to invite.
  ///
  /// In en, this message translates to:
  /// **'No friends yet'**
  String get guildNavbarNoFriendsYet;

  /// Empty state when friend search returns no matches.
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get guildNavbarNoResults;

  /// Prompt above the invite link field in the invite modal.
  ///
  /// In en, this message translates to:
  /// **'Or, send an invite link to a friend:'**
  String get guildNavbarInviteLinkPrompt;

  /// Hint text for the invite link field.
  ///
  /// In en, this message translates to:
  /// **'Invite link'**
  String get guildNavbarInviteLink;

  /// Button to copy the invite link.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get guildNavbarCopy;

  /// Button label after copying the invite link.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get guildNavbarCopied;

  /// Default invite link expiry notice.
  ///
  /// In en, this message translates to:
  /// **'Your invite link expires in 7 days.'**
  String get guildNavbarInviteExpiresSevenDays;

  /// Notice when an invite link has no expiry.
  ///
  /// In en, this message translates to:
  /// **'This invite link never expires.'**
  String get guildNavbarInviteNeverExpires;

  /// Notice when an invite link expires after a custom duration.
  ///
  /// In en, this message translates to:
  /// **'Your invite link expires in {duration}.'**
  String guildNavbarInviteExpiresIn(String duration);

  /// Link to edit invite link settings.
  ///
  /// In en, this message translates to:
  /// **'Edit invite link'**
  String get guildNavbarEditInviteLink;

  /// Title for the invite link settings modal.
  ///
  /// In en, this message translates to:
  /// **'Invite link settings'**
  String get guildNavbarInviteLinkSettings;

  /// Label for invite link expiry dropdown.
  ///
  /// In en, this message translates to:
  /// **'Expire After'**
  String get guildNavbarExpireAfter;

  /// Label for invite link max uses dropdown.
  ///
  /// In en, this message translates to:
  /// **'Max Number of Uses'**
  String get guildNavbarMaxUses;

  /// Toggle label for temporary membership on invite links.
  ///
  /// In en, this message translates to:
  /// **'Grant Temporary Membership'**
  String get guildNavbarGrantTemporaryMembership;

  /// Description for the temporary membership toggle.
  ///
  /// In en, this message translates to:
  /// **'Members will be removed when they go offline unless a role is assigned'**
  String get guildNavbarTemporaryMembershipDescription;

  /// Confirm button in invite link settings modal.
  ///
  /// In en, this message translates to:
  /// **'Create New Link'**
  String get guildNavbarCreateNewLink;

  /// Button label after an invite was sent to a recipient.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get guildNavbarSent;

  /// Button to send an invite to a recipient.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get guildNavbarInvite;

  /// Title for the leave community confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Leave Community'**
  String get guildNavbarLeaveCommunityTitle;

  /// Description for the leave community confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to leave this community? You will no longer be able to see any messages.'**
  String get guildNavbarLeaveCommunityDescription;

  /// Confirm button for the leave community dialog.
  ///
  /// In en, this message translates to:
  /// **'Leave Community'**
  String get guildNavbarLeaveCommunityConfirm;

  /// Title for the delete my messages confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete your messages in this community?'**
  String get guildNavbarDeleteMyMessagesTitle;

  /// Description for the delete my messages confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete every message you\'ve sent here, across every channel. Cannot be undone.'**
  String get guildNavbarDeleteMyMessagesDescription;

  /// Confirm button for the delete my messages dialog.
  ///
  /// In en, this message translates to:
  /// **'Delete My Messages'**
  String get guildNavbarDeleteMyMessagesConfirm;

  /// Success toast after deleting messages in a community.
  ///
  /// In en, this message translates to:
  /// **'Deleted your messages'**
  String get guildNavbarDeletedYourMessages;

  /// Error toast when deleting messages in a community fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t delete your messages'**
  String get guildNavbarCouldNotDeleteYourMessages;

  /// Semantic label for removing a per-channel notification override.
  ///
  /// In en, this message translates to:
  /// **'Remove override'**
  String get guildNavbarRemoveOverride;

  /// Guild tooltip text when the community is muted until a specific time.
  ///
  /// In en, this message translates to:
  /// **'Muted until {formattedDate}'**
  String guildNavbarMutedUntil(String formattedDate);

  /// Guild tooltip when the community is staff-only.
  ///
  /// In en, this message translates to:
  /// **'Only accessible to Fluxer staff'**
  String get guildNavbarStaffOnlyAccessible;

  /// Guild tooltip when invites are disabled.
  ///
  /// In en, this message translates to:
  /// **'Invites are currently paused in this community'**
  String get guildNavbarInvitesPaused;

  /// Invite expiry duration label for no expiry.
  ///
  /// In en, this message translates to:
  /// **'never'**
  String get guildNavbarDurationNever;

  /// Invite expiry duration label for 30 minutes.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get guildNavbarDuration30Minutes;

  /// Invite expiry duration label for 1 hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get guildNavbarDuration1Hour;

  /// Invite expiry duration label for 6 hours.
  ///
  /// In en, this message translates to:
  /// **'6 hours'**
  String get guildNavbarDuration6Hours;

  /// Invite expiry duration label for 12 hours.
  ///
  /// In en, this message translates to:
  /// **'12 hours'**
  String get guildNavbarDuration12Hours;

  /// Invite expiry duration label for 1 day.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get guildNavbarDuration1Day;

  /// Invite expiry duration label for 7 days.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get guildNavbarDuration7Days;

  /// Invite expiry duration label for a custom number of seconds.
  ///
  /// In en, this message translates to:
  /// **'{count} seconds'**
  String guildNavbarDurationSeconds(int count);

  /// Invite expiry select option for no expiry.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get guildNavbarNever;

  /// Invite max uses select option for unlimited uses.
  ///
  /// In en, this message translates to:
  /// **'No limit'**
  String get guildNavbarNoLimit;

  /// Invite max uses select option for a single use.
  ///
  /// In en, this message translates to:
  /// **'1 use'**
  String get guildNavbarOneUse;

  /// Invite max uses select option for a specific number of uses.
  ///
  /// In en, this message translates to:
  /// **'{count} uses'**
  String guildNavbarUses(int count);

  /// Guild menu action to mark all channels as read.
  ///
  /// In en, this message translates to:
  /// **'Mark as Read'**
  String get guildMenuMarkAsRead;

  /// Guild peek menu action to open the full guild options sheet.
  ///
  /// In en, this message translates to:
  /// **'More Options'**
  String get guildPeekMoreOptions;

  /// Guild menu action to open the invite members flow.
  ///
  /// In en, this message translates to:
  /// **'Invite Members'**
  String get guildMenuInviteMembers;

  /// Guild menu submenu for community settings tabs.
  ///
  /// In en, this message translates to:
  /// **'Community Settings'**
  String get guildMenuCommunitySettings;

  /// Guild menu action to edit the community profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Community Profile'**
  String get guildMenuEditCommunityProfile;

  /// Guild menu action to unmute the community.
  ///
  /// In en, this message translates to:
  /// **'Unmute Community'**
  String get guildMenuUnmuteCommunity;

  /// Guild menu submenu to mute the community.
  ///
  /// In en, this message translates to:
  /// **'Mute Community'**
  String get guildMenuMuteCommunity;

  /// Guild menu checkbox to hide muted channels.
  ///
  /// In en, this message translates to:
  /// **'Hide Muted Channels'**
  String get guildMenuHideMutedChannels;

  /// Guild menu action to report the community.
  ///
  /// In en, this message translates to:
  /// **'Report Community'**
  String get guildMenuReportCommunity;

  /// Guild menu action to open community debug info.
  ///
  /// In en, this message translates to:
  /// **'Debug Community'**
  String get guildMenuDebugCommunity;

  /// Guild menu action to copy the community ID.
  ///
  /// In en, this message translates to:
  /// **'Copy Community ID'**
  String get guildMenuCopyCommunityId;

  /// Guild menu hint showing when a community mute expires.
  ///
  /// In en, this message translates to:
  /// **'Until {formattedTime}'**
  String guildMenuMutedUntil(String formattedTime);

  /// Community settings tab for general overview.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get guildMenuSettingsGeneral;

  /// Community settings tab for roles and permissions.
  ///
  /// In en, this message translates to:
  /// **'Roles & Permissions'**
  String get guildMenuSettingsRoles;

  /// Community settings tab for custom emoji.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get guildMenuSettingsEmoji;

  /// Community settings tab for custom stickers.
  ///
  /// In en, this message translates to:
  /// **'Stickers'**
  String get guildMenuSettingsStickers;

  /// Community settings tab for safety and moderation.
  ///
  /// In en, this message translates to:
  /// **'Safety & Moderation'**
  String get guildMenuSettingsSafetyModeration;

  /// Community settings tab for the activity log.
  ///
  /// In en, this message translates to:
  /// **'Activity log'**
  String get guildMenuSettingsActivityLog;

  /// Community settings tab for webhooks.
  ///
  /// In en, this message translates to:
  /// **'Webhooks'**
  String get guildMenuSettingsWebhooks;

  /// Community settings tab for custom invite URLs.
  ///
  /// In en, this message translates to:
  /// **'Custom Invite URL'**
  String get guildMenuSettingsCustomInviteUrl;

  /// Community settings tab for discovery settings.
  ///
  /// In en, this message translates to:
  /// **'Discovery'**
  String get guildMenuSettingsDiscovery;

  /// Community settings tab for member management.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get guildMenuSettingsMembers;

  /// Community settings tab for invite links.
  ///
  /// In en, this message translates to:
  /// **'Invites'**
  String get guildMenuSettingsInviteLinks;

  /// Community settings tab for banned members.
  ///
  /// In en, this message translates to:
  /// **'Bans'**
  String get guildMenuSettingsBans;

  /// Guild settings menu item for channel management.
  ///
  /// In en, this message translates to:
  /// **'Channels'**
  String get guildMenuSettingsChannels;

  /// Shown when the user lacks permission for a guild settings tab.
  ///
  /// In en, this message translates to:
  /// **'You do not have permission to view this settings tab.'**
  String get guildSettingsNoPermission;

  /// Title for the guild icon section in overview settings.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get guildSettingsOverviewIconTitle;

  /// Button label to upload an image in guild settings.
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get guildSettingsUploadImage;

  /// Title for the guild banner section.
  ///
  /// In en, this message translates to:
  /// **'Banner'**
  String get guildSettingsOverviewBannerTitle;

  /// Hint text for guild banner upload.
  ///
  /// In en, this message translates to:
  /// **'Upload a banner for your server.'**
  String get guildSettingsOverviewBannerHint;

  /// Title for the guild name field.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get guildSettingsOverviewNameTitle;

  /// Hint for the guild name field.
  ///
  /// In en, this message translates to:
  /// **'My awesome community'**
  String get guildSettingsOverviewNameHint;

  /// Title for guild statistics section.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get guildSettingsOverviewStatsTitle;

  /// Label for member count in overview.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get guildSettingsOverviewMembers;

  /// Label for online count in overview.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get guildSettingsOverviewOnline;

  /// Description for the roles settings tab.
  ///
  /// In en, this message translates to:
  /// **'Use roles to group members and assign permissions.'**
  String get guildSettingsRolesDescription;

  /// Button to create a new role.
  ///
  /// In en, this message translates to:
  /// **'Create role'**
  String get guildSettingsCreateRole;

  /// Title for the roles list section.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get guildSettingsRolesListTitle;

  /// Default name for a newly created role.
  ///
  /// In en, this message translates to:
  /// **'New role'**
  String get guildSettingsRolesNewRole;

  /// Button to delete the selected role.
  ///
  /// In en, this message translates to:
  /// **'Delete role'**
  String get guildSettingsRolesDeleteRole;

  /// Button to return to the role list from the editor.
  ///
  /// In en, this message translates to:
  /// **'Back to roles'**
  String get guildSettingsRolesBackToRoles;

  /// Button in community settings that returns from a nested sidebar to the main settings tab list.
  ///
  /// In en, this message translates to:
  /// **'Back to settings'**
  String get guildSettingsBackToSettings;

  /// Title for the role editor panel.
  ///
  /// In en, this message translates to:
  /// **'Edit \"{name}\"'**
  String guildSettingsRolesEditTitle(String name);

  /// Subtitle for the role editor panel.
  ///
  /// In en, this message translates to:
  /// **'Configure role settings and permissions'**
  String get guildSettingsRolesEditSubtitle;

  /// Section title for role display settings.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get guildSettingsRolesDisplaySection;

  /// Label for the role name input.
  ///
  /// In en, this message translates to:
  /// **'Role name'**
  String get guildSettingsRolesRoleName;

  /// Label for the role color picker.
  ///
  /// In en, this message translates to:
  /// **'Role color'**
  String get guildSettingsRolesRoleColor;

  /// Helper text under the role color input.
  ///
  /// In en, this message translates to:
  /// **'Type a color (hex, rgb(), hsl(), or name) or use the picker.'**
  String get guildSettingsRolesRoleColorHelper;

  /// Switch label for the hoist toggle.
  ///
  /// In en, this message translates to:
  /// **'Show this role separately'**
  String get guildSettingsRolesShowSeparately;

  /// Helper text under the hoist toggle.
  ///
  /// In en, this message translates to:
  /// **'Lists members with this role in their own section in the member list.'**
  String get guildSettingsRolesShowSeparatelyHelper;

  /// Switch label for the mentionable toggle.
  ///
  /// In en, this message translates to:
  /// **'Allow mentions for this role'**
  String get guildSettingsRolesAllowMentions;

  /// Helper text under the mentionable toggle.
  ///
  /// In en, this message translates to:
  /// **'Members with the \"{permission}\" permission can always mention roles, regardless of this setting.'**
  String guildSettingsRolesAllowMentionsHelper(String permission);

  /// Help text above the clear permissions button.
  ///
  /// In en, this message translates to:
  /// **'Use this button to quickly clear all permissions.'**
  String get guildSettingsRolesClearPermissionsHelp;

  /// Button to clear all role permissions.
  ///
  /// In en, this message translates to:
  /// **'Clear permissions'**
  String get guildSettingsRolesClearPermissions;

  /// Section title for role permissions.
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get guildSettingsRolesPermissionsSection;

  /// Placeholder for the permission search input.
  ///
  /// In en, this message translates to:
  /// **'Search permissions'**
  String get guildSettingsRolesSearchPermissions;

  /// Tooltip when permission list is in comfy layout.
  ///
  /// In en, this message translates to:
  /// **'Dense layout'**
  String get guildSettingsRolesDenseLayout;

  /// Tooltip when permission list is in dense layout.
  ///
  /// In en, this message translates to:
  /// **'Comfy layout'**
  String get guildSettingsRolesComfyLayout;

  /// Aria label for switching to dense layout.
  ///
  /// In en, this message translates to:
  /// **'Switch to dense layout'**
  String get guildSettingsRolesSwitchToDenseLayout;

  /// Aria label for switching to comfy layout.
  ///
  /// In en, this message translates to:
  /// **'Switch to comfy layout'**
  String get guildSettingsRolesSwitchToComfyLayout;

  /// Tooltip when permission list is in two-column layout.
  ///
  /// In en, this message translates to:
  /// **'Single column'**
  String get guildSettingsRolesSingleColumn;

  /// Tooltip when permission list is in single-column layout.
  ///
  /// In en, this message translates to:
  /// **'Two columns'**
  String get guildSettingsRolesTwoColumns;

  /// Aria label for switching to single column.
  ///
  /// In en, this message translates to:
  /// **'Switch to single column'**
  String get guildSettingsRolesSwitchToSingleColumn;

  /// Aria label for switching to two columns.
  ///
  /// In en, this message translates to:
  /// **'Switch to two columns'**
  String get guildSettingsRolesSwitchToTwoColumns;

  /// Empty state when permission search has no matches.
  ///
  /// In en, this message translates to:
  /// **'No permissions found'**
  String get guildSettingsRolesNoPermissionsFound;

  /// Button to enter custom hoist order mode.
  ///
  /// In en, this message translates to:
  /// **'Custom hoist order'**
  String get guildSettingsRolesCustomHoistOrder;

  /// Header for hoist order sub-mode.
  ///
  /// In en, this message translates to:
  /// **'Hoist order'**
  String get guildSettingsRolesHoistOrder;

  /// Button to reset custom hoist order.
  ///
  /// In en, this message translates to:
  /// **'Reset to default'**
  String get guildSettingsRolesResetHoistOrder;

  /// Help text in hoist order mode.
  ///
  /// In en, this message translates to:
  /// **'Drag roles to customize the order they appear in the member list.'**
  String get guildSettingsRolesHoistOrderHelp;

  /// Empty state when no roles are hoisted.
  ///
  /// In en, this message translates to:
  /// **'No hoisted roles. Enable \"Show this role separately\" on a role to see it here.'**
  String get guildSettingsRolesNoHoistedRoles;

  /// Tooltip on locked role rows.
  ///
  /// In en, this message translates to:
  /// **'You cannot edit this role because it is your highest role or above you'**
  String get guildSettingsRolesLockedTooltip;

  /// Tooltip when user lacks manage roles permission.
  ///
  /// In en, this message translates to:
  /// **'You need the \"{permission}\" permission to edit these permissions'**
  String guildSettingsRolesNeedManageRolesPermission(String permission);

  /// Tooltip when role hierarchy blocks editing.
  ///
  /// In en, this message translates to:
  /// **'You cannot edit a role at or above your highest role'**
  String get guildSettingsRolesCannotEditHigherRole;

  /// Tooltip when user cannot grant a permission.
  ///
  /// In en, this message translates to:
  /// **'You cannot grant a permission you don\'t have'**
  String get guildSettingsRolesCannotGrantPermission;

  /// Tooltip when revoking would strip permission from self.
  ///
  /// In en, this message translates to:
  /// **'You cannot remove this permission because it would remove it from yourself'**
  String get guildSettingsRolesCannotRemoveOwnPermission;

  /// Toast after saving role changes.
  ///
  /// In en, this message translates to:
  /// **'Roles updated successfully'**
  String get guildSettingsRolesUpdatedSuccess;

  /// Toast after creating a role.
  ///
  /// In en, this message translates to:
  /// **'Role created successfully'**
  String get guildSettingsRolesCreatedSuccess;

  /// Toast after deleting a role.
  ///
  /// In en, this message translates to:
  /// **'Role deleted successfully'**
  String get guildSettingsRolesDeletedSuccess;

  /// Toast after resetting hoist order.
  ///
  /// In en, this message translates to:
  /// **'Hoist order reset to default'**
  String get guildSettingsRolesHoistResetSuccess;

  /// Modal title when role name is blank on save.
  ///
  /// In en, this message translates to:
  /// **'Role name is required'**
  String get guildSettingsRolesNameRequiredTitle;

  /// Modal body when role name is blank on save.
  ///
  /// In en, this message translates to:
  /// **'Give the role a name before saving.'**
  String get guildSettingsRolesNameRequiredBody;

  /// Error modal title when role creation fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t create role'**
  String get guildSettingsRolesCreateFailedTitle;

  /// Error modal title when role update fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update roles'**
  String get guildSettingsRolesUpdateFailedTitle;

  /// Error modal title when role deletion fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t delete role'**
  String get guildSettingsRolesDeleteFailedTitle;

  /// Error modal body when role deletion fails.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" wouldn\'t delete. Try again.'**
  String guildSettingsRolesDeleteFailedBody(String name);

  /// Error modal title when hoist reset fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t reset hoist order'**
  String get guildSettingsRolesResetHoistFailedTitle;

  /// Generic retry message for role errors.
  ///
  /// In en, this message translates to:
  /// **'Try again in a moment.'**
  String get guildSettingsRolesTryAgainInAMoment;

  /// Delete role confirmation message.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the {name} role? Any members with this role will no longer have it.'**
  String guildSettingsRolesDeleteConfirm(String name);

  /// Permission category label.
  ///
  /// In en, this message translates to:
  /// **'Community-wide'**
  String get permissionCategoryCommunityWide;

  /// Permission category label.
  ///
  /// In en, this message translates to:
  /// **'Messages & media'**
  String get permissionCategoryMessagesMedia;

  /// Permission category label.
  ///
  /// In en, this message translates to:
  /// **'Moderation'**
  String get permissionCategoryModeration;

  /// Permission category label.
  ///
  /// In en, this message translates to:
  /// **'Channel access'**
  String get permissionCategoryChannelAccess;

  /// Permission category for per-channel management permissions.
  ///
  /// In en, this message translates to:
  /// **'Channel management'**
  String get permissionCategoryChannelManagement;

  /// Permission category label.
  ///
  /// In en, this message translates to:
  /// **'Audio & video'**
  String get permissionCategoryAudioVideo;

  /// Fallback permission label.
  ///
  /// In en, this message translates to:
  /// **'Unknown permission'**
  String get permissionUnknown;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Administrator'**
  String get permissionAdministrator;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Grants all permissions and bypasses channel restrictions. Highly sensitive.'**
  String get permissionAdministratorDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'View activity log'**
  String get permissionViewActivityLog;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Read the community\'s activity log of changes and moderation actions.'**
  String get permissionViewActivityLogDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Manage community'**
  String get permissionManageCommunity;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Edit global settings like name, description, and icon.'**
  String get permissionManageCommunityDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Manage roles'**
  String get permissionManageRoles;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Create, edit, or delete roles below your highest role. Also allows editing channel permission overwrites.'**
  String get permissionManageRolesDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Manage channels'**
  String get permissionManageChannels;

  /// Channel-scoped permission name for editing the current channel.
  ///
  /// In en, this message translates to:
  /// **'Manage channel'**
  String get permissionManageChannel;

  /// Channel-scoped description for manage channel permission.
  ///
  /// In en, this message translates to:
  /// **'Rename and edit this channel\'s settings.'**
  String get permissionManageChannelDescription;

  /// Channel-scoped permission name for editing permission overwrites.
  ///
  /// In en, this message translates to:
  /// **'Manage permissions'**
  String get permissionManagePermissions;

  /// Channel-scoped description for manage permissions permission.
  ///
  /// In en, this message translates to:
  /// **'Edit overwrites for roles and members in this channel.'**
  String get permissionManagePermissionsDescription;

  /// Channel-scoped description for manage webhooks permission.
  ///
  /// In en, this message translates to:
  /// **'Create, edit, or delete webhooks for this channel.'**
  String get permissionManageWebhooksChannelDescription;

  /// Channel-scoped description for view channel members permission.
  ///
  /// In en, this message translates to:
  /// **'See the member list for this channel.'**
  String get permissionViewChannelMembersChannelDescription;

  /// Channel-scoped description for create invite permission.
  ///
  /// In en, this message translates to:
  /// **'Manage invite links for this channel.'**
  String get permissionCreateInviteLinksChannelDescription;

  /// Deny state label for channel permission overwrite controls.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get permissionOverwriteDeny;

  /// Inherit state label for channel permission overwrite controls.
  ///
  /// In en, this message translates to:
  /// **'Neutral (inherit)'**
  String get permissionOverwriteInherit;

  /// Allow state label for channel permission overwrite controls.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get permissionOverwriteAllow;

  /// Helper text above bulk permission state buttons in channel permissions.
  ///
  /// In en, this message translates to:
  /// **'Use these buttons to quickly set all permissions.'**
  String get permissionOverwriteSetAllHelp;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Create, edit, or delete channels and categories.'**
  String get permissionManageChannelsDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Kick members'**
  String get permissionKickMembers;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Ban members'**
  String get permissionBanMembers;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Create invite links'**
  String get permissionCreateInviteLinks;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Change own nickname'**
  String get permissionChangeOwnNickname;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Update your own nickname.'**
  String get permissionChangeOwnNicknameDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Manage nicknames'**
  String get permissionManageNicknames;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Change other members\' nicknames.'**
  String get permissionManageNicknamesDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Create emoji & stickers'**
  String get permissionCreateEmojiStickers;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Upload new emoji and stickers, and manage your own creations.'**
  String get permissionCreateEmojiStickersDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Manage emoji & stickers'**
  String get permissionManageEmojiStickers;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Edit or delete emoji and stickers created by other members.'**
  String get permissionManageEmojiStickersDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Manage webhooks'**
  String get permissionManageWebhooks;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Create, edit, or delete webhooks.'**
  String get permissionManageWebhooksDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Send messages'**
  String get permissionSendMessages;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Send TTS messages'**
  String get permissionSendTtsMessages;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Send text-to-speech messages.'**
  String get permissionSendTtsMessagesDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Manage messages'**
  String get permissionManageMessages;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Delete other members\' messages. Pinning is controlled separately.'**
  String get permissionManageMessagesDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Pin messages'**
  String get permissionPinMessages;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Embed links'**
  String get permissionEmbedLinks;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Attach files'**
  String get permissionAttachFiles;

  /// Permission name for mention everyone.
  ///
  /// In en, this message translates to:
  /// **'Use @everyone/@here and @role'**
  String get permissionMentionEveryone;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Mention everyone or any role (even if the role isn\'t set to be mentionable).'**
  String get permissionMentionEveryoneDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Use external emoji'**
  String get permissionUseExternalEmoji;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Use emoji from other communities.'**
  String get permissionUseExternalEmojiDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Use external stickers'**
  String get permissionUseExternalStickers;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Add reactions'**
  String get permissionAddReactions;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Add new reactions to messages.'**
  String get permissionAddReactionsDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Bypass slowmode'**
  String get permissionBypassSlowmode;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Ignore per-channel message rate limits.'**
  String get permissionBypassSlowmodeDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Time out members'**
  String get permissionTimeOutMembers;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Prevent members from sending messages, reacting, and joining voice for a duration.'**
  String get permissionTimeOutMembersDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'View channel'**
  String get permissionViewChannel;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'View channel members'**
  String get permissionViewChannelMembers;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'See the member list for channels in this community.'**
  String get permissionViewChannelMembersDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get permissionConnect;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Speak'**
  String get permissionSpeak;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Stream video'**
  String get permissionStreamVideo;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Use voice activity'**
  String get permissionUseVoiceActivity;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Without this permission, push-to-talk is required.'**
  String get permissionUseVoiceActivityDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Priority speaker'**
  String get permissionPrioritySpeaker;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Mute members'**
  String get permissionMuteMembers;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Deafen members'**
  String get permissionDeafenMembers;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Move members'**
  String get permissionMoveMembers;

  /// Permission description.
  ///
  /// In en, this message translates to:
  /// **'Drag members between channels they can access.'**
  String get permissionMoveMembersDescription;

  /// Permission name.
  ///
  /// In en, this message translates to:
  /// **'Set voice region'**
  String get permissionSetVoiceRegion;

  /// Emoji slot usage summary.
  ///
  /// In en, this message translates to:
  /// **'{staticCount} static, {animatedCount} animated emoji slots used'**
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount);

  /// Empty state for emoji settings.
  ///
  /// In en, this message translates to:
  /// **'No custom emoji yet.'**
  String get guildSettingsEmojiEmpty;

  /// Sticker slot usage summary.
  ///
  /// In en, this message translates to:
  /// **'{count} stickers uploaded'**
  String guildSettingsStickersSlotInfo(int count);

  /// Empty state for sticker settings.
  ///
  /// In en, this message translates to:
  /// **'No custom stickers yet.'**
  String get guildSettingsStickersEmpty;

  /// Title for verification level settings.
  ///
  /// In en, this message translates to:
  /// **'Member verification'**
  String get guildSettingsModerationVerificationTitle;

  /// Description for verification level settings.
  ///
  /// In en, this message translates to:
  /// **'Choose what members must have before they can post or DM community members.'**
  String get guildSettingsModerationVerificationDescription;

  /// Additional verification guidance in moderation settings.
  ///
  /// In en, this message translates to:
  /// **'Members with roles can bypass these checks. For public spaces, we recommend enabling verification.'**
  String get guildSettingsModerationVerificationRolesBypass;

  /// Discovery restriction note for verification level.
  ///
  /// In en, this message translates to:
  /// **'Communities listed in Discovery require at least verified email. None cannot be selected while Discovery is enabled.'**
  String get guildSettingsModerationVerificationDiscoveryNote;

  /// Title for mature content settings.
  ///
  /// In en, this message translates to:
  /// **'Mature content & content warnings'**
  String get guildSettingsModerationMatureTitle;

  /// Section description for mature content and content warning settings.
  ///
  /// In en, this message translates to:
  /// **'Configure mature content labeling and optional content warnings for members.'**
  String get guildSettingsModerationMatureSectionDescription;

  /// Switch label for mature content setting.
  ///
  /// In en, this message translates to:
  /// **'Mature content'**
  String get guildSettingsModerationMatureToggle;

  /// Subtitle for the mature content switch in moderation settings.
  ///
  /// In en, this message translates to:
  /// **'Mark this community as containing mature content.'**
  String get guildSettingsModerationMatureToggleDescription;

  /// No description provided for @guildSettingsVerificationNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get guildSettingsVerificationNone;

  /// No description provided for @guildSettingsVerificationNoneDescription.
  ///
  /// In en, this message translates to:
  /// **'No verification is required.'**
  String get guildSettingsVerificationNoneDescription;

  /// No description provided for @guildSettingsVerificationLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get guildSettingsVerificationLow;

  /// No description provided for @guildSettingsVerificationLowDescription.
  ///
  /// In en, this message translates to:
  /// **'Requires a verified email address.'**
  String get guildSettingsVerificationLowDescription;

  /// No description provided for @guildSettingsVerificationMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get guildSettingsVerificationMedium;

  /// No description provided for @guildSettingsVerificationMediumDescription.
  ///
  /// In en, this message translates to:
  /// **'Requires a verified email address, and an account that\'s at least 5 minutes old.'**
  String get guildSettingsVerificationMediumDescription;

  /// No description provided for @guildSettingsVerificationHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get guildSettingsVerificationHigh;

  /// No description provided for @guildSettingsVerificationHighDescription.
  ///
  /// In en, this message translates to:
  /// **'Requires everything in medium, plus being a member of the community for at least 10 minutes.'**
  String get guildSettingsVerificationHighDescription;

  /// No description provided for @guildSettingsVerificationHighest.
  ///
  /// In en, this message translates to:
  /// **'Very high'**
  String get guildSettingsVerificationHighest;

  /// No description provided for @guildSettingsVerificationHighestDescription.
  ///
  /// In en, this message translates to:
  /// **'Requires a verified phone number.'**
  String get guildSettingsVerificationHighestDescription;

  /// Subtitle under the activity-log page title.
  ///
  /// In en, this message translates to:
  /// **'Track moderator actions across the community.'**
  String get guildSettingsAuditLogDescription;

  /// Empty-state title in the activity log tab when there are no log entries to show.
  ///
  /// In en, this message translates to:
  /// **'No logs yet'**
  String get guildSettingsAuditLogEmpty;

  /// Empty-state body in the activity log tab when there are no log entries to show.
  ///
  /// In en, this message translates to:
  /// **'Moderation actions and community changes will appear here.'**
  String get guildSettingsAuditLogEmptyDescription;

  /// Default option in the activity log filter by user dropdown.
  ///
  /// In en, this message translates to:
  /// **'All users'**
  String get guildSettingsAuditLogFilterAllUsers;

  /// Default option in the activity log filter by action dropdown.
  ///
  /// In en, this message translates to:
  /// **'All actions'**
  String get guildSettingsAuditLogFilterAllActions;

  /// Fallback text when the moderator did not supply a reason.
  ///
  /// In en, this message translates to:
  /// **'No reason was provided.'**
  String get guildSettingsAuditLogNoReason;

  /// Fallback avatar label when the acting user is unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unknown user'**
  String get guildSettingsAuditLogUnknownUser;

  /// Generic error shown when fetching log entries fails.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong while loading the activity log.'**
  String get guildSettingsAuditLogLoadError;

  /// Error-state title when fetching log entries failed.
  ///
  /// In en, this message translates to:
  /// **'Unable to load activity logs'**
  String get guildSettingsAuditLogLoadErrorTitle;

  /// Label for the reason field in an expanded activity log entry.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get guildSettingsAuditLogReason;

  /// Fallback label when the actor or user is unknown.
  ///
  /// In en, this message translates to:
  /// **'someone'**
  String get guildSettingsAuditLogSomeone;

  /// Fallback label when an entity name is missing.
  ///
  /// In en, this message translates to:
  /// **'something'**
  String get guildSettingsAuditLogSomething;

  /// Fallback label for an entity that cannot be resolved.
  ///
  /// In en, this message translates to:
  /// **'unknown entity'**
  String get guildSettingsAuditLogUnknownEntity;

  /// Fallback label for an empty or missing value.
  ///
  /// In en, this message translates to:
  /// **'nothing'**
  String get guildSettingsAuditLogNothing;

  /// Fallback label for a target object that cannot be resolved.
  ///
  /// In en, this message translates to:
  /// **'Unknown target'**
  String get guildSettingsAuditLogUnknownTarget;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Community updated'**
  String get auditLogActionGuildUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Channel created'**
  String get auditLogActionChannelCreate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Channel updated'**
  String get auditLogActionChannelUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Channel deleted'**
  String get auditLogActionChannelDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Channel overwrite added'**
  String get auditLogActionChannelOverwriteCreate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Channel overwrite updated'**
  String get auditLogActionChannelOverwriteUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Channel overwrite removed'**
  String get auditLogActionChannelOverwriteDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Member kicked'**
  String get auditLogActionMemberKick;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Members pruned'**
  String get auditLogActionMemberPrune;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Member banned'**
  String get auditLogActionMemberBanAdd;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Member unbanned'**
  String get auditLogActionMemberBanRemove;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Member updated'**
  String get auditLogActionMemberUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Member roles updated'**
  String get auditLogActionMemberRoleUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Member moved'**
  String get auditLogActionMemberMove;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Member disconnected'**
  String get auditLogActionMemberDisconnect;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Bot added'**
  String get auditLogActionBotAdd;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Role created'**
  String get auditLogActionRoleCreate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Role updated'**
  String get auditLogActionRoleUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Role deleted'**
  String get auditLogActionRoleDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Invite created'**
  String get auditLogActionInviteCreate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Invite updated'**
  String get auditLogActionInviteUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Invite deleted'**
  String get auditLogActionInviteDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Webhook created'**
  String get auditLogActionWebhookCreate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Webhook updated'**
  String get auditLogActionWebhookUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Webhook deleted'**
  String get auditLogActionWebhookDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Emoji created'**
  String get auditLogActionEmojiCreate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Emoji updated'**
  String get auditLogActionEmojiUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Emoji deleted'**
  String get auditLogActionEmojiDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Sticker created'**
  String get auditLogActionStickerCreate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Sticker updated'**
  String get auditLogActionStickerUpdate;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Sticker deleted'**
  String get auditLogActionStickerDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Message deleted'**
  String get auditLogActionMessageDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Messages deleted'**
  String get auditLogActionMessageBulkDelete;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Message pinned'**
  String get auditLogActionMessagePin;

  /// Audit log action filter label.
  ///
  /// In en, this message translates to:
  /// **'Message unpinned'**
  String get auditLogActionMessageUnpin;

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the community settings.'**
  String auditLogSummaryGuildUpdate(String actor);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} created the channel {target}.'**
  String auditLogSummaryChannelCreate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the channel {target}.'**
  String auditLogSummaryChannelUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted the channel {target}.'**
  String auditLogSummaryChannelDelete(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} added channel permissions for {target}.'**
  String auditLogSummaryChannelOverwriteCreate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} added channel permissions for {target} in {channel}.'**
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated channel permissions for {target}.'**
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated channel permissions for {target} in {channel}.'**
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} removed channel permissions for {target}.'**
  String auditLogSummaryChannelOverwriteDelete(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} removed channel permissions for {target} in {channel}.'**
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} kicked {target}.'**
  String auditLogSummaryMemberKick(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} banned {target}.'**
  String auditLogSummaryMemberBanAdd(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} unbanned {target}.'**
  String auditLogSummaryMemberBanRemove(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated {target}.'**
  String auditLogSummaryMemberUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated roles for {target}.'**
  String auditLogSummaryMemberRoleUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} pruned inactive members.'**
  String auditLogSummaryMemberPrune(String actor);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} pruned members inactive for {days} days.'**
  String auditLogSummaryMemberPruneDays(String actor, int days);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} moved {target} to another voice channel.'**
  String auditLogSummaryMemberMove(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} moved {target} to {channel}.'**
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} disconnected {target} from voice.'**
  String auditLogSummaryMemberDisconnect(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} added the bot {target}.'**
  String auditLogSummaryBotAdd(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} created the role {target}.'**
  String auditLogSummaryRoleCreate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the role {target}.'**
  String auditLogSummaryRoleUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted the role {target}.'**
  String auditLogSummaryRoleDelete(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} created the invite {target}.'**
  String auditLogSummaryInviteCreate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} created the invite {target} for {channel}.'**
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the invite {target}.'**
  String auditLogSummaryInviteUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the invite {target} for {channel}.'**
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted the invite {target}.'**
  String auditLogSummaryInviteDelete(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted the invite {target} for {channel}.'**
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} created the webhook {target}.'**
  String auditLogSummaryWebhookCreate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the webhook {target}.'**
  String auditLogSummaryWebhookUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted the webhook {target}.'**
  String auditLogSummaryWebhookDelete(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} added the emoji {target}.'**
  String auditLogSummaryEmojiCreate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the emoji {target}.'**
  String auditLogSummaryEmojiUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted the emoji {target}.'**
  String auditLogSummaryEmojiDelete(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} added the sticker {target}.'**
  String auditLogSummaryStickerCreate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} updated the sticker {target}.'**
  String auditLogSummaryStickerUpdate(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted the sticker {target}.'**
  String auditLogSummaryStickerDelete(String actor, String target);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted a message.'**
  String auditLogSummaryMessageDelete(String actor);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted a message in {channel}.'**
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted multiple messages.'**
  String auditLogSummaryMessageBulkDelete(String actor);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted {count} messages.'**
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted multiple messages in {channel}.'**
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} deleted {count} messages in {channel}.'**
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  );

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} pinned a message.'**
  String auditLogSummaryMessagePin(String actor);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} pinned a message in {channel}.'**
  String auditLogSummaryMessagePinInChannel(String actor, String channel);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} unpinned a message.'**
  String auditLogSummaryMessageUnpin(String actor);

  /// Activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} unpinned a message in {channel}.'**
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel);

  /// Fallback activity log entry summary.
  ///
  /// In en, this message translates to:
  /// **'{actor} performed an audit action on {target}.'**
  String auditLogSummaryDefault(String actor, String target);

  /// Fallback change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Updated {field} from {oldValue} to {newValue}.'**
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  );

  /// Fallback change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Set {field} to {newValue}.'**
  String auditLogChangeSetTo(String field, String newValue);

  /// Fallback change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Cleared {field} (was {oldValue}).'**
  String auditLogChangeCleared(String field, String oldValue);

  /// Fallback change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Updated {field}.'**
  String auditLogChangeUpdated(String field);

  /// Guild change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Renamed the community to {name}.'**
  String auditLogChangeRenamedCommunity(String name);

  /// Guild change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Updated the community icon.'**
  String get auditLogChangeUpdatedCommunityIcon;

  /// Channel change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Renamed the channel to {name}.'**
  String auditLogChangeRenamedChannel(String name);

  /// Channel change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Cleared the topic.'**
  String get auditLogChangeClearedTopic;

  /// Channel change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Updated the topic to {topic}.'**
  String auditLogChangeUpdatedTopic(String topic);

  /// Channel change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Enabled mature content.'**
  String get auditLogChangeEnabledMatureContent;

  /// Channel change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Disabled mature content.'**
  String get auditLogChangeDisabledMatureContent;

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Set nickname to {nickname}.'**
  String auditLogChangeSetNickname(String nickname);

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Removed nickname {nickname}.'**
  String auditLogChangeRemovedNickname(String nickname);

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Muted the member.'**
  String get auditLogChangeMutedMember;

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Unmuted the member.'**
  String get auditLogChangeUnmutedMember;

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Deafened the member.'**
  String get auditLogChangeDeafenedMember;

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Undeafened the member.'**
  String get auditLogChangeUndeafenedMember;

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Added {roles}.'**
  String auditLogChangeAddedRoles(String roles);

  /// Member change detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Removed {roles}.'**
  String auditLogChangeRemovedRoles(String roles);

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Channel: {value}.'**
  String auditLogOptionChannel(String value);

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Message: {value}.'**
  String auditLogOptionMessage(String value);

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Invited by {value}.'**
  String auditLogOptionInvitedBy(String value);

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Deleted # message.} other{Deleted # messages.}}'**
  String auditLogOptionDeletedMessages(int count);

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Removed # member.} other{Removed # members.}}'**
  String auditLogOptionRemovedMembers(int count);

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'This invite never expires.'**
  String get auditLogOptionInviteNeverExpires;

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Grants temporary membership.'**
  String get auditLogOptionTemporaryMembership;

  /// Audit log option detail sentence.
  ///
  /// In en, this message translates to:
  /// **'Grants permanent membership.'**
  String get auditLogOptionPermanentMembership;

  /// Button to load more audit log entries.
  ///
  /// In en, this message translates to:
  /// **'Load more'**
  String get guildSettingsLoadMore;

  /// Loading state for pagination.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get guildSettingsLoadingMore;

  /// Description for webhooks tab.
  ///
  /// In en, this message translates to:
  /// **'View and manage every webhook configured across your community.'**
  String get guildSettingsWebhooksDescription;

  /// Empty state title for webhooks.
  ///
  /// In en, this message translates to:
  /// **'No webhooks'**
  String get guildSettingsWebhooksEmpty;

  /// Empty state description for guild webhooks.
  ///
  /// In en, this message translates to:
  /// **'This community doesn\'t have any webhooks yet. Go to {channelSettingsPath} to create one.'**
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath);

  /// Permission notice on guild webhooks tab.
  ///
  /// In en, this message translates to:
  /// **'You need the \"{permission}\" permission to view and edit webhooks for this community.'**
  String guildSettingsWebhooksPermissionRequired(String permission);

  /// Error title when guild webhooks fail to load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load webhooks'**
  String get guildSettingsWebhooksLoadFailedTitle;

  /// Error description when guild webhooks fail to load.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading the webhooks. Try again.'**
  String get guildSettingsWebhooksLoadFailedDescription;

  /// Success toast after saving guild webhook changes.
  ///
  /// In en, this message translates to:
  /// **'Webhooks updated'**
  String get guildSettingsWebhooksUpdated;

  /// Error message when saving guild webhook changes fails.
  ///
  /// In en, this message translates to:
  /// **'Failed to update webhooks'**
  String get guildSettingsWebhooksUpdateFailed;

  /// Fallback label when a webhook channel name is unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unknown channel'**
  String get guildSettingsUnknownChannel;

  /// Tooltip to copy a URL.
  ///
  /// In en, this message translates to:
  /// **'Copy URL'**
  String get guildSettingsCopyUrl;

  /// Snackbar after copying a URL.
  ///
  /// In en, this message translates to:
  /// **'URL copied to clipboard'**
  String get guildSettingsCopiedUrl;

  /// Tooltip to delete a webhook.
  ///
  /// In en, this message translates to:
  /// **'Delete webhook'**
  String get guildSettingsDeleteWebhook;

  /// Description for vanity URL tab.
  ///
  /// In en, this message translates to:
  /// **'Set a custom invite link for your server.'**
  String get guildSettingsVanityUrlDescription;

  /// Hint for vanity URL input.
  ///
  /// In en, this message translates to:
  /// **'my-server'**
  String get guildSettingsVanityUrlHint;

  /// Generic save button label.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get guildSettingsSave;

  /// Title for vanity URL usage section.
  ///
  /// In en, this message translates to:
  /// **'Usage'**
  String get guildSettingsVanityUrlUsageTitle;

  /// Vanity URL usage count.
  ///
  /// In en, this message translates to:
  /// **'{count} uses'**
  String guildSettingsVanityUrlUses(int count);

  /// Subtitle for the community Discovery settings tab.
  ///
  /// In en, this message translates to:
  /// **'List your community in Discovery so others can find and join it.'**
  String get guildSettingsDiscoveryDescription;

  /// Title for the eligibility warning when a community cannot apply for Discovery yet.
  ///
  /// In en, this message translates to:
  /// **'Not enough members'**
  String get guildSettingsDiscoveryNotEnoughMembersTitle;

  /// Discovery eligibility message.
  ///
  /// In en, this message translates to:
  /// **'Your community needs at least {count} members before it can be listed in Discovery.'**
  String guildSettingsDiscoveryNotEligible(int count);

  /// Label before the discovery application status badge.
  ///
  /// In en, this message translates to:
  /// **'Status:'**
  String get guildSettingsDiscoveryStatusLabel;

  /// Discovery application status badge when awaiting staff review.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get guildSettingsDiscoveryStatusPending;

  /// Discovery application status badge when approved and listed.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get guildSettingsDiscoveryStatusApproved;

  /// Discovery application status badge when declined by staff.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get guildSettingsDiscoveryStatusRejected;

  /// Discovery application status badge when delisted from Discovery.
  ///
  /// In en, this message translates to:
  /// **'Removed'**
  String get guildSettingsDiscoveryStatusRemoved;

  /// Review or removal reason shown on the discovery application status card.
  ///
  /// In en, this message translates to:
  /// **'Reason: {reason}'**
  String guildSettingsDiscoveryReason(String reason);

  /// Info banner when the community is approved and listed in Discovery.
  ///
  /// In en, this message translates to:
  /// **'Your community is listed in Discovery. You can update your listing details below or withdraw to remove it.'**
  String get guildSettingsDiscoveryApprovedInfo;

  /// Info banner when the discovery application is pending review.
  ///
  /// In en, this message translates to:
  /// **'Your application is pending review. You can still update your listing details or withdraw the application.'**
  String get guildSettingsDiscoveryPendingInfo;

  /// Label for discovery category dropdown.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get guildSettingsDiscoveryCategory;

  /// Help text below the discovery category field.
  ///
  /// In en, this message translates to:
  /// **'Choose the category that best describes your community. You can change this any time.'**
  String get guildSettingsDiscoveryCategoryHelp;

  /// Label for the primary language field on the discovery application form.
  ///
  /// In en, this message translates to:
  /// **'Primary language'**
  String get guildSettingsDiscoveryPrimaryLanguage;

  /// Help text below the primary language field.
  ///
  /// In en, this message translates to:
  /// **'The language most of your community speaks. Used to filter Discovery results.'**
  String get guildSettingsDiscoveryPrimaryLanguageHelp;

  /// Label for discovery description field.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get guildSettingsDiscoveryDescriptionField;

  /// Placeholder in the discovery description field.
  ///
  /// In en, this message translates to:
  /// **'Describe what your community is about'**
  String get guildSettingsDiscoveryDescriptionPlaceholder;

  /// Validation error when the discovery description is empty.
  ///
  /// In en, this message translates to:
  /// **'A description is required.'**
  String get guildSettingsDiscoveryDescriptionRequired;

  /// Validation error when the discovery description is too short.
  ///
  /// In en, this message translates to:
  /// **'Description must be at least {minLength} characters.'**
  String guildSettingsDiscoveryDescriptionMinLength(int minLength);

  /// Validation error when the discovery description is too long.
  ///
  /// In en, this message translates to:
  /// **'Description must be no more than {maxLength} characters.'**
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength);

  /// Label for discovery custom tags field.
  ///
  /// In en, this message translates to:
  /// **'Custom tags'**
  String get guildSettingsDiscoveryTags;

  /// Help text below the custom tags field.
  ///
  /// In en, this message translates to:
  /// **'Up to {maxTags} tags help people find your community. They show up in Discovery search.'**
  String guildSettingsDiscoveryTagsHelp(int maxTags);

  /// Placeholder in the custom tags input field.
  ///
  /// In en, this message translates to:
  /// **'Add a tag and press Enter'**
  String get guildSettingsDiscoveryTagsHint;

  /// Button to add a custom discovery tag.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get guildSettingsDiscoveryAddTag;

  /// Accessibility label for removing a custom discovery tag.
  ///
  /// In en, this message translates to:
  /// **'Remove tag {tag}'**
  String guildSettingsDiscoveryRemoveTag(String tag);

  /// Error modal title when a custom discovery tag cannot be added.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t add tag'**
  String get guildSettingsDiscoveryTagErrorTitle;

  /// Validation error for invalid custom discovery tags.
  ///
  /// In en, this message translates to:
  /// **'Tags must be 2 to {maxLength} characters and alphanumeric.'**
  String guildSettingsDiscoveryTagRequirements(int maxLength);

  /// Validation error when the custom tag limit is reached.
  ///
  /// In en, this message translates to:
  /// **'You can only add up to {maxTags} tags.'**
  String guildSettingsDiscoveryTagLimit(int maxTags);

  /// Button to submit a new discovery application.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get guildSettingsDiscoveryApply;

  /// Button to save changes to an existing discovery listing.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get guildSettingsDiscoverySave;

  /// Button to withdraw discovery application.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get guildSettingsDiscoveryWithdraw;

  /// Success toast after submitting a discovery application.
  ///
  /// In en, this message translates to:
  /// **'Discovery application sent'**
  String get guildSettingsDiscoveryApplicationSent;

  /// Success toast after updating a discovery listing.
  ///
  /// In en, this message translates to:
  /// **'Discovery listing updated'**
  String get guildSettingsDiscoveryListingUpdated;

  /// Success toast after withdrawing a discovery application.
  ///
  /// In en, this message translates to:
  /// **'Discovery application withdrawn'**
  String get guildSettingsDiscoveryApplicationWithdrawn;

  /// Error modal title when withdrawing a discovery application fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t withdraw application'**
  String get guildSettingsDiscoveryWithdrawErrorTitle;

  /// Error modal body when withdrawing a discovery application fails.
  ///
  /// In en, this message translates to:
  /// **'Try again in a moment.'**
  String get guildSettingsDiscoveryWithdrawErrorDescription;

  /// Description for members tab.
  ///
  /// In en, this message translates to:
  /// **'Search and manage server members.'**
  String get guildSettingsMembersDescription;

  /// Hint for member search field on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Search by username or ID'**
  String get guildSettingsMembersSearchHint;

  /// Title for member search results.
  ///
  /// In en, this message translates to:
  /// **'{count} members'**
  String guildSettingsMembersResultsTitle(int count);

  /// Title on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Recent members'**
  String get guildMembersRecentTitle;

  /// Subtitle showing pagination count on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Showing {displayedCount} of {totalCount} total members'**
  String guildMembersShowingCount(int displayedCount, int totalCount);

  /// Sort button label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get guildMembersSort;

  /// Sort option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Newest first'**
  String get guildSettingsMembersSortNewest;

  /// Sort option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Oldest first'**
  String get guildMembersSortOldest;

  /// Table column header on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get guildMembersColumnName;

  /// Table column header on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get guildMembersColumnMemberSince;

  /// Table column header for account creation date on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Joined {productName}'**
  String guildMembersColumnJoinedProduct(String productName);

  /// Table column header on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Join method'**
  String get guildMembersColumnJoinMethod;

  /// Table column header on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get guildMembersColumnRoles;

  /// Table column header on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get guildMembersColumnActions;

  /// Filter menu label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Filter by member since'**
  String get guildMembersFilterMemberSince;

  /// Filter menu label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Filter by account creation date'**
  String get guildMembersFilterJoinedProduct;

  /// Filter menu label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Filter by join method'**
  String get guildMembersFilterJoinMethod;

  /// Filter menu label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Filter by roles'**
  String get guildMembersFilterRoles;

  /// Filter option to clear filters on the community members page.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get guildMembersFilterAll;

  /// Date-range filter option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Past 1 hour'**
  String get guildMembersFilterPast1Hour;

  /// Date-range filter option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Past 24 hours'**
  String get guildMembersFilterPast24Hours;

  /// Date-range filter option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Past 7 days'**
  String get guildMembersFilterPast7Days;

  /// Date-range filter option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Past 2 weeks'**
  String get guildMembersFilterPast2Weeks;

  /// Date-range filter option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Past 3 weeks'**
  String get guildMembersFilterPast3Weeks;

  /// Date-range filter option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Past 4 weeks'**
  String get guildMembersFilterPast4Weeks;

  /// Date-range filter option on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Past 3 months'**
  String get guildMembersFilterPast3Months;

  /// Date-range filter option that opens a date picker on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Custom range...'**
  String get guildMembersFilterCustomRange;

  /// Title for the custom date range sheet on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Custom date range'**
  String get guildMembersDateRangeTitle;

  /// Label for the after-date field in the custom date range sheet.
  ///
  /// In en, this message translates to:
  /// **'After date'**
  String get guildMembersDateAfter;

  /// Label for the before-date field in the custom date range sheet.
  ///
  /// In en, this message translates to:
  /// **'Before date'**
  String get guildMembersDateBefore;

  /// Button to clear all role filters on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get guildMembersClearAll;

  /// Pagination page size label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Rows per page'**
  String get guildMembersRowsPerPage;

  /// Empty state when no members match filters on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Nobody matches that search.'**
  String get guildMembersEmptySearch;

  /// Error state on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong loading members. Try again later.'**
  String get guildMembersLoadError;

  /// Banner shown while guild members are being indexed.
  ///
  /// In en, this message translates to:
  /// **'Indexing members…'**
  String get guildMembersIndexing;

  /// Pagination jump label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Go to page'**
  String get guildMembersGoToPage;

  /// Accessibility label for a pagination page button.
  ///
  /// In en, this message translates to:
  /// **'Go to page {page}'**
  String guildMembersGoToPageItem(int page);

  /// Label for pagination jump input on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Jump to page'**
  String get guildMembersJumpToPage;

  /// Join method label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Community creator'**
  String get guildMembersJoinSourceCreator;

  /// Join method label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Invite'**
  String get guildMembersJoinSourceInvite;

  /// Join method label with invite code on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Invite ({code})'**
  String guildMembersJoinSourceInviteCode(String code);

  /// Join method label with inviter on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Invited by {name}'**
  String guildMembersJoinSourceInvitedBy(String name);

  /// Join method label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Vanity URL'**
  String get guildMembersJoinSourceVanityUrl;

  /// Join method label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Bot invite'**
  String get guildMembersJoinSourceBotInvite;

  /// Join method label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Platform admin'**
  String get guildMembersJoinSourcePlatformAdmin;

  /// Join method label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Discovery'**
  String get guildMembersJoinSourceDiscovery;

  /// Fallback join method label on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get guildMembersJoinMethodUnknown;

  /// Label for the guild owner on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Community owner'**
  String get guildMembersCommunityOwner;

  /// Tooltip for role overflow on the community members page.
  ///
  /// In en, this message translates to:
  /// **'View all roles'**
  String get guildMembersViewAllRoles;

  /// Relative join time on the community members page.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get guildMembersJoinedJustNow;

  /// Relative join time on the community members page.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {1 minute ago} other {{count} minutes ago}}'**
  String guildMembersJoinedMinutesAgo(int count);

  /// Relative join time on the community members page.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {1 hour ago} other {{count} hours ago}}'**
  String guildMembersJoinedHoursAgo(int count);

  /// Relative join time on the community members page.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {1 day ago} other {{count} days ago}}'**
  String guildMembersJoinedDaysAgo(int count);

  /// Label for the Members item at the top of the guild channel list.
  ///
  /// In en, this message translates to:
  /// **'Members'**
  String get guildMembersChannelListLabel;

  /// Accessibility label when the Members channel list item is selected.
  ///
  /// In en, this message translates to:
  /// **'Members, selected'**
  String get guildMembersChannelListSelected;

  /// Title for the invites settings tab.
  ///
  /// In en, this message translates to:
  /// **'Invites'**
  String get guildSettingsInvitesTitle;

  /// Description for invites tab.
  ///
  /// In en, this message translates to:
  /// **'View all invites for this community. To create a new invite, go to a channel and use the invite button.'**
  String get guildSettingsInvitesDescription;

  /// Empty state title for invites.
  ///
  /// In en, this message translates to:
  /// **'No invite links'**
  String get guildSettingsInvitesEmpty;

  /// Empty state description for invites.
  ///
  /// In en, this message translates to:
  /// **'This community doesn\'t have any invite links yet. Go to a channel and create an invite to invite people.'**
  String get guildSettingsInvitesEmptyDescription;

  /// Error title when invites fail to load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load invites'**
  String get guildSettingsInvitesLoadFailedTitle;

  /// Error description when invites fail to load.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading the invites. Try again.'**
  String get guildSettingsInvitesLoadFailedDescription;

  /// Retry button on invites load error.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get guildSettingsInvitesTryAgain;

  /// Toggle to show invite creation date instead of expiration.
  ///
  /// In en, this message translates to:
  /// **'Show creation date instead of expiration date'**
  String get guildSettingsInvitesShowCreatedDate;

  /// Button to pause invite links for a community.
  ///
  /// In en, this message translates to:
  /// **'Pause invites'**
  String get guildSettingsInvitesPauseInvites;

  /// Button to re-enable invite links for a community.
  ///
  /// In en, this message translates to:
  /// **'Enable invites'**
  String get guildSettingsInvitesEnableInvites;

  /// Confirmation title before pausing invites.
  ///
  /// In en, this message translates to:
  /// **'Pause invites for this community'**
  String get guildSettingsInvitesPauseForCommunityTitle;

  /// Confirmation title before enabling invites.
  ///
  /// In en, this message translates to:
  /// **'Enable invites for this community'**
  String get guildSettingsInvitesEnableForCommunityTitle;

  /// Confirmation body before pausing invites.
  ///
  /// In en, this message translates to:
  /// **'Pause invites? New users won\'t be able to join through invite links until you re-enable them. Existing members won\'t be affected.'**
  String get guildSettingsInvitesPauseConfirmDescription;

  /// Confirmation body before enabling invites.
  ///
  /// In en, this message translates to:
  /// **'Enable invites? Users will be able to join this community through invite links again.'**
  String get guildSettingsInvitesEnableConfirmDescription;

  /// Confirm button to pause invites.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get guildSettingsInvitesPause;

  /// Status message when invites are manually paused.
  ///
  /// In en, this message translates to:
  /// **'Invites are paused for this community.'**
  String get guildSettingsInvitesPausedForCommunity;

  /// Status message when invites are paused due to raid detection.
  ///
  /// In en, this message translates to:
  /// **'Invites are paused because {productName} detected a potential raid. New users can\'t join right now.'**
  String guildSettingsInvitesPausedBecauseRaid(String productName);

  /// Mobile invite row label for inviter.
  ///
  /// In en, this message translates to:
  /// **'Inviter:'**
  String get guildSettingsInvitesLabelInviter;

  /// Mobile invite row label for channel.
  ///
  /// In en, this message translates to:
  /// **'Channel:'**
  String get guildSettingsInvitesLabelChannel;

  /// Mobile invite row label for invite code.
  ///
  /// In en, this message translates to:
  /// **'Code:'**
  String get guildSettingsInvitesLabelCode;

  /// Mobile invite row label for uses count.
  ///
  /// In en, this message translates to:
  /// **'Uses:'**
  String get guildSettingsInvitesLabelUses;

  /// Mobile invite row label for created date.
  ///
  /// In en, this message translates to:
  /// **'Created:'**
  String get guildSettingsInvitesLabelCreated;

  /// Mobile invite row label for expiration date.
  ///
  /// In en, this message translates to:
  /// **'Expires:'**
  String get guildSettingsInvitesLabelExpires;

  /// Fallback when invite inviter is unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get guildSettingsInvitesUnknown;

  /// Fallback when invite channel has no parent category.
  ///
  /// In en, this message translates to:
  /// **'No category'**
  String get guildSettingsInvitesNoCategory;

  /// Label when an invite has expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get guildSettingsInvitesExpired;

  /// Label when an invite does not expire.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get guildSettingsInvitesNever;

  /// Action to copy an invite link.
  ///
  /// In en, this message translates to:
  /// **'Copy invite link'**
  String get guildSettingsInvitesCopyLink;

  /// Action to revoke an invite link.
  ///
  /// In en, this message translates to:
  /// **'Revoke invite'**
  String get guildSettingsInvitesRevoke;

  /// Error title when revoking an invite fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t revoke invite'**
  String get guildSettingsInvitesRevokeFailedTitle;

  /// Error description when revoking an invite fails.
  ///
  /// In en, this message translates to:
  /// **'The link may still work. Try again in a moment.'**
  String get guildSettingsInvitesRevokeFailedDescription;

  /// Invite usage count.
  ///
  /// In en, this message translates to:
  /// **'{uses} / {maxUses} uses'**
  String guildSettingsInviteUses(int uses, int maxUses);

  /// Invite expiration date.
  ///
  /// In en, this message translates to:
  /// **'Expires {date}'**
  String guildSettingsInviteExpires(String date);

  /// Description for bans tab.
  ///
  /// In en, this message translates to:
  /// **'View and manage banned users.'**
  String get guildSettingsBansDescription;

  /// Hint for ban search field.
  ///
  /// In en, this message translates to:
  /// **'Search bans'**
  String get guildSettingsBansSearchHint;

  /// Empty state for bans.
  ///
  /// In en, this message translates to:
  /// **'No banned users.'**
  String get guildSettingsBansEmpty;

  /// Label for permanent ban.
  ///
  /// In en, this message translates to:
  /// **'Permanent ban'**
  String get guildSettingsBanPermanent;

  /// Ban expiration date.
  ///
  /// In en, this message translates to:
  /// **'Expires {date}'**
  String guildSettingsBanExpires(String date);

  /// Label for ban expiration row.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get guildSettingsBanExpiresLabel;

  /// Button to unban a user.
  ///
  /// In en, this message translates to:
  /// **'Unban'**
  String get guildSettingsUnban;

  /// Loading state for the guild bans list.
  ///
  /// In en, this message translates to:
  /// **'Loading banned users'**
  String get guildSettingsBansLoading;

  /// Empty state when ban search has no matches.
  ///
  /// In en, this message translates to:
  /// **'No bans found matching your search.'**
  String get guildSettingsBansNoSearchResults;

  /// Title for the ban details modal.
  ///
  /// In en, this message translates to:
  /// **'Ban details'**
  String get guildSettingsBanDetailsTitle;

  /// Menu action to open ban details.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get guildSettingsBanViewDetails;

  /// Label for when a user was banned.
  ///
  /// In en, this message translates to:
  /// **'Banned on'**
  String get guildSettingsBannedOn;

  /// Label for who issued the ban.
  ///
  /// In en, this message translates to:
  /// **'Banned by'**
  String get guildSettingsBannedBy;

  /// Title for the revoke ban confirmation.
  ///
  /// In en, this message translates to:
  /// **'Revoke ban'**
  String get guildSettingsRevokeBanTitle;

  /// Confirmation message when revoking a ban.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to revoke the ban for {displayName}? They will be able to rejoin the community.'**
  String guildSettingsRevokeBanDescription(String displayName);

  /// Toast shown after successfully revoking a ban.
  ///
  /// In en, this message translates to:
  /// **'Revoked ban for {displayName}'**
  String guildSettingsRevokeBanSuccess(String displayName);

  /// Error when loading the guild bans list fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load bans. Try again.'**
  String get guildSettingsBansLoadError;

  /// Error when revoking a ban fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t revoke ban. Try again.'**
  String get guildSettingsRevokeBanError;

  /// Title for guild settings modal.
  ///
  /// In en, this message translates to:
  /// **'Community Settings'**
  String get guildSettingsCommunitySettings;

  /// Sidebar category for emoji and stickers.
  ///
  /// In en, this message translates to:
  /// **'EXPRESSIONS'**
  String get guildSettingsCategoryExpressions;

  /// Sidebar category for discovery and vanity URL.
  ///
  /// In en, this message translates to:
  /// **'COMMUNITY'**
  String get guildSettingsCategoryCommunity;

  /// Sidebar category for webhooks.
  ///
  /// In en, this message translates to:
  /// **'INTEGRATIONS'**
  String get guildSettingsCategoryIntegrations;

  /// Sidebar category for members, invites, and bans.
  ///
  /// In en, this message translates to:
  /// **'PEOPLE'**
  String get guildSettingsCategoryPeople;

  /// No description provided for @guildSettingsOverviewDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage your community\'s profile, channels, and default settings.'**
  String get guildSettingsOverviewDescription;

  /// No description provided for @guildSettingsOverviewBrandingTitle.
  ///
  /// In en, this message translates to:
  /// **'Branding'**
  String get guildSettingsOverviewBrandingTitle;

  /// Description for the branding settings section.
  ///
  /// In en, this message translates to:
  /// **'Update your icon, name, banner, and invite background'**
  String get guildSettingsOverviewBrandingDescription;

  /// No description provided for @guildSettingsOverviewBannerUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload banner'**
  String get guildSettingsOverviewBannerUpload;

  /// No description provided for @guildSettingsOverviewIdleTitle.
  ///
  /// In en, this message translates to:
  /// **'Idle settings'**
  String get guildSettingsOverviewIdleTitle;

  /// Description for the idle settings section.
  ///
  /// In en, this message translates to:
  /// **'Configure AFK channel and timeout'**
  String get guildSettingsOverviewIdleDescription;

  /// No description provided for @guildSettingsOverviewSystemTitle.
  ///
  /// In en, this message translates to:
  /// **'System & welcome'**
  String get guildSettingsOverviewSystemTitle;

  /// Description for the system and welcome settings section.
  ///
  /// In en, this message translates to:
  /// **'Choose destination for system and welcome messages'**
  String get guildSettingsOverviewSystemDescription;

  /// No description provided for @guildSettingsOverviewNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Default notifications'**
  String get guildSettingsOverviewNotificationsTitle;

  /// No description provided for @guildSettingsOverviewNotificationsLargeGuild.
  ///
  /// In en, this message translates to:
  /// **'Communities with over 250 people are forced onto the \"mentions only\" setting. Your original setting is preserved and will be restored if the community drops below 250 members.'**
  String get guildSettingsOverviewNotificationsLargeGuild;

  /// No description provided for @guildSettingsOverviewAdvancedTitle.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get guildSettingsOverviewAdvancedTitle;

  /// No description provided for @guildSettingsOverviewFlexibleNames.
  ///
  /// In en, this message translates to:
  /// **'Allow flexible text channel names'**
  String get guildSettingsOverviewFlexibleNames;

  /// No description provided for @guildSettingsOverviewHideOwnerCrown.
  ///
  /// In en, this message translates to:
  /// **'Hide community owner crown'**
  String get guildSettingsOverviewHideOwnerCrown;

  /// Toggle label for detached banner display.
  ///
  /// In en, this message translates to:
  /// **'Detached banner'**
  String get guildSettingsOverviewDetachedBanner;

  /// Description for detached banner toggle.
  ///
  /// In en, this message translates to:
  /// **'Shows the banner in its own section below the community header.'**
  String get guildSettingsOverviewDetachedBannerHint;

  /// Button to upload a guild icon.
  ///
  /// In en, this message translates to:
  /// **'Upload icon'**
  String get guildSettingsOverviewUploadIcon;

  /// Button to remove an uploaded guild image.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get guildSettingsOverviewRemoveImage;

  /// Title for invite splash upload section.
  ///
  /// In en, this message translates to:
  /// **'Invite background'**
  String get guildSettingsOverviewSplashTitle;

  /// Title for embed splash upload section.
  ///
  /// In en, this message translates to:
  /// **'Chat embed background'**
  String get guildSettingsOverviewEmbedSplashTitle;

  /// Note shown when uploading chat embed background.
  ///
  /// In en, this message translates to:
  /// **'Shown in invite embeds in chat.'**
  String get guildSettingsOverviewEmbedSplashHint;

  /// Button to upload invite or embed background image.
  ///
  /// In en, this message translates to:
  /// **'Upload background'**
  String get guildSettingsOverviewUploadBackground;

  /// Placeholder when no community banner is set.
  ///
  /// In en, this message translates to:
  /// **'No community banner'**
  String get guildSettingsOverviewNoCommunityBanner;

  /// Placeholder when no invite background is set.
  ///
  /// In en, this message translates to:
  /// **'No invite background'**
  String get guildSettingsOverviewNoInviteBackground;

  /// Label for invite preview controls.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get guildSettingsOverviewInvitePreviewTitle;

  /// Helper text for invite preview controls.
  ///
  /// In en, this message translates to:
  /// **'See how your invite looks to visitors.'**
  String get guildSettingsOverviewInvitePreviewHint;

  /// Advanced settings section for text channel naming rules.
  ///
  /// In en, this message translates to:
  /// **'Text channel names'**
  String get guildSettingsOverviewTextChannelNamesTitle;

  /// Settings section for hiding the owner crown.
  ///
  /// In en, this message translates to:
  /// **'Community owner crown'**
  String get guildSettingsOverviewOwnerCrownTitle;

  /// Description for the community owner crown settings section.
  ///
  /// In en, this message translates to:
  /// **'Configure whether the crown icon is shown next to the community owner'**
  String get guildSettingsOverviewOwnerCrownDescription;

  /// Label for invite splash card alignment selector.
  ///
  /// In en, this message translates to:
  /// **'Card alignment'**
  String get guildSettingsSplashCardAlignment;

  /// Center alignment option for invite splash card.
  ///
  /// In en, this message translates to:
  /// **'Center'**
  String get guildSettingsSplashAlignmentCenter;

  /// Left alignment option for invite splash card.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get guildSettingsSplashAlignmentLeft;

  /// Right alignment option for invite splash card.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get guildSettingsSplashAlignmentRight;

  /// Hint for splash card alignment setting.
  ///
  /// In en, this message translates to:
  /// **'Only applies on wide screens.'**
  String get guildSettingsSplashAlignmentHint;

  /// Permission name for reading earlier channel messages.
  ///
  /// In en, this message translates to:
  /// **'Read message history'**
  String get permissionReadMessageHistory;

  /// Title for message history cutoff section.
  ///
  /// In en, this message translates to:
  /// **'Change what users without \"{permission}\" can see'**
  String guildSettingsOverviewMessageHistoryTitle(String permission);

  /// Description for message history cutoff section.
  ///
  /// In en, this message translates to:
  /// **'Use a dedicated modal to set a message history threshold date for members who don\'t have the {permission} permission.'**
  String guildSettingsOverviewMessageHistoryDescription(String permission);

  /// Button to open message history threshold settings.
  ///
  /// In en, this message translates to:
  /// **'Open message history threshold'**
  String get guildSettingsOverviewMessageHistoryOpen;

  /// Title for message history threshold modal.
  ///
  /// In en, this message translates to:
  /// **'Message history threshold'**
  String get guildSettingsMessageHistoryThresholdTitle;

  /// Toggle to enable message history threshold.
  ///
  /// In en, this message translates to:
  /// **'Enable message history threshold'**
  String get guildSettingsMessageHistoryThresholdEnable;

  /// Label for threshold date picker.
  ///
  /// In en, this message translates to:
  /// **'Threshold date'**
  String get guildSettingsMessageHistoryThresholdDate;

  /// Hint for threshold date picker.
  ///
  /// In en, this message translates to:
  /// **'Members without Read Message History can view messages sent after this date.'**
  String get guildSettingsMessageHistoryThresholdDateHint;

  /// Toast after saving message history threshold.
  ///
  /// In en, this message translates to:
  /// **'Message history threshold updated'**
  String get guildSettingsMessageHistoryThresholdUpdated;

  /// Description for flexible channel names toggle.
  ///
  /// In en, this message translates to:
  /// **'Allow capital letters and spaces in text channel names. Off restricts names to lowercase with hyphens and underscores.'**
  String get guildSettingsOverviewFlexibleNamesHint;

  /// Description for hide owner crown toggle.
  ///
  /// In en, this message translates to:
  /// **'Hides the crown icon next to the community owner across all surfaces.'**
  String get guildSettingsOverviewHideOwnerCrownHint;

  /// Error when uploading animated icon without feature.
  ///
  /// In en, this message translates to:
  /// **'Animated icons require the Animated Icon community feature.'**
  String get guildSettingsAnimatedIconRequiresFeature;

  /// Error when uploading animated banner without feature.
  ///
  /// In en, this message translates to:
  /// **'Animated banners require the Animated Banner community feature.'**
  String get guildSettingsAnimatedBannerRequiresFeature;

  /// No description provided for @guildSettingsAfkChannel.
  ///
  /// In en, this message translates to:
  /// **'AFK / idle channel'**
  String get guildSettingsAfkChannel;

  /// Description for the AFK channel selector.
  ///
  /// In en, this message translates to:
  /// **'Move members to this channel when they\'re AFK.'**
  String get guildSettingsAfkChannelHint;

  /// No description provided for @guildSettingsNoAfkChannel.
  ///
  /// In en, this message translates to:
  /// **'No AFK channel'**
  String get guildSettingsNoAfkChannel;

  /// No description provided for @guildSettingsAfkTimeout.
  ///
  /// In en, this message translates to:
  /// **'AFK timeout'**
  String get guildSettingsAfkTimeout;

  /// No description provided for @guildSettingsAfkTimeout1Min.
  ///
  /// In en, this message translates to:
  /// **'1 minute'**
  String get guildSettingsAfkTimeout1Min;

  /// No description provided for @guildSettingsAfkTimeout5Min.
  ///
  /// In en, this message translates to:
  /// **'5 minutes'**
  String get guildSettingsAfkTimeout5Min;

  /// No description provided for @guildSettingsAfkTimeout15Min.
  ///
  /// In en, this message translates to:
  /// **'15 minutes'**
  String get guildSettingsAfkTimeout15Min;

  /// No description provided for @guildSettingsAfkTimeout30Min.
  ///
  /// In en, this message translates to:
  /// **'30 minutes'**
  String get guildSettingsAfkTimeout30Min;

  /// No description provided for @guildSettingsAfkTimeout1Hour.
  ///
  /// In en, this message translates to:
  /// **'1 hour'**
  String get guildSettingsAfkTimeout1Hour;

  /// AFK timeout label for a custom duration in seconds.
  ///
  /// In en, this message translates to:
  /// **'{seconds} seconds'**
  String guildSettingsAfkTimeoutSeconds(int seconds);

  /// No description provided for @guildSettingsSystemChannel.
  ///
  /// In en, this message translates to:
  /// **'Destination channel'**
  String get guildSettingsSystemChannel;

  /// Description for the system channel selector.
  ///
  /// In en, this message translates to:
  /// **'Welcome and system messages will appear here.'**
  String get guildSettingsSystemChannelHint;

  /// No description provided for @guildSettingsNoSystemChannel.
  ///
  /// In en, this message translates to:
  /// **'No system channel'**
  String get guildSettingsNoSystemChannel;

  /// No description provided for @guildSettingsHideJoinMessages.
  ///
  /// In en, this message translates to:
  /// **'Hide join messages'**
  String get guildSettingsHideJoinMessages;

  /// Description for the hide join messages toggle.
  ///
  /// In en, this message translates to:
  /// **'Suppresses join messages in the destination channel.'**
  String get guildSettingsHideJoinMessagesHint;

  /// No description provided for @guildSettingsDefaultNotifications.
  ///
  /// In en, this message translates to:
  /// **'Default notification settings'**
  String get guildSettingsDefaultNotifications;

  /// No description provided for @guildSettingsNotificationsAll.
  ///
  /// In en, this message translates to:
  /// **'All messages'**
  String get guildSettingsNotificationsAll;

  /// Subtitle for the all messages default notification option.
  ///
  /// In en, this message translates to:
  /// **'Notify on all messages'**
  String get guildSettingsNotificationsAllDescription;

  /// No description provided for @guildSettingsNotificationsMentions.
  ///
  /// In en, this message translates to:
  /// **'Mentions only'**
  String get guildSettingsNotificationsMentions;

  /// Subtitle for the mentions only default notification option.
  ///
  /// In en, this message translates to:
  /// **'Notify only on mentions'**
  String get guildSettingsNotificationsMentionsDescription;

  /// Upload requirements for invite background images.
  ///
  /// In en, this message translates to:
  /// **'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9)'**
  String get guildSettingsOverviewSplashUploadHint;

  /// Upload requirements for chat embed background images.
  ///
  /// In en, this message translates to:
  /// **'JPEG, PNG, WebP, AVIF. Max 10MB. Minimum: 960×540px (16:9). Shown in invite embeds in chat.'**
  String get guildSettingsOverviewEmbedSplashUploadHint;

  /// No description provided for @guildSettingsModerationDescription.
  ///
  /// In en, this message translates to:
  /// **'Configure verification, content filtering, and mature content settings.'**
  String get guildSettingsModerationDescription;

  /// No description provided for @guildSettingsModerationDiscoveryNotice.
  ///
  /// In en, this message translates to:
  /// **'Discovery-listed communities have restricted moderation options.'**
  String get guildSettingsModerationDiscoveryNotice;

  /// No description provided for @guildSettingsModerationContentFilterTitle.
  ///
  /// In en, this message translates to:
  /// **'Content filtering'**
  String get guildSettingsModerationContentFilterTitle;

  /// No description provided for @guildSettingsModerationContentFilterDescription.
  ///
  /// In en, this message translates to:
  /// **'Automatically screen messages for explicit content in channels not marked for mature content.'**
  String get guildSettingsModerationContentFilterDescription;

  /// No description provided for @guildSettingsModerationContentFilterDiscoveryNote.
  ///
  /// In en, this message translates to:
  /// **'Communities listed in Discovery are required to scan all members. This setting cannot be changed while Discovery is enabled.'**
  String get guildSettingsModerationContentFilterDiscoveryNote;

  /// No description provided for @guildSettingsContentFilterOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get guildSettingsContentFilterOff;

  /// No description provided for @guildSettingsContentFilterOffDescription.
  ///
  /// In en, this message translates to:
  /// **'Let the community self-moderate'**
  String get guildSettingsContentFilterOffDescription;

  /// No description provided for @guildSettingsContentFilterNoRole.
  ///
  /// In en, this message translates to:
  /// **'Filter members without roles'**
  String get guildSettingsContentFilterNoRole;

  /// No description provided for @guildSettingsContentFilterNoRoleDescription.
  ///
  /// In en, this message translates to:
  /// **'Suggested for most communities'**
  String get guildSettingsContentFilterNoRoleDescription;

  /// No description provided for @guildSettingsContentFilterAll.
  ///
  /// In en, this message translates to:
  /// **'Filter everyone'**
  String get guildSettingsContentFilterAll;

  /// No description provided for @guildSettingsContentFilterAllDescription.
  ///
  /// In en, this message translates to:
  /// **'Maximum protection for family-friendly spaces'**
  String get guildSettingsContentFilterAllDescription;

  /// No description provided for @guildSettingsModerationMatureOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get guildSettingsModerationMatureOff;

  /// No description provided for @guildSettingsModerationMatureOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get guildSettingsModerationMatureOn;

  /// Switch label for the community content warning setting.
  ///
  /// In en, this message translates to:
  /// **'Show a content warning'**
  String get guildSettingsContentWarningToggle;

  /// Subtitle for the content warning switch in moderation settings.
  ///
  /// In en, this message translates to:
  /// **'Toggles a consent prompt before entering any channel.'**
  String get guildSettingsContentWarningToggleDescription;

  /// Textarea label for custom content warning copy.
  ///
  /// In en, this message translates to:
  /// **'Custom warning text'**
  String get guildSettingsContentWarningText;

  /// Placeholder example in the custom content warning field.
  ///
  /// In en, this message translates to:
  /// **'This contains sensitive content.'**
  String get guildSettingsContentWarningTextPlaceholder;

  /// No description provided for @guildSettingsModeration2faTitle.
  ///
  /// In en, this message translates to:
  /// **'2FA requirement'**
  String get guildSettingsModeration2faTitle;

  /// No description provided for @guildSettingsModeration2faDescription.
  ///
  /// In en, this message translates to:
  /// **'Require two-factor authentication for moderators before they can ban, kick, timeout, or remove messages.'**
  String get guildSettingsModeration2faDescription;

  /// No description provided for @guildSettingsModeration2faSwitchLabel.
  ///
  /// In en, this message translates to:
  /// **'Require 2FA for moderation actions'**
  String get guildSettingsModeration2faSwitchLabel;

  /// No description provided for @guildSettingsModeration2faOwnerOnlyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Only the community owner can change this setting'**
  String get guildSettingsModeration2faOwnerOnlyTooltip;

  /// No description provided for @guildSettingsModeration2faEnableFirstTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enable 2FA on your account to change this setting'**
  String get guildSettingsModeration2faEnableFirstTooltip;

  /// No description provided for @guildSettingsEmojiSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search emojis'**
  String get guildSettingsEmojiSearchHint;

  /// No description provided for @guildSettingsEmojiUploadTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload emoji'**
  String get guildSettingsEmojiUploadTitle;

  /// No description provided for @guildSettingsEmojiSlotsTitle.
  ///
  /// In en, this message translates to:
  /// **'Emoji slots'**
  String get guildSettingsEmojiSlotsTitle;

  /// No description provided for @guildSettingsEmojiDropZone.
  ///
  /// In en, this message translates to:
  /// **'Drag and drop emoji files here'**
  String get guildSettingsEmojiDropZone;

  /// No description provided for @guildSettingsEmojiLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load emojis. Try again later.'**
  String get guildSettingsEmojiLoadFailed;

  /// No description provided for @guildSettingsEmojiSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No emojis found matching your search.'**
  String get guildSettingsEmojiSearchEmpty;

  /// No description provided for @guildSettingsEmojiNoSlots.
  ///
  /// In en, this message translates to:
  /// **'No emoji slots available'**
  String get guildSettingsEmojiNoSlots;

  /// No description provided for @guildSettingsEmojiSlotsFull.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the maximum number of emojis. Delete some existing emojis to make room.'**
  String get guildSettingsEmojiSlotsFull;

  /// No description provided for @guildSettingsEmojiUploadRequirements.
  ///
  /// In en, this message translates to:
  /// **'Emoji names need at least 2 characters and can use letters, numbers, and underscores. Emojis must be under {maxSize}. Static images are resized to 128x128 pixels and compressed automatically. Animated emojis and SVGs must already fit the limit.'**
  String guildSettingsEmojiUploadRequirements(String maxSize);

  /// No description provided for @guildSettingsEmojiUploadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Uploading emojis'**
  String get guildSettingsEmojiUploadingTitle;

  /// No description provided for @guildSettingsEmojiUploadingBody.
  ///
  /// In en, this message translates to:
  /// **'Uploading {count, plural, one {# emoji} other {# emojis}}. This may take a little while.'**
  String guildSettingsEmojiUploadingBody(int count);

  /// No description provided for @guildSettingsEmojiUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to upload emojis. Try again.'**
  String get guildSettingsEmojiUploadFailed;

  /// No description provided for @guildSettingsEmojiSomeFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Some emojis couldn\'t be added'**
  String get guildSettingsEmojiSomeFailedTitle;

  /// No description provided for @guildSettingsEmojiSomeFailedBody.
  ///
  /// In en, this message translates to:
  /// **'Review these files and try again with smaller or simpler images.'**
  String get guildSettingsEmojiSomeFailedBody;

  /// No description provided for @guildSettingsEmojiRenameTitle.
  ///
  /// In en, this message translates to:
  /// **'Rename emoji'**
  String get guildSettingsEmojiRenameTitle;

  /// No description provided for @guildSettingsEmojiRenameHint.
  ///
  /// In en, this message translates to:
  /// **'2-32 characters, letters, numbers, underscores.'**
  String get guildSettingsEmojiRenameHint;

  /// No description provided for @guildSettingsEmojiColumnEmoji.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get guildSettingsEmojiColumnEmoji;

  /// No description provided for @guildSettingsEmojiColumnName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get guildSettingsEmojiColumnName;

  /// No description provided for @guildSettingsEmojiColumnUploader.
  ///
  /// In en, this message translates to:
  /// **'Uploaded by'**
  String get guildSettingsEmojiColumnUploader;

  /// No description provided for @guildSettingsEmojiUnknownUploader.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get guildSettingsEmojiUnknownUploader;

  /// No description provided for @guildSettingsEmojiDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete emoji'**
  String get guildSettingsEmojiDeleteTitle;

  /// No description provided for @guildSettingsEmojiDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'Delete :{name}:? Can\'t be undone.'**
  String guildSettingsEmojiDeleteBody(String name);

  /// No description provided for @guildSettingsEmojiPurgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Purge this emoji from storage and CDN'**
  String get guildSettingsEmojiPurgeLabel;

  /// No description provided for @guildSettingsEmojiNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Emoji name must be at least 2 characters long'**
  String get guildSettingsEmojiNameTooShort;

  /// No description provided for @guildSettingsEmojiNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Emoji name must be at most 32 characters long'**
  String get guildSettingsEmojiNameTooLong;

  /// No description provided for @guildSettingsEmojiInvalidNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Invalid emoji name'**
  String get guildSettingsEmojiInvalidNameTitle;

  /// No description provided for @guildSettingsEmojiRenameFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t rename this emoji'**
  String get guildSettingsEmojiRenameFailedTitle;

  /// No description provided for @guildSettingsEmojiRenameFailedBody.
  ///
  /// In en, this message translates to:
  /// **'The name was reverted to what it was before. Please try again in a moment.'**
  String get guildSettingsEmojiRenameFailedBody;

  /// No description provided for @guildSettingsEmojiGoneTitle.
  ///
  /// In en, this message translates to:
  /// **'This emoji no longer exists'**
  String get guildSettingsEmojiGoneTitle;

  /// No description provided for @guildSettingsEmojiGoneBody.
  ///
  /// In en, this message translates to:
  /// **'It may have been deleted. The name was reverted to what it was before.'**
  String get guildSettingsEmojiGoneBody;

  /// No description provided for @guildSettingsEmojiNoPermissionRenameTitle.
  ///
  /// In en, this message translates to:
  /// **'You can\'t rename this emoji'**
  String get guildSettingsEmojiNoPermissionRenameTitle;

  /// No description provided for @guildSettingsEmojiNoPermissionRenameBody.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to rename this emoji. The name was reverted to what it was before.'**
  String get guildSettingsEmojiNoPermissionRenameBody;

  /// No description provided for @guildSettingsEmojiRateLimitedTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re going too fast'**
  String get guildSettingsEmojiRateLimitedTitle;

  /// No description provided for @guildSettingsEmojiRateLimitedBody.
  ///
  /// In en, this message translates to:
  /// **'Please wait a moment and try renaming again.'**
  String get guildSettingsEmojiRateLimitedBody;

  /// No description provided for @guildSettingsEmojiDeleteFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t delete this emoji'**
  String get guildSettingsEmojiDeleteFailedTitle;

  /// No description provided for @guildSettingsEmojiDeleteNoPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'You can\'t delete this emoji'**
  String get guildSettingsEmojiDeleteNoPermissionTitle;

  /// No description provided for @guildSettingsCloneEmojiTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow others to clone your emojis'**
  String get guildSettingsCloneEmojiTitle;

  /// No description provided for @guildSettingsCloneEmojiDescription.
  ///
  /// In en, this message translates to:
  /// **'When enabled, members of other communities can use the in-app one-click \"Clone\" shortcut on your custom emojis. This does not prevent them from saving the image and uploading it themselves.'**
  String get guildSettingsCloneEmojiDescription;

  /// No description provided for @guildSettingsCloneStickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow others to clone your stickers'**
  String get guildSettingsCloneStickerTitle;

  /// No description provided for @guildSettingsCloneStickerDescription.
  ///
  /// In en, this message translates to:
  /// **'When enabled, members of other communities can use the in-app one-click \"Clone\" shortcut on your custom stickers. This does not prevent them from saving the image and uploading it themselves.'**
  String get guildSettingsCloneStickerDescription;

  /// No description provided for @guildSettingsClonePermissionHint.
  ///
  /// In en, this message translates to:
  /// **'Only members with the \"{permission}\" permission can change this.'**
  String guildSettingsClonePermissionHint(String permission);

  /// No description provided for @guildSettingsCloneEmojiUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update emoji cloning'**
  String get guildSettingsCloneEmojiUpdateFailed;

  /// No description provided for @guildSettingsCloneStickerUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t update sticker cloning'**
  String get guildSettingsCloneStickerUpdateFailed;

  /// No description provided for @guildSettingsNonAnimatedEmoji.
  ///
  /// In en, this message translates to:
  /// **'Non-animated emoji ({count})'**
  String guildSettingsNonAnimatedEmoji(int count);

  /// No description provided for @guildSettingsAnimatedEmoji.
  ///
  /// In en, this message translates to:
  /// **'Animated emoji ({count})'**
  String guildSettingsAnimatedEmoji(int count);

  /// No description provided for @guildSettingsStickersSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search stickers'**
  String get guildSettingsStickersSearchHint;

  /// No description provided for @guildSettingsStickerSlotsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sticker slots'**
  String get guildSettingsStickerSlotsTitle;

  /// No description provided for @guildSettingsStickerUploadTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload sticker'**
  String get guildSettingsStickerUploadTitle;

  /// No description provided for @guildSettingsStickerDropZone.
  ///
  /// In en, this message translates to:
  /// **'Drag and drop a sticker file here (one at a time)'**
  String get guildSettingsStickerDropZone;

  /// No description provided for @guildSettingsStickerDensity.
  ///
  /// In en, this message translates to:
  /// **'Sticker density'**
  String get guildSettingsStickerDensity;

  /// No description provided for @guildSettingsStickerDensityCozy.
  ///
  /// In en, this message translates to:
  /// **'Cozy'**
  String get guildSettingsStickerDensityCozy;

  /// No description provided for @guildSettingsStickerDensityCompact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get guildSettingsStickerDensityCompact;

  /// No description provided for @guildSettingsStickersLoadFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Failed to load stickers'**
  String get guildSettingsStickersLoadFailedTitle;

  /// No description provided for @guildSettingsStickersLoadFailedBody.
  ///
  /// In en, this message translates to:
  /// **'There was an error loading the stickers. Try again.'**
  String get guildSettingsStickersLoadFailedBody;

  /// No description provided for @guildSettingsStickersSearchEmpty.
  ///
  /// In en, this message translates to:
  /// **'No stickers found matching your search.'**
  String get guildSettingsStickersSearchEmpty;

  /// No description provided for @guildSettingsStickersEmptySearch.
  ///
  /// In en, this message translates to:
  /// **'No stickers found'**
  String get guildSettingsStickersEmptySearch;

  /// No description provided for @guildSettingsStickerNoSlots.
  ///
  /// In en, this message translates to:
  /// **'No sticker slots available'**
  String get guildSettingsStickerNoSlots;

  /// No description provided for @guildSettingsStickerSlotsFull.
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached the maximum number of stickers. Delete some existing stickers to make room.'**
  String get guildSettingsStickerSlotsFull;

  /// No description provided for @guildSettingsStickerUploadRequirements.
  ///
  /// In en, this message translates to:
  /// **'Stickers are saved at 320x320 pixels and must be under {maxSize}. Static images are resized and compressed automatically. Animated stickers and SVGs must already fit the limit.'**
  String guildSettingsStickerUploadRequirements(String maxSize);

  /// No description provided for @guildSettingsStickerUnsupportedTitle.
  ///
  /// In en, this message translates to:
  /// **'Unsupported sticker file'**
  String get guildSettingsStickerUnsupportedTitle;

  /// No description provided for @guildSettingsStickerAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add sticker'**
  String get guildSettingsStickerAddTitle;

  /// No description provided for @guildSettingsStickerEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit sticker'**
  String get guildSettingsStickerEditTitle;

  /// No description provided for @guildSettingsStickerNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get guildSettingsStickerNameLabel;

  /// No description provided for @guildSettingsStickerNameHint.
  ///
  /// In en, this message translates to:
  /// **'My awesome sticker'**
  String get guildSettingsStickerNameHint;

  /// No description provided for @guildSettingsStickerDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get guildSettingsStickerDescriptionLabel;

  /// No description provided for @guildSettingsStickerDescriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Describe the sticker'**
  String get guildSettingsStickerDescriptionHint;

  /// No description provided for @guildSettingsStickerTagsLabel.
  ///
  /// In en, this message translates to:
  /// **'Tags ({count}/{limit})'**
  String guildSettingsStickerTagsLabel(int count, int limit);

  /// No description provided for @guildSettingsStickerTagHint.
  ///
  /// In en, this message translates to:
  /// **'Add a tag'**
  String get guildSettingsStickerTagHint;

  /// No description provided for @guildSettingsStickerTagAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get guildSettingsStickerTagAdd;

  /// No description provided for @guildSettingsStickerNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get guildSettingsStickerNameRequired;

  /// No description provided for @guildSettingsStickerNameTooShort.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 2 characters'**
  String get guildSettingsStickerNameTooShort;

  /// No description provided for @guildSettingsStickerNameTooLong.
  ///
  /// In en, this message translates to:
  /// **'Name must be 30 characters or less'**
  String get guildSettingsStickerNameTooLong;

  /// No description provided for @guildSettingsStickerDescriptionTooLong.
  ///
  /// In en, this message translates to:
  /// **'Description must be 500 characters or less'**
  String get guildSettingsStickerDescriptionTooLong;

  /// No description provided for @guildSettingsStickerCreateFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t create this sticker'**
  String get guildSettingsStickerCreateFailedTitle;

  /// No description provided for @guildSettingsStickerTooLargeTitle.
  ///
  /// In en, this message translates to:
  /// **'Sticker is too large'**
  String get guildSettingsStickerTooLargeTitle;

  /// No description provided for @guildSettingsStickerCompressFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Sticker couldn\'t be compressed enough'**
  String get guildSettingsStickerCompressFailedTitle;

  /// No description provided for @guildSettingsStickerDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete sticker'**
  String get guildSettingsStickerDeleteTitle;

  /// No description provided for @guildSettingsStickerDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"? Can\'t be undone.'**
  String guildSettingsStickerDeleteBody(String name);

  /// No description provided for @guildSettingsStickerPurgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Purge this sticker from storage and CDN'**
  String get guildSettingsStickerPurgeLabel;

  /// No description provided for @guildSettingsStickerDeleteFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t delete this sticker'**
  String get guildSettingsStickerDeleteFailedTitle;

  /// No description provided for @guildSettingsStickerDeleteNoPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'You can\'t delete this sticker'**
  String get guildSettingsStickerDeleteNoPermissionTitle;

  /// Info box on the guild webhooks tab.
  ///
  /// In en, this message translates to:
  /// **'To create a webhook, open {channelSettingsPath}. You can still edit and organize all existing webhooks here.'**
  String guildSettingsWebhooksInfo(String channelSettingsPath);

  /// No description provided for @guildSettingsVanityUrlWarning.
  ///
  /// In en, this message translates to:
  /// **'Your vanity URL won\'t work unless at least one channel is visible to everyone.'**
  String get guildSettingsVanityUrlWarning;

  /// No description provided for @guildSettingsVanityUrlRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get guildSettingsVanityUrlRemove;

  /// No description provided for @guildSettingsBannedUsersTitle.
  ///
  /// In en, this message translates to:
  /// **'Banned users'**
  String get guildSettingsBannedUsersTitle;

  /// No description provided for @guildSettingsInvitesTableInviter.
  ///
  /// In en, this message translates to:
  /// **'Inviter'**
  String get guildSettingsInvitesTableInviter;

  /// No description provided for @guildSettingsInvitesTableChannel.
  ///
  /// In en, this message translates to:
  /// **'Channel'**
  String get guildSettingsInvitesTableChannel;

  /// No description provided for @guildSettingsInvitesTableCode.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get guildSettingsInvitesTableCode;

  /// No description provided for @guildSettingsInvitesTableUses.
  ///
  /// In en, this message translates to:
  /// **'Uses'**
  String get guildSettingsInvitesTableUses;

  /// No description provided for @guildSettingsInvitesTableCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get guildSettingsInvitesTableCreated;

  /// No description provided for @guildSettingsInvitesTableExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get guildSettingsInvitesTableExpires;

  /// Label of the user filter dropdown in the activity log tab.
  ///
  /// In en, this message translates to:
  /// **'Filter by user'**
  String get guildSettingsAuditLogFilterUser;

  /// Label of the action-type filter dropdown in the activity log tab.
  ///
  /// In en, this message translates to:
  /// **'Filter by action'**
  String get guildSettingsAuditLogFilterAction;

  /// Button to create a direct message with selected friends.
  ///
  /// In en, this message translates to:
  /// **'Create DM'**
  String get createDm;

  /// Button to create a group direct message.
  ///
  /// In en, this message translates to:
  /// **'Create group DM'**
  String get createGroupDm;

  /// Accessibility label for the mobile compose FAB in the DM list.
  ///
  /// In en, this message translates to:
  /// **'New message'**
  String get createDmNewMessage;

  /// Title for the create DM modal or bottom sheet.
  ///
  /// In en, this message translates to:
  /// **'Select friends'**
  String get createDmSelectFriends;

  /// Subtitle in the create DM flow.
  ///
  /// In en, this message translates to:
  /// **'Choose friends to message.'**
  String get createDmChooseFriendsSubtitle;

  /// Search input placeholder in the friend selector.
  ///
  /// In en, this message translates to:
  /// **'Search friends'**
  String get createDmSearchFriends;

  /// Empty state when friend search has no matches.
  ///
  /// In en, this message translates to:
  /// **'No friends found'**
  String get createDmNoFriendsFound;

  /// Empty state when the user has no friends.
  ///
  /// In en, this message translates to:
  /// **'You have no friends yet'**
  String get createDmNoFriendsYet;

  /// Blocked state when an unclaimed account cannot start DMs.
  ///
  /// In en, this message translates to:
  /// **'Claim your account to start DMs.'**
  String get createDmClaimToStartDms;

  /// Blocked state when an unverified account cannot start DMs.
  ///
  /// In en, this message translates to:
  /// **'Verify your email to start DMs.'**
  String get createDmVerifyToStartDms;

  /// Title when email verification is required to start DMs.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get createDmVerifyYourEmail;

  /// Row title to create a group from an existing 1:1 DM.
  ///
  /// In en, this message translates to:
  /// **'New group'**
  String get createDmNewGroup;

  /// Subtitle for the new group row in channel details.
  ///
  /// In en, this message translates to:
  /// **'Create a new group with {userName}'**
  String createDmCreateGroupWithRecipient(String userName);

  /// Title for duplicate group confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'Confirm new group'**
  String get createDmConfirmNewGroup;

  /// Confirm button to create a new group despite duplicates.
  ///
  /// In en, this message translates to:
  /// **'Create new group'**
  String get createDmCreateNewGroup;

  /// Accessibility label for removing a selected friend pill.
  ///
  /// In en, this message translates to:
  /// **'Remove {displayName}'**
  String createDmRemoveFriend(String displayName);

  /// Body text in the duplicate group confirmation modal.
  ///
  /// In en, this message translates to:
  /// **'You already have a group with these users. Do you really want to create a new one? That\'s fine too!'**
  String get createDmDuplicateGroupDescription;

  /// Fallback label for duplicate group list items with no recent activity.
  ///
  /// In en, this message translates to:
  /// **'No activity yet'**
  String get createDmNoActivityYet;

  /// Title for unaddable recipients confirmation.
  ///
  /// In en, this message translates to:
  /// **'Some users can\'t be added'**
  String get createDmSomeUsersCantBeAdded;

  /// Confirm button to create group DM excluding unaddable users.
  ///
  /// In en, this message translates to:
  /// **'Create without them'**
  String get createDmCreateWithoutThem;

  /// Intro text listing users who cannot be added to a group DM.
  ///
  /// In en, this message translates to:
  /// **'The following people can\'t be added to this group DM:'**
  String get createDmUnaddableIntro;

  /// Prompt to proceed with addable recipients only.
  ///
  /// In en, this message translates to:
  /// **'Create the group DM with the remaining {count} recipient(s) and skip the others?'**
  String createDmUnaddableProceed(int count);

  /// Shown when every selected recipient is unaddable.
  ///
  /// In en, this message translates to:
  /// **'No remaining recipients to create a group DM with.'**
  String get createDmUnaddableNoneRemaining;

  /// Reason when an unaddable recipient is unknown.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get createDmUnaddableUserNotFound;

  /// Reason when an unaddable recipient is blocked or DMs are disallowed.
  ///
  /// In en, this message translates to:
  /// **'You can\'t message this user'**
  String get createDmUnaddableBlocked;

  /// Reason when a recipient is not a friend.
  ///
  /// In en, this message translates to:
  /// **'Not on your friends list'**
  String get createDmUnaddableNotFriends;

  /// Reason when a user disabled group DM additions.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t allow being added to group DMs'**
  String get createDmUnaddableGroupDisabled;

  /// Generic error when DM or group DM creation fails.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t create the conversation. Try again.'**
  String get createDmFailed;

  /// Mobile header title for the DM list.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get dmListMessagesTitle;

  /// Desktop section header for the DM conversation list.
  ///
  /// In en, this message translates to:
  /// **'Direct Messages'**
  String get dmListDirectMessagesTitle;
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
    'ar',
    'cs',
    'da',
    'de',
    'el',
    'en',
    'es',
    'fi',
    'fr',
    'hu',
    'it',
    'ja',
    'ko',
    'lt',
    'nb',
    'pl',
    'pt',
    'ru',
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
          case 'Hant':
            return FluxerLocalizationsZhHant();
        }
        break;
      }
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
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
    case 'ar':
      return FluxerLocalizationsAr();
    case 'cs':
      return FluxerLocalizationsCs();
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
    case 'fi':
      return FluxerLocalizationsFi();
    case 'fr':
      return FluxerLocalizationsFr();
    case 'hu':
      return FluxerLocalizationsHu();
    case 'it':
      return FluxerLocalizationsIt();
    case 'ja':
      return FluxerLocalizationsJa();
    case 'ko':
      return FluxerLocalizationsKo();
    case 'lt':
      return FluxerLocalizationsLt();
    case 'nb':
      return FluxerLocalizationsNb();
    case 'pl':
      return FluxerLocalizationsPl();
    case 'pt':
      return FluxerLocalizationsPt();
    case 'ru':
      return FluxerLocalizationsRu();
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
