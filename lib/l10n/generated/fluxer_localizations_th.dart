// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class FluxerLocalizationsTh extends FluxerLocalizations {
  FluxerLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get reconnectingTitle => 'เรามีปัญหา!';

  @override
  String get reconnectingBody =>
      'มีบางอย่างผิดปกติกับเซิร์ฟเวอร์\nจะแก้ไขให้เร็วๆ นี้!';

  @override
  String get gatewayReconnectingToast => 'กำลังเชื่อมต่อใหม่…';

  @override
  String get gatewayConnectedToast => 'เชื่อมต่อแล้ว';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

  @override
  String splashStartupFailed(String error) {
    return 'เริ่มทำงานไม่สำเร็จ: $error';
  }

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'การเชื่อมต่อขาดหาย';

  @override
  String get splashViewOnStatusPage => 'ดูที่หน้าสถานะ';

  @override
  String get splashConnectionIssuesPrompt => 'มีปัญหาการเชื่อมต่อใช่ไหม?';

  @override
  String get splashStatusPageLink => 'หน้าสถานะ';

  @override
  String get splashReadIncident => 'อ่านรายละเอียดเหตุการณ์';

  @override
  String get splashIncidentHistory => 'ประวัติเหตุการณ์';

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
  String get welcomeBack => 'ยินดีต้อนรับกลับ';

  @override
  String get email => 'อีเมล';

  @override
  String get emailInvalid => 'โปรดป้อนที่อยู่อีเมลที่ถูกต้อง';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get forgotPassword => 'ลืมรหัสผ่าน?';

  @override
  String get logIn => 'เข้าสู่ระบบ';

  @override
  String get logInWithPasskey => 'เข้าสู่ระบบด้วย Passkey';

  @override
  String continueWithSso(String provider) {
    return 'ดำเนินการต่อด้วย $provider';
  }

  @override
  String get ssoRequired => 'ต้องใช้ SSO เพื่อเข้าถึงอินสแตนซ์นี้';

  @override
  String get organizationSsoProvider =>
      'ลงชื่อเข้าใช้ด้วยผู้ให้บริการ Single Sign-On ขององค์กรของคุณ';

  @override
  String get failedToStartSso => 'เริ่ม SSO ไม่สำเร็จ';

  @override
  String get ssoCancelled => 'ยกเลิกการเข้าสู่ระบบ SSO แล้ว';

  @override
  String preferSso(String provider) {
    return 'ต้องการใช้ SSO ไหม? ดำเนินการต่อด้วย $provider';
  }

  @override
  String get logInViaBrowser => 'เข้าสู่ระบบผ่านเบราว์เซอร์';

  @override
  String get needAccountPrompt => 'ยังไม่มีบัญชี? ';

  @override
  String get register => 'ลงทะเบียน';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'ยืนยันว่าคุณเป็นมนุษย์';

  @override
  String get captchaDescription =>
      'เราต้องแน่ใจว่าคุณไม่ใช่บอท โปรดทำการยืนยันด้านล่าง';

  @override
  String get captchaSwitchToHcaptcha => 'มีปัญหา? ลองใช้ hCaptcha แทน';

  @override
  String get captchaSwitchToTurnstile => 'ลองใช้ Turnstile แทน';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get ipAuthCheckEmail => 'ตรวจสอบอีเมลของคุณ';

  @override
  String ipAuthDescription(String email) {
    return 'เราได้ส่งลิงก์เพื่ออนุญาตการเข้าสู่ระบบนี้ทางอีเมล โปรดเปิดกล่องจดหมายของคุณสำหรับ $email';
  }

  @override
  String get ipAuthConnectionLost => 'การเชื่อมต่อขาดหาย';

  @override
  String get ipAuthConnectionLostDescription =>
      'เราสูญเสียการเชื่อมต่อขณะรอการอนุมัติ โปรดลองอีกครั้ง';

  @override
  String get ipAuthLinkExpired => 'ลิงก์ลงชื่อเข้าใช้หมดอายุแล้ว';

  @override
  String get ipAuthLinkExpiredDescription =>
      'ลิงก์การอนุญาตนี้หมดอายุแล้ว โปรดลงชื่อเข้าใช้อีกครั้ง';

  @override
  String get ipAuthResendEmail => 'ส่งอีเมลอีกครั้ง';

  @override
  String get ipAuthResent => 'ส่งแล้ว';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$secondsวินาที';
  }

  @override
  String get back => 'ย้อนกลับ';

  @override
  String get mfaTitle => 'การยืนยันตัวตนสองปัจจัย';

  @override
  String get mfaChooseMethod => 'เลือกวิธีการยืนยัน';

  @override
  String get mfaMethodTotp => 'แอป Authenticator';

  @override
  String get mfaMethodWebauthn => 'คีย์ความปลอดภัย / Passkey';

  @override
  String get mfaTotpDescription =>
      'ป้อนรหัส 6 หลักจากแอป Authenticator ของคุณ หรือรหัสสำรองของคุณ';

  @override
  String get mfaCodeLabel => 'รหัส';

  @override
  String get mfaTryAnotherMethod => 'ลองวิธีอื่น';

  @override
  String get mfaUseSecurityKey => 'ลองใช้คีย์ความปลอดภัย / รหัสผ่านแทน';

  @override
  String get accountSelectorTitle => 'เลือกบัญชี';

  @override
  String get accountSelectorDescription =>
      'เลือกบัญชีเพื่อดำเนินการต่อ หรือเพิ่มบัญชีอื่น';

  @override
  String get accountAdd => 'เพิ่มบัญชี';

  @override
  String get accountRemove => 'ลบ';

  @override
  String accountRemoveTitle(String username) {
    return 'ลบบัญชี $username';
  }

  @override
  String get accountRemoveDescription =>
      'การดำเนินการนี้จะลบเซสชันที่บันทึกไว้สำหรับบัญชีนี้';

  @override
  String get accountRemoveOnlyDescription =>
      'การดำเนินการนี้จะลบบัญชีเดียวที่บันทึกไว้ในอุปกรณ์นี้';

  @override
  String get accountExpired => 'หมดอายุ';

  @override
  String accountSessionExpired(String identifier) {
    return 'เซสชันหมดอายุสำหรับ $identifier โปรดเข้าสู่ระบบอีกครั้ง';
  }

  @override
  String get accountManageTitle => 'จัดการบัญชี';

  @override
  String get accountSwitchFailed => 'สลับบัญชีไม่ได้ ลองอีกครั้ง';

  @override
  String get profileTabMenuSwitchAccounts => 'สลับบัญชี';

  @override
  String get statusChangeSheetTitle => 'ตั้งค่าสถานะ';

  @override
  String get statusOnlineStatusSection => 'สถานะออนไลน์';

  @override
  String get statusOnline => 'ออนไลน์';

  @override
  String get statusIdle => 'ไม่ได้ใช้งาน';

  @override
  String get statusDnd => 'ห้ามรบกวน';

  @override
  String get statusInvisible => 'ซ่อนตัว';

  @override
  String get statusOffline => 'ออฟไลน์';

  @override
  String get statusUntilIChangeIt => 'จนกว่าฉันจะเปลี่ยน';

  @override
  String get statusDontClear => 'ไม่ล้าง';

  @override
  String get statusFor10Seconds => 'เป็นเวลา 10 วินาที';

  @override
  String get statusClearAfter10Seconds => '10 วินาที';

  @override
  String get statusClearAfter15Minutes => '15 นาที';

  @override
  String get statusClearAfter30Minutes => '30 นาที';

  @override
  String get statusClearAfter1Hour => '1 ชั่วโมง';

  @override
  String get statusClearAfter3Hours => '3 ชั่วโมง';

  @override
  String get statusClearAfter4Hours => '4 ชั่วโมง';

  @override
  String get statusClearAfter8Hours => '8 ชั่วโมง';

  @override
  String get statusClearAfter24Hours => '24 ชั่วโมง';

  @override
  String get statusClearAfter3Days => '3 วัน';

  @override
  String get statusDndDescription => 'คุณจะไม่ได้รับการแจ้งเตือนบนเดสก์ท็อป';

  @override
  String get statusInvisibleDescription => 'คุณจะปรากฏเป็นออฟไลน์';

  @override
  String get customStatusSetTitle => 'ตั้งค่าสถานะที่กำหนดเอง';

  @override
  String get customStatusCurrentHint => 'สถานะที่กำหนดเอง';

  @override
  String get customStatusClear => 'ล้างสถานะที่กำหนดเอง';

  @override
  String get customStatusPlaceholder => 'เกิดอะไรขึ้น?';

  @override
  String get customStatusChooseEmoji => 'เลือกอิโมจิ';

  @override
  String get customStatusClearAfter => 'ล้างหลัง';

  @override
  String get customStatusSave => 'บันทึก';

  @override
  String get accountActive => 'บัญชีที่ใช้งานอยู่';

  @override
  String get signOut => 'ออกจากระบบ';

  @override
  String get suspendedPermanentTitle => 'บัญชีถูกระงับถาวร';

  @override
  String get suspendedTemporaryTitle => 'บัญชีถูกระงับ';

  @override
  String get suspendedPermanentDescription =>
      'บัญชีของคุณถูกระงับถาวรเนื่องจากการละเมิดข้อกำหนดในการให้บริการของเรา';

  @override
  String get suspendedTemporaryDescription =>
      'บัญชีของคุณถูกระงับชั่วคราว คุณจะสามารถเข้าถึงบัญชีของคุณได้เมื่อช่วงเวลาการระงับสิ้นสุดลง';

  @override
  String get suspendedIssuedAt => 'ออกเมื่อ';

  @override
  String get suspendedEndsAt => 'สิ้นสุด';

  @override
  String get suspendedDuration => 'ระยะเวลา';

  @override
  String get suspendedPermanent => 'ถาวร';

  @override
  String get suspendedReason => 'เหตุผล';

  @override
  String get suspendedAppealDeadline => 'กำหนดเวลายื่นอุทธรณ์';

  @override
  String suspendedDeletionWarning(String date) {
    return 'บัญชีของคุณมีกำหนดจะถูกลบในวันที่ $date';
  }

  @override
  String get suspendedRecheck => 'ตรวจสอบอีกครั้ง';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'ลองอีกครั้งใน $seconds วินาที';
  }

  @override
  String get suspendedBackToLogin => 'กลับสู่หน้าเข้าสู่ระบบ';

  @override
  String get suspendedAppealTitle => 'ยื่นอุทธรณ์';

  @override
  String get suspendedAppealHint =>
      'อธิบายว่าทำไมการระงับบัญชีของคุณควรได้รับการพิจารณาใหม่ (อย่างน้อย 50 ตัวอักษร)...';

  @override
  String get suspendedAppealSubmit => 'ส่งคำร้อง';

  @override
  String get suspendedAppealPending => 'รอการตรวจสอบ';

  @override
  String get suspendedAppealAccepted => 'คำร้องได้รับการยอมรับ';

  @override
  String get suspendedAppealRejected => 'คำร้องถูกปฏิเสธ';

  @override
  String get suspendedAppealAcceptedDescription =>
      'คำร้องของคุณได้รับการยอมรับและบัญชีของคุณได้รับการกู้คืนแล้ว';

  @override
  String get suspendedSignIn => 'เข้าสู่ระบบบัญชีของคุณ';

  @override
  String get forgotPasswordTitle => 'ลืมรหัสผ่าน?';

  @override
  String get forgotPasswordDescription =>
      'กรอกที่อยู่อีเมลของคุณ แล้วเราจะส่งลิงก์สำหรับรีเซ็ตรหัสผ่านให้คุณ';

  @override
  String get forgotPasswordSubmit => 'ส่งลิงก์รีเซ็ต';

  @override
  String get forgotPasswordSentTitle => 'ตรวจสอบอีเมลของคุณ';

  @override
  String get forgotPasswordSentDescription =>
      'เราได้ส่งคำแนะนำในการรีเซ็ตรหัสผ่านไปยังที่อยู่อีเมลของคุณแล้ว โปรดตรวจสอบกล่องจดหมายของคุณและคลิกลิงก์เพื่อรีเซ็ตรหัสผ่าน';

  @override
  String get forgotPasswordBackToLogin => 'กลับสู่หน้าเข้าสู่ระบบ';

  @override
  String get resetPasswordTitle => 'ตั้งรหัสผ่านใหม่';

  @override
  String get resetPasswordDescription =>
      'กรอกรหัสผ่านใหม่ของคุณด้านล่างเพื่อดำเนินการรีเซ็ตรหัสผ่านให้เสร็จสมบูรณ์';

  @override
  String get resetPasswordNewPassword => 'รหัสผ่านใหม่';

  @override
  String get resetPasswordConfirm => 'ยืนยันรหัสผ่านใหม่';

  @override
  String get resetPasswordSubmit => 'รีเซ็ตรหัสผ่าน';

  @override
  String get resetPasswordMismatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get registerTitle => 'สร้างบัญชี';

  @override
  String get registerDisplayName => 'ชื่อที่แสดง (ไม่บังคับ)';

  @override
  String get registerDisplayNameHint => 'ผู้คนควรเรียกคุณว่าอะไร?';

  @override
  String get registerUsername => 'ชื่อผู้ใช้ (ไม่บังคับ)';

  @override
  String get registerUsernameHint => 'เว้นว่างไว้สำหรับชื่อผู้ใช้แบบสุ่ม';

  @override
  String get registerUsernameTagHint =>
      'จะมีการเพิ่มแท็ก 4 หลักโดยอัตโนมัติเพื่อให้แน่ใจว่าไม่ซ้ำกัน';

  @override
  String get registerDateOfBirth => 'วันเกิด';

  @override
  String get registerMonth => 'เดือน';

  @override
  String get registerDay => 'วัน';

  @override
  String get registerYear => 'ปี';

  @override
  String get registerConsent =>
      'ฉันยอมรับข้อกำหนดในการให้บริการและนโยบายความเป็นส่วนตัว';

  @override
  String get registerConsentPrefix => 'ฉันยอมรับ ';

  @override
  String get registerConsentTerms => 'ข้อกำหนดในการให้บริการ';

  @override
  String get registerConsentAnd => ' และ ';

  @override
  String get registerConsentPrivacy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get registerConfirmPassword => 'ยืนยันรหัสผ่าน';

  @override
  String get registerSubmit => 'สร้างบัญชี';

  @override
  String get registerHaveAccount => 'มีบัญชีอยู่แล้ว? ';

  @override
  String get passkeyNoCredentials =>
      'ไม่พบ passkey สำหรับแอปนี้ โปรดเข้าสู่ระบบด้วยอีเมลและรหัสผ่านแทน';

  @override
  String get passkeyDeviceNotSupported => 'อุปกรณ์นี้ไม่รองรับ passkey';

  @override
  String get passkeyDomainNotAssociated =>
      'ไม่ได้กำหนดค่า passkey สำหรับแอปนี้ โปรดเข้าสู่ระบบด้วยอีเมลและรหัสผ่านแทน';

  @override
  String get passkeyTimeout =>
      'การยืนยันตัวตนด้วย passkey หมดเวลา โปรดลองอีกครั้ง';

  @override
  String get passkeyNotAvailable =>
      'ไม่สามารถใช้ passkey สำหรับแอปนี้ได้ โปรดเข้าสู่ระบบด้วยอีเมลและรหัสผ่านแทน';

  @override
  String get passkeyFailed => 'การยืนยันด้วยรหัสผ่านล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get errorUnableToCreateAccount =>
      'ไม่สามารถสร้างบัญชีได้ โปรดลองอีกครั้ง';

  @override
  String get errorUnableToSignIn =>
      'ไม่สามารถลงชื่อเข้าใช้ได้ในขณะนี้ โปรดลองอีกครั้ง';

  @override
  String get errorInvalidEmailOrPassword => 'อีเมลหรือรหัสผ่านไม่ถูกต้อง';

  @override
  String get errorUnableToSendResetLink =>
      'ไม่สามารถส่งลิงก์รีเซ็ตได้ โปรดลองอีกครั้ง';

  @override
  String get errorUnableToResetPassword =>
      'ไม่สามารถรีเซ็ตรหัสผ่านได้ โปรดลองอีกครั้ง';

  @override
  String get embedInviteJoin => 'เข้าร่วมชุมชน';

  @override
  String get embedInviteGoTo => 'ไปที่ชุมชน';

  @override
  String embedInviteOnline(String count) {
    return '$count ออนไลน์';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count สมาชิก';
  }

  @override
  String get embedInviteUnknownTitle => 'คำเชิญไม่ถูกต้อง';

  @override
  String get embedInviteUnknownSubtitle => 'ลองขอคำเชิญใหม่';

  @override
  String get embedInviteUnavailable => 'คำเชิญไม่พร้อมใช้งาน';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'คุณได้รับเชิญให้เข้าร่วม';

  @override
  String get inviteAcceptJoinButton => 'เข้าร่วมชุมชน';

  @override
  String get inviteAcceptGoToButton => 'ไปที่ชุมชน';

  @override
  String get inviteAcceptInvitesPaused => 'การเชิญถูกระงับ';

  @override
  String get inviteAcceptNotFoundTitle => 'คำเชิญไม่ถูกต้อง';

  @override
  String get inviteAcceptNotFoundDescription =>
      'คำเชิญนี้อาจหมดอายุหรือไม่ถูกต้อง';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'เข้าร่วมกลุ่ม';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'คุณได้รับเชิญให้เข้าร่วมกลุ่ม DM โดย $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'ใครบางคน';

  @override
  String get inviteAcceptEmojiPack => 'ชุดอิโมจิ';

  @override
  String get inviteAcceptStickerPack => 'ชุดสติกเกอร์';

  @override
  String get inviteAcceptInstallEmojiPack => 'ติดตั้งชุดอิโมจิ';

  @override
  String get inviteAcceptInstallStickerPack => 'ติดตั้งชุดสติกเกอร์';

  @override
  String get inviteAcceptPackInstallNote =>
      'การยอมรับคำเชิญนี้จะติดตั้งแพ็กโดยอัตโนมัติ';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'ไม่สามารถเข้าถึงช่องได้';

  @override
  String get channelAccessDeniedDescription =>
      'คุณไม่มีสิทธิ์เข้าถึงช่องที่ข้อความนี้ถูกส่งไป';

  @override
  String get messageJumpLinkNoAccess => 'ไม่มีสิทธิ์เข้าถึง';

  @override
  String get okay => 'ตกลง';

  @override
  String get embedThemeTitle => 'ธีมที่แชร์';

  @override
  String get embedThemeSubtitle => 'ไคลเอ็นต์นี้ไม่รองรับธีมที่กำหนดเอง';

  @override
  String get embedThemeUnavailableButton => 'ธีมไม่พร้อมใช้งาน';

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
  String get privacySettings => 'การตั้งค่าความเป็นส่วนตัว';

  @override
  String get privacyDirectMessages => 'ข้อความส่วนตัว';

  @override
  String get privacyDirectMessagesDescription =>
      'อนุญาตข้อความส่วนตัวจากสมาชิกคนอื่นในชุมชนนี้';

  @override
  String get privacyBotDirectMessages => 'ข้อความส่วนตัวของบอท';

  @override
  String get privacyBotDirectMessagesDescription =>
      'อนุญาตให้บอทจากชุมชนนี้ส่งข้อความส่วนตัวถึงคุณ';

  @override
  String get privacyMutualDmsDisabled =>
      'ผู้ดูแลชุมชนได้ปิดใช้งานการรับข้อความส่วนตัวจากสมาชิกที่ติดต่อกันในชุมชนนี้เท่านั้น';

  @override
  String get communityDebug => 'ดีบักชุมชน';

  @override
  String get copiedToClipboard => 'คัดลอกไปยังคลิปบอร์ดแล้ว';

  @override
  String get notificationSettings => 'การตั้งค่าการแจ้งเตือน';

  @override
  String notificationMuteGuild(String guildName) {
    return 'ปิดเสียง $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'การปิดเสียงชุมชนจะป้องกันไม่ให้ตัวบ่งชี้ที่ยังไม่ได้อ่านและการแจ้งเตือนปรากฏขึ้น เว้นแต่คุณจะถูกกล่าวถึง';

  @override
  String get notificationCommunitySettings => 'การตั้งค่าการแจ้งเตือนชุมชน';

  @override
  String get notificationAllMessages => 'ข้อความทั้งหมด';

  @override
  String get notificationOnlyMentions => 'เฉพาะการกล่าวถึง';

  @override
  String get notificationNothing => 'ไม่มี';

  @override
  String get notificationSuppressEveryone => 'ระงับ @everyone และ @here';

  @override
  String get notificationSuppressRoles => 'ปิดเสียงการกล่าวถึงบทบาททั้งหมด';

  @override
  String get notificationMobilePush => 'การแจ้งเตือนแบบพุชบนมือถือ';

  @override
  String get notificationOverrides => 'การตั้งค่าการแจ้งเตือน';

  @override
  String get notificationSelectChannel => 'เลือกช่องหรือหมวดหมู่';

  @override
  String get notificationOnlyAtMentions => 'เฉพาะการกล่าวถึงเท่านั้น';

  @override
  String get notificationMuteChannel => 'ปิดเสียงช่อง';

  @override
  String get notificationUnmuteChannel => 'เปิดเสียงช่อง';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'ไม่มีหมวดหมู่';

  @override
  String get dmMarkAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get dmMuteConversation => 'ปิดเสียง DM';

  @override
  String get dmUnmuteConversation => 'เปิดเสียง DM';

  @override
  String get dmPinDm => 'ปักหมุด DM';

  @override
  String get dmUnpinDm => 'ยกเลิกการปักหมุด DM';

  @override
  String get dmAlwaysShowInSidebar => 'แสดงในแถบด้านข้างเสมอ';

  @override
  String get dmRemoveFromAlwaysShown => 'นำออกจากรายการที่แสดงเสมอ';

  @override
  String get dmCloseDm => 'ปิด DM';

  @override
  String get dmCloseDmConfirmTitle => 'ปิด DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการปิด DM กับ $username? คุณสามารถเปิดใหม่ได้ตลอดเวลา';
  }

  @override
  String get dmCopyChannelId => 'คัดลอก ID ช่อง';

  @override
  String get dmChannelIdCopied => 'คัดลอก ID ช่องแล้ว';

  @override
  String get dmCopyUserId => 'คัดลอก ID ผู้ใช้';

  @override
  String get dmUserIdCopied => 'คัดลอก ID ผู้ใช้แล้ว';

  @override
  String get dmViewProfile => 'ดูโปรไฟล์';

  @override
  String get dmVoiceCall => 'เริ่มการโทรด้วยเสียง';

  @override
  String get incomingVoiceCallTitle => 'สายเรียกเข้า';

  @override
  String get incomingVoiceCallAccept => 'รับสาย';

  @override
  String get incomingVoiceCallDecline => 'ปฏิเสธ';

  @override
  String get incomingVoiceCallLabel => 'สายเรียกเข้า';

  @override
  String get incomingVoiceCallIgnore => 'เพิกเฉย';

  @override
  String get directVoiceCallNotEligible =>
      'ไม่สามารถเริ่มการโทรนี้ได้ในขณะนี้ โปรดลองอีกครั้งในภายหลัง';

  @override
  String get voiceJoinCallFailed =>
      'ไม่สามารถเชื่อมต่อกับสายนี้ได้ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String get voiceJoinIncomingCallFailed =>
      'ไม่สามารถเข้าร่วมสายนี้ได้ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'ไม่สามารถอัปเดตสายนี้บนเซิร์ฟเวอร์ได้ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String get dmAddNote => 'เพิ่มบันทึก';

  @override
  String get dmEditGroup => 'แก้ไขกลุ่ม';

  @override
  String get dmInviteToCommunity => 'เชิญเข้าร่วมชุมชน';

  @override
  String get dmBlock => 'บล็อก';

  @override
  String get dmLeaveGroup => 'ออกจากกลุ่ม';

  @override
  String get dmNoCommunitiesAvailable => 'ไม่มีชุมชนให้เข้าร่วม';

  @override
  String dmGroupMemberCount(int count) {
    return '$count คน';
  }

  @override
  String get dmMuteFor15Min => 'เป็นเวลา 15 นาที';

  @override
  String get dmMuteFor30Min => 'เป็นเวลา 30 นาที';

  @override
  String get dmMuteFor1Hour => 'เป็นเวลา 1 ชั่วโมง';

  @override
  String get dmMuteFor3Hours => 'เป็นเวลา 3 ชั่วโมง';

  @override
  String get dmMuteFor4Hours => 'เป็นเวลา 4 ชั่วโมง';

  @override
  String get dmMuteFor8Hours => 'เป็นเวลา 8 ชั่วโมง';

  @override
  String get dmMuteFor24Hours => 'เป็นเวลา 24 ชั่วโมง';

  @override
  String get dmMuteFor3Days => 'เป็นเวลา 3 วัน';

  @override
  String get dmMuteForever => 'จนกว่าจะเปิดอีกครั้ง';

  @override
  String get dmPinGroupDm => 'ปักหมุด DM กลุ่ม';

  @override
  String get dmUnpinGroupDm => 'ยกเลิกปักหมุด DM กลุ่ม';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'รายการโปรด DM';

  @override
  String get dmUnfavoriteDm => 'ยกเลิกรายการโปรด DM';

  @override
  String get dmFavoriteGroupDm => 'รายการโปรด DM กลุ่ม';

  @override
  String get dmUnfavoriteGroupDm => 'ยกเลิกรายการโปรด DM กลุ่ม';

  @override
  String get dmChangeFriendNickname => 'เปลี่ยนชื่อเล่นเพื่อน';

  @override
  String get dmRemoveFriend => 'ลบเพื่อน';

  @override
  String get dmAddFriend => 'เพิ่มเพื่อน';

  @override
  String get dmAcceptFriendRequest => 'ยอมรับคำขอเป็นเพื่อน';

  @override
  String get dmIgnoreFriendRequest => 'เพิกเฉยต่อคำขอเป็นเพื่อน';

  @override
  String get dmFriendRequestSent => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get dmUnblock => 'เลิกบล็อก';

  @override
  String get dmDebugUser => 'ดีบักผู้ใช้';

  @override
  String get dmDebugChannel => 'ดีบักช่อง';

  @override
  String get dmDebugCategory => 'Debug Category';

  @override
  String get dmPinned => 'DM ที่ปักหมุด';

  @override
  String get dmUnpinned => 'DM ที่ยกเลิกการปักหมุด';

  @override
  String get dmMuted => 'ปิดเสียง DM';

  @override
  String get dmUnmuted => 'เปิดเสียง DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'ลบเพื่อน';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $username ออกจากการเป็นเพื่อน?';
  }

  @override
  String get dmBlockConfirmTitle => 'บล็อกผู้ใช้';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการบล็อก $username? เขา/เธอจะไม่สามารถส่งข้อความหรือส่งคำขอเป็นเพื่อนถึงคุณได้';
  }

  @override
  String get dmFriendRequestSentToast => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get dmFriendRequestFailed => 'ส่งคำขอเป็นเพื่อนไม่สำเร็จ';

  @override
  String get dmAcceptFriendRequestFailed => 'ยอมรับคำขอเป็นเพื่อนไม่สำเร็จ';

  @override
  String get dmRemoveFriendFailed => 'ลบเพื่อนไม่สำเร็จ';

  @override
  String get dmBlockFailed => 'บล็อกผู้ใช้ไม่สำเร็จ';

  @override
  String get dmUnblockFailed => 'เลิกบล็อกผู้ใช้ไม่สำเร็จ';

  @override
  String get dmIgnoreFriendRequestFailed => 'เพิกเฉยต่อคำขอเป็นเพื่อนไม่สำเร็จ';

  @override
  String get dmAddFriends => 'เพิ่มเพื่อน';

  @override
  String get addFriendSheetTitle => 'เพิ่มเพื่อน';

  @override
  String get addFriendUsernameHint => 'ชื่อผู้ใช้#0000';

  @override
  String get addFriendUsernameLabel => 'ชื่อผู้ใช้ของเพื่อน';

  @override
  String get addFriendSendRequest => 'ส่งคำขอ';

  @override
  String get addFriendNoUserFound => 'ไม่พบผู้ใช้ที่มีชื่อผู้ใช้นั้น';

  @override
  String get addFriendInvalidUsername =>
      'ป้อนชื่อผู้ใช้ที่ถูกต้อง (ชื่อผู้ใช้#0000)';

  @override
  String get addFriendOutgoingSuccess => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get addFriendClaimTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get addFriendClaimDescription =>
      'ยืนยันบัญชีของคุณเพื่อส่งคำขอเป็นเพื่อน';

  @override
  String get addFriendVerifyTitle => 'ยืนยันอีเมลของคุณ';

  @override
  String get addFriendVerifyDescription =>
      'คุณต้องยืนยันที่อยู่อีเมลของคุณก่อนจึงจะสามารถส่งคำขอเป็นเพื่อนได้';

  @override
  String get addFriendVerifyEmail => 'ยืนยันอีเมล';

  @override
  String addFriendIncomingRequests(int count) {
    return 'คำขอเป็นเพื่อนที่เข้ามา ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'คำขอเป็นเพื่อนที่ส่งออก ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'คำขอเป็นเพื่อนที่เข้ามา';

  @override
  String get addFriendOutgoingStatus => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get addFriendViewProfile => 'ดูโปรไฟล์';

  @override
  String get addFriendAccept => 'ยอมรับ';

  @override
  String get addFriendIgnore => 'เพิกเฉย';

  @override
  String get addFriendAcceptTitle => 'ยอมรับคำขอเป็นเพื่อน';

  @override
  String get addFriendIgnoreTitle => 'ไม่สนใจคำขอเป็นเพื่อน';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'ยอมรับคำขอเป็นเพื่อนจาก $userName หรือไม่';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'ไม่สนใจคำขอเป็นเพื่อนจาก $displayName หรือไม่';
  }

  @override
  String get addFriendCancelRequest => 'ยกเลิกคำขอ';

  @override
  String get addFriendCancelRequestFailed =>
      'ไม่สามารถยกเลิกคำขอเป็นเพื่อนได้ ลองอีกครั้ง';

  @override
  String get addFriendNotAcceptingRequests =>
      'ขณะนี้พวกเขาไม่รับคำขอเป็นเพื่อน';

  @override
  String get addFriendUnblockFirst =>
      'เลิกบล็อกพวกเขาก่อนเพื่อส่งคำขอเป็นเพื่อน';

  @override
  String get addFriendCannotSendToSelf =>
      'คุณไม่สามารถส่งคำขอเป็นเพื่อนถึงตัวเองได้';

  @override
  String get addFriendAlreadyFriends => 'คุณเป็นเพื่อนกับผู้ใช้นี้อยู่แล้ว';

  @override
  String get addFriendClaimToSend => 'สมัครให้เสร็จสิ้นเพื่อส่งคำขอเป็นเพื่อน';

  @override
  String get addFriendSendFailedGeneric =>
      'ไม่สามารถส่งคำขอเป็นเพื่อนได้ ลองอีกครั้ง';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'ระบบ';

  @override
  String get emojiSearchPlaceholder => 'ค้นหาอิโมจิในฝันของคุณ';

  @override
  String get emojiSearchEmpty => 'ไม่มีอิโมจิที่ตรงกับการค้นหาของคุณ';

  @override
  String get emojiAutocompleteDefaultLabel => 'อิโมจิเริ่มต้น';

  @override
  String get emojiFrequentlyUsed => 'ใช้บ่อย';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'สื่อ';

  @override
  String get emojiTabStickers => 'สติกเกอร์';

  @override
  String get emojiTabEmojis => 'อิโมจิ';

  @override
  String get gifPickerSearch => 'ค้นหา GIF';

  @override
  String get gifPickerSearchKlipy => 'ค้นหา KLIPY';

  @override
  String get gifPickerSearchTenor => 'ค้นหา Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'รายการโปรด';

  @override
  String get gifPickerTrending => 'GIF ยอดนิยม';

  @override
  String get gifPickerNoResultsTitle => 'ไม่พบผลการค้นหา';

  @override
  String get gifPickerNoResultsDescription => 'ลองใช้คำค้นหาอื่น';

  @override
  String get gifPickerLoadFailedTitle => 'ไม่สามารถโหลด GIF ได้';

  @override
  String get gifPickerLoadFailedBody =>
      'ตรวจสอบการเชื่อมต่อของคุณแล้วลองอีกครั้ง';

  @override
  String get emojiCategoryPeople => 'ผู้คนและรอยยิ้ม';

  @override
  String get emojiCategoryNature => 'สัตว์และธรรมชาติ';

  @override
  String get emojiCategoryFood => 'อาหารและเครื่องดื่ม';

  @override
  String get emojiCategoryActivity => 'กิจกรรมและกีฬา';

  @override
  String get emojiCategoryTravel => 'การเดินทางและสถานที่';

  @override
  String get emojiCategoryObjects => 'วัตถุ';

  @override
  String get emojiCategorySymbols => 'สัญลักษณ์';

  @override
  String get emojiCategoryFlags => 'ธง';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'ปลดล็อก $emojiCount จาก $communityCount ด้วย Plutonium';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'รับ Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'ไม่ต้องแสดงอีก';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'อิโมจีแบบกำหนดเอง $count รายการ',
      one: 'อิโมจีแบบกำหนดเอง 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชุมชน',
      one: '1 ชุมชน',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'คำเตือนลิงก์ภายนอก';

  @override
  String get externalLinkWarningLeaving => 'คุณกำลังจะออกจาก Fluxer';

  @override
  String get externalLinkWarningDescription =>
      'ลิงก์ภายนอกอาจเป็นอันตราย โปรดระมัดระวัง';

  @override
  String get externalLinkWarningDestinationUrl => 'URL ปลายทาง:';

  @override
  String get externalLinksSectionTitle => 'ลิงก์ภายนอก';

  @override
  String get externalLinksSectionDescription =>
      'กำหนดค่าวิธีการจัดการคำเตือนลิงก์ภายนอก';

  @override
  String get externalLinkWarningTrustPrefix => 'เชื่อถือ ';

  @override
  String get externalLinkWarningTrustSuffix => ' — ข้ามคำเตือนนี้ในครั้งต่อไป';

  @override
  String get externalLinkVisitSite => 'เยี่ยมชมเว็บไซต์';

  @override
  String get externalLinkTrustAllLabel => 'เชื่อถือลิงก์ภายนอกทั้งหมด';

  @override
  String get externalLinkStripTrackingLabel =>
      'ลบพารามิเตอร์การติดตามออกจาก URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'ลบพารามิเตอร์การติดตาม (เช่น utm_source, fbclid, gclid) ออกจาก URL ในข้อความที่คุณส่งโดยอัตโนมัติ ลิงก์จะสะอาดก่อนที่จะถึงใครก็ตาม';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'เชื่อถือลิงก์ภายนอกทั้งหมดหรือไม่?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'การดำเนินการนี้จะเชื่อถือลิงก์ภายนอกทั้งหมดและข้ามคำเตือนสำหรับทุกโดเมน โดเมนที่เชื่อถือของคุณที่มีอยู่จะถูกแทนที่ ซึ่งมีความปลอดภัยน้อยกว่า';

  @override
  String get externalLinkTrustAllConfirmAction => 'เชื่อถือทั้งหมด';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'หยุดเชื่อถือลิงก์ทั้งหมดหรือไม่?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'คำเตือนลิงก์ภายนอกจะแสดงอีกครั้ง คุณจะต้องเพิ่มโดเมนที่เชื่อถือทีละรายการ';

  @override
  String get externalLinkStopTrustingAllAction => 'ปิดใช้งานการเชื่อถือทั้งหมด';

  @override
  String get externalLinkTrustedAllDescription =>
      'ลิงก์ภายนอกทั้งหมดได้รับความเชื่อถือ จะไม่มีการแสดงคำเตือน';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'คุณมีโดเมนที่เชื่อถือ $count รายการ เพิ่มเติมได้โดยการทำเครื่องหมายที่ช่องเมื่อเยี่ยมชมลิงก์ภายนอก';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'เมื่อเปิดใช้งาน จะไม่มีการแสดงคำเตือนลิงก์ภายนอก ซึ่งมีความปลอดภัยน้อยกว่า';

  @override
  String get imageFileTooLarge =>
      'ไฟล์รูปภาพมีขนาดใหญ่เกินไป โปรดเลือกไฟล์ที่มีขนาดเล็กกว่า 10 MB';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'อวาตาร์เคลื่อนไหวต้องใช้ Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'แบนเนอร์เคลื่อนไหวต้องใช้ Plutonium';

  @override
  String get animatedAvifNotSupported => 'ไม่รองรับ AVIF แบบเคลื่อนไหว';

  @override
  String get animatedAvifNotSupportedBody =>
      'การครอบตัดและหมุนไฟล์ AVIF แบบเคลื่อนไหวยังไม่รองรับ หากคุณดำเนินการต่อ ไฟล์จะถูกอัปโหลดในรูปแบบเดิม';

  @override
  String get uploadAsIs => 'อัปโหลดตามเดิม';

  @override
  String get croppingAnimatedNotSupported =>
      'การครอบตัดรูปภาพเคลื่อนไหวยังไม่รองรับ จะใช้ไฟล์ที่อัปโหลดต้นฉบับ';

  @override
  String get cropAvatar => 'ครอบตัดอวาตาร์';

  @override
  String get cropBanner => 'ครอบตัดแบนเนอร์';

  @override
  String get skip => 'ข้าม';

  @override
  String get crop => 'ครอบตัด';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'เปลี่ยน ชื่อผู้ใช้ ของคุณ';

  @override
  String get fluxerTagInputLabel => 'ชื่อผู้ใช้';

  @override
  String get fluxerTagDescriptionBase =>
      'ชื่อผู้ใช้สามารถมีได้เฉพาะตัวอักษร (a-z, A-Z) ตัวเลข (0-9) และขีดล่างเท่านั้น ชื่อผู้ใช้ไม่คำนึงถึงตัวพิมพ์เล็ก/ใหญ่';

  @override
  String get fluxerTagDescriptionVisionary =>
      'ชื่อผู้ใช้สามารถมีได้เฉพาะตัวอักษร (a-z, A-Z) ตัวเลข (0-9) และขีดล่างเท่านั้น ชื่อผู้ใช้ไม่คำนึงถึงตัวพิมพ์เล็ก/ใหญ่ คุณสามารถเลือกแท็ก 4 หลักที่มีอยู่ได้ตั้งแต่ #0000 ถึง #9999';

  @override
  String get fluxerTagDescriptionPremium =>
      'ชื่อผู้ใช้สามารถมีได้เฉพาะตัวอักษร (a-z, A-Z) ตัวเลข (0-9) และขีดล่างเท่านั้น ชื่อผู้ใช้ไม่คำนึงถึงตัวพิมพ์เล็ก/ใหญ่ คุณสามารถเลือกแท็ก 4 หลักที่มีอยู่ได้ตั้งแต่ #0001 ถึง #9999';

  @override
  String validationLengthRange(int min, int max) {
    return 'ระหว่าง $min ถึง $max ตัวอักษร';
  }

  @override
  String get validationAllowedChars =>
      'เฉพาะตัวอักษร (a-z, A-Z) ตัวเลข (0-9) และขีดล่าง (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'รับ Plutonium เพื่อปรับแต่งแท็กของคุณ หรือเก็บไว้เมื่อเปลี่ยนชื่อผู้ใช้';

  @override
  String get fluxerTagAlreadyTaken => 'ชื่อผู้ใช้ มีผู้ใช้แล้ว';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'ชื่อผู้ใช้ $username#$discriminator มีผู้ใช้แล้ว การดำเนินการต่อจะสุ่มเลือกตัวเลขประจำตัวของคุณใหม่โดยอัตโนมัติ';
  }

  @override
  String get customTagIsTemporary => 'แท็กที่กำหนดเองมีผลชั่วคราว';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'แท็ก 4 หลักที่กำหนดเองของคุณจะใช้งานได้เฉพาะเมื่อการสมัครสมาชิก Plutonium ของคุณยังคงใช้งานอยู่ เมื่อการสมัครสมาชิกของคุณหมดอายุในวันที่ $date แท็กของคุณจะกลับไปเป็นหมายเลขที่สุ่มเลือกหลังจากช่วงผ่อนผัน 3 วัน';
  }

  @override
  String get customTagTemporaryBody =>
      'แท็ก 4 หลักที่กำหนดเองของคุณจะใช้งานได้เฉพาะเมื่อการสมัครสมาชิก Plutonium ของคุณยังคงใช้งานอยู่ เมื่อการสมัครสมาชิกของคุณหมดอายุ แท็กของคุณจะกลับไปเป็นหมายเลขที่สุ่มเลือกหลังจากช่วงผ่อนผัน 3 วัน';

  @override
  String get iUnderstandContinue => 'ฉันเข้าใจแล้ว ดำเนินการต่อ';

  @override
  String get premiumWarningPendingDiscriminator =>
      'หากคุณบันทึก ชื่อผู้ใช้ นี้ แท็ก 4 หลักที่กำหนดเองของคุณจะกลับไปเป็นหมายเลขสุ่มเมื่อการสมัครสมาชิก Plutonium ของคุณสิ้นสุดลง หากการสมัครสมาชิกของคุณต่ออายุไม่สำเร็จ คุณจะมีช่วงผ่อนผัน 3 วันก่อนที่แท็กจะเปลี่ยนแปลง';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'แท็ก 4 หลักที่กำหนดเองของคุณ (#$discriminator) จะใช้งานได้ในขณะที่การสมัครสมาชิก Plutonium ของคุณยังคงใช้งานอยู่ หากการสมัครสมาชิกของคุณสิ้นสุดลงหรือต่ออายุไม่สำเร็จหลังจากช่วงผ่อนผัน 3 วัน แท็กของคุณจะกลับไปเป็นหมายเลขสุ่ม';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'ปรับแต่งแท็ก 4 หลักของคุณ หรือเก็บไว้เมื่อเปลี่ยนชื่อผู้ใช้';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'การทดลองใช้ Plutonium ของคุณจะหมดอายุในวันที่ $date อัปเกรดเพื่อเก็บแท็กที่กำหนดเองของคุณและรับป้ายบนโปรไฟล์ของคุณ';
  }

  @override
  String get premiumTrialActive =>
      'คุณกำลังทดลองใช้ Plutonium อัปเกรดเพื่อเก็บแท็กที่กำหนดเองของคุณและรับป้ายบนโปรไฟล์ของคุณ';

  @override
  String get fluxerTagUpdated => 'ชื่อผู้ใช้ ได้รับการอัปเดตแล้ว';

  @override
  String get fluxerTagUpdateFailed =>
      'ไม่สามารถอัปเดต ชื่อผู้ใช้ ได้ โปรดลองอีกครั้ง';

  @override
  String get continueAction => 'ดำเนินการต่อ';

  @override
  String get profileCustomizationTitle => 'การปรับแต่งโปรไฟล์';

  @override
  String get profileCustomizationDescription =>
      'แก้ไขรูปลักษณ์โปรไฟล์ของคุณและดูตัวอย่างสด';

  @override
  String get usernameLabel => 'ชื่อผู้ใช้';

  @override
  String get claimAccountToChangeFluxerTag =>
      'ยืนยันบัญชีของคุณเพื่อเปลี่ยน ชื่อผู้ใช้ ของคุณ';

  @override
  String get changeFluxerTag => 'เปลี่ยน ชื่อผู้ใช้';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'ปรับแต่งแท็ก 4 หลักของคุณ (#$discriminator) ได้ตามต้องการด้วย Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'เปลี่ยนชื่อผู้ใช้และแท็ก 4 หลักของคุณ';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'แท็กแบบกำหนดเองของคุณ (#$discriminator) เชื่อมโยงกับการสมัครสมาชิก Plutonium ของคุณ และจะกลับไปเป็นแท็กแบบสุ่มหากหมดอายุ';
  }

  @override
  String get displayNameLabel => 'ชื่อที่แสดง';

  @override
  String get pronounsLabel => 'คำสรรพนาม';

  @override
  String get avatarLabel => 'อวาตาร์';

  @override
  String get changeAvatar => 'เปลี่ยนอวาตาร์';

  @override
  String get removeAvatar => 'ลบอวาตาร์';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. สูงสุด 10MB. แนะนำ: 512×512px';

  @override
  String get bannerLabel => 'แบนเนอร์';

  @override
  String get changeBanner => 'เปลี่ยนแบนเนอร์';

  @override
  String get removeBanner => 'ลบแบนเนอร์';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. สูงสุด 10MB. ขั้นต่ำ: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'สีเน้น';

  @override
  String get accentColorDescription =>
      'ปรับแต่งสีขอบและแบนเนอร์บนโปรไฟล์ของคุณ';

  @override
  String get aboutMeLabel => 'เกี่ยวกับฉัน';

  @override
  String get aboutMeHelperText => 'คุณสามารถใช้ลิงก์, อิโมจิ และ Markdown ได้';

  @override
  String get emojiPickerTitle => 'อิโมจิ';

  @override
  String get plutoniumBadgePrivacyTitle => 'ความเป็นส่วนตัวของป้าย Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'ควบคุมวิธีแสดงป้าย Plutonium ของคุณให้ผู้อื่นเห็น';

  @override
  String get hidePlutoniumBadgeLabel => 'ซ่อนป้าย Plutonium ทั้งหมด';

  @override
  String get hidePlutoniumBadgeDescription =>
      'ซ่อนป้าย Plutonium ของคุณจากผู้ใช้อื่นอย่างสมบูรณ์';

  @override
  String get hidePlutoniumPurchaseDate => 'ซ่อนวันที่ซื้อ Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'ซ่อนวันที่ซื้อ Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'ลบวันที่คุณซื้อ Plutonium ครั้งแรกออกจากป้ายของคุณ';

  @override
  String get maskVisionaryAsSubscription => 'ซ่อน Visionary เป็นการสมัครสมาชิก';

  @override
  String get maskVisionaryDescription =>
      'แสดง Visionary ของคุณเป็นการสมัครสมาชิกปกติแทน';

  @override
  String get hideVisionaryIdBadge => 'ซ่อนป้าย ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'ซ่อนป้าย ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'ลบป้าย ID Visionary ของคุณ';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'คุณกำลังทดลองใช้ Plutonium — การสมัครสมาชิกของคุณจะเริ่มในวันที่ $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'การสมัครสมาชิกของคุณจะเริ่มโดยอัตโนมัติเมื่อการทดลองใช้ของคุณสิ้นสุดลง ไม่ต้องดำเนินการใดๆ';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'คุณกำลังทดลองใช้ Plutonium ซึ่งจะหมดอายุในวันที่ $date';
  }

  @override
  String get premiumTrialActiveProfile => 'คุณกำลังทดลองใช้ Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. สูงสุด 10MB. แนะนำ: 512×512px. อวาตาร์เคลื่อนไหว (GIF) ต้องใช้ Plutonium';

  @override
  String get bannerPlutoniumUpsell =>
      'ปรับแต่งโปรไฟล์ของคุณด้วยรูปภาพแบนเนอร์แบบคงที่หรือเคลื่อนไหวเพื่อให้โดดเด่น';

  @override
  String get getPlutonium => 'รับ Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'ยังไม่สามารถซื้อภายในแอปได้บนแพลตฟอร์มนี้ โปรดติดตาม — เร็วๆ นี้!';

  @override
  String get profilePreviewLabel => 'แสดงตัวอย่าง';

  @override
  String get profilePreviewMessage => 'ข้อความ';

  @override
  String get profilePreviewMemberSince => 'สมาชิก Fluxer ตั้งแต่';

  @override
  String get unclaimedAccountTitle => 'บัญชีที่ยังไม่ถูกอ้างสิทธิ์';

  @override
  String get unclaimedAccountDescription =>
      'บัญชีของคุณยังไม่ถูกอ้างสิทธิ์ หากไม่มีอีเมลและรหัสผ่าน คุณอาจสูญเสียการเข้าถึง อ้างสิทธิ์บัญชีของคุณตอนนี้เพื่อรักษาความปลอดภัย';

  @override
  String get claimAccount => 'อ้างสิทธิ์บัญชี';

  @override
  String get profileTypeLabel => 'ประเภทโปรไฟล์';

  @override
  String get profileTypeGlobal => 'โปรไฟล์ทั่วโลก';

  @override
  String get profileTypeGuildDescription =>
      'คุณกำลังแก้ไขโปรไฟล์ต่อชุมชน โปรไฟล์นี้จะมองเห็นได้เฉพาะในชุมชนนี้และจะแทนที่โปรไฟล์ทั่วโลกของคุณ';

  @override
  String get communityNicknameLabel => 'ชื่อเล่นในชุมชน';

  @override
  String get perGuildPremiumUpsellText =>
      'การปรับแต่งอวาตาร์, แบนเนอร์, สีเน้น และประวัติส่วนตัวสำหรับแต่ละชุมชนต้องใช้ Plutonium ชื่อเล่นและคำสรรพนามในชุมชนนั้นฟรีสำหรับทุกคน';

  @override
  String get avatarModeInherit => 'ใช้โปรไฟล์ส่วนกลาง';

  @override
  String get avatarModeCustom => 'ใช้รูปภาพที่กำหนดเอง';

  @override
  String get avatarModeUnset => 'ไม่แสดง';

  @override
  String get profileSavedToast => 'อัปเดตโปรไฟล์แล้ว';

  @override
  String get profileEditButton => 'แก้ไขโปรไฟล์';

  @override
  String get profileNoteLabel => 'หมายเหตุ';

  @override
  String get profileNoteVisibility => '(เฉพาะคุณที่มองเห็น)';

  @override
  String get profileNoteEmpty => 'ยังไม่มีหมายเหตุ';

  @override
  String get sudoTitle => 'ยืนยันตัวตนของคุณ';

  @override
  String get sudoDescription =>
      'การดำเนินการนี้ต้องมีการยืนยันเพื่อดำเนินการต่อ';

  @override
  String get sudoAuthenticatorCode => 'รหัส Authenticator';

  @override
  String get sudoMethodPassword => 'รหัสผ่าน';

  @override
  String get sudoMethodTotp => 'Authenticator';

  @override
  String get sudoVerificationFailed => 'การยืนยันล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get securityAccountTitle => 'บัญชี';

  @override
  String get securityAccountDescription =>
      'จัดการอีเมล, รหัสผ่าน และการตั้งค่าบัญชีของคุณ';

  @override
  String get securitySectionTitle => 'ความปลอดภัย';

  @override
  String get securitySectionDescription =>
      'ปกป้องบัญชีของคุณด้วยการยืนยันตัวตนสองชั้นและรหัสผ่าน';

  @override
  String get securityLoginEmailSectionTitle => 'การตั้งค่าอีเมล';

  @override
  String get securityLoginEmailSectionDescription =>
      'จัดการที่อยู่อีเมลที่คุณใช้ลงชื่อเข้าใช้ Fluxer';

  @override
  String get securityLoginEmailAddressLabel => 'ที่อยู่อีเมล';

  @override
  String get securityLoginNoEmailSet => 'ยังไม่ได้ตั้งค่าที่อยู่อีเมล';

  @override
  String get securityLoginChangeEmail => 'เปลี่ยนอีเมล';

  @override
  String get securityLoginAddEmail => 'เพิ่มอีเมล';

  @override
  String get securityLoginReveal => 'แสดง';

  @override
  String get securityLoginHide => 'ซ่อน';

  @override
  String get securityLoginPasswordSectionTitle => 'รหัสผ่าน';

  @override
  String get securityLoginPasswordSectionDescription =>
      'เปลี่ยนรหัสผ่านของคุณเพื่อรักษาความปลอดภัยบัญชีของคุณ';

  @override
  String get securityLoginCurrentPasswordLabel => 'รหัสผ่านปัจจุบัน';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'เปลี่ยนล่าสุด: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'เปลี่ยนล่าสุด: ไม่เคย';

  @override
  String get securityLoginNoPasswordSet => 'ยังไม่ได้ตั้งค่ารหัสผ่าน';

  @override
  String get securityLoginChangePassword => 'เปลี่ยนรหัสผ่าน';

  @override
  String get securityLoginSetPassword => 'ตั้งรหัสผ่าน';

  @override
  String get passwordChangeTitle => 'เปลี่ยนรหัสผ่าน';

  @override
  String get passwordChangeIntroDescription =>
      'เราจะส่งรหัสยืนยันไปยังที่อยู่อีเมลของคุณเพื่อยืนยันตัวตนของคุณก่อนที่จะเปลี่ยนรหัสผ่าน';

  @override
  String get passwordChangeStart => 'เริ่ม';

  @override
  String get passwordChangeVerifyTitle => 'ยืนยันอีเมลของคุณ';

  @override
  String get passwordChangeVerifyDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังที่อยู่อีเมลของคุณ';

  @override
  String get passwordChangeVerificationCode => 'รหัสยืนยัน';

  @override
  String get passwordChangeVerify => 'ยืนยัน';

  @override
  String get passwordChangeNewPasswordTitle => 'ตั้งรหัสผ่านใหม่';

  @override
  String get passwordChangeNewPasswordDescription =>
      'ป้อนรหัสผ่านใหม่ของคุณด้านล่าง';

  @override
  String get passwordChangeNewPassword => 'รหัสผ่านใหม่';

  @override
  String get passwordChangeConfirmPassword => 'ยืนยันรหัสผ่านใหม่';

  @override
  String get passwordChangeSubmit => 'เปลี่ยนรหัสผ่าน';

  @override
  String get passwordChangeSuccess => 'เปลี่ยนรหัสผ่านแล้ว';

  @override
  String get passwordChangePasswordsDoNotMatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get passwordChangeInvalidCode => 'รหัสไม่ถูกต้องหรือไม่หมดอายุ';

  @override
  String get emailChangeTitle => 'เปลี่ยนอีเมล';

  @override
  String get emailChangeIntroDescription =>
      'เราจะส่งรหัสยืนยันเพื่อยืนยันตัวตนของคุณก่อนที่จะเปลี่ยนที่อยู่อีเมล';

  @override
  String get emailChangeStart => 'เริ่ม';

  @override
  String get emailChangeVerifyOriginalTitle => 'ยืนยันอีเมลปัจจุบัน';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังอีเมลปัจจุบันของคุณ';

  @override
  String get emailChangeNewEmailTitle => 'ป้อนอีเมลใหม่';

  @override
  String get emailChangeNewEmailDescription =>
      'ป้อนที่อยู่อีเมลใหม่ที่คุณต้องการใช้';

  @override
  String get emailChangeNewEmailLabel => 'อีเมลใหม่';

  @override
  String get emailChangeNewEmailSubmit => 'ส่งรหัสยืนยัน';

  @override
  String get emailChangeVerifyNewTitle => 'ยืนยันอีเมลใหม่';

  @override
  String get emailChangeVerifyNewDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังที่อยู่อีเมลใหม่ของคุณ';

  @override
  String get emailChangeSuccess => 'เปลี่ยนอีเมลสำเร็จแล้ว';

  @override
  String get emailChangeInvalidCode => 'รหัสไม่ถูกต้องหรือไม่หมดอายุ';

  @override
  String get resend => 'ส่งอีกครั้ง';

  @override
  String resendCountdown(int seconds) {
    return 'ส่งอีกครั้ง ($seconds วินาที)';
  }

  @override
  String get verificationCode => 'รหัสยืนยัน';

  @override
  String get verify => 'ยืนยัน';

  @override
  String get enable => 'เปิดใช้งาน';

  @override
  String get disable => 'ปิดใช้งาน';

  @override
  String get delete => 'ลบ';

  @override
  String get save => 'บันทึก';

  @override
  String get securityTfaSectionTitle => 'การยืนยันตัวตนสองชั้น';

  @override
  String get securityTfaSectionDescription =>
      'เพิ่มชั้นความปลอดภัยพิเศษให้กับบัญชีของคุณ';

  @override
  String get securityTfaAuthenticatorApp => 'แอปยืนยันตัวตน';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'เปิดใช้งานการยืนยันตัวตนสองชั้นแล้ว';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'ใช้แอปยืนยันตัวตนเพื่อสร้างรหัสสำหรับการยืนยันตัวตนสองชั้น';

  @override
  String get securityTfaBackupCodes => 'รหัสสำรอง';

  @override
  String get securityTfaBackupCodesDescription =>
      'ดูและจัดการรหัสสำรองของคุณเพื่อกู้คืนบัญชี';

  @override
  String get securityTfaViewCodes => 'ดูรหัส';

  @override
  String get securityPasskeysSectionTitle => 'Passkeys';

  @override
  String get securityPasskeysSectionDescription =>
      'ใช้ Passkeys เพื่อเข้าสู่ระบบโดยไม่ต้องใช้รหัสผ่านและการยืนยันตัวตนสองชั้น';

  @override
  String get securityPasskeysRegistered => 'Passkeys ที่ลงทะเบียนแล้ว';

  @override
  String get securityPasskeysNone => 'ยังไม่ได้ลงทะเบียน Passkeys';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return 'ลงทะเบียน $count $_temp0 แล้ว (สูงสุด 10 รายการ)';
  }

  @override
  String get securityPasskeysAdd => 'เพิ่ม Passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'เพิ่มเมื่อ: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'ใช้ครั้งล่าสุด: $date';
  }

  @override
  String get securityPasskeysRename => 'เปลี่ยนชื่อ';

  @override
  String get securityPasskeysDeleteTitle => 'ลบ Passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ Passkey \"$name\"';
  }

  @override
  String get securityPasskeyNameTitle => 'ตั้งชื่อ Passkey';

  @override
  String get securityPasskeyNameLabel => 'ชื่อ Passkey';

  @override
  String get securityPasskeyNameHint =>
      'เช่น YubiKey, iPhone, คอมพิวเตอร์ที่ทำงาน';

  @override
  String get securityPhoneSectionTitle => 'หมายเลขโทรศัพท์';

  @override
  String get securityPhoneSectionDescription => 'จัดการหมายเลขโทรศัพท์ของคุณ';

  @override
  String get securityPhoneLabel => 'หมายเลขโทรศัพท์';

  @override
  String get securityPhoneNone => 'ยังไม่ได้เพิ่มหมายเลขโทรศัพท์';

  @override
  String get securityPhoneAdd => 'เพิ่มโทรศัพท์';

  @override
  String get securityPhoneRemove => 'ลบ';

  @override
  String get securityPhoneRemoveTitle => 'ลบหมายเลขโทรศัพท์';

  @override
  String get securityPhoneRemoveDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบหมายเลขโทรศัพท์ของคุณ?';

  @override
  String get securityPhoneRemoved => 'ลบหมายเลขโทรศัพท์แล้ว';

  @override
  String get securityClaimTitle => 'คุณสมบัติความปลอดภัย';

  @override
  String get securityClaimDescription =>
      'ยืนยันบัญชีของคุณเพื่อเข้าถึงคุณสมบัติด้านความปลอดภัย เช่น การยืนยันตัวตนสองชั้นและรหัสผ่าน';

  @override
  String get securityVerifyEmailRequired =>
      'คุณต้องยืนยันที่อยู่อีเมลของคุณก่อนจึงจะสามารถตั้งค่าการยืนยันตัวตนสองชั้น รหัสผ่าน หรือการยืนยันทาง SMS ได้';

  @override
  String get totpEnableTitle => 'ตั้งค่าแอปยืนยันตัวตน';

  @override
  String get totpEnableDescription =>
      'สแกนรหัส QR ด้วยแอปยืนยันตัวตนของคุณเพื่อสร้างรหัสสำหรับการยืนยันตัวตนสองชั้น';

  @override
  String get totpEnableCodeLabel => 'รหัส';

  @override
  String get totpEnableCodeHint => 'ป้อนรหัส 6 หลักจากแอปยืนยันตัวตนของคุณ';

  @override
  String get totpEnableSuccess => 'เปิดใช้งานการยืนยันตัวตนสองชั้นแล้ว';

  @override
  String get totpDisableTitle => 'ลบแอปยืนยันตัวตน';

  @override
  String get totpDisableDescription =>
      'ป้อนรหัส 6 หลักจากแอปยืนยันตัวตนของคุณเพื่อปิดใช้งานการยืนยันตัวตนสองชั้น';

  @override
  String get totpDisableSuccess => 'ปิดใช้งานการยืนยันตัวตนสองชั้นแล้ว';

  @override
  String get backupCodesTitle => 'รหัสสำรอง';

  @override
  String get backupCodesWarning =>
      'หากคุณสูญเสียการเข้าถึงแอปยืนยันตัวตนและไม่มีรหัสเหล่านี้ คุณจะถูกล็อกออกจากบัญชีของคุณอย่างถาวร ดาวน์โหลดหรือคัดลอกตอนนี้และเก็บไว้ในที่ปลอดภัย';

  @override
  String get backupCodesDownload => 'ดาวน์โหลด';

  @override
  String get backupCodesCopy => 'คัดลอก';

  @override
  String get backupCodesCopied => 'คัดลอกรหัสสำรองไปยังคลิปบอร์ดแล้ว';

  @override
  String get backupCodesAcknowledge =>
      'ฉันได้ดาวน์โหลดหรือคัดลอกรหัสสำรองของฉันและเก็บไว้ในที่ปลอดภัยแล้ว';

  @override
  String get backupCodesDone => 'เสร็จสิ้น';

  @override
  String get backupCodesViewTitle => 'ดูรหัสสำรอง';

  @override
  String get backupCodesViewDescription =>
      'อาจต้องมีการยืนยันก่อนดูรหัสสำรองของคุณ';

  @override
  String get phoneAddTitle => 'เพิ่มหมายเลขโทรศัพท์';

  @override
  String get phoneAddLabel => 'หมายเลขโทรศัพท์';

  @override
  String get phoneAddHint => 'ป้อนหมายเลขโทรศัพท์ของคุณ';

  @override
  String get phoneAddFooter =>
      'ป้อนหมายเลขโทรศัพท์ของคุณ เราจะส่งรหัสยืนยันทาง SMS ไปให้คุณ';

  @override
  String get phoneAddSendCode => 'ส่งรหัส';

  @override
  String get phoneVerifyTitle => 'ยืนยันหมายเลขโทรศัพท์';

  @override
  String get phoneVerifyDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังหมายเลขโทรศัพท์ของคุณ';

  @override
  String get phoneAddSuccess => 'เพิ่มหมายเลขโทรศัพท์แล้ว';

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
  String get dangerZoneSectionTitle => 'โซนอันตราย';

  @override
  String get dangerZoneSectionDescription =>
      'การดำเนินการที่แก้ไขไม่ได้และทำลายล้าง';

  @override
  String get dangerZoneDisableTitle => 'ปิดใช้งานบัญชี';

  @override
  String get dangerZoneDisableDescription =>
      'ปิดใช้งานบัญชีของคุณชั่วคราว คุณสามารถเปิดใช้งานใหม่ได้ในภายหลังโดยการลงชื่อเข้าใช้อีกครั้ง';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'การปิดใช้งานบัญชีของคุณจะทำให้คุณออกจากระบบทุกเซสชัน คุณสามารถเปิดใช้งานบัญชีของคุณใหม่ได้ตลอดเวลาโดยการลงชื่อเข้าใช้อีกครั้ง';

  @override
  String get dangerZoneDeleteTitle => 'ลบบัญชี';

  @override
  String get dangerZoneDeleteDescription =>
      'ลบบัญชีของคุณและข้อมูลที่เกี่ยวข้องทั้งหมดอย่างถาวร การดำเนินการนี้ไม่สามารถย้อนกลับได้';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'ยกเลิกการสมัครใช้งาน Plutonium ที่ใช้งานอยู่ของคุณในการตั้งค่า Plutonium ก่อนที่จะลบบัญชีของคุณ';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'ไม่สามารถลบบัญชีได้';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'คุณไม่สามารถลบบัญชีของคุณได้ในขณะที่คุณเป็นเจ้าของชุมชน โปรดโอนความเป็นเจ้าของชุมชนต่อไปนี้ก่อน:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'และอีก $count รายการ';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'หากต้องการโอนความเป็นเจ้าของ ให้ไปที่ $settingsPath และใช้ตัวเลือกโอนความเป็นเจ้าของ';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบบัญชีของคุณ? การดำเนินการนี้จะกำหนดเวลาบัญชีของคุณเพื่อการลบอย่างถาวร';

  @override
  String get dangerZoneDeleteBullet1 =>
      'คุณสามารถยกเลิกกระบวนการลบได้ภายใน 14 วัน';

  @override
  String get dangerZoneDeleteBullet2 =>
      'หลังจาก 14 วัน บัญชีของคุณจะถูกลบอย่างถาวร';

  @override
  String get dangerZoneDeleteBullet3 =>
      'เมื่อดำเนินการลบแล้ว คุณจะไม่สามารถกู้คืนการเข้าถึงบัญชีของคุณได้';

  @override
  String get dangerZoneDeleteBullet4 =>
      'คุณจะไม่สามารถลบข้อความที่คุณส่งได้หลังจากลบบัญชีของคุณ';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'หากคุณต้องการส่งออกข้อมูลของคุณหรือลบข้อความของคุณก่อน โปรดไปที่ส่วนแดชบอร์ดความเป็นส่วนตัวในการตั้งค่าผู้ใช้ก่อนดำเนินการต่อ';

  @override
  String get claimAccountTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get claimAccountDescription =>
      'ยืนยันบัญชีของคุณโดยการเพิ่มอีเมลและรหัสผ่าน เราจะส่งรหัสยืนยันเพื่อยืนยันอีเมลของคุณก่อนที่จะเสร็จสิ้น';

  @override
  String get claimAccountEmailLabel => 'อีเมล';

  @override
  String get claimAccountPasswordLabel => 'รหัสผ่าน';

  @override
  String get claimAccountSendCode => 'ส่งรหัส';

  @override
  String get claimAccountVerifyDescription =>
      'ป้อนรหัสที่เราส่งไปยังอีเมลของคุณเพื่อยืนยัน รหัสผ่านของคุณจะถูกตั้งค่าเมื่อยืนยันรหัสแล้ว';

  @override
  String get claimAccountSuccess => 'ยืนยันบัญชีสำเร็จแล้ว';

  @override
  String get importantInformation => 'ข้อมูลสำคัญ:';

  @override
  String get genericError => 'เกิดข้อผิดพลาดขึ้น';

  @override
  String get invalidCode => 'รหัสไม่ถูกต้อง';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ปีที่แล้ว',
      one: '1 ปีที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count เดือนที่แล้ว',
      one: '1 เดือนที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วันที่แล้ว',
      one: '1 วันที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชั่วโมงที่แล้ว',
      one: '1 ชั่วโมงที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count นาทีที่แล้ว',
      one: '1 นาทีที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'เมื่อสักครู่';

  @override
  String get authorizedAppsTitle => 'แอปพลิเคชันที่ได้รับอนุญาต';

  @override
  String get authorizedAppsDescription =>
      'แอปพลิเคชันเหล่านี้ได้รับอนุญาตให้เข้าถึงบัญชี Fluxer ของคุณ';

  @override
  String get authorizedAppsEmptyTitle => 'ไม่มีแอปพลิเคชันที่ได้รับอนุญาต';

  @override
  String get authorizedAppsEmptyDescription =>
      'คุณยังไม่ได้อนุญาตแอปพลิเคชันใดๆ ให้เข้าถึงบัญชีของคุณ';

  @override
  String get authorizedAppsLoadError =>
      'ไม่สามารถโหลดแอปพลิเคชันที่ได้รับอนุญาตได้';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'ได้รับอนุญาตเมื่อ $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'สิทธิ์ที่ได้รับ';

  @override
  String get authorizedAppsRevoke => 'ยกเลิก';

  @override
  String get authorizedAppsRevokeTitle => 'ยกเลิกการเข้าถึงแอปพลิเคชัน';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการยกเลิกการเข้าถึงของ $appName? แอปพลิเคชันนี้จะไม่มีสิทธิ์เข้าถึงบัญชีของคุณอีกต่อไป';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'เข้าถึงข้อมูลโปรไฟล์พื้นฐานของคุณ (ชื่อผู้ใช้, รูปประจำตัว ฯลฯ)';

  @override
  String get authorizedAppsScopeEmail => 'ดูที่อยู่อีเมลของคุณ';

  @override
  String get authorizedAppsScopeGuilds => 'ดูชุมชนที่คุณเป็นสมาชิก';

  @override
  String get authorizedAppsScopeConnections => 'ดูบัญชีที่เชื่อมต่อของคุณ';

  @override
  String get authorizedAppsScopeBot => 'เพิ่มบอทไปยังชุมชนพร้อมสิทธิ์ที่ร้องขอ';

  @override
  String get authorizedAppsScopeAdmin => 'เข้าถึงจุดสิ้นสุดการดูแลระบบ';

  @override
  String get privacyPendingDeletionTitle => 'รอดำเนินการลบ';

  @override
  String get blockedUsersTitle => 'ผู้ใช้ที่ถูกบล็อก';

  @override
  String get blockedUsersDescription =>
      'ผู้ใช้ที่ถูกบล็อกจะไม่สามารถส่งคำขอเป็นเพื่อนหรือส่งข้อความถึงคุณได้โดยตรง';

  @override
  String get blockedUsersEmptyTitle => 'ไม่มีผู้ใช้ที่ถูกบล็อก';

  @override
  String get blockedUsersEmptyDescription => 'คุณยังไม่ได้บล็อกใคร';

  @override
  String get blockedUsersLoadError => 'ไม่สามารถโหลดผู้ใช้ที่ถูกบล็อกได้';

  @override
  String get blockedUsersUnblock => 'เลิกบล็อก';

  @override
  String get blockedUsersUnblockTitle => 'เลิกบล็อกผู้ใช้';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเลิกบล็อก $username?';
  }

  @override
  String get blockedUsersCopyTag => 'คัดลอก ชื่อผู้ใช้';

  @override
  String get blockedUsersCopyId => 'คัดลอก ID ผู้ใช้';

  @override
  String get userProfileLoadError => 'ไม่สามารถโหลดโปรไฟล์ได้';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'ลองอีกครั้ง';

  @override
  String get userProfileMessage => 'ข้อความ';

  @override
  String get userProfileVoiceCall => 'โทรด้วยเสียง';

  @override
  String get userProfileVideoCall => 'โทรวิดีโอ';

  @override
  String get userProfileEditProfile => 'แก้ไขโปรไฟล์';

  @override
  String get userProfileStaffBadgeTooltip => 'ทีมงาน Fluxer';

  @override
  String get userProfileCtpBadgeTooltip => 'ทีมชุมชน Fluxer';

  @override
  String get userProfilePartnerBadgeTooltip => 'พันธมิตร Fluxer';

  @override
  String get userProfileBugHunterBadgeTooltip => 'ผู้ล่าบั๊ก Fluxer';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'สมาชิก Fluxer Plutonium ตั้งแต่ $date';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Visionary';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Visionary ตั้งแต่ $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'เพื่อนร่วมกัน ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'ชุมชนร่วมกัน ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'เพื่อนร่วมกัน';

  @override
  String get userProfileMutualCommunitiesTitle => 'ชุมชนร่วมกัน';

  @override
  String get userProfileNoMutualFriends => 'ไม่พบเพื่อนร่วมกัน';

  @override
  String get userProfileNoMutualCommunities => 'ไม่พบชุมชนร่วมกัน';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'ชื่อเล่น: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'เปิด DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'คุณบล็อก $username คุณจะไม่สามารถส่งข้อความได้จนกว่าจะเลิกบล็อก';
  }

  @override
  String get blockedUserComposerBarrierAction => 'เลิกบล็อก';

  @override
  String get userProfileOpenDm => 'เปิด DM';

  @override
  String get userProfileNoteTitle => 'หมายเหตุ';

  @override
  String get userProfileNoteVisibility => '(มองเห็นได้เฉพาะคุณ)';

  @override
  String get userProfileNoteSave => 'บันทึก';

  @override
  String get userProfileNoteDelete => 'ลบ';

  @override
  String get userProfileNoteEmpty => 'แตะเพื่อเพิ่มหมายเหตุ';

  @override
  String get userProfileMemberSince => 'สมาชิกตั้งแต่';

  @override
  String get userProfileAboutMe => 'เกี่ยวกับฉัน';

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
  String get userProfileCopyUsername => 'คัดลอกชื่อผู้ใช้';

  @override
  String get userProfileCopyUserId => 'คัดลอก ID ผู้ใช้';

  @override
  String get userProfileViewMainProfile => 'ดูโปรไฟล์หลัก';

  @override
  String get userProfileViewCommunityProfile => 'ดูโปรไฟล์ชุมชน';

  @override
  String get userProfileBlockUser => 'บล็อกผู้ใช้';

  @override
  String get userProfileUnblockUser => 'เลิกบล็อกผู้ใช้';

  @override
  String get userProfileRemoveFriend => 'ลบเพื่อน';

  @override
  String get userProfileBlockConfirmTitle => 'บล็อกผู้ใช้';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการบล็อก $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'เลิกบล็อกผู้ใช้';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเลิกบล็อก $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'ลบเพื่อน';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $username ออกจากรายชื่อเพื่อน?';
  }

  @override
  String get userProfileFailedOpenDm => 'ไม่สามารถเปิด DM ได้';

  @override
  String get userProfileFailedSaveNote => 'ไม่สามารถบันทึกหมายเหตุได้';

  @override
  String get userProfileActionFailed => 'การดำเนินการล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get userProfileChangeNickname => 'เปลี่ยนชื่อเล่น';

  @override
  String get userProfileKick => 'เตะออก';

  @override
  String get userProfileBan => 'แบน';

  @override
  String get userProfileTimeout => 'ระงับชั่วคราว';

  @override
  String get userProfileRemoveTimeout => 'ยกเลิกการระงับชั่วคราว';

  @override
  String get userProfileTransferOwnership => 'โอนความเป็นเจ้าของ';

  @override
  String get userProfileReportUser => 'รายงานผู้ใช้';

  @override
  String get userProfileReportMessage => 'รายงานข้อความ';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'เตะ $username ออก?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเตะ $username ออก? พวกเขาสามารถเข้าร่วมใหม่ด้วยคำเชิญใหม่';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'ยกเลิกการระงับ?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'การยกเลิกการระงับจะทำให้ $username สามารถส่งข้อความ แสดงปฏิกิริยา และเข้าร่วมช่องเสียงได้อีกครั้ง';
  }

  @override
  String get userProfileTransferConfirmTitle => 'โอนความเป็นเจ้าของ?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'โอนความเป็นเจ้าของชุมชนนี้ให้กับ $username หรือไม่? การดำเนินการนี้ไม่สามารถย้อนกลับได้ และคุณจะสูญเสียสิทธิ์เจ้าของทั้งหมด';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'แบน $username';
  }

  @override
  String get userProfileBanDurationLabel => 'ระยะเวลาแบน';

  @override
  String get userProfileBanCustomSecondsLabel => 'ระยะเวลาที่กำหนดเอง (วินาที)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'ค่าใดก็ได้ตั้งแต่ $min ถึง $max วินาที';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'ลบประวัติข้อความ';

  @override
  String get userProfileBanDeleteNone => 'ไม่ลบข้อความใดๆ';

  @override
  String get userProfileBanDelete24h => '24 ชั่วโมงที่ผ่านมา';

  @override
  String get userProfileBanDelete7d => '7 วันที่ผ่านมา';

  @override
  String get userProfileBanReasonLabel => 'เหตุผล (ไม่บังคับ)';

  @override
  String get userProfileBanReasonHint => 'ระบุเหตุผลในการแบน';

  @override
  String get userProfileBanSubmit => 'แบนสมาชิก';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'ระงับ $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'ระยะเวลาระงับ';

  @override
  String get userProfileTimeoutSubmit => 'ระงับสมาชิก';

  @override
  String get userProfileNicknameLabel => 'ชื่อเล่น';

  @override
  String get userProfileNicknameHint => 'ระบุชื่อเล่น';

  @override
  String get userProfileNicknameSave => 'บันทึก';

  @override
  String userProfileKickSuccess(String username) {
    return 'ไล่ $username ออกแล้ว';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'แบน $username แล้ว';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'ระงับ $username แล้ว';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'ยกเลิกการระงับสำหรับ $username แล้ว';
  }

  @override
  String get userProfileNicknameSuccess => 'อัปเดตชื่อเล่นแล้ว';

  @override
  String get userProfileTransferSuccess => 'โอนความเป็นเจ้าของแล้ว';

  @override
  String get durationPermanent => 'ถาวร';

  @override
  String get duration60Seconds => '60 วินาที';

  @override
  String get duration5Minutes => '5 นาที';

  @override
  String get duration10Minutes => '10 นาที';

  @override
  String get duration1Hour => '1 ชั่วโมง';

  @override
  String get duration12Hours => '12 ชั่วโมง';

  @override
  String get duration1Day => '1 วัน';

  @override
  String get duration3Days => '3 วัน';

  @override
  String get duration5Days => '5 วัน';

  @override
  String get duration1Week => '1 สัปดาห์';

  @override
  String get duration2Weeks => '2 สัปดาห์';

  @override
  String get duration1Month => '1 เดือน';

  @override
  String get durationCustom => 'กำหนดเอง…';

  @override
  String get iarReportUserTitle => 'รายงานผู้ใช้';

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
  String get iarReasonInappropriateProfile => 'โปรไฟล์ไม่เหมาะสม';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'โปรไฟล์ของผู้ใช้นี้มีเนื้อหาไม่เหมาะสม';

  @override
  String typingIndicatorOne(String name) {
    return '$name กำลังพิมพ์...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 และ $name2 กำลังพิมพ์...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 และ $name3 กำลังพิมพ์...';
  }

  @override
  String get typingIndicatorMultiple => 'หลายคนกำลังพิมพ์...';

  @override
  String get typingIndicatorHandful => 'นักพิมพ์ดีดกำลังรวมตัวกัน...';

  @override
  String get typingIndicatorSymphony => 'เสียงแป้นพิมพ์กำลังบรรเลง...';

  @override
  String get typingIndicatorFiesta =>
      'กำลังมีงานเลี้ยงพิมพ์ดีดเต็มรูปแบบที่นี่';

  @override
  String get typingIndicatorApocalypse => 'โอ้โห นี่มันสงครามการพิมพ์!';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'ยินดีต้อนรับนะ $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'ยินดีต้อนรับนะ $username! ทำตัวตามสบายเลย';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'สวัสดี $username! ดีใจที่ได้เจอคุณที่นี่';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'สวัสดี $username! เข้ามาคุยได้เลยเมื่อคุณพร้อม';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'เฮ้ $username ดีใจที่ได้เจอคุณที่นี่!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'เฮ้ $username! หวังว่าคุณจะสนุกกับการเข้าพักนะ';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'เฮ้ $username ยินดีต้อนรับ!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'ดีใจที่คุณมาถึงนะ $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'ยินดีต้อนรับนะ $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'ยินดีต้อนรับนะ $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'ยินดีต้อนรับนะ $username! เราดีใจที่คุณอยู่ที่นี่';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'ยินดีต้อนรับนะ $username! หวังว่าคุณจะสนุกกับเวลาที่นี่';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'ยินดีต้อนรับนะ $username! การสนทนาครั้งต่อไปของคุณเริ่มต้นที่นี่';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'ยินดีต้อนรับนะ $username เราดีใจที่มีคุณอยู่ที่นี่';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'ดีใจที่ได้เจอคุณนะ $username! ยินดีต้อนรับ';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'คุณมาแล้วนะ $username! ดีใจที่มีคุณอยู่กับเรา';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'คุณมาถึงแล้วนะ $username! มาเริ่มกันเลย';
  }

  @override
  String get relativeTimeShortNow => 'ตอนนี้';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countนาที',
      one: '1นาที',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countชม.',
      one: '1ชม.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countวัน',
      one: '1วัน',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countด.',
      one: '1ด.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countปี',
      one: '1ปี',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'อุปกรณ์ของฉัน';

  @override
  String get linkedDevicesDescription =>
      'ดูอุปกรณ์ทั้งหมดที่เข้าสู่ระบบบัญชีของคุณอยู่ขณะนี้ เพิกถอนเซสชันที่คุณไม่คุ้นเคย';

  @override
  String get linkedDevicesCurrentDevice => 'อุปกรณ์ปัจจุบัน';

  @override
  String get linkedDevicesOtherDevices => 'อุปกรณ์อื่น ๆ';

  @override
  String get linkedDevicesEnterSelection => 'เข้าสู่โหมดเลือก';

  @override
  String get linkedDevicesExitSelection => 'ออกจากโหมดเลือก';

  @override
  String get linkedDevicesSelectAll => 'เลือกทั้งหมด';

  @override
  String get linkedDevicesClearSelection => 'ล้างการเลือก';

  @override
  String get linkedDevicesRevokeTooltip => 'เพิกถอนอุปกรณ์';

  @override
  String get linkedDevicesSignOutAll => 'ออกจากระบบอุปกรณ์อื่นทั้งหมด';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ออกจากระบบ $count อุปกรณ์',
      one: 'ออกจากระบบ 1 อุปกรณ์',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ออกจากระบบ $count อุปกรณ์',
      one: 'ออกจากระบบ 1 อุปกรณ์',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'ออกจากระบบอุปกรณ์อื่นทั้งหมด';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์เหล่านั้น',
      one: 'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์นั้น',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์เหล่านั้น';

  @override
  String get linkedDevicesSignOutConfirm => 'ดำเนินการต่อ';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์ที่ออกจากระบบทั้งหมด';

  @override
  String get linkedDevicesLoadErrorTitle => 'ข้อผิดพลาดเครือข่าย';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'เรากำลังประสบปัญหาในการเชื่อมต่อกับกาลอวกาศ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เพิกถอนอุปกรณ์แล้ว',
      one: 'เพิกถอนอุปกรณ์แล้ว',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'ไม่สามารถออกจากระบบได้ ลองอีกครั้ง';

  @override
  String get linkedDevicesUnknownOs => 'ระบบปฏิบัติการไม่รู้จัก';

  @override
  String get linkedDevicesUnknownPlatform => 'แพลตฟอร์มไม่รู้จัก';

  @override
  String slowmodeLabel(String duration) {
    return '$duration โหมดหน่วงเวลา';
  }

  @override
  String get slowmodeTooltipActive =>
      'คุณอยู่ในโหมดหน่วงเวลา โปรดรอสักครู่ก่อนส่งข้อความอื่น';

  @override
  String get slowmodeTooltipImmune =>
      'เปิดใช้งานโหมดหน่วงเวลาแล้ว แต่คุณได้รับการยกเว้น';

  @override
  String get slowmodeStatusEnabled => 'Slowmode is enabled';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Slowmode is active ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Slowmode is set to $durationLabel, but you are immune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Slowmode is set to $durationLabel. Wait before sending another message.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Slowmode is set to $durationLabel for this channel.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'คุณไม่สามารถส่งข้อความในช่องนี้ได้';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'ประกาศจากทีมงาน $productName คุณไม่สามารถตอบกลับที่นี่ได้';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'การส่งข้อความถูกระงับชั่วคราวในชุมชนนี้';

  @override
  String get channelComposerBarrierTimedOut =>
      'คุณถูกระงับชั่วคราว การส่งข้อความ การแสดงความรู้สึก และการสนทนาด้วยเสียงจะถูกระงับจนกว่าจะหมดเวลา';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'คุณต้องยืนยันบัญชีของคุณเพื่อส่งข้อความในชุมชนนี้';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'คุณต้องยืนยันอีเมลของคุณเพื่อส่งข้อความในชุมชนนี้';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'บัญชีของคุณยังใหม่เกินไปที่จะส่งข้อความในชุมชนนี้';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'คุณยังไม่ได้เป็นสมาชิกของชุมชนนี้เป็นเวลานานพอที่จะส่งข้อความ';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'คุณต้องยืนยันหมายเลขโทรศัพท์เพื่อส่งข้อความในชุมชนนี้';

  @override
  String get channelComposerBarrierVerifyEmail => 'ยืนยันอีเมล';

  @override
  String get channelComposerBarrierVerifyPhone => 'ยืนยันโทรศัพท์';

  @override
  String chatAttachmentTooMany(int max) {
    return 'ไฟล์แนบมากเกินไป (สูงสุด $max ไฟล์)';
  }

  @override
  String get chatAttachmentFileTooLarge =>
      'ไฟล์หนึ่งไฟล์หรือมากกว่านั้นมีขนาดใหญ่เกินขีดจำกัด';

  @override
  String get chatAttachmentPayloadTooLarge =>
      'ไฟล์เหล่านั้นมีขนาดใหญ่เกินกว่าจะส่งพร้อมกันได้';

  @override
  String get chatAttachmentDropToUpload => 'วางไฟล์เพื่ออัปโหลด';

  @override
  String get chatAttachmentDropToSend => 'วางไฟล์เพื่อส่งทันที';

  @override
  String get chatAttachmentSendVoiceMessage => 'ส่งข้อความเสียง';

  @override
  String get voiceMessageTitle => 'ข้อความเสียง';

  @override
  String get voiceMessageHoldHint =>
      'กดค้างไว้เพื่อบันทึก ลากขึ้นเพื่อล็อค หรือปล่อยเพื่อส่ง';

  @override
  String get voiceMessageDiscard => 'ทิ้งข้อความเสียง';

  @override
  String get voiceMessageSend => 'ส่งข้อความเสียง';

  @override
  String get voiceMessageMicPermissionDenied =>
      'ไม่สามารถเริ่มบันทึกได้ โปรดอนุญาตการเข้าถึงไมโครโฟน';

  @override
  String get voiceMessageRecordingNotSupported =>
      'อุปกรณ์นี้ไม่รองรับการบันทึกเสียง';

  @override
  String get voiceMessageMicInUse => 'ออกจากสายสนทนาเพื่อบันทึกข้อความเสียง';

  @override
  String get voiceMessageRecordingFailed => 'การบันทึกไม่สำเร็จ ลองอีกครั้ง';

  @override
  String get voiceMessageSendFailed =>
      'ไม่สามารถส่งข้อความเสียงได้ ลองอีกครั้ง';

  @override
  String get voiceMessageRecordingHint =>
      'พูดได้เลย กดหยุดเมื่อคุณทำเสร็จแล้ว คุณสามารถตัดแต่งได้ในภายหลัง';

  @override
  String get voiceMessageReviewHint => 'ลากที่จับเพื่อตัดแต่ง จากนั้นกดส่ง';

  @override
  String get voiceMessageStop => 'หยุด';

  @override
  String get voiceMessageStartRecording => 'เริ่มบันทึก';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'เล่น';

  @override
  String get voiceMessagePause => 'หยุดชั่วคราว';

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

    return 'การเลือกต้องมีความยาวอย่างน้อย $secondsString วินาที';
  }

  @override
  String get chatAttachmentEditTitle => 'แก้ไขไฟล์แนบ';

  @override
  String get chatAttachmentFilenameLabel => 'ชื่อไฟล์';

  @override
  String get chatAttachmentDescriptionLabel => 'คำอธิบาย';

  @override
  String get chatAttachmentDescriptionHint => 'ข้อความทางเลือก (ไม่บังคับ)';

  @override
  String get chatAttachmentSpoilerLabel => 'ทำเครื่องหมายว่าเป็นสปอยเลอร์';

  @override
  String get chatAttachmentRemove => 'ลบไฟล์แนบ';

  @override
  String get chatAttachmentDownload => 'ดาวน์โหลด';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'ไฟล์แนบหมดอายุ';

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
  String get chatAttachmentSourceGallery => 'คลังภาพ';

  @override
  String get chatAttachmentSourceCamera => 'กล้อง';

  @override
  String get chatAttachmentSourceBrowse => 'เรียกดูไฟล์';

  @override
  String get chatAttachmentPasteTooltip => 'วางรูปภาพจากคลิปบอร์ด';

  @override
  String get chatAttachmentSpoiler => 'สปอยเลอร์';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'เปิดเผยสปอยเลอร์';

  @override
  String get matureMediaRevealButton => 'เปิดเผย';

  @override
  String get matureMediaRevealHint => 'คลิกเพื่อเปิดเผย';

  @override
  String get matureContentTitle => 'เนื้อหาสำหรับผู้ใหญ่';

  @override
  String get matureCommunityTitle => 'ชุมชนสำหรับผู้ใหญ่';

  @override
  String get matureCategoryTitle => 'หมวดหมู่สำหรับผู้ใหญ่';

  @override
  String get matureChannelTitle => 'ช่องสำหรับผู้ใหญ่';

  @override
  String get communityContentWarningTitle => 'คำเตือนเนื้อหาชุมชน';

  @override
  String get categoryContentWarningTitle => 'คำเตือนเนื้อหาหมวดหมู่';

  @override
  String get channelContentWarningTitle => 'คำเตือนเนื้อหาช่อง';

  @override
  String get defaultContentWarningBody => 'มีเนื้อหาที่ละเอียดอ่อน';

  @override
  String get matureCommunityBody =>
      'ชุมชนนี้ถูกตั้งค่าสำหรับเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureCategoryBody =>
      'หมวดหมู่นี้ถูกตั้งค่าสำหรับเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureChannelBody =>
      'ช่องนี้ถูกตั้งค่าสำหรับเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureVoiceChannelBody =>
      'ช่องเสียงนี้ถูกตั้งค่าสำหรับเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureLinkChannelBody =>
      'ช่องลิงก์นี้ถูกตั้งค่าสำหรับเนื้อหาสำหรับผู้ใหญ่ และอาจเปิดเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureCommunityUnavailableBody =>
      'บัญชีของคุณไม่สามารถเข้าถึงชุมชนสำหรับผู้ใหญ่แห่งนี้ได้';

  @override
  String get matureCategoryUnavailableBody =>
      'บัญชีของคุณไม่สามารถเข้าถึงหมวดหมู่สำหรับผู้ใหญ่แห่งนี้ได้';

  @override
  String get matureChannelUnavailableBody =>
      'บัญชีของคุณไม่สามารถเข้าถึงช่องสำหรับผู้ใหญ่แห่งนี้ได้';

  @override
  String get matureContentProceedButton => 'ดำเนินการต่อ';

  @override
  String get matureContentUnderstandButton => 'ฉันเข้าใจ';

  @override
  String get matureContentOpenLinkButton => 'เปิดลิงก์';

  @override
  String get sensitiveContentSectionTitle => 'เนื้อหาที่ละเอียดอ่อน';

  @override
  String get sensitiveContentSectionDescription =>
      'ควบคุมการกรองสื่อสำหรับผู้ใหญ่หรือสื่อที่ละเอียดอ่อนในบริบทต่างๆ';

  @override
  String get sensitiveContentFriendDmLabel => 'ข้อความส่วนตัวจากเพื่อน';

  @override
  String get sensitiveContentNonFriendDmLabel => 'ข้อความส่วนตัวจากผู้อื่น';

  @override
  String get sensitiveContentGuildLabel => 'ข้อความในช่องชุมชน';

  @override
  String get sensitiveContentFilterShow => 'แสดง';

  @override
  String get sensitiveContentFilterBlur => 'เบลอ';

  @override
  String get sensitiveContentFilterBlock => 'บล็อก';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'เบลอสื่อจนกว่าการสแกนความปลอดภัยจะเสร็จสิ้น';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'เมื่อเปิดใช้งาน รูปภาพและวิดีโอจะถูกเบลอจนกว่าการสแกนความปลอดภัยของเนื้อหาจะเสร็จสิ้น';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'การตั้งค่านี้เปิดอยู่เสมอสำหรับบัญชีของคุณ';

  @override
  String get sensitiveContentResetButton => 'รีเซ็ต';

  @override
  String get sensitiveContentSaveButton => 'บันทึก';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ไฟล์',
      one: 'ไฟล์ 1 ไฟล์',
    );
    return 'กำลังอัปโหลด $_temp0';
  }

  @override
  String get chatCancelUpload => 'ยกเลิกการอัปโหลด';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'หมดอายุวันที่ $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'หมดอายุระหว่างวันที่ $start ถึง $end';
  }

  @override
  String get connectionsTitle => 'การเชื่อมต่อ';

  @override
  String get connectionsDescription =>
      'เชื่อมโยงบัญชีและโดเมนภายนอกเข้ากับโปรไฟล์ Fluxer ของคุณ การเชื่อมต่อที่ยืนยันแล้วจะแสดงบนโปรไฟล์ของคุณเพื่อให้ผู้อื่นเห็น';

  @override
  String get connectionsEmptyTitle => 'ยังไม่มีการเชื่อมต่อ';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'เชื่อมโยงบัญชี Bluesky ของคุณ หรือยืนยันความเป็นเจ้าของโดเมนเพื่อแสดงบนโปรไฟล์ของคุณ';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'ยืนยันความเป็นเจ้าของโดเมนเพื่อแสดงบนโปรไฟล์ของคุณ';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'โดเมน';

  @override
  String get connectionsAddBlueskyAriaLabel => 'เพิ่มการเชื่อมต่อ Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'เพิ่มการเชื่อมต่อโดเมน';

  @override
  String get connectionEdit => 'แก้ไข';

  @override
  String get connectionRemove => 'ลบ';

  @override
  String get connectionVerifiedLabel => 'การเชื่อมต่อนี้ได้รับการยืนยันแล้ว';

  @override
  String get connectionUnverifiedLabel =>
      'การเชื่อมต่อนี้ยังไม่ได้รับการยืนยัน';

  @override
  String get connectionAddTitle => 'เพิ่มการเชื่อมต่อ';

  @override
  String get connectionTypeLabel => 'ประเภทการเชื่อมต่อ';

  @override
  String get connectionHandleLabel => 'ชื่อผู้ใช้';

  @override
  String get connectionDomainLabel => 'โดเมน';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'คุณมีข้อมูลการเชื่อมต่อนี้อยู่แล้ว';

  @override
  String get connectionConnectBluesky => 'เชื่อมต่อด้วย Bluesky';

  @override
  String get connectionContinue => 'ดำเนินการต่อ';

  @override
  String get connectionVerifyTitle => 'ยืนยันการเชื่อมต่อ';

  @override
  String get connectionVerifyInstructions =>
      'ใช้ระเบียนด้านล่างเพื่อพิสูจน์ความเป็นเจ้าของโดเมน';

  @override
  String get connectionDnsRecordTitle => 'ระเบียน DNS TXT';

  @override
  String get connectionDnsHostLabel => 'โฮสต์';

  @override
  String get connectionDnsValueLabel => 'ค่า';

  @override
  String get connectionCopyHost => 'คัดลอกโฮสต์';

  @override
  String get connectionCopyValue => 'คัดลอกค่า';

  @override
  String get connectionCopied => 'คัดลอกแล้ว!';

  @override
  String get connectionTokenFileTitle => 'ให้บริการไฟล์โทเค็น';

  @override
  String get connectionTokenFileDescription =>
      'ดาวน์โหลด **fluxer-verification** และวางไว้ในโฟลเดอร์ **.well-known** ของคุณ เพื่อให้เราสามารถตรวจสอบโดเมนได้';

  @override
  String get connectionTokenFileDownload => 'ดาวน์โหลด fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'ไฟล์มีโทเค็นการยืนยันที่เราจะดึงมาจาก **$dnsUrl**';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'บันทึก fluxer-verification';

  @override
  String get connectionVerifyButton => 'ยืนยัน';

  @override
  String get connectionBack => 'ย้อนกลับ';

  @override
  String get connectionEditTitle => 'แก้ไขการเชื่อมต่อ';

  @override
  String get connectionEditDescription =>
      'เลือกว่าใครสามารถเห็นการเชื่อมต่อนี้ในโปรไฟล์ของคุณได้บ้าง';

  @override
  String get connectionVisibilityEveryone => 'ทุกคน';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'อนุญาตให้ทุกคนเห็นการเชื่อมต่อนี้ในโปรไฟล์ของคุณ';

  @override
  String get connectionVisibilityFriends => 'เพื่อน';

  @override
  String get connectionVisibilityFriendsDesc =>
      'อนุญาตให้เพื่อนของคุณเห็นการเชื่อมต่อนี้';

  @override
  String get connectionVisibilityCommunityMembers => 'สมาชิกชุมชน';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'อนุญาตให้สมาชิกจากชุมชนที่คุณอยู่เห็นการเชื่อมต่อนี้';

  @override
  String get connectionRemoveTitle => 'ลบการเชื่อมต่อ';

  @override
  String get connectionRemoveDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบการเชื่อมต่อนี? การดำเนินการนี้ไม่สามารถยกเลิกได้';

  @override
  String get connectionRemoveConfirm => 'ลบ';

  @override
  String get connectionsLoadError => 'ไม่สามารถโหลดข้อมูลการเชื่อมต่อได้';

  @override
  String get connectionsReorderError => 'ไม่สามารถอัปเดตลำดับได้';

  @override
  String get connectionInitiateFailed =>
      'ไม่สามารถเริ่มการยืนยันได้ โปรดลองอีกครั้ง';

  @override
  String get connectionVerifyFailed =>
      'ไม่สามารถยืนยันได้ โปรดตรวจสอบระเบียน DNS ของคุณและลองอีกครั้ง';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'ไม่สามารถเริ่มการอนุญาต Bluesky ได้';

  @override
  String get connectionUpdateFailed => 'ไม่สามารถอัปเดตการเชื่อมต่อได้';

  @override
  String get connectionRemoveFailed => 'ไม่สามารถลบการเชื่อมต่อได้';

  @override
  String get connectionTokenSavedToast => 'บันทึก fluxer-verification แล้ว';

  @override
  String get connectionTokenSaveFailedToast => 'ไม่สามารถบันทึกไฟล์ได้';

  @override
  String get connectionEnterHandle => 'ป้อนชื่อผู้ใช้ Bluesky';

  @override
  String get connectionEnterDomain => 'ป้อนโดเมน';

  @override
  String get lookAndFeelTitle => 'รูปลักษณ์และการแสดงผล';

  @override
  String get lookAndFeelThemeSectionTitle => 'ธีม';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'เลือกระหว่างรูปลักษณ์แบบมืด, ถ่าน, หรือสว่าง';

  @override
  String get lookAndFeelHdrSectionTitle => 'High dynamic range';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Control how HDR images are displayed on HDR-capable monitors.';

  @override
  String get lookAndFeelHdrFullName => 'Full dynamic range';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Display HDR images at full brightness and color range.';

  @override
  String get lookAndFeelHdrStandardName => 'Standard range';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tone-map HDR images to standard range, reducing peak brightness.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'High dynamic range display mode';

  @override
  String get lookAndFeelThemeDark => 'ธีมมืด';

  @override
  String get lookAndFeelThemeCoal => 'ธีมถ่าน';

  @override
  String get lookAndFeelThemeLight => 'ธีมสว่าง';

  @override
  String get lookAndFeelThemeSystem => 'ธีมระบบ';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel => 'ซิงค์ธีมกับอุปกรณ์อื่น';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'เมื่อเปิดใช้งาน การเปลี่ยนแปลงธีมจะซิงค์ไปยังอุปกรณ์ทั้งหมดของคุณ เมื่อปิดใช้งาน อุปกรณ์นี้จะใช้การตั้งค่าธีมของตัวเอง';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'ธีมระบบจะปิดใช้งานการซิงค์โดยอัตโนมัติเพื่อติดตามการตั้งค่าระบบของคุณบนอุปกรณ์นี้';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'ไม่สามารถซิงค์ธีมไปยังบัญชีของคุณได้ โปรดลองอีกครั้ง';

  @override
  String get lookAndFeelChatFontScalingTitle => 'การปรับขนาดฟอนต์แชท';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'ปรับขนาดฟอนต์ในพื้นที่แชท';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Chat font size';

  @override
  String get lookAndFeelAppZoomTitle => 'App zoom level';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Adjust the application\'s zoom level.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Messages';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Choose how messages are displayed in chat channels.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Space between message groups';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Message display mode';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Comfy';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Spacious layout with clear visual separation between messages.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dense';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximizes visible messages with minimal spacing.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Hide user avatars';

  @override
  String get lookAndFeelInterfaceTitle => 'อินเทอร์เฟซ';

  @override
  String get lookAndFeelInterfaceDescription =>
      'ปรับแต่งองค์ประกอบและพฤติกรรมของอินเทอร์เฟซ';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'ตัวบ่งชี้การพิมพ์ในรายการช่อง';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'เลือกว่าตัวบ่งชี้การพิมพ์จะปรากฏในรายการช่องอย่างไรเมื่อมีคนกำลังพิมพ์ในช่อง';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'ตัวบ่งชี้การพิมพ์ + อวาตาร์';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'แสดงตัวบ่งชี้การพิมพ์พร้อมอวาตาร์ผู้ใช้ในรายการช่อง';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'เฉพาะตัวบ่งชี้การพิมพ์';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'แสดงเฉพาะตัวบ่งชี้การพิมพ์โดยไม่มีอวาตาร์';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'ซ่อน';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'ไม่แสดงตัวบ่งชี้การพิมพ์ในรายการช่อง';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'แสดงการพิมพ์ในช่องที่เลือก';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'เมื่อปิดใช้งาน (ค่าเริ่มต้น) ตัวบ่งชี้การพิมพ์จะไม่ปรากฏในช่องที่คุณกำลังดูอยู่';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'ทั่วไป';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'คำแนะนำแป้นพิมพ์';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'ควบคุมว่าคำแนะนำทางลัดแป้นพิมพ์จะปรากฏในคำแนะนำเครื่องมือหรือไม่';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'ซ่อนคำแนะนำแป้นพิมพ์ในคำแนะนำเครื่องมือ';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'เมื่อเปิดใช้งาน จะซ่อนป้ายทางลัดในป๊อปอัปคำแนะนำเครื่องมือ';

  @override
  String get lookAndFeelNekoTitle => 'เบ็ดเตล็ด';

  @override
  String get lookAndFeelNekoDescription => 'ตัวเลือกอินเทอร์เฟซเบ็ดเตล็ด';

  @override
  String get lookAndFeelShowNekoLabel => 'แสดง Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'เมื่อเปิดใช้งาน Neko จะปรากฏใกล้แถบป้อนข้อมูลแชท';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => 'พฤติกรรมการเข้าร่วมช่องเสียง';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'ควบคุมวิธีที่คุณเข้าร่วมช่องเสียงในชุมชน';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'ต้องดับเบิลคลิกเพื่อเข้าร่วมช่องเสียง';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'เมื่อเปิดใช้งาน คุณจะต้องดับเบิลคลิกที่ช่องเสียงเพื่อเข้าร่วม เมื่อปิดใช้งาน (ค่าเริ่มต้น) การคลิกเพียงครั้งเดียวจะเข้าร่วมช่องทันที';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'หมาจิ้งจอกสีน้ำตาลตัวเร็ว กระโดดข้ามหมาแก่';

  @override
  String get lookAndFeelGuildSidebarTitle => 'แถบด้านข้างเซิร์ฟเวอร์';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'กำหนดค่าการแสดงข้อความส่วนตัวในแถบด้านข้างเซิร์ฟเวอร์';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count ชุมชนไม่พร้อมใช้งานชั่วคราวเนื่องจากความผิดปกติของฟลักซ์คาปาซิเตอร์',
      one: '1 ชุมชนไม่พร้อมใช้งานชั่วคราวเนื่องจากความผิดปกติของฟลักซ์คาปาซิเตอร์',
    );
    return '$_temp0';
  }

  @override
  String get lookAndFeelCollapseDMsLabel => 'ยุบ DM เป็นโฟลเดอร์';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'เมื่อเปิดใช้งาน DM ที่ยังไม่ได้อ่านในแถบด้านข้างเซิร์ฟเวอร์จะถูกยุบเป็นโฟลเดอร์ในปุ่ม Fluxer คลิกปุ่ม Fluxer ขณะที่อยู่ในหน้า DM เพื่อขยายหรือยุบโฟลเดอร์';

  @override
  String get lookAndFeelChannelListSectionTitle => 'รายการช่อง';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'ควบคุมพฤติกรรมตัวบ่งชี้ที่ยังไม่ได้อ่านสำหรับช่องที่ปิดเสียงในรายการช่อง';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'แสดงตัวบ่งชี้ที่ยังไม่ได้อ่านในช่องที่ปิดเสียง';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'เมื่อเปิดใช้งาน ช่องที่ปิดเสียงจะแสดงตัวบ่งชี้ที่ยังไม่ได้อ่านแบบจางๆ ทางด้านซ้าย การกล่าวถึงยังคงปรากฏโดยไม่คำนึงถึงการตั้งค่านี้';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'กำลังใช้งานอยู่';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'ควบคุมวิธีที่ \'กำลังใช้งานอยู่\' ปรากฏทั่วทั้งแอป';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'แสดง \'กำลังใช้งานอยู่\' บนหน้าแรก';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'แสดง \'กำลังใช้งานอยู่\' บนหน้าแรกเพื่อแสดงเพื่อนที่กำลังใช้งานในช่องเสียง คุณจะเห็นตัวอย่าง บริบทของช่อง ใครอยู่ในนั้นแล้ว และวิธีเข้าร่วมได้อย่างรวดเร็ว';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'รายการโปรด';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'ควบคุมการมองเห็นรายการโปรดทั่วทั้งแอป';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'เปิดใช้งานรายการโปรด';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'เมื่อเปิดใช้งาน คุณสามารถตั้งค่าช่องเป็นรายการโปรด และช่องเหล่านั้นจะปรากฏในส่วนรายการโปรด เมื่อปิดใช้งาน องค์ประกอบ UI ที่เกี่ยวข้องกับรายการโปรดทั้งหมด (ปุ่ม รายการเมนู) จะถูกซ่อน รายการโปรดที่มีอยู่ของคุณจะยังคงอยู่';

  @override
  String get favoritesTitle => 'รายการโปรด';

  @override
  String get favoritesEmptyTitle => 'ยังไม่มีรายการโปรด';

  @override
  String get favoritesEmptyDescription =>
      'ปักดาวช่องต่างๆ จากส่วนหัวแชทเพื่อเก็บไว้ที่นี่';

  @override
  String get favoritesWelcomeTitle => 'ยินดีต้อนรับสู่รายการโปรด';

  @override
  String get favoritesWelcomeDescription =>
      'พื้นที่ส่วนตัวของคุณสำหรับเข้าถึงช่อง DM และกลุ่มที่คุณชื่นชอบได้อย่างรวดเร็ว กดรูปดาวบนช่องใดก็ได้เพื่อเพิ่มที่นี่';

  @override
  String get favoritesWelcomeTip => 'ไม่ถูกใจ? ปิดได้ทุกเมื่อ';

  @override
  String get favoritesDisableButton => 'ปิดรายการโปรด';

  @override
  String get favoritesAddedToast => 'เพิ่มไปยังรายการโปรดแล้ว';

  @override
  String get favoritesRemovedToast => 'นำออกจากรายการโปรดแล้ว';

  @override
  String get favoritesHiddenToast => 'ซ่อนรายการโปรดแล้ว';

  @override
  String get favoritesMute => 'ปิดเสียงรายการโปรด';

  @override
  String get favoritesUnmute => 'เปิดเสียงรายการโปรด';

  @override
  String get favoritesHeaderMenu => 'เมนูรายการโปรด';

  @override
  String get favoritesCreateCategory => 'สร้างหมวดหมู่';

  @override
  String get favoritesCategoryNameLabel => 'ชื่อหมวดหมู่';

  @override
  String get favoritesHideMutedChannels => 'ซ่อนช่องที่ปิดเสียง';

  @override
  String get favoritesShowMutedChannels => 'แสดงช่องที่ปิดเสียง';

  @override
  String get favoritesSetNickname => 'ตั้งชื่อเล่น';

  @override
  String get favoritesNicknameLabel => 'ชื่อเล่น';

  @override
  String get favoritesSaveNickname => 'บันทึกชื่อเล่น';

  @override
  String get favoritesMoveToCategory => 'ย้ายไปยังหมวดหมู่';

  @override
  String get favoritesUncategorized => 'ไม่มีหมวดหมู่';

  @override
  String get favoritesOtherCategory => 'อื่นๆ';

  @override
  String get favoritesRemoveFromFavorites => 'นำออกจากรายการโปรด';

  @override
  String get favoritesAddToFavorites => 'เพิ่มไปยังรายการโปรด';

  @override
  String get favoritesHideConfirmTitle => 'ซ่อนรายการโปรด';

  @override
  String get favoritesHideConfirmDescription =>
      'การดำเนินการนี้จะซ่อนองค์ประกอบ UI ที่เกี่ยวข้องกับรายการโปรดทั้งหมด รวมถึงปุ่มและรายการเมนู รายการโปรดที่มีอยู่ของคุณจะยังคงอยู่และสามารถเปิดใช้งานใหม่ได้ทุกเมื่อจากการตั้งค่า > ขั้นสูง > รูปลักษณ์';

  @override
  String get favoritesDirectMessageSubtitle => 'ข้อความส่วนตัว';

  @override
  String get messagesMediaDisplayGroupTitle => 'การแสดงผล';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'ควบคุมวิธีการแสดงข้อความ สื่อ และเนื้อหาอื่นๆ';

  @override
  String get messagesMediaMediaGroupTitle => 'สื่อ';

  @override
  String get messagesMediaMediaGroupDescription =>
      'ปรับแต่งการตั้งค่าขนาดสื่อและปุ่ม';

  @override
  String get messagesMediaInputGroupTitle => 'การป้อนข้อมูล';

  @override
  String get messagesMediaInputGroupDescription =>
      'ปรับแต่งการตั้งค่าการป้อนข้อความ';

  @override
  String get messagesMediaSidebarGroupTitle => 'แถบด้านข้าง';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'กำหนดค่าวิธีการแสดงแถบด้านข้างของชุมชน';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'ซ่อนช่องที่ปิดเสียงโดยค่าเริ่มต้น';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'ซ่อนช่องที่ปิดเสียงในแถบด้านข้างโดยอัตโนมัติเมื่อคุณเข้าร่วมชุมชนใหม่';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'ซ่อนช่องที่ปิดเสียงโดยค่าเริ่มต้นหรือไม่?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'ชุมชนใหม่ที่คุณเข้าร่วมจะซ่อนช่องที่ปิดเสียงโดยอัตโนมัติ คุณต้องการใช้การตั้งค่านี้กับชุมชนที่มีอยู่ทั้งหมดของคุณด้วยหรือไม่?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'หยุดซ่อนช่องที่ปิดเสียงโดยค่าเริ่มต้นหรือไม่?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'ชุมชนใหม่ที่คุณเข้าร่วมจะไม่ซ่อนช่องที่ปิดเสียงโดยอัตโนมัติอีกต่อไป คุณต้องการแสดงช่องที่ปิดเสียงในชุมชนที่มีอยู่ทั้งหมดของคุณด้วยหรือไม่?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'ใช้กับทุกชุมชน';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'แสดงในทุกชุมชน';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'เฉพาะชุมชนใหม่';

  @override
  String get messagesMediaDisplaySectionTitle => 'การแสดงผลสื่อ';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'ควบคุมวิธีการแสดงรูปภาพ วิดีโอ และสื่ออื่นๆ สื่อทั้งหมดจะถูกปรับขนาดและแปลง ไฟล์ขนาดใหญ่มากที่ไม่สามารถบีบอัดเป็นตัวอย่างได้จะไม่ถูกฝังโดยไม่คำนึงถึงการตั้งค่าเหล่านี้';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'เมื่อโพสต์เป็นลิงก์ไปยังแชท';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'เมื่ออัปโหลดโดยตรงไปยัง Fluxer';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'ตัวอย่างลิงก์';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'ควบคุมวิธีการแสดงตัวอย่างลิงก์เว็บไซต์ในแชท';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'แสดงการฝังและตัวอย่างลิงก์เว็บไซต์';

  @override
  String get messagesMediaReactionsSectionTitle => 'การแสดงอิโมจิ';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'ตั้งค่าการแสดงอิโมจิบนข้อความ';

  @override
  String get messagesMediaReactionsToggleLabel => 'แสดงการแสดงอิโมจิบนข้อความ';

  @override
  String get messagesMediaSpoilersSectionTitle => 'เนื้อหาที่ถูกสปอยล์';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'ควบคุมวิธีการแสดงเนื้อหาที่ถูกสปอยล์';

  @override
  String get messagesMediaSpoilersRadioLabel => 'แสดงเนื้อหาที่ถูกสปอยล์';

  @override
  String get messagesMediaSpoilersOnClickName => 'เมื่อคลิก';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'แสดงเนื้อหาที่ถูกสปอยล์เมื่อคลิก';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'ในช่องที่ฉันดูแล';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'แสดงเนื้อหาที่ถูกสปอยล์เสมอในช่องที่คุณได้รับอนุญาต \"จัดการข้อความ\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'เสมอ';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'แสดงเนื้อหาที่ถูกสปอยล์เสมอ';

  @override
  String get messagesMediaSizeSectionTitle => 'การตั้งค่าขนาดสื่อ';

  @override
  String get messagesMediaSizeSectionDescription =>
      'ปรับแต่งขนาดการแสดงผลสูงสุดสำหรับสื่อที่ฝังและแนบ ขนาดที่เล็กกว่าจะใช้พื้นที่หน้าจอน้อยกว่า ในขณะที่ขนาดที่ใหญ่กว่าจะแสดงรายละเอียดได้มากขึ้น';

  @override
  String get messagesMediaSizeEmbedLabel => 'สื่อจากลิงก์ (ที่ฝัง)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'ไฟล์แนบที่อัปโหลด';

  @override
  String get messagesMediaSizeCompactName => 'กะทัดรัด (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'ขนาดสื่อที่เล็กกว่า';

  @override
  String get messagesMediaSizeComfortableName => 'สบายตา (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'ขนาดสื่อที่ใหญ่ขึ้นพร้อมรายละเอียดเพิ่มเติม';

  @override
  String get messagesMediaGifsSectionTitle => 'พฤติกรรม GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'ควบคุมวิธีการแทรก GIF ลงในแชท';

  @override
  String get messagesMediaGifsAutoSendLabel => 'ส่ง GIF โดยอัตโนมัติเมื่อเลือก';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'การเติมข้อความอัตโนมัติ (การเติมข้อความด้วยเครื่องหมายทวิภาค)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'ควบคุมสิ่งที่ปรากฏในการเติมข้อความอัตโนมัติเมื่อคุณพิมพ์เครื่องหมายทวิภาค ปรับแต่งคำแนะนำที่จะแสดงเพื่อให้ตรงกับความต้องการของคุณ';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'แสดงอิโมจิเริ่มต้นในการเติมข้อความอัตโนมัติ';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'แสดงอิโมจิที่กำหนดเองในการเติมข้อความอัตโนมัติ';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'แสดงสติกเกอร์ในการเติมข้อความอัตโนมัติ';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'แสดงสื่อที่บันทึกไว้ในการเติมข้อความอัตโนมัติ';

  @override
  String get messagesMediaEditingSectionTitle => 'การแก้ไขข้อความ';

  @override
  String get messagesMediaEditingSectionDescription =>
      'ควบคุมสิ่งที่เกิดขึ้นกับร่างการแก้ไขของคุณเมื่อคุณยกเลิก';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'เก็บร่างการแก้ไขไว้เมื่อยกเลิก';

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
  String get accessibilityDmMessagePreviewGroupTitle => 'ตัวอย่างข้อความ DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'ควบคุมเมื่อใดที่จะแสดงตัวอย่างข้อความในรายการ DM';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'โหมดตัวอย่างข้อความ DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'ข้อความทั้งหมด';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'แสดงตัวอย่างข้อความสำหรับบทสนทนา DM ทั้งหมด';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'เฉพาะ DM ที่ยังไม่ได้อ่าน';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'แสดงตัวอย่างข้อความเฉพาะสำหรับ DM ที่มีข้อความที่ยังไม่ได้อ่าน';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'ไม่มี';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'ไม่แสดงตัวอย่างข้อความในรายการ DM';

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
  String get dmListSentAnAttachment => 'ส่งไฟล์แนบ';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username ปักหมุดข้อความในช่องนี้';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username เพิ่ม $userName เข้ามาในกลุ่ม';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username เพิ่มใครบางคนเข้ามาในกลุ่ม';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username ออกจากกลุ่มแล้ว';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username ได้ลบ $userName ออกจากกลุ่ม';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username ได้ลบใครบางคนออกจากกลุ่ม';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username เปลี่ยนชื่อแชนเนลเป็น $newName';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username เปลี่ยนชื่อแชนเนล';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username เปลี่ยนไอคอนแชนเนล';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username เริ่มการโทร';
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
  String get voiceConnectionConfirmTitle => 'ยืนยันการเชื่อมต่อเสียง';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'คุณเชื่อมต่อกับช่องเสียงนี้จากอุปกรณ์อื่นแล้ว $count เครื่อง ต้องการทำอะไร?',
      one: 'คุณเชื่อมต่อกับช่องเสียงนี้จากอุปกรณ์อื่นแล้ว 1 เครื่อง ต้องการทำอะไร?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'สลับไปยังอุปกรณ์นี้';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'เข้าร่วมเลย (คงการเชื่อมต่ออื่นไว้)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'ไม่ต้องทำอะไร ฉันไม่ต้องการเข้าร่วม';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'นี่คือช่องเสียง เชื่อมต่อเพื่อเริ่มพูดคุย!';

  @override
  String get voiceChannelJoin => 'เข้าร่วมช่องเสียง';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'เชื่อมต่อเสียง';

  @override
  String get voiceChannelNoConnectPermission =>
      'คุณไม่มีสิทธิ์เข้าร่วมช่องเสียงนี้';

  @override
  String get voiceChannelE2eeEncrypted =>
      'ไมโครโฟน กล้อง และเนื้อหาการแชร์หน้าจอเข้ารหัสแบบ end-to-end';

  @override
  String get voiceCallE2eeEncrypted =>
      'ไมโครโฟน กล้อง และเนื้อหาการแชร์หน้าจอเข้ารหัสแบบ end-to-end';

  @override
  String get voiceChannelE2eeBroken =>
      'การเข้ารหัสแบบ end-to-end ไม่พร้อมใช้งานเนื่องจากมีผู้เข้าร่วมที่ไม่รองรับในช่องเสียงนี้';

  @override
  String get voiceCallE2eeBroken =>
      'การเข้ารหัสแบบ end-to-end ไม่พร้อมใช้งานเนื่องจากมีผู้เข้าร่วมที่ไม่รองรับในการโทรนี้';

  @override
  String get voiceE2eeUpdateRequired =>
      'ต้องอัปเดตไคลเอ็นต์นี้ก่อนเข้าร่วมการโทรที่เข้ารหัสนี้';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'ไม่สามารถเปิดไมโครโฟนของคุณได้ คุณยังคงอยู่ในสาย';

  @override
  String get voiceChannelStatusConnecting => 'กำลังเชื่อมต่อ…';

  @override
  String get voiceChannelStatusConnected => 'เชื่อมต่อแล้ว';

  @override
  String get voiceChannelStatusError => 'ข้อผิดพลาด';

  @override
  String get voiceParticipantTooltipMobileDevice => 'อุปกรณ์มือถือ';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'อุปกรณ์เดสก์ท็อป';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'ปิดเสียงโดยชุมชน';

  @override
  String get voiceParticipantTooltipMuted => 'ปิดเสียง';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'ปิดเสียงการได้ยินโดยชุมชน';

  @override
  String get voiceParticipantTooltipDeafened => 'ปิดเสียงการได้ยิน';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'การเชื่อมต่อ: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ผู้เข้าร่วม $count คน',
      one: 'ผู้เข้าร่วม 1 คน',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'ออกจากสาย';

  @override
  String get voiceControlMute => 'ปิดเสียง';

  @override
  String get voiceControlUnmute => 'เปิดเสียง';

  @override
  String get voiceControlDeafen => 'ปิดเสียงการได้ยิน';

  @override
  String get voiceControlUndeafen => 'เปิดเสียงการได้ยิน';

  @override
  String get voiceControlVideo => 'วิดีโอ';

  @override
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => 'แชร์หน้าจอ';

  @override
  String get voiceScreenShareNotificationText => 'กำลังแชร์หน้าจอของคุณ';

  @override
  String get voiceControlMore => 'เพิ่มเติม';

  @override
  String get voiceControlDisconnect => 'ตัดการเชื่อมต่อ';

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
  String get voiceParticipantMenuCommunityMute => 'Community mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Community deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'แชท';

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
  String get voiceTextChatShow => 'แสดงแชท';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ข้อความ',
      one: '# ข้อความ',
    );
    return 'แสดงแชทพร้อมข้อความที่ยังไม่ได้อ่าน $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'ต้องได้รับอนุญาตจากกล้องสำหรับวิดีโอ';

  @override
  String get voiceErrorScreenShareToggle =>
      'ไม่สามารถเริ่มแชร์หน้าจอได้ โปรดลองอีกครั้ง';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'ถูกปฏิเสธสิทธิ์การแชร์หน้าจอ';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'การแชร์หน้าจอไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get voiceWatchStream => 'ดูสตรีม';

  @override
  String get voiceStopWatching => 'หยุดดู';

  @override
  String get voiceStopWatchingCurrentStreamTooltip => 'หยุดดูสตรีมปัจจุบัน';

  @override
  String get voiceOwnScreenShareTitle => 'คุณกำลังถ่ายทอดสด';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'สตรีมของคุณกำลังถ่ายทอดสดสำหรับผู้เข้าร่วม';

  @override
  String get voiceLiveBadge => 'สด';

  @override
  String get dmVoiceViewCall => 'ดูการโทร';

  @override
  String get dmVoiceCallFullScreen => 'เต็มหน้าจอ';

  @override
  String get dmVoiceCallFullScreenTooltip => 'เปิดการโทรแบบเต็มหน้าจอ';

  @override
  String get dmVoiceStripStatusConnecting => 'กำลังเชื่อมต่อ...';

  @override
  String get dmVoiceStripStatusInCall => 'กำลังโทร';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'การโทรด้วยเสียง';

  @override
  String get dmVoiceCallBarConnecting => 'กำลังเชื่อมต่อ...';

  @override
  String get dmVoiceCallBarDirectPrimary => 'การโทรโดยตรง';

  @override
  String get dmVoiceCallBarGroupPrimary => 'การโทรแบบกลุ่ม';

  @override
  String get dmVoiceCallBarIssueFallback => 'ปัญหาเกี่ยวกับเสียง';

  @override
  String get dmVoiceFullscreenTitle => 'เสียง';

  @override
  String get voiceCallBarGuildConnectedFallback => 'เชื่อมต่อเสียงแล้ว';

  @override
  String get notificationsPageTitle => 'การแจ้งเตือน';

  @override
  String get notificationsFilterUnreads => 'ข้อความที่ยังไม่ได้อ่าน';

  @override
  String get notificationsFilterMentions => 'การกล่าวถึง';

  @override
  String get notificationsBookmarksTooltip => 'บุ๊กมาร์ก';

  @override
  String get notificationsMentionFilterTooltip => 'กรองการกล่าวถึง';

  @override
  String get notificationsMentionFiltersTitle => 'ตัวกรองการกล่าวถึง';

  @override
  String get notificationsMentionIncludeEveryone =>
      'รวมการกล่าวถึง @everyone และ @here';

  @override
  String get notificationsMentionIncludeRoles => 'รวมการกล่าวถึงบทบาท';

  @override
  String get notificationsMentionIncludeGuilds => 'รวมการกล่าวถึงชุมชนทั้งหมด';

  @override
  String get notificationsNoUnreadTitle => 'ไม่มีข้อความที่ยังไม่ได้อ่าน';

  @override
  String get notificationsNoUnreadBody => 'คุณอ่านทั้งหมดแล้ว';

  @override
  String get notificationsNoMentionsTitle => 'ไม่มีการกล่าวถึงล่าสุด';

  @override
  String get notificationsNoMentionsBody =>
      'การกล่าวถึงคุณทั้งหมดจะปรากฏที่นี่เป็นเวลา 7 วัน';

  @override
  String get notificationsMentionsEndTitle => 'คุณมาถึงจุดสิ้นสุดแล้ว';

  @override
  String get notificationsMentionsEndBody =>
      'คุณเห็นการกล่าวถึงล่าสุดทั้งหมดแล้ว ไม่ต้องกังวล จะมีเพิ่มเข้ามาอีกเร็วๆ นี้';

  @override
  String get notificationsJump => 'ไปยัง';

  @override
  String get notificationsRemoveMentionTooltip => 'ลบการกล่าวถึง';

  @override
  String get notificationsViewAllUnread => 'ดูข้อความที่ยังไม่ได้อ่านทั้งหมด';

  @override
  String get notificationsMarkAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get notificationsExpand => 'ขยาย';

  @override
  String get notificationsCollapse => 'ย่อ';

  @override
  String get notificationsMessageUnavailable => 'ไม่สามารถโหลดข้อความนี้ได้';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining ตัวอักษรที่เหลือ';
  }

  @override
  String get characterCounterTooLong => 'ข้อความยาวเกินไป';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining ตัวอักษรที่เหลือ รับ $productName เพื่อเขียนได้สูงสุด $premiumMaxLength ตัวอักษร';
  }

  @override
  String get chatMessageFailedToSend => 'ส่งข้อความไม่สำเร็จ';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'ไม่สามารถส่งข้อความของคุณได้ โดยปกติจะเป็นเพราะคุณไม่ได้อยู่ในชุมชนเดียวกับผู้รับ หรือผู้รับยอมรับเฉพาะข้อความส่วนตัวจากเพื่อนเท่านั้น คุณอาจต้องปรับการตั้งค่าความเป็นส่วนตัวข้อความส่วนตัวของคุณใน $settingsPath';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'ไม่สามารถส่งข้อความของคุณได้ คุณต้องยืนยันบัญชีของคุณเพื่อส่งข้อความส่วนตัว';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'ไม่สามารถส่งข้อความของคุณได้ คุณต้องยืนยันบัญชีของคุณเพื่อส่งข้อความ';

  @override
  String get chatSendFailureContentBlocked =>
      'ไม่สามารถส่งข้อความของคุณได้เนื่องจากถูกระบบความปลอดภัยของเราบล็อก หากคุณเชื่อว่านี่เป็นข้อผิดพลาด โปรดติดต่อฝ่ายสนับสนุน';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'ไม่สามารถส่งข้อความของคุณได้เนื่องจากมีอิโมจิหรือสติกเกอร์สำหรับผู้ใหญ่ที่ไม่ได้รับอนุญาตในบริบทนี้';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'มีเพียงคุณเท่านั้นที่เห็นข้อความนี้';

  @override
  String get chatClientSystemDismiss => 'ปิด';

  @override
  String get privacyDashboardCommunicationSection => 'การสื่อสาร';

  @override
  String get privacyDashboardProfilePrivacySection => 'Profile privacy';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Friends & direct messages';

  @override
  String get privacyDashboardActivitySharingSection => 'Activity sharing';

  @override
  String get privacyDashboardSensitiveContentSection => 'Sensitive content';

  @override
  String get privacyDashboardDataExportSection => 'Data export';

  @override
  String get privacyDashboardDataDeletionSection => 'Data deletion';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Who can see your full profile';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Friends and all communities';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Your full profile is visible to friends and to anyone in your communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Friends and small communities only';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Your full profile is visible to friends and members of your communities with 200 or fewer members';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Friends only';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Your full profile is only visible to your friends';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Friend requests';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Everyone';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Allow anyone to send you friend requests';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Friends of Friends';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Allow friends of your friends to send you requests';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Community Members';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Allow members from communities you\'re in to send you requests';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direct messages';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Allow direct messages from community members';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Allow members from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Allow direct messages from community bots';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Allow bots from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Control who can send you friend requests and direct messages';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Control who can call you and add you to group chats';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Incoming calls';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Control who can call you';

  @override
  String get privacyDashboardAllowedCallers => 'Allowed callers';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nobody';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Block all incoming calls';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Friends Only';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Only allow friends to call you (recommended)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Friends + Custom';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Allow friends plus additional groups you choose';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Everyone';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Allow anyone to call you, even strangers';

  @override
  String get privacyDashboardAdditionalGroups => 'Additional Groups';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'People who are friends with your friends can call you';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'People from communities you\'re both in can call you';

  @override
  String get privacyDashboardRingBehavior => 'Ring Behavior';

  @override
  String get privacyDashboardSilentCalls => 'Silent calls from everyone';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'All calls will notify silently instead of ringing. By default, calls from non-friends are always silent.';

  @override
  String get privacyDashboardGroupDmTitle => 'Who Can Add You to Group Chats';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Control who can add you to group chats without asking. Anyone can still send you invite links to join.';

  @override
  String get privacyDashboardAllowedInvites => 'Allowed invites';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Don\'t let anyone add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Only allow friends to add you without asking (recommended)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Allow friends plus additional groups to add you';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Allow anyone to add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'People who are friends with your friends can add you to group chats';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'People from communities you\'re both in can add you to group chats';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Voice activity on active now';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Share your voice activity with friends';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Share voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Stop sharing voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'You\'re about to start sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'You\'re about to stop sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Yes, share with all friends';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Yes, stop sharing';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Available again in $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Voice activity sharing updated';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Couldn\'t update voice activity sharing right now';

  @override
  String get privacyDashboardDataExportDesc =>
      'Build a downloadable archive of your account data, including messages and attachment URLs. Most people want everything, but you can narrow the scope below.';

  @override
  String get privacyDashboardExportMyData => 'Export my data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Permanently remove messages you have sent across DMs, group DMs, and communities. The work runs in the background, and you will get a DM when it finishes.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Delete my messages';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Allow direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Block direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Allow bots to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Block bots from sending you direct messages?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Do you also want to allow direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Do you also want to block direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Do you also want to allow bots from your existing communities to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Do you also want to block bots from your existing communities?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'You can also change this setting per-community by long-pressing the community name and selecting Privacy Settings.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Allow for all communities';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Block for all communities';

  @override
  String get privacyDashboardDmConfirmSkip => 'Skip this step';

  @override
  String get privacyDashboardDataRequestGoBack => 'Go back';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Export my data';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Delete my messages';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'We\'ll process this as soon as possible. You\'ll get an email when your archive is ready.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'We\'ll process this as soon as possible. You\'ll get a DM from us when it\'s done.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'What to include';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Everything';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Export every message you have ever sent, plus all of your account settings, memberships, and metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Custom selection';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Choose which conversation kinds, communities, and time window to include in the archive.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Choose what to include';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pick which kinds of conversations to clean up.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Only places I can\'t access anymore';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Only delete messages from communities and group DMs you have left or been removed from.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Which conversations';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Toggle the kinds of conversations you want included.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Open DMs';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Closed DMs';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Which communities';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Community filter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Include all except selected';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Only the selected ones';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'You aren\'t in any communities right now.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Time range';

  @override
  String get privacyDashboardDataRequestDateMode => 'Time range';

  @override
  String get privacyDashboardDataRequestAllTime => 'All time';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Custom range';

  @override
  String get privacyDashboardDataRequestStartDate => 'Start date';

  @override
  String get privacyDashboardDataRequestEndDate => 'End date';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Leave either field blank to leave that end of the window unbounded.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Pick at least one kind of conversation to include.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Start date must be earlier than end date.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Review and confirm';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'We\'ll build a downloadable archive of every message you have ever sent and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'We\'ll build a downloadable archive that matches the filters below and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Permanently delete the messages that match the filters below. This cannot be undone.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'There is no recovery once this starts. We will DM you when it finishes.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Request export';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Delete messages';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Scope';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversations';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Time range';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'None';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'From $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Until $end';
  }

  @override
  String privacyDashboardDataRequestSummaryBetween(String start, String end) {
    return '$start – $end';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildExclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'All except $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'Only $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Open direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Closed direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direct messages (open and closed)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communities';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0 and $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# seconds',
      one: '# second',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Failed to load privacy settings';

  @override
  String get privacyDashboardRetry => 'Retry';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Failed to save sensitive content settings.';

  @override
  String get privacyDashboardDataRequestFailed => 'Failed to complete request.';

  @override
  String get chatMessageDeleteFailed => 'ล้มเหลวในการลบข้อความ';

  @override
  String get chatMessageAddReaction => 'เพิ่มอิโมจิ';

  @override
  String get chatMessageEdit => 'แก้ไขข้อความ';

  @override
  String get chatMessageReply => 'ตอบกลับ';

  @override
  String get chatMessageForward => 'ส่งต่อ';

  @override
  String get forwardMessageTitle => 'ส่งต่อข้อความ';

  @override
  String get forwardSearchHint => 'ค้นหาแชทหรือ DM';

  @override
  String get forwardDirectMessagesSection => 'ข้อความส่วนตัว';

  @override
  String get forwardCommentHint => 'เพิ่มความคิดเห็น (ไม่บังคับ)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'ส่ง ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'ไม่พบแชท';

  @override
  String get forwardSuccessToast => 'ส่งต่อข้อความสำเร็จ';

  @override
  String get forwardFailed => 'ล้มเหลวในการส่งต่อข้อความ';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'ไม่สามารถแสดงความคิดเห็นได้เนื่องจากช่องที่เลือกเปิดใช้งานโหมดหน่วงเวลา';

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
      'คุณไม่สามารถส่งข้อความที่นี่ได้';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'คุณไม่สามารถฝังลิงก์ที่นี่ได้';

  @override
  String get forwardDestinationNoAttachPermission =>
      'คุณไม่สามารถแนบไฟล์ที่นี่ได้';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'การส่งข้อความถูกปิดใช้งานในชุมชนนี้';

  @override
  String get forwardDestinationTimedOut => 'คุณถูกจำกัดการสื่อสารในชุมชนนี้';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'โหมดหน่วงเวลา - รอ $remaining';
  }

  @override
  String get chatMessageCopyText => 'คัดลอกข้อความ';

  @override
  String get chatMessageTranslate => 'Translate';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Translated from $language';
  }

  @override
  String get chatMessageSeeOriginal => 'See original';

  @override
  String get chatMessageSeeTranslation => 'See translation';

  @override
  String get chatMessageTranslating => 'Translating…';

  @override
  String get chatMessageTranslateFailed => 'Couldn\'t translate this message.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Translation isn\'t available on this device.';

  @override
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

  @override
  String get chatMessagePin => 'ปักหมุดข้อความ';

  @override
  String get chatMessageUnpin => 'ยกเลิกการปักหมุดข้อความ';

  @override
  String get chatMessageUnpinIt => 'ยกเลิกการปักหมุด';

  @override
  String get chatMessageBookmark => 'บุ๊กมาร์กข้อความ';

  @override
  String get chatMessageRemoveBookmark => 'ลบที่คั่นหน้า';

  @override
  String get chatMessageMarkAsUnread => 'ทำเครื่องหมายว่ายังไม่ได้อ่าน';

  @override
  String get chatMessageCopyMessageLink => 'คัดลอกลิงก์ข้อความ';

  @override
  String get chatMessageCopyMessageId => 'คัดลอก ID ข้อความ';

  @override
  String get chatMessageViewReactions => 'ดูอิโมจิ';

  @override
  String get chatMessageRemoveAllReactions => 'ลบอิโมจิทั้งหมด';

  @override
  String get chatMessageDebug => 'ดีบักข้อความ';

  @override
  String get chatMessageDebugSheetTitle => 'ดีบักข้อความ';

  @override
  String get chatMessageDebugCopyJson => 'คัดลอก JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'คัดลอก JSON ข้อความไปยังคลิปบอร์ดแล้ว';

  @override
  String get chatReactionsSheetTitle => 'อิโมจิ';

  @override
  String get chatReactionsSheetEmpty => 'ยังไม่มีใครแสดงอิโมจินี้';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'รายงานข้อความ';

  @override
  String get iarReportMessageTitle => 'รายงานข้อความ';

  @override
  String get iarThisUserFallback => 'ผู้ใช้รายนี้';

  @override
  String get iarModalDescription =>
      'รายงานการละเมิดกฎ หรือค้นหาเครื่องมือเพื่อจัดการการติดต่อและการตั้งค่า';

  @override
  String get iarPathStepAriaLabel => 'คุณต้องการอะไร?';

  @override
  String get iarCategoryStepTitle => 'ละเมิดกฎประเภทใด?';

  @override
  String get iarReasonStepTitle => 'ละเมิดกฎข้อใด?';

  @override
  String get iarReasonSelectHint => 'เลือกเหตุผล';

  @override
  String get iarPickAnOptionToast => 'เลือกตัวเลือกเพื่อดำเนินการต่อ';

  @override
  String get iarPickARuleToast => 'เลือกกฎที่ละเมิด';

  @override
  String get iarPathPlatform => 'รายงานการละเมิดกฎแพลตฟอร์ม';

  @override
  String get iarPathCommunity => 'รายงานต่อผู้ดูแลชุมชนนี้';

  @override
  String get iarPathPreferenceMessage => 'ฉันไม่ชอบเนื้อหานี้';

  @override
  String get iarCategoryTargetedHarmLabel => 'การคุกคาม การข่มขู่ หรืออันตราย';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'การกลั่นแกล้ง การข่มขู่ การเกลียดชัง ความรุนแรง การบุกโจมตี หรือเนื้อหาที่ส่งเสริมการทำร้ายตนเอง';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'ความปลอดภัยของเด็กหรือเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'เด็กตกอยู่ในความเสี่ยง เนื้อหาสำหรับผู้ใหญ่ในที่ที่ไม่เหมาะสม หรือพฤติกรรมที่ไม่พึงประสงค์';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'ความเป็นส่วนตัวหรือการปลอมแปลงตัวตน';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'การเปิดเผยข้อมูลส่วนตัว การสะกดรอยตาม การแอบอ้างเป็นผู้อื่น หรือโปรไฟล์ที่ไม่เหมาะสม';

  @override
  String get iarCategoryDeceptionLabel => 'การหลอกลวง มัลแวร์ หรือข้อมูลเท็จ';

  @override
  String get iarCategoryDeceptionDescription =>
      'ฟิชชิง การฉ้อโกง ลิงก์ที่เป็นอันตราย หรือการอ้างเท็จที่อาจก่อให้เกิดอันตรายในโลกจริง';

  @override
  String get iarCategoryIllegalOtherLabel => 'กิจกรรมที่ผิดกฎหมาย หรืออื่นๆ';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'การขายที่ผิดกฎหมาย การอำนวยความสะดวกทางอาญา หรือการละเมิดกฎที่ชัดเจนซึ่งไม่เข้าข่ายข้างต้น';

  @override
  String get iarReasonHarassmentLabel => 'การคุกคามหรือการข่มขู่';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'การกลั่นแกล้ง การติดต่อที่ไม่ต้องการซ้ำๆ การสะกดรอยตาม หรือการล่วงละเมิดที่มุ่งเป้า';

  @override
  String get iarReasonHateLabel => 'คำพูดแสดงความเกลียดชัง';

  @override
  String get iarReasonHateMessageDescription =>
      'การใช้คำหยาบ การลดทอนความเป็นมนุษย์ หรือการโจมตีกลุ่มที่ได้รับการคุ้มครอง';

  @override
  String get iarReasonViolenceLabel =>
      'ความรุนแรงหรือการข่มขู่ว่าจะใช้ความรุนแรง';

  @override
  String get iarReasonViolenceDescription =>
      'การข่มขู่ที่น่าเชื่อถือ ความรุนแรงที่โจ่งแจ้ง หรือการยกย่องความรุนแรง';

  @override
  String get iarReasonMatureContentLabel => 'เนื้อหาสำหรับผู้ใหญ่หรือการคุกคาม';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'พฤติกรรมที่ไม่พึงประสงค์หรือเนื้อหาสำหรับผู้ใหญ่ในที่ที่ไม่เหมาะสม';

  @override
  String get iarReasonChildSafetyLabel =>
      'ความปลอดภัยของเด็กหรือการแสวงหาประโยชน์จากผู้เยาว์';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'เนื้อหาเกี่ยวกับการชักจูงหรือการแสวงหาประโยชน์จากเด็ก';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'ข้อมูลเท็จที่เป็นอันตราย';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'การอ้างเท็จที่อาจก่อให้เกิดอันตรายในโลกจริง';

  @override
  String get iarReasonSpamLabel => 'สแปม การหลอกลวง หรือฟิชชิง';

  @override
  String get iarReasonSpamMessageDescription =>
      'สแปมจำนวนมาก การฉ้อโกง การแจกของรางวัลปลอม หรือการละเมิดบัญชี';

  @override
  String get iarReasonMalwareLabel => 'มัลแวร์หรือลิงก์อันตราย';

  @override
  String get iarReasonMalwareDescription =>
      'มัลแวร์ การขโมยข้อมูลประจำตัว หรือไฟล์ที่เป็นอันตราย';

  @override
  String get iarReasonPrivacyLabel => 'การละเมิดความเป็นส่วนตัว';

  @override
  String get iarReasonPrivacyDescription =>
      'การเปิดเผยข้อมูลส่วนตัว ข้อมูลส่วนตัวที่ถูกเปิดเผย หรือการสะกดรอยตาม';

  @override
  String get iarReasonImpersonationLabel =>
      'การปลอมแปลงตัวตนหรือสื่อที่หลอกลวง';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'การแอบอ้างเป็นผู้อื่น รวมถึงเนื้อหาที่สร้างโดย AI ที่หลอกลวง';

  @override
  String get iarReasonIllegalLabel => 'กิจกรรมที่ผิดกฎหมาย';

  @override
  String get iarReasonIllegalDescription =>
      'การขายที่ผิดกฎหมาย การอำนวยความสะดวกทางอาญา หรือกิจกรรมที่ผิดกฎหมาย';

  @override
  String get iarReasonSelfHarmLabel => 'การทำร้ายตนเองหรือการฆ่าตัวตาย';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'การส่งเสริมหรือคำแนะนำที่กระตุ้นให้เกิดการทำร้ายตนเองหรือความผิดปกติของการกิน';

  @override
  String get iarReasonOtherLabel => 'การละเมิดกฎที่ชัดเจนอื่นๆ';

  @override
  String get iarReasonOtherDescription =>
      'ใช้เฉพาะเมื่อละเมิดกฎของ Fluxer อย่างชัดเจนและไม่เข้าข่ายข้างต้น';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'หากเกี่ยวข้องกับผู้เยาว์ ให้ใช้ \"$childSafetyReason\" แทน';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'หากเกี่ยวข้องกับ CSAM หรือการแสวงหาประโยชน์จากผู้เยาว์ โปรดส่งทันทีและอย่าแชร์เนื้อหาซ้ำ';

  @override
  String get iarSafetyNoteSelfHarm =>
      'หากมีผู้ที่อาจตกอยู่ในอันตรายทันที โปรดติดต่อบริการฉุกเฉินในพื้นที่หากคุณสามารถทำได้อย่างปลอดภัย';

  @override
  String get iarSafetyNoteViolence =>
      'หากเป็นการข่มขู่ที่ใกล้จะเกิดขึ้นและน่าเชื่อถือ โปรดติดต่อบริการฉุกเฉินในพื้นที่ด้วย';

  @override
  String get iarSafetyNoteTerrorism =>
      'หากเป็นการคุกคามการก่อการร้ายที่ใกล้จะเกิดขึ้น โปรดติดต่อบริการฉุกเฉินในพื้นที่ด้วย';

  @override
  String get iarActionBlockUserTitle => 'บล็อกผู้ใช้นี้';

  @override
  String get iarActionBlockUserDescription => 'หยุดรับข้อความและคำขอเป็นเพื่อน';

  @override
  String get iarActionBlockUserButton => 'บล็อก';

  @override
  String get iarActionCopyMessageLinkTitle => 'คัดลอกลิงก์ข้อความ';

  @override
  String get iarActionCopyMessageLinkDescription => 'แชร์กับผู้ดูแลชุมชน';

  @override
  String get iarActionCopyMessageLinkButton => 'คัดลอก';

  @override
  String get iarActionCloseDmTitle => 'ปิด DM นี้';

  @override
  String get iarActionCloseDmDescription =>
      'ไม่บล็อก คุณสามารถเปิดใหม่ได้ในภายหลัง';

  @override
  String get iarActionCloseDmButton => 'ปิด DM';

  @override
  String get iarActionLeaveCommunityTitle => 'ออกจากชุมชน';

  @override
  String get iarActionLeaveCommunityDescription => 'หยุดดูเนื้อหาและสมาชิก';

  @override
  String get iarActionLeaveCommunityButton => 'ออก';

  @override
  String get iarActionDmSettingsTitle => 'การตั้งค่า DM และคำขอเป็นเพื่อน';

  @override
  String get iarActionDmSettingsDescription =>
      'เปลี่ยนผู้ที่สามารถติดต่อคุณได้';

  @override
  String get iarActionCallSettingsTitle => 'การตั้งค่าการโทรและแชทกลุ่ม';

  @override
  String get iarActionCallSettingsDescription =>
      'เปลี่ยนผู้ที่สามารถโทรหาหรือเพิ่มคุณได้';

  @override
  String get iarActionOpenButton => 'เปิด';

  @override
  String get iarActionDeleteMessageTitle => 'ลบข้อความนี้';

  @override
  String get iarActionDeleteMessageDescription => 'ลบออกจากช่องสำหรับทุกคน';

  @override
  String get iarActionDeleteMessageButton => 'ลบ';

  @override
  String get iarActionDeleteMessageDeletedButton => 'ลบแล้ว';

  @override
  String get iarActionDeleteMessageDeletedTooltip => 'ข้อความนี้ถูกลบไปแล้ว';

  @override
  String get iarActionBanUserTitle => 'แบนผู้ใช้รายนี้';

  @override
  String get iarActionBanUserDescription => 'เปิดหน้าต่างแบนสำหรับชุมชนนี้';

  @override
  String get iarActionBanUserButton => 'แบน';

  @override
  String get iarActionBanUserBannedButton => 'ถูกแบนแล้ว';

  @override
  String get iarActionBanUserBannedTooltip => 'ผู้ใช้รายนี้ถูกแบนจากชุมชนแล้ว';

  @override
  String get iarCloseDmConfirmTitle => 'ปิด DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'ปิด DM ปัจจุบันของคุณกับ $name การดำเนินการนี้จะไม่บล็อกพวกเขา คุณสามารถเปิดใหม่ได้ในภายหลัง';
  }

  @override
  String get iarSuccessTitle => 'ส่งรายงานแล้ว';

  @override
  String get iarSuccessBody =>
      'ทีมความปลอดภัยของเรากำลังตรวจสอบรายงาน เราจะส่ง DM และอีเมลถึงคุณเมื่อได้ข้อสรุปแล้ว';

  @override
  String get iarAlreadyReportedTitle => 'รายงานแล้ว';

  @override
  String get iarAlreadyReportedBody =>
      'คุณได้รายงานข้อความนี้แล้ว ทีมความปลอดภัยของเรากำลังตรวจสอบรายงาน';

  @override
  String get iarBackButton => 'ย้อนกลับ';

  @override
  String get iarContinueButton => 'ต่อไป';

  @override
  String get iarSendReportButton => 'ส่งรายงาน';

  @override
  String get iarDoneButton => 'เสร็จสิ้น';

  @override
  String get iarCouldntSendToast => 'ไม่สามารถส่งรายงานได้ โปรดลองอีกครั้ง';

  @override
  String get iarRateLimitedToast =>
      'คุณกำลังรายงานเร็วเกินไป โปรดรอสักครู่แล้วลองอีกครั้ง';

  @override
  String get iarReportSentToast =>
      'ส่งรายงานแล้ว ทีมความปลอดภัยของเราจะตรวจสอบ';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'บล็อก $name หรือไม่? พวกเขาจะไม่สามารถส่งข้อความถึงคุณหรือส่งคำขอเป็นเพื่อนได้ คุณสามารถเลิกบล็อกพวกเขาได้ในภายหลัง';
  }

  @override
  String get iarBlockUserFailedToast =>
      'ไม่สามารถบล็อกผู้ใช้รายนี้ได้ โปรดลองอีกครั้ง';

  @override
  String get iarCloseDmSuccessToast => 'ปิด DM แล้ว';

  @override
  String get iarCloseDmFailedToast => 'ไม่สามารถปิด DM นี้ได้ โปรดลองอีกครั้ง';

  @override
  String get iarLeaveCommunityFailedToast =>
      'ไม่สามารถออกจากชุมชนนี้ได้ โปรดลองอีกครั้ง';

  @override
  String get chatMessageSuppressEmbeds => 'ซ่อน Embeds';

  @override
  String get chatMessageUnsuppressEmbeds => 'แสดง Embeds';

  @override
  String get chatMessageDelete => 'ลบข้อความ';

  @override
  String get chatMessageDeleteConfirmTitle => 'ลบข้อความ';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบข้อความนี้';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'เพิ่มเติม';

  @override
  String get chatEditingMessage => 'กำลังแก้ไขข้อความ';

  @override
  String get chatReplyOriginalDeleted => 'ข้อความต้นฉบับถูกลบแล้ว';

  @override
  String get chatReplyOriginalFailedToLoad => 'ไม่สามารถโหลดข้อความต้นฉบับได้';

  @override
  String get chatReplyAttachedMedia => 'ข้อความมีสื่อที่แนบมา';

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
  String get chatMessagesLoadError => 'ไม่สามารถโหลดข้อความได้';

  @override
  String get chatReplyMentionOverrideTitle =>
      'ต้องการแทนที่การตั้งค่าการกล่าวถึงหรือไม่?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname ต้องการให้ @กล่าวถึงเมื่อตอบกลับ ส่งโดยไม่กล่าวถึงอยู่ดีหรือไม่?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname ต้องการให้ตอบกลับโดยไม่มีการ @mention คุณต้องการส่งโดยมีการ mention อยู่ดีหรือไม่?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'ไม่สนใจการตั้งค่า';

  @override
  String get chatReplyMentionDisableTooltip =>
      'คลิกเพื่อปิดการแจ้งเตือนผู้ที่คุณกำลังตอบกลับ';

  @override
  String get chatReplyMentionEnableTooltip =>
      'คลิกเพื่อเปิดการแจ้งเตือนผู้ที่คุณกำลังตอบกลับ';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Mention ผู้ที่ตอบกลับ';

  @override
  String get chatReplyMentionOn => 'เปิด';

  @override
  String get chatReplyMentionOff => 'ปิด';

  @override
  String get chatReplyCancel => 'ยกเลิกการตอบกลับ';

  @override
  String get chatEditMessageHint => 'แก้ไขข้อความ';

  @override
  String get chatEditNoChanges => 'ไม่มีการเปลี่ยนแปลงที่จะบันทึก';

  @override
  String get chatChannelNotReady =>
      'ช่องนี้ยังไม่พร้อม โปรดลองอีกครั้งในสักครู่';

  @override
  String get chatMessageEdited => '(แก้ไข)';

  @override
  String get chatMessageSilent => 'นี่คือข้อความ @silent';

  @override
  String chatMessageTimestampToday(String time) {
    return 'วันนี้ เวลา $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'เมื่อวานนี้ เวลา $time';
  }

  @override
  String get mediaViewerImagePreview => 'แสดงตัวอย่างรูปภาพ';

  @override
  String get mediaViewerClose => 'ปิดโปรแกรมดูสื่อ';

  @override
  String get mediaViewerOpenInBrowser => 'เปิดในเบราว์เซอร์';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'ส่งต่อ';

  @override
  String get mediaViewerZoomIn => 'ซูมเข้า';

  @override
  String get mediaViewerZoomOut => 'ซูมออก';

  @override
  String get mediaViewerPreviousAttachment => 'ไฟล์แนบก่อนหน้า';

  @override
  String get mediaViewerNextAttachment => 'ไฟล์แนบถัดไป';

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
  String get chatAttachmentVideoToggleControls => 'สลับการควบคุมวิดีโอ';

  @override
  String get chatAttachmentVideoMute => 'ปิดเสียงวิดีโอ';

  @override
  String get chatAttachmentVideoUnmute => 'เปิดเสียงวิดีโอ';

  @override
  String get chatAttachmentVideoPlay => 'เล่นวิดีโอ';

  @override
  String get chatAttachmentVideoPause => 'หยุดวิดีโอชั่วคราว';

  @override
  String get chatAttachmentVideoProgress => 'ความคืบหน้าวิดีโอ';

  @override
  String get chatVideoPlaybackFailed => 'ไม่สามารถเล่นวิดีโอนี้ได้';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'แจ้งเตือนผู้ใช้ที่มีบทบาทนี้ซึ่งได้รับอนุญาตให้ดูช่องนี้';

  @override
  String get addGuildModalTitle => 'เพิ่มชุมชน';

  @override
  String get addGuildModalLandingDescription =>
      'สร้างชุมชนใหม่หรือเข้าร่วมชุมชนที่มีอยู่';

  @override
  String get addGuildCreateCommunity => 'สร้างชุมชน';

  @override
  String get addGuildJoinCommunity => 'เข้าร่วมชุมชน';

  @override
  String get addGuildImportDiscordTemplate => 'นำเข้าเทมเพลต Discord';

  @override
  String get addGuildJoinTitle => 'เข้าร่วมชุมชน';

  @override
  String get addGuildJoinDescription => 'ป้อนลิงก์เชิญเพื่อเข้าร่วมชุมชน';

  @override
  String get addGuildInviteLinkLabel => 'ลิงก์เชิญ';

  @override
  String get addGuildJoinSubmit => 'เข้าร่วมชุมชน';

  @override
  String get addGuildInviteInvalid => 'คำเชิญนี้ไม่ถูกต้องหรือไม่ถูกต้องแล้ว';

  @override
  String get addGuildJoinFailed => 'ไม่สามารถเข้าร่วมชุมชนได้ โปรดลองอีกครั้ง';

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
  String get addGuildPackInstalled => 'ติดตั้งแพ็กสำเร็จแล้ว';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'ลบอิโมจิทั้งหมด';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบอิโมจิทั้งหมดออกจากข้อความนี้';

  @override
  String get chatMessageUnpinConfirmTitle => 'ยกเลิกการปักหมุดข้อความ';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'ส่งหมุดนี้กลับไปในอดีตหรือไม่';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username ปักหมุด $messageLink ไว้ในช่องนี้ ดู $allPinsLink';
  }

  @override
  String get systemPinMessageMessageLink => 'ข้อความ';

  @override
  String get systemPinMessageAllPinsLink => 'ข้อความที่ปักหมุดทั้งหมด';

  @override
  String get channelPinsEmptyTitle => 'ไม่มีข้อความปักหมุด';

  @override
  String get channelPinsEmptyDescription => 'ข้อความปักหมุดจะแสดงที่นี่';

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
  String get channelDetailsSearchFilterIn => 'In';

  @override
  String get channelDetailsSearchFilterMentions => 'Mentions';

  @override
  String get channelDetailsSearchFilterMore => 'More';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Active';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count channels';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count users';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'User';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filter by channel';

  @override
  String get channelDetailsSearchChannelsHint => 'Search channels';

  @override
  String get channelDetailsSearchChannelsEmpty => 'No channels found';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Pinned';

  @override
  String get channelDetailsSearchPinnedTrue => 'Pinned only';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclude pinned';

  @override
  String get channelDetailsSearchClearFilter => 'Clear';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Author type';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Date';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Date mode';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Pick a date';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link hostname';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filename contains';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'File extension';

  @override
  String get channelDetailsSearchContentPoll => 'Poll';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Messages with a poll';

  @override
  String get channelDetailsSearchContentForward => 'Forward';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Forwarded messages';

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
  String get personalNotesTitle => 'บันทึกส่วนตัว';

  @override
  String get personalNotesSubtitle =>
      'พื้นที่ส่วนตัวของคุณสำหรับความคิดและสิ่งเตือนใจ';

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
    return 'ยินดีต้อนรับสู่ $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'ในตอนแรก ไม่มีอะไรเลย จากนั้นก็มี $channelName และมันก็ดี';
  }

  @override
  String get personalNotesComposerHint => 'ส่งข้อความถึงตัวเอง';

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
  String get personalNotesPrivateSpace => 'พื้นที่ส่วนตัวของคุณ';

  @override
  String get purgePersonalNotes => 'ล้างบันทึกส่วนตัว';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'การดำเนินการนี้จะลบข้อความและไฟล์แนบทั้งหมดในบันทึกส่วนตัวของคุณอย่างถาวร ซึ่งไม่สามารถยกเลิกได้';

  @override
  String get purgePersonalNotesConfirmButton => 'ล้าง';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'ล้างข้อความ $count รายการออกจากบันทึกส่วนตัวแล้ว';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'บันทึกส่วนตัวว่างเปล่าอยู่แล้ว';

  @override
  String get purgePersonalNotesFailed => 'ไม่สามารถล้างบันทึกส่วนตัวได้';

  @override
  String get userSettingsGroupYourAccount => 'บัญชีของคุณ';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Search settings...';

  @override
  String get userSettingsSearchFieldLabel => 'Search settings';

  @override
  String get userSettingsSearchClear => 'Clear search';

  @override
  String get userSettingsSearchNoResults => 'No settings found';

  @override
  String get userSettingsNavProfile => 'โปรไฟล์';

  @override
  String get userSettingsNavSecurityLogin => 'ความปลอดภัยและการเข้าสู่ระบบ';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'ของขวัญและรหัส';

  @override
  String get giftSettingsClaimAccountTitle => 'Claim your account';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Claim your account to redeem or manage Plutonium gift codes.';

  @override
  String get giftSettingsRedeemTitle => 'Redeem a gift';

  @override
  String get giftSettingsRedeemDescription =>
      'Enter a gift code to redeem Plutonium for your account.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Enter gift code…';

  @override
  String get giftSettingsRedeemButton => 'Redeem';

  @override
  String get giftSettingsRedeemSuccess =>
      'Gift redeemed successfully. Enjoy your Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Purchased gifts';

  @override
  String get giftSettingsPurchasedDescription =>
      'Manage your purchased Plutonium gift codes. Share the gift URL with someone special or redeem it for yourself!';

  @override
  String get giftSettingsEmptyTitle => 'No gifts yet';

  @override
  String get giftSettingsEmptyDescription =>
      'Buy a Plutonium gift from the Plutonium tab to share with friends.';

  @override
  String get giftSettingsGoToPlutonium => 'Go to Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Failed to load gift inventory';

  @override
  String get giftSettingsLoadFailedDescription => 'Try again later.';

  @override
  String get giftSettingsTryAgain => 'Try again';

  @override
  String get giftSettingsGiftUrl => 'Gift URL';

  @override
  String get giftSettingsCopy => 'Copy';

  @override
  String get giftSettingsCopied => 'Copied';

  @override
  String get giftSettingsGiftUrlCopied => 'Gift URL copied to clipboard!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Couldn\'t copy gift URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Purchased $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Redeemed $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Redeemed by $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'This gift has been redeemed';

  @override
  String get giftSettingsRedeemForYourself => 'Redeem for yourself';

  @override
  String get giftSettingsShareWithFriend => 'Share with a friend';

  @override
  String get premiumPlutoniumTagline =>
      'Unlock higher limits and exclusive features while supporting an independent communication platform.';

  @override
  String get premiumPurchaseMode => 'Purchase mode';

  @override
  String get premiumForMe => 'For me';

  @override
  String get premiumAsAGift => 'As a gift';

  @override
  String get premiumMonthly => 'Monthly';

  @override
  String get premiumYearly => 'Yearly';

  @override
  String get premiumPerMonth => 'per month';

  @override
  String get premiumPerYear => 'per year';

  @override
  String get premiumOneTimePurchase => 'one-time purchase';

  @override
  String get premiumSave17 => 'Save 17%';

  @override
  String get premiumUpgradeNow => 'Upgrade now';

  @override
  String get premiumBuyGift => 'Buy gift';

  @override
  String get premiumOneYearGift => '1 year gift';

  @override
  String get premiumOneMonthGift => '1 month gift';

  @override
  String get premiumMostPopular => 'Most popular';

  @override
  String get premiumScrollPrompt =>
      'Scroll down to view all the perks included with Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Free vs Plutonium';

  @override
  String get premiumFreeColumn => 'Free';

  @override
  String get premiumGiftSectionTitle => 'Gift Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Share the Plutonium experience with your friends by purchasing a gift subscription.';

  @override
  String get premiumGiftBannerOne =>
      'You have a new gift code waiting for you!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'You have $count new gift codes waiting for you!';
  }

  @override
  String get premiumViewGifts => 'View gifts';

  @override
  String get premiumReadyToUpgrade => 'Ready to upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Ready to buy a gift?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Monthly $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Yearly $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 year $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 month $price';
  }

  @override
  String get premiumManageSubscription => 'Manage subscription';

  @override
  String get premiumRedeemGiftCode => 'Redeem gift code';

  @override
  String get premiumGiftBadge => 'Gift';

  @override
  String get premiumCancelSubscriptionTitle => 'Cancel subscription?';

  @override
  String get premiumCancelSubscriptionBody =>
      'You keep your perks until your next renewal date, then have a 3-day grace period to resubscribe and keep your subscriber history.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancel subscription';

  @override
  String get premiumKeepSubscription => 'Keep subscription';

  @override
  String get premiumPurchaseHistoryTitle => 'Purchase history';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Your recent invoices. To change the payment method for your subscription, add or choose one in the billing portal and make it the default.';

  @override
  String get premiumManagePaymentMethods => 'Manage payment methods';

  @override
  String get premiumBillingHistory => 'Billing history';

  @override
  String get premiumSelfServeRefundTitle => 'Self-serve refund';

  @override
  String get premiumSelfServeRefundButton => 'Refund latest purchase';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'By purchasing, you agree to our ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'By purchasing, you agreed to our ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' and ';

  @override
  String premiumActiveUntil(String date) {
    return 'Active until $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Canceling';

  @override
  String premiumCancelsOn(String date) {
    return 'Cancels on $date. Perks remain active until then.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivate';

  @override
  String premiumGiftedUntil(String date) {
    return 'Gifted until $date. Does not renew automatically.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Feature';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'By purchasing, you agreed to our $terms and $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Self-serve refunds available within 3 days of payment, once every 30 days. Refunding a subscription cancels it. EU/EEA buyers waive the 14-day right of withdrawal at checkout to access content immediately. Use the in-app refund button instead of a chargeback. Chargebacks can permanently restrict your account. Stripe handles payment securely. We never see your full card number.';

  @override
  String get premiumTermsOfService => 'Terms of service';

  @override
  String get premiumPrivacyPolicy => 'Privacy policy';

  @override
  String get premiumCheckoutStartFailedTitle => 'Couldn\'t start checkout';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Something went wrong while starting checkout. Please try again in a moment.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'You\'re currently on a gift subscription. It won\'t renew. You can redeem more gift codes to extend it. Recurring subscriptions can be started after your gift time ends.';

  @override
  String get premiumPlanUnavailable =>
      'This plan isn\'t available. Contact support.';

  @override
  String get premiumCompletePaymentTitle => 'Complete payment';

  @override
  String get premiumCompletePaymentBody =>
      'You are now navigating to Stripe to complete the payment. Return to Fluxer once you\'ve completed it.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Choose payment method';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pay with Pix automático to authorize recurring charges directly from your Brazilian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUsePix => 'Use Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Pay with UPI to set up an RBI-compliant e-mandate from your Indian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUseUpi => 'Use UPI';

  @override
  String get premiumUseCard => 'Use card';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Couldn\'t open the billing portal';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Something went wrong while opening the billing portal. Please try again in a moment.';

  @override
  String get premiumAlreadyVisionaryTitle => 'You\'re already Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary already includes permanent access, so a recurring subscription isn\'t needed. You can still buy gifts for others.';

  @override
  String get premiumExistingSubscriptionTitle => 'Subscription already exists';

  @override
  String get premiumExistingSubscriptionBody =>
      'We found an existing Fluxer Plutonium subscription for this account. Manage it in the secure billing portal to update payment details or check renewal status. If you just paid, wait a minute and reopen this page.';

  @override
  String get premiumPurchasesDisabledTitle => 'Purchases unavailable';

  @override
  String get premiumPurchasesDisabledBody =>
      'Purchases are disabled for this account. Contact support@fluxer.app if this looks wrong.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Claim your account to purchase Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'You need to verify your email before you can purchase Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Custom username tag';

  @override
  String get premiumPerkPerCommunityProfiles => 'Per-community profiles';

  @override
  String get premiumPerkMessageScheduling => 'Message scheduling';

  @override
  String get premiumPerkProfileBadge => 'Profile badge';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Custom video backgrounds';

  @override
  String get premiumPerkEntranceSounds => 'Entrance sounds';

  @override
  String get premiumPerkCommunities => 'Communities';

  @override
  String get premiumPerkMessageCharacterLimit => 'Message character limit';

  @override
  String get premiumPerkBookmarkedMessages => 'Bookmarked messages';

  @override
  String get premiumPerkFileUploadSize => 'File upload size';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji & sticker packs';

  @override
  String get premiumPerkSavedMedia => 'Saved media';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Use animated emojis';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Global emoji & sticker access';

  @override
  String get premiumPerkVideoQuality => 'Video quality';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animated avatars & profile banners';

  @override
  String get premiumPerkEarlyAccess => 'Early access to new features';

  @override
  String get premiumPerkCustomThemes => 'Custom themes';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Up to 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => 'แดชบอร์ดความเป็นส่วนตัว';

  @override
  String get userSettingsNavAuthorizedApps => 'แอปที่ได้รับอนุญาต';

  @override
  String get userSettingsNavBlockedUsers => 'ผู้ใช้ที่ถูกบล็อก';

  @override
  String get userSettingsNavLinkedDevices => 'อุปกรณ์ที่เชื่อมโยง';

  @override
  String get userSettingsNavConnections => 'การเชื่อมต่อ';

  @override
  String get userSettingsNavLookAndFeel => 'รูปลักษณ์และการแสดงผล';

  @override
  String get userSettingsNavAccessibility => 'การช่วยสำหรับการเข้าถึง';

  @override
  String get userSettingsNavChat => 'ข้อความและสื่อ';

  @override
  String get userSettingsNavAudioAndVideo => 'เสียงและวิดีโอ';

  @override
  String get userSettingsNavShortcuts => 'Shortcuts';

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
  String get userSettingsNavLanguageAndTime => 'ภาษาและเวลา';

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
  String get userSettingsNavAdvanced => 'ขั้นสูง';

  @override
  String get advancedPerformanceReportingTitle => 'การรายงานประสิทธิภาพ';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'ช่วยปรับปรุง Fluxer ด้วยการแชร์ข้อมูลประสิทธิภาพและข้อมูลขัดข้องแบบไม่ระบุตัวตน';

  @override
  String get advancedPerformanceReportingLabel =>
      'ส่งรายงานข้อขัดข้องและประสิทธิภาพ';

  @override
  String get advancedPerformanceReportingDescription =>
      'ข้อมูลที่รายงานทั้งหมดไม่ระบุตัวตนและจะถูกส่งไปยังบริการตรวจสอบของ Fluxer เท่านั้น — ไม่มีผู้ให้บริการบุคคลที่สาม';

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
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash zoom animation';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zoom the logo out when leaving the splash screen';

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
  String get userSettingsNavApplications => 'แอปพลิเคชัน';

  @override
  String get userSettingsNavAppLogs => 'บันทึกแอป';

  @override
  String get userSettingsNavDeveloperTools => 'เครื่องมือสำหรับนักพัฒนา';

  @override
  String get userSettingsNavLimitsConfig => 'การตั้งค่าขีดจำกัด';

  @override
  String get userSettingsNavFeatureFlags => 'ฟีเจอร์แฟล็ก';

  @override
  String get userSettingsNavWhatsNew => 'มีอะไรใหม่';

  @override
  String get userSettingsNavLogOut => 'ออกจากระบบ';

  @override
  String get quickSwitcherTabSearch => 'ค้นหา';

  @override
  String get quickSwitcherTabFriends => 'เพื่อน';

  @override
  String get quickSwitcherSearchPlaceholder => 'ค้นหาแชแนล ผู้คน หรือชุมชน';

  @override
  String get quickSwitcherSearchFriends => 'ค้นหาเพื่อน';

  @override
  String get quickSwitcherNoMatchesFound => 'ไม่พบผลการค้นหา';

  @override
  String get quickSwitcherEmptyHint =>
      'ลองใช้ชื่ออื่น หรือใช้คำนำหน้า @ / # / ! / * เพื่อกรองผลลัพธ์';

  @override
  String get quickSwitcherSectionPeople => 'ผู้คน';

  @override
  String get quickSwitcherSectionGroupMessages => 'ข้อความกลุ่ม';

  @override
  String get quickSwitcherSectionTextChannels => 'ช่องข้อความ';

  @override
  String get quickSwitcherSectionVoiceChannels => 'ช่องเสียง';

  @override
  String get quickSwitcherSectionCommunities => 'ชุมชน';

  @override
  String get quickSwitcherSectionSettings => 'การตั้งค่า';

  @override
  String get quickSwitcherHomeLabel => 'หน้าแรก';

  @override
  String get quickSwitcherDirectMessagesLabel => 'ข้อความส่วนตัว';

  @override
  String get quickSwitcherFavoritesLabel => 'รายการโปรด';

  @override
  String get quickSwitcherUserSettingsLabel => 'การตั้งค่าผู้ใช้';

  @override
  String get quickSwitcherNotificationsLabel => 'การแจ้งเตือน';

  @override
  String get quickSwitcherBookmarksLabel => 'บุ๊กมาร์ก';

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
  String get quickSwitcherMentionsLabel => 'การกล่าวถึง';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'ยังไม่มีเพื่อน';

  @override
  String get quickSwitcherFriendsEmptyHint => 'เพิ่มเพื่อนเพื่อเริ่มต้น';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'ไม่พบเพื่อนที่ตรงกับการค้นหา';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'ลองใช้ชื่ออื่น';

  @override
  String get quickSwitcherSearchAliasUser => 'ผู้ใช้';

  @override
  String get quickSwitcherSearchAliasYou => 'คุณ';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'ข้อความส่วนตัว';

  @override
  String get quickSwitcherSearchAliasMessages => 'ข้อความ';

  @override
  String get quickSwitcherSearchAliasFav => 'รายการโปรด';

  @override
  String get quickSwitcherSearchAliasStarred => 'ติดดาว';

  @override
  String get quickSwitcherSearchAliasInbox => 'กล่องขาเข้า';

  @override
  String get quickSwitcherSearchAliasSaved => 'บันทึกไว้';

  @override
  String get uiClose => 'ปิด';

  @override
  String get chatJumpToBottom => 'เลื่อนไปยังด้านล่าง';

  @override
  String get uiConfirm => 'ยืนยัน';

  @override
  String get uiLoading => 'กำลังโหลด';

  @override
  String get uiUnsavedChanges => 'การเปลี่ยนแปลงที่ยังไม่ได้บันทึก';

  @override
  String get uiReset => 'รีเซ็ต';

  @override
  String get uiOpenColorPicker => 'เปิดตัวเลือกสี';

  @override
  String get uiSelectPlaceholder => 'เลือก';

  @override
  String get uiSearchPlaceholder => 'ค้นหา';

  @override
  String get uiNoOptionsFound => 'ไม่พบตัวเลือก';

  @override
  String get uiDismissNotification => 'ปิดการแจ้งเตือน';

  @override
  String get uiColorPickerTitle => 'ตัวเลือกสี';

  @override
  String get mentionConfirmTitle => 'กล่าวถึงทุกคนหรือไม่?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'การดำเนินการนี้จะแจ้งเตือนสมาชิก $count คน ดำเนินการต่อหรือไม่?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'การดำเนินการนี้จะแจ้งเตือนสมาชิกที่ออนไลน์อยู่ $count คน ดำเนินการต่อหรือไม่?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'กล่าวถึง';

  @override
  String get composerEmojiUnavailable => 'คุณไม่สามารถใช้อีโมจินี้ที่นี่ได้';

  @override
  String get instanceUrlLabel => 'URL อินสแตนซ์';

  @override
  String get instanceUrlPlaceholder => 'ป้อน URL อินสแตนซ์ (เช่น fluxer.app)';

  @override
  String get resetToDefaultInstance => 'รีเซ็ตเป็น Fluxer';

  @override
  String get instanceConnect => 'เชื่อมต่อ';

  @override
  String get instanceConnecting => 'กำลังเชื่อมต่อ…';

  @override
  String get instanceConnectFailed => 'เชื่อมต่ออินสแตนซ์ไม่สำเร็จ';

  @override
  String get recentInstances => 'อินสแตนซ์ล่าสุด';

  @override
  String removeRecentInstance(String domain) {
    return 'นำ $domain ออกจากอินสแตนซ์ล่าสุด';
  }

  @override
  String get instanceSheetTitle => 'เชื่อมต่อกับอินสแตนซ์';

  @override
  String get connectToDifferentInstance => 'เชื่อมต่อกับอินสแตนซ์อื่น';

  @override
  String get changeInstance => 'เปลี่ยน';

  @override
  String get instanceConnectionRequired =>
      'เชื่อมต่อกับอินสแตนซ์เพื่อลงชื่อเข้าใช้';

  @override
  String get comingSoon => 'เร็วๆ นี้';

  @override
  String get guildNavbarDirectMessages => 'ข้อความส่วนตัว';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'สำรวจชุมชนที่ค้นหาได้';

  @override
  String get discoveryExplore => 'สำรวจ';

  @override
  String get discoveryExplorePublicCommunities => 'สำรวจชุมชนสาธารณะ';

  @override
  String get discoveryListingSubheading =>
      'ต้องการลงรายการชุมชนของคุณที่นี่หรือไม่? สมัครหากคุณมีคุณสมบัติตรงตามข้อกำหนดใน การตั้งค่าชุมชน > การค้นพบ';

  @override
  String get discoverySearchCommunities => 'ค้นหาชุมชน';

  @override
  String get discoveryFilterByLanguage => 'กรองตามภาษา';

  @override
  String get discoveryAllLanguages => 'ทุกภาษา';

  @override
  String get discoveryAllCategories => 'ทั้งหมด';

  @override
  String get discoveryCategoryGaming => 'เกม';

  @override
  String get discoveryCategoryMusic => 'เพลง';

  @override
  String get discoveryCategoryEntertainment => 'บันเทิง';

  @override
  String get discoveryCategoryEducation => 'การศึกษา';

  @override
  String get discoveryCategoryScienceAndTechnology => 'วิทยาศาสตร์และเทคโนโลยี';

  @override
  String get discoveryCategoryContentCreator => 'ผู้สร้างเนื้อหา';

  @override
  String get discoveryCategoryAnimeAndManga => 'อนิเมะและมังงะ';

  @override
  String get discoveryCategoryMoviesAndTv => 'ภาพยนตร์และทีวี';

  @override
  String get discoveryCategoryOther => 'อื่นๆ';

  @override
  String get discoveryNoCommunitiesMatch => 'ไม่มีชุมชนที่ตรงกัน';

  @override
  String get discoveryJoinCommunity => 'เข้าร่วมชุมชน';

  @override
  String get discoveryJoined => 'เข้าร่วมแล้ว';

  @override
  String discoveryOnlineCount(String count) {
    return '$count ออนไลน์';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString สมาชิก',
      one: 'สมาชิก 1 คน',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'ไม่มีคำอธิบาย';

  @override
  String get discoveryCommunities => 'ชุมชน';

  @override
  String get discoveryApps => 'แอป';

  @override
  String get discoveryJoinErrorGenericTitle => 'เข้าร่วมชุมชนนี้ไม่ได้';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'เกิดข้อผิดพลาดบางอย่าง โปรดลองอีกครั้งในสักครู่';

  @override
  String get discoveryJoinErrorFullTitle => 'ชุมชนนี้เต็มแล้ว';

  @override
  String get discoveryJoinErrorFullMessage =>
      'ชุมชนนี้ถึงขีดจำกัดจำนวนสมาชิกแล้ว คุณจึงไม่สามารถเข้าร่วมได้ในขณะนี้';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'คุณถึงขีดจำกัดชุมชนแล้ว';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'คุณอยู่ในจำนวนชุมชนสูงสุดแล้ว ออกจากชุมชนหนึ่งแล้วลองอีกครั้ง';

  @override
  String get discoveryJoinErrorBannedTitle => 'คุณไม่สามารถเข้าร่วมชุมชนนี้ได้';

  @override
  String get discoveryJoinErrorBannedMessage => 'คุณถูกแบนจากชุมชนนี้';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'ชุมชนนี้ไม่มีให้บริการแล้ว';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'ชุมชนอาจออกจากรายการที่ค้นหาได้หรือปิดการเข้าร่วมใหม่ รีเฟรชหน้าและคุณจะไม่เห็นอีก';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'คุณกำลังดำเนินการเร็วเกินไป';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'โปรดรอสักครู่แล้วลองอีกครั้ง';

  @override
  String get guildNavbarAddCommunity => 'เพิ่มชุมชน';

  @override
  String get guildNavbarHelp => 'ช่วยเหลือ';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'ข้อความใหม่';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'ย่อ $folderName';
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
  String get guildNavbarGroupDm => 'DM กลุ่ม';

  @override
  String get guildNavbarCreateChannel => 'สร้างช่อง';

  @override
  String get guildNavbarChannelType => 'ประเภทช่อง';

  @override
  String get guildNavbarTextChannel => 'ช่องข้อความ';

  @override
  String get guildNavbarTextChannelDescription =>
      'ส่งข้อความ รูปภาพ GIF และอิโมจิ';

  @override
  String get guildNavbarVoiceChannel => 'ช่องเสียง';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'พูดคุยกันด้วยเสียง วิดีโอ และการแชร์หน้าจอ';

  @override
  String get guildNavbarLinkChannel => 'ช่องลิงก์';

  @override
  String get guildNavbarLinkChannelDescription =>
      'เข้าถึงเว็บไซต์หรือแหล่งข้อมูลภายนอกได้อย่างรวดเร็ว';

  @override
  String get guildNavbarNameLabel => 'ชื่อ';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'สร้างหมวดหมู่';

  @override
  String get guildNavbarNewCategoryHint => 'หมวดหมู่ใหม่';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'ชวนเพื่อนมาที่ $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'ผู้รับจะถูกนำไปยัง #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'ค้นหาเพื่อน';

  @override
  String get guildNavbarNoFriendsYet => 'ยังไม่มีเพื่อน';

  @override
  String get guildNavbarNoResults => 'ไม่พบผลลัพธ์';

  @override
  String get guildNavbarInviteLinkPrompt => 'หรือส่งลิงก์เชิญให้เพื่อน:';

  @override
  String get guildNavbarInviteLink => 'ลิงก์เชิญ';

  @override
  String get guildNavbarCopy => 'คัดลอก';

  @override
  String get guildNavbarCopied => 'คัดลอกแล้ว!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'ลิงก์เชิญของคุณจะหมดอายุใน 7 วัน';

  @override
  String get guildNavbarInviteNeverExpires => 'ลิงก์เชิญนี้ไม่มีวันหมดอายุ';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'ลิงก์เชิญของคุณจะหมดอายุใน $duration';
  }

  @override
  String get guildNavbarEditInviteLink => 'แก้ไขลิงก์เชิญ';

  @override
  String get guildNavbarInviteLinkSettings => 'การตั้งค่าลิงก์เชิญ';

  @override
  String get guildNavbarExpireAfter => 'หมดอายุหลังจาก';

  @override
  String get guildNavbarMaxUses => 'จำนวนครั้งที่ใช้สูงสุด';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'ให้สิทธิ์เข้าเป็นสมาชิกชั่วคราว';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'สมาชิกจะถูกลบออกเมื่อออฟไลน์ เว้นแต่จะได้รับมอบหมายบทบาท';

  @override
  String get guildNavbarCreateNewLink => 'สร้างลิงก์ใหม่';

  @override
  String get guildNavbarSent => 'ส่งแล้ว';

  @override
  String get guildNavbarInvite => 'เชิญ';

  @override
  String get guildNavbarLeaveCommunityTitle => 'ออกจากชุมชน';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการออกจากชุมชนนี้? คุณจะไม่สามารถดูข้อความใดๆ ได้อีกต่อไป';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'ออกจากชุมชน';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'ลบข้อความของคุณในชุมชนนี้หรือไม่?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'ลบข้อความทั้งหมดที่คุณส่งที่นี่อย่างถาวร ในทุกช่อง จะไม่สามารถยกเลิกได้';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'ลบข้อความของฉัน';

  @override
  String get guildNavbarDeletedYourMessages => 'ลบข้อความของคุณแล้ว';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'ไม่สามารถลบข้อความของคุณได้';

  @override
  String get guildNavbarRemoveOverride => 'ลบการตั้งค่าที่กำหนดเอง';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'ปิดเสียงจนถึง $formattedDate';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'เข้าถึงได้โดยเจ้าหน้าที่ Fluxer เท่านั้น';

  @override
  String get guildNavbarInvitesPaused => 'การเชิญถูกระงับชั่วคราวในชุมชนนี้';

  @override
  String get guildNavbarDurationNever => 'ไม่หมดอายุ';

  @override
  String get guildNavbarDuration30Minutes => '30 นาที';

  @override
  String get guildNavbarDuration1Hour => '1 ชั่วโมง';

  @override
  String get guildNavbarDuration6Hours => '6 ชั่วโมง';

  @override
  String get guildNavbarDuration12Hours => '12 ชั่วโมง';

  @override
  String get guildNavbarDuration1Day => '1 วัน';

  @override
  String get guildNavbarDuration7Days => '7 วัน';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count วินาที';
  }

  @override
  String get guildNavbarNever => 'ไม่เลย';

  @override
  String get guildNavbarNoLimit => 'ไม่จำกัด';

  @override
  String get guildNavbarOneUse => '1 ครั้ง';

  @override
  String guildNavbarUses(int count) {
    return '$count ครั้ง';
  }

  @override
  String get guildMenuMarkAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get guildPeekMoreOptions => 'ตัวเลือกเพิ่มเติม';

  @override
  String get guildMenuInviteMembers => 'เชิญสมาชิก';

  @override
  String get guildMenuCommunitySettings => 'การตั้งค่าชุมชน';

  @override
  String get guildMenuEditCommunityProfile => 'แก้ไขโปรไฟล์ชุมชน';

  @override
  String get guildMenuUnmuteCommunity => 'ยกเลิกปิดเสียงชุมชน';

  @override
  String get guildMenuMuteCommunity => 'ปิดเสียงชุมชน';

  @override
  String get guildMenuHideMutedChannels => 'ซ่อนช่องที่ปิดเสียง';

  @override
  String get guildMenuReportCommunity => 'รายงานชุมชน';

  @override
  String get guildMenuDebugCommunity => 'ดีบักชุมชน';

  @override
  String get guildMenuCopyCommunityId => 'คัดลอก ID ชุมชน';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'จนถึง $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'ทั่วไป';

  @override
  String get guildMenuSettingsRoles => 'บทบาทและสิทธิ์';

  @override
  String get guildMenuSettingsEmoji => 'อิโมจิที่กำหนดเอง';

  @override
  String get guildMenuSettingsStickers => 'สติกเกอร์ที่กำหนดเอง';

  @override
  String get guildMenuSettingsSafetyModeration => 'ความปลอดภัยและการกลั่นกรอง';

  @override
  String get guildMenuSettingsActivityLog => 'บันทึกกิจกรรม';

  @override
  String get guildMenuSettingsWebhooks => 'เว็บฮุค';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL เชิญที่กำหนดเอง';

  @override
  String get guildMenuSettingsDiscovery => 'การค้นพบ';

  @override
  String get guildMenuSettingsMembers => 'สมาชิก';

  @override
  String get guildMenuSettingsInviteLinks => 'ลิงก์เชิญ';

  @override
  String get guildMenuSettingsBans => 'การแบน';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission => 'คุณไม่มีสิทธิ์ดูแท็บการตั้งค่านี้';

  @override
  String get guildSettingsOverviewIconTitle => 'ไอคอน';

  @override
  String get guildSettingsUploadImage => 'อัปโหลดรูปภาพ';

  @override
  String get guildSettingsOverviewBannerTitle => 'แบนเนอร์';

  @override
  String get guildSettingsOverviewBannerHint =>
      'อัปโหลดแบนเนอร์สำหรับเซิร์ฟเวอร์ของคุณ';

  @override
  String get guildSettingsOverviewNameTitle => 'ชื่อ';

  @override
  String get guildSettingsOverviewNameHint => 'ชุมชนสุดเจ๋งของฉัน';

  @override
  String get guildSettingsOverviewStatsTitle => 'สถิติ';

  @override
  String get guildSettingsOverviewMembers => 'สมาชิก';

  @override
  String get guildSettingsOverviewOnline => 'ออนไลน์';

  @override
  String get guildSettingsRolesDescription =>
      'ใช้บทบาทเพื่อจัดกลุ่มสมาชิกและกำหนดสิทธิ์';

  @override
  String get guildSettingsCreateRole => 'สร้างบทบาท';

  @override
  String get guildSettingsRolesListTitle => 'บทบาท';

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
    return 'ใช้ $staticCount อิโมจิแบบคงที่, $animatedCount อิโมจิแบบเคลื่อนไหว';
  }

  @override
  String get guildSettingsEmojiEmpty => 'ยังไม่มีอิโมจิที่กำหนดเอง';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return 'อัปโหลดสติกเกอร์แล้ว $count รายการ';
  }

  @override
  String get guildSettingsStickersEmpty => 'ยังไม่มีสติกเกอร์ที่กำหนดเอง';

  @override
  String get guildSettingsModerationVerificationTitle => 'การยืนยันสมาชิก';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'เลือกสิ่งที่สมาชิกต้องมีก่อนที่จะสามารถโพสต์หรือส่งข้อความส่วนตัวถึงสมาชิกในชุมชนได้';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'สมาชิกที่มีบทบาทสามารถข้ามการตรวจสอบเหล่านี้ได้ สำหรับพื้นที่สาธารณะ เราแนะนำให้เปิดใช้งานการยืนยันตัวตน';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'ชุมชนที่แสดงใน Discovery ต้องมีอีเมลที่ยืนยันแล้วเป็นอย่างน้อย ไม่สามารถเลือก \'ไม่มี\' ได้ในขณะที่เปิดใช้งาน Discovery';

  @override
  String get guildSettingsModerationMatureTitle =>
      'เนื้อหาสำหรับผู้ใหญ่และการเตือนเนื้อหา';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'กำหนดการติดป้ายเนื้อหาสำหรับผู้ใหญ่และการเตือนเนื้อหาที่เป็นทางเลือกสำหรับสมาชิก';

  @override
  String get guildSettingsModerationMatureToggle => 'เนื้อหาสำหรับผู้ใหญ่';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'ทำเครื่องหมายว่าชุมชนนี้มีเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get guildSettingsVerificationNone => 'ไม่มี';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'ไม่จำเป็นต้องมีการยืนยันตัวตน';

  @override
  String get guildSettingsVerificationLow => 'ต่ำ';

  @override
  String get guildSettingsVerificationLowDescription =>
      'ต้องมีที่อยู่อีเมลที่ยืนยันแล้ว';

  @override
  String get guildSettingsVerificationMedium => 'ปานกลาง';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'ต้องมีที่อยู่อีเมลที่ยืนยันแล้ว และบัญชีที่มีอายุอย่างน้อย 5 นาที';

  @override
  String get guildSettingsVerificationHigh => 'สูง';

  @override
  String get guildSettingsVerificationHighDescription =>
      'ต้องมีทุกอย่างในระดับปานกลาง บวกกับการเป็นสมาชิกชุมชนอย่างน้อย 10 นาที';

  @override
  String get guildSettingsVerificationHighest => 'สูงมาก';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'ต้องมีหมายเลขโทรศัพท์ที่ยืนยันแล้ว';

  @override
  String get guildSettingsAuditLogDescription =>
      'ติดตามการดำเนินการของผู้ดูแลในชุมชน';

  @override
  String get guildSettingsAuditLogEmpty => 'ยังไม่มีบันทึก';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'การดำเนินการของผู้ดูแลและการเปลี่ยนแปลงชุมชนจะปรากฏที่นี่';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'ผู้ใช้ทั้งหมด';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'การดำเนินการทั้งหมด';

  @override
  String get guildSettingsAuditLogNoReason => 'ไม่มีการระบุเหตุผล';

  @override
  String get guildSettingsAuditLogUnknownUser => 'ผู้ใช้ที่ไม่รู้จัก';

  @override
  String get guildSettingsAuditLogLoadError =>
      'เกิดข้อผิดพลาดขณะโหลดบันทึกกิจกรรม';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'ไม่สามารถโหลดบันทึกกิจกรรมได้';

  @override
  String get guildSettingsAuditLogReason => 'เหตุผล';

  @override
  String get guildSettingsAuditLogSomeone => 'ใครบางคน';

  @override
  String get guildSettingsAuditLogSomething => 'บางสิ่งบางอย่าง';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'เอนทิตีที่ไม่รู้จัก';

  @override
  String get guildSettingsAuditLogNothing => 'ไม่มีอะไร';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'เป้าหมายที่ไม่รู้จัก';

  @override
  String get auditLogActionGuildUpdate => 'ชุมชนอัปเดต';

  @override
  String get auditLogActionChannelCreate => 'สร้างช่อง';

  @override
  String get auditLogActionChannelUpdate => 'อัปเดตช่อง';

  @override
  String get auditLogActionChannelDelete => 'ลบช่อง';

  @override
  String get auditLogActionChannelOverwriteCreate => 'เพิ่มการเขียนทับช่อง';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'อัปเดตการเขียนทับช่อง';

  @override
  String get auditLogActionChannelOverwriteDelete => 'ลบการเขียนทับช่อง';

  @override
  String get auditLogActionMemberKick => 'สมาชิกถูกเตะออก';

  @override
  String get auditLogActionMemberPrune => 'สมาชิกถูกลบ';

  @override
  String get auditLogActionMemberBanAdd => 'สมาชิกถูกแบน';

  @override
  String get auditLogActionMemberBanRemove => 'ยกเลิกการแบนสมาชิก';

  @override
  String get auditLogActionMemberUpdate => 'สมาชิกอัปเดต';

  @override
  String get auditLogActionMemberRoleUpdate => 'บทบาทสมาชิกอัปเดต';

  @override
  String get auditLogActionMemberMove => 'สมาชิกถูกย้าย';

  @override
  String get auditLogActionMemberDisconnect => 'สมาชิกถูกตัดการเชื่อมต่อ';

  @override
  String get auditLogActionBotAdd => 'บอทถูกเพิ่ม';

  @override
  String get auditLogActionRoleCreate => 'สร้างบทบาท';

  @override
  String get auditLogActionRoleUpdate => 'อัปเดตบทบาท';

  @override
  String get auditLogActionRoleDelete => 'ลบสิทธิ์แล้ว';

  @override
  String get auditLogActionInviteCreate => 'สร้างคำเชิญแล้ว';

  @override
  String get auditLogActionInviteUpdate => 'อัปเดตคำเชิญแล้ว';

  @override
  String get auditLogActionInviteDelete => 'ลบคำเชิญแล้ว';

  @override
  String get auditLogActionWebhookCreate => 'สร้างเว็บฮุคแล้ว';

  @override
  String get auditLogActionWebhookUpdate => 'อัปเดตเว็บฮุคแล้ว';

  @override
  String get auditLogActionWebhookDelete => 'ลบเว็บฮุคแล้ว';

  @override
  String get auditLogActionEmojiCreate => 'สร้างอิโมจิแล้ว';

  @override
  String get auditLogActionEmojiUpdate => 'อัปเดตอิโมจิแล้ว';

  @override
  String get auditLogActionEmojiDelete => 'ลบอิโมจิแล้ว';

  @override
  String get auditLogActionStickerCreate => 'สร้างสติกเกอร์แล้ว';

  @override
  String get auditLogActionStickerUpdate => 'อัปเดตสติกเกอร์แล้ว';

  @override
  String get auditLogActionStickerDelete => 'ลบสติกเกอร์แล้ว';

  @override
  String get auditLogActionMessageDelete => 'ลบข้อความแล้ว';

  @override
  String get auditLogActionMessageBulkDelete => 'ลบข้อความจำนวนมากแล้ว';

  @override
  String get auditLogActionMessagePin => 'ปักหมุดข้อความแล้ว';

  @override
  String get auditLogActionMessageUnpin => 'ยกเลิกการปักหมุดข้อความแล้ว';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor อัปเดตการตั้งค่าชุมชนแล้ว';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor สร้างช่อง $target แล้ว';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor อัปเดตช่อง $target แล้ว';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor ลบช่อง $target แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor เพิ่มสิทธิ์ช่องสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor เพิ่มสิทธิ์ช่องสำหรับ $target ในช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor อัปเดตสิทธิ์ช่องสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor อัปเดตสิทธิ์ช่องสำหรับ $target ในช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor ลบสิทธิ์ช่องสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ลบสิทธิ์ช่องสำหรับ $target ในช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor เตะ $target ออกแล้ว';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor แบน $target แล้ว';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor เลิกแบน $target แล้ว';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor อัปเดต $target แล้ว';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor อัปเดตบทบาทสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor ลบสมาชิกที่ไม่มีความเคลื่อนไหวแล้ว';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor ลบสมาชิกที่ไม่มีความเคลื่อนไหวเป็นเวลา $days วันแล้ว';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor ย้าย $target ไปยังช่องเสียงอื่นแล้ว';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ย้าย $target ไปยังช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor ตัดการเชื่อมต่อเสียงของ $target แล้ว';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor เพิ่มบอท $target แล้ว';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor สร้างบทบาท $target แล้ว';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor อัปเดตบทบาท $target แล้ว';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor ลบบทบาท $target แล้ว';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor สร้างคำเชิญ $target แล้ว';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor สร้างคำเชิญ $target สำหรับช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor อัปเดตคำเชิญ $target แล้ว';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor อัปเดตคำเชิญ $target สำหรับช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor ลบคำเชิญ $target แล้ว';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ลบคำเชิญ $target สำหรับช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor สร้างเว็บฮุค $target แล้ว';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor อัปเดตเว็บฮุค $target แล้ว';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor ลบเว็บฮุค $target แล้ว';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor เพิ่มอิโมจิ $target';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor อัปเดตอิโมจิ $target';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor ลบอิโมจิ $target';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor เพิ่มสติกเกอร์ $target';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor อัปเดตสติกเกอร์ $target';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor ลบสติกเกอร์ $target';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor ลบข้อความ';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor ลบข้อความใน $channel';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor ลบข้อความหลายรายการ';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor ลบข้อความ $count รายการ';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor ลบข้อความหลายรายการใน $channel';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor ลบข้อความ $count รายการใน $channel';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor ปักหมุดข้อความ';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor ปักหมุดข้อความใน $channel';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor เลิกปักหมุดข้อความ';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor เลิกปักหมุดข้อความใน $channel';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor ดำเนินการตรวจสอบบน $target';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'อัปเดต $field จาก $oldValue เป็น $newValue';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'ตั้งค่า $field เป็น $newValue';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'ล้าง $field (เดิมคือ $oldValue)';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'อัปเดต $field';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'เปลี่ยนชื่อชุมชนเป็น $name';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => 'อัปเดตไอคอนชุมชน';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'เปลี่ยนชื่อช่องเป็น $name';
  }

  @override
  String get auditLogChangeClearedTopic => 'ล้างหัวข้อ';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'อัปเดตหัวข้อเป็น $topic';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'เปิดใช้งานเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'ปิดใช้งานเนื้อหาสำหรับผู้ใหญ่';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'ตั้งชื่อเล่นเป็น $nickname';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'ลบชื่อเล่น $nickname';
  }

  @override
  String get auditLogChangeMutedMember => 'ปิดเสียงสมาชิก';

  @override
  String get auditLogChangeUnmutedMember => 'เปิดเสียงสมาชิก';

  @override
  String get auditLogChangeDeafenedMember => 'ปิดเสียงสมาชิก (ห้ามได้ยิน)';

  @override
  String get auditLogChangeUndeafenedMember => 'เปิดเสียงสมาชิก (ให้ได้ยิน)';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'เพิ่ม $roles';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'ลบ $roles';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'ช่อง: $value';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'ข้อความ: $value';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'ได้รับเชิญจาก $value';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบข้อความ # รายการ',
      one: 'ลบข้อความ # รายการ',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบสมาชิก # รายการ',
      one: 'ลบสมาชิก # รายการ',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'คำเชิญนี้ไม่มีวันหมดอายุ';

  @override
  String get auditLogOptionTemporaryMembership =>
      'ให้สิทธิ์การเป็นสมาชิกชั่วคราว';

  @override
  String get auditLogOptionPermanentMembership => 'ให้สิทธิ์การเป็นสมาชิกถาวร';

  @override
  String get guildSettingsLoadMore => 'โหลดเพิ่มเติม';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'จัดการเว็บฮุคที่โพสต์ข้อความไปยังช่องต่างๆ';

  @override
  String get guildSettingsWebhooksEmpty => 'ยังไม่มีเว็บฮุคที่กำหนดค่าไว้';

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
  String get guildSettingsCopyUrl => 'คัดลอก URL';

  @override
  String get guildSettingsCopiedUrl => 'คัดลอก URL ไปยังคลิปบอร์ดแล้ว';

  @override
  String get guildSettingsDeleteWebhook => 'ลบเว็บฮุค';

  @override
  String get guildSettingsVanityUrlDescription =>
      'ตั้งค่าลิงก์เชิญแบบกำหนดเองสำหรับเซิร์ฟเวอร์ของคุณ';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'บันทึก';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'การใช้งาน';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count ครั้ง';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'สมัครเพื่อเข้าร่วมการค้นหาเซิร์ฟเวอร์';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'ต้องมีสมาชิกอย่างน้อย $count คนจึงจะสมัครได้';
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
  String get guildSettingsDiscoveryCategory => 'หมวดหมู่';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'คำอธิบาย';

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
  String get guildSettingsDiscoveryTags => 'แท็ก';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'เกม, ศิลปะ, ดนตรี';

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
  String get guildSettingsDiscoveryApply => 'ส่งใบสมัคร';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'ถอน';

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
      'ค้นหาและจัดการสมาชิกเซิร์ฟเวอร์';

  @override
  String get guildSettingsMembersSearchHint => 'ค้นหาสมาชิก';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return 'สมาชิก $count คน';
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
  String get guildSettingsMembersSortNewest => 'ใหม่ล่าสุดก่อน';

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
      'ดูและเพิกถอนลิงก์เชิญที่ใช้งานอยู่';

  @override
  String get guildSettingsInvitesEmpty => 'ไม่มีคำเชิญที่ใช้งานอยู่';

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
    return '$uses / $maxUses ครั้ง';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'หมดอายุ $date';
  }

  @override
  String get guildSettingsBansDescription => 'ดูและจัดการผู้ใช้ที่ถูกแบน';

  @override
  String get guildSettingsBansSearchHint => 'ค้นหาการแบน';

  @override
  String get guildSettingsBansEmpty => 'ไม่มีผู้ใช้ที่ถูกแบน';

  @override
  String get guildSettingsBanPermanent => 'แบนถาวร';

  @override
  String guildSettingsBanExpires(String date) {
    return 'หมดอายุ $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'หมดอายุ';

  @override
  String get guildSettingsUnban => 'เลิกแบน';

  @override
  String get guildSettingsBansLoading => 'กำลังโหลดผู้ใช้ที่ถูกแบน';

  @override
  String get guildSettingsBansNoSearchResults =>
      'ไม่พบการแบนที่ตรงกับการค้นหาของคุณ';

  @override
  String get guildSettingsBanDetailsTitle => 'รายละเอียดการแบน';

  @override
  String get guildSettingsBanViewDetails => 'ดูรายละเอียด';

  @override
  String get guildSettingsBannedOn => 'ถูกแบนเมื่อ';

  @override
  String get guildSettingsBannedBy => 'ถูกแบนโดย';

  @override
  String get guildSettingsRevokeBanTitle => 'เพิกถอนการแบน';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเพิกถอนการแบน $displayName? พวกเขาจะสามารถกลับเข้าร่วมชุมชนได้';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'เพิกถอนการแบนสำหรับ $displayName แล้ว';
  }

  @override
  String get guildSettingsBansLoadError => 'ไม่สามารถโหลดการแบนได้ ลองอีกครั้ง';

  @override
  String get guildSettingsRevokeBanError =>
      'ไม่สามารถเพิกถอนการแบนได้ ลองอีกครั้ง';

  @override
  String get guildSettingsCommunitySettings => 'การตั้งค่าชุมชน';

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
      'จัดการโปรไฟล์ ช่อง และการตั้งค่าเริ่มต้นของชุมชนของคุณ';

  @override
  String get guildSettingsOverviewBrandingTitle => 'การสร้างแบรนด์';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'อัปเดตไอคอน ชื่อ แบนเนอร์ และพื้นหลังคำเชิญของคุณ';

  @override
  String get guildSettingsOverviewBannerUpload => 'อัปโหลดแบนเนอร์';

  @override
  String get guildSettingsOverviewIdleTitle => 'การตั้งค่าขณะไม่ได้ใช้งาน';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'กำหนดค่าช่อง AFK และหมดเวลา';

  @override
  String get guildSettingsOverviewSystemTitle => 'ระบบและการต้อนรับ';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'เลือกปลายทางสำหรับข้อความระบบและการต้อนรับ';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'การแจ้งเตือนเริ่มต้น';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'ชุมชนที่มีสมาชิกมากกว่า 250 คนจะถูกบังคับให้ใช้การตั้งค่า \"เฉพาะการกล่าวถึง\" การตั้งค่าเดิมของคุณจะยังคงอยู่และจะถูกกู้คืนหากชุมชนมีสมาชิกน้อยกว่า 250 คน';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'ขั้นสูง';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'อนุญาตชื่อช่องข้อความที่ยืดหยุ่น';

  @override
  String get guildSettingsOverviewHideOwnerCrown => 'ซ่อนมงกุฎเจ้าของชุมชน';

  @override
  String get guildSettingsOverviewDetachedBanner => 'แบนเนอร์แยก';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'แสดงแบนเนอร์ในส่วนของตัวเองใต้ส่วนหัวชุมชน';

  @override
  String get guildSettingsOverviewUploadIcon => 'อัปโหลดไอคอน';

  @override
  String get guildSettingsOverviewRemoveImage => 'ลบ';

  @override
  String get guildSettingsOverviewSplashTitle => 'พื้นหลังคำเชิญ';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'พื้นหลังการฝังแชท';

  @override
  String get guildSettingsOverviewEmbedSplashHint => 'แสดงในการฝังคำเชิญในแชท';

  @override
  String get guildSettingsOverviewUploadBackground => 'อัปโหลดพื้นหลัง';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'ไม่มีแบนเนอร์ชุมชน';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'ไม่มีพื้นหลังคำเชิญ';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'แสดงตัวอย่าง';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'ดูว่าคำเชิญของคุณมีลักษณะอย่างไรสำหรับผู้เยี่ยมชม';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'ชื่อช่องข้อความ';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'มงกุฎเจ้าของชุมชน';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'กำหนดว่าจะแสดงไอคอนมงกุฎถัดจากเจ้าของชุมชนหรือไม่';

  @override
  String get guildSettingsSplashCardAlignment => 'การจัดตำแหน่งการ์ด';

  @override
  String get guildSettingsSplashAlignmentCenter => 'ตรงกลาง';

  @override
  String get guildSettingsSplashAlignmentLeft => 'ซ้าย';

  @override
  String get guildSettingsSplashAlignmentRight => 'ขวา';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'มีผลเฉพาะบนหน้าจอที่กว้างเท่านั้น';

  @override
  String get permissionReadMessageHistory => 'อ่านประวัติข้อความ';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'เปลี่ยนสิ่งที่ผู้ใช้ที่ไม่มี \"$permission\" สามารถมองเห็นได้';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'ใช้หน้าต่างที่กำหนดเองเพื่อตั้งค่าวันที่กำหนดเวลาประวัติข้อความสำหรับสมาชิกที่ไม่มีสิทธิ์ $permission';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'เปิดการตั้งค่าประวัติข้อความ';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'ขีดจำกัดประวัติข้อความ';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'เปิดใช้งานขีดจำกัดประวัติข้อความ';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'วันที่กำหนด';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'สมาชิกที่ไม่มีสิทธิ์อ่านประวัติข้อความสามารถดูข้อความที่ส่งหลังจากวันที่นี้ได้';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'อัปเดตขีดจำกัดประวัติข้อความแล้ว';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'อนุญาตตัวพิมพ์ใหญ่และเว้นวรรคในชื่อช่องข้อความ ปิดจะจำกัดชื่อให้เป็นตัวพิมพ์เล็กที่มีขีดกลางและขีดล่าง';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'ซ่อนไอคอนมงกุฎถัดจากเจ้าของชุมชนในทุกส่วน';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'ไอคอนเคลื่อนไหวต้องมีฟีเจอร์ชุมชนไอคอนเคลื่อนไหว';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'แบนเนอร์เคลื่อนไหวต้องมีฟีเจอร์ชุมชนแบนเนอร์เคลื่อนไหว';

  @override
  String get guildSettingsAfkChannel => 'ช่อง AFK / ไม่ใช้งาน';

  @override
  String get guildSettingsAfkChannelHint =>
      'ย้ายสมาชิกไปยังช่องนี้เมื่อพวกเขาไม่อยู่';

  @override
  String get guildSettingsNoAfkChannel => 'ไม่มีช่อง AFK';

  @override
  String get guildSettingsAfkTimeout => 'หมดเวลา AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 นาที';

  @override
  String get guildSettingsAfkTimeout5Min => '5 นาที';

  @override
  String get guildSettingsAfkTimeout15Min => '15 นาที';

  @override
  String get guildSettingsAfkTimeout30Min => '30 นาที';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 ชั่วโมง';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds วินาที';
  }

  @override
  String get guildSettingsSystemChannel => 'ช่องปลายทาง';

  @override
  String get guildSettingsSystemChannelHint =>
      'ข้อความต้อนรับและข้อความระบบจะปรากฏที่นี่';

  @override
  String get guildSettingsNoSystemChannel => 'ไม่มีช่องระบบ';

  @override
  String get guildSettingsHideJoinMessages => 'ซ่อนข้อความเข้าร่วม';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'ปิดข้อความการเข้าร่วมในช่องปลายทาง';

  @override
  String get guildSettingsDefaultNotifications =>
      'การตั้งค่าการแจ้งเตือนเริ่มต้น';

  @override
  String get guildSettingsNotificationsAll => 'ข้อความทั้งหมด';

  @override
  String get guildSettingsNotificationsAllDescription => 'แจ้งเตือนทุกข้อความ';

  @override
  String get guildSettingsNotificationsMentions => 'เฉพาะการกล่าวถึง';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'แจ้งเตือนเฉพาะเมื่อมีการกล่าวถึง';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. สูงสุด 10MB. ขั้นต่ำ: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. สูงสุด 10MB. ขั้นต่ำ: 960×540px (16:9). แสดงใน embed ของคำเชิญในแชท';

  @override
  String get guildSettingsModerationDescription =>
      'กำหนดการตั้งค่าการยืนยัน การกรองเนื้อหา และเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'ชุมชนที่แสดงใน Discovery มีตัวเลือกการกลั่นกรองที่จำกัด';

  @override
  String get guildSettingsModerationContentFilterTitle => 'การกรองเนื้อหา';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'คัดกรองข้อความที่มีเนื้อหาโจ่งแจ้งโดยอัตโนมัติในช่องที่ไม่ได้ตั้งค่าสำหรับเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'ชุมชนที่แสดงใน Discovery ต้องสแกนสมาชิกทั้งหมด การตั้งค่านี้ไม่สามารถเปลี่ยนแปลงได้ในขณะที่เปิดใช้งาน Discovery';

  @override
  String get guildSettingsContentFilterOff => 'ปิด';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'ให้ชุมชนกลั่นกรองตนเอง';

  @override
  String get guildSettingsContentFilterNoRole => 'กรองสมาชิกที่ไม่มีบทบาท';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'แนะนำสำหรับชุมชนส่วนใหญ่';

  @override
  String get guildSettingsContentFilterAll => 'กรองทุกคน';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'การป้องกันสูงสุดสำหรับพื้นที่ที่เป็นมิตรกับครอบครัว';

  @override
  String get guildSettingsModerationMatureOff => 'ปิด';

  @override
  String get guildSettingsModerationMatureOn => 'เปิด';

  @override
  String get guildSettingsContentWarningToggle => 'แสดงคำเตือนเนื้อหา';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'สลับการแจ้งเตือนก่อนเข้าช่องใดๆ';

  @override
  String get guildSettingsContentWarningText => 'ข้อความคำเตือนที่กำหนดเอง';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'นี่มีเนื้อหาที่ละเอียดอ่อน';

  @override
  String get guildSettingsModeration2faTitle => 'ข้อกำหนด 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'กำหนดให้มีการยืนยันตัวตนสองปัจจัยสำหรับผู้กลั่นกรองก่อนที่พวกเขาจะสามารถแบน, ไล่ออก, ระงับเวลา หรือลบข้อความได้';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'ต้องใช้ 2FA สำหรับการดำเนินการกลั่นกรอง';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'เฉพาะเจ้าของชุมชนเท่านั้นที่สามารถเปลี่ยนการตั้งค่านี้ได้';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'เปิดใช้งาน 2FA ในบัญชีของคุณเพื่อเปลี่ยนการตั้งค่านี้';

  @override
  String get guildSettingsEmojiSearchHint => 'ค้นหาอิโมจิ';

  @override
  String get guildSettingsEmojiUploadTitle => 'อัปโหลดอิโมจิ';

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
    return 'อิโมจิที่ไม่เคลื่อนไหว ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'อิโมจิเคลื่อนไหว ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'ค้นหาสติกเกอร์';

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
    return 'สร้างเว็บฮุคจากการตั้งค่าช่อง แก้ไขที่นี่';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'URL พิเศษของคุณจะไม่ทำงาน เว้นแต่จะมีอย่างน้อยหนึ่งช่องที่ทุกคนมองเห็นได้';

  @override
  String get guildSettingsVanityUrlRemove => 'ลบ';

  @override
  String get guildSettingsBannedUsersTitle => 'ผู้ใช้ที่ถูกแบน';

  @override
  String get guildSettingsInvitesTableInviter => 'ผู้เชิญ';

  @override
  String get guildSettingsInvitesTableChannel => 'ช่อง';

  @override
  String get guildSettingsInvitesTableCode => 'รหัส';

  @override
  String get guildSettingsInvitesTableUses => 'การใช้งาน';

  @override
  String get guildSettingsInvitesTableCreated => 'สร้างเมื่อ';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'กรองตามผู้ใช้';

  @override
  String get guildSettingsAuditLogFilterAction => 'กรองตามการดำเนินการ';

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

  @override
  String get keybindsSearchShortcuts => 'Search shortcuts';

  @override
  String get keybindSectionDefaults => 'Defaults';

  @override
  String get keybindSectionMessages => 'Messages';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Drag and drop';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voice and video';

  @override
  String get keybindSectionMisc => 'Miscellaneous';

  @override
  String get keybindActionShowShortcutsList => 'Show keyboard shortcuts list';

  @override
  String get keybindActionCopyText => 'Copy text';

  @override
  String get keybindActionMarkUnread => 'Mark as unread';

  @override
  String get keybindActionFocusTextarea => 'Focus text area';

  @override
  String get keybindActionSwitchCommunities => 'Switch between communities';

  @override
  String get keybindActionSwitchChannels => 'Switch between channels';

  @override
  String get keybindActionHistoryBack =>
      'Move back through viewed channel history';

  @override
  String get keybindActionHistoryForward =>
      'Move forward through viewed channel history';

  @override
  String get keybindActionJumpUnreadChannels => 'Jump between unread channels';

  @override
  String get keybindActionJumpMentionChannels =>
      'Jump between unread channels with mentions';

  @override
  String get keybindActionJumpCurrentCall => 'Jump to the current call';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Toggle between last community and DMs';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Switch to previous community or DMs';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Switch to next community or DMs';

  @override
  String get keybindActionGoToDms => 'Go to Direct Messages';

  @override
  String get keybindActionGoToFirstCommunity => 'Go to first community';

  @override
  String get keybindActionGoToSecondCommunity => 'Go to second community';

  @override
  String get keybindActionGoToThirdCommunity => 'Go to third community';

  @override
  String get keybindActionGoToFourthCommunity => 'Go to fourth community';

  @override
  String get keybindActionGoToFifthCommunity => 'Go to fifth community';

  @override
  String get keybindActionGoToSixthCommunity => 'Go to sixth community';

  @override
  String get keybindActionGoToSeventhCommunity => 'Go to seventh community';

  @override
  String get keybindActionGoToEighthCommunity => 'Go to eighth community';

  @override
  String get keybindActionToggleQuickSwitcher => 'Toggle quick switcher';

  @override
  String get keybindActionCreateOrJoinCommunity => 'Create or join a community';

  @override
  String get keybindActionStartDragAndDrop => 'Start drag and drop';

  @override
  String get keybindActionMove => 'Move';

  @override
  String get keybindActionDropItem => 'Drop item';

  @override
  String get keybindActionCancel => 'Cancel';

  @override
  String get keybindActionMarkCommunityRead => 'Mark community as read';

  @override
  String get keybindActionMarkChannelRead => 'Mark channel as read';

  @override
  String get keybindActionStartGroupDm => 'Start a group DM';

  @override
  String get keybindActionTogglePinnedMessages => 'Toggle pinned messages';

  @override
  String get keybindActionToggleInbox => 'Toggle the inbox';

  @override
  String get keybindActionMarkTopInboxRead => 'Mark top inbox channel as read';

  @override
  String get keybindActionMarkAllInboxRead => 'Mark all inbox channels as read';

  @override
  String get keybindActionToggleMemberList =>
      'Toggle the member list or voice chat';

  @override
  String get keybindActionToggleEmojiPicker => 'Toggle the emoji picker';

  @override
  String get keybindActionToggleGifPicker => 'Toggle the GIF picker';

  @override
  String get keybindActionToggleStickerPicker => 'Toggle the sticker picker';

  @override
  String get keybindActionScrollChatUp => 'Scroll chat up';

  @override
  String get keybindActionScrollChatDown => 'Scroll chat down';

  @override
  String get keybindActionJumpOldestUnread =>
      'Jump to the oldest unread message';

  @override
  String get keybindActionFocusComposer => 'Focus the text area';

  @override
  String get keybindActionUploadFile => 'Upload a file';

  @override
  String get keybindActionCopyChannelLink => 'Copy channel link';

  @override
  String get keybindActionToggleSavedMedia => 'Toggle saved media';

  @override
  String get keybindActionSendVoiceMessage => 'Send voice message';

  @override
  String get keybindActionAnswerCall => 'Answer the incoming call';

  @override
  String get keybindActionDeclineCall => 'Decline the incoming call';

  @override
  String get keybindActionStartDmCall => 'Start a call in a DM or group';

  @override
  String get keybindActionToggleSoundboard => 'Toggle the soundboard';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expand or collapse compact call view';

  @override
  String get keybindActionOpenHelp => 'Open help';

  @override
  String get keybindActionSearchMessages => 'Search messages';

  @override
  String get keybindActionOpenContextMenu => 'Open the context menu';

  @override
  String get keybindActionOpenSettings => 'Open your settings';

  @override
  String get keybindActionOpenThemeStudio => 'Open theme studio popout';

  @override
  String get keybindActionZoomIn => 'Zoom in';

  @override
  String get keybindActionZoomOut => 'Zoom out';

  @override
  String get keybindActionZoomReset => 'Reset zoom';

  @override
  String get clipboardPasteFailed =>
      'Couldn\'t paste. The clipboard was empty or blocked for this app.';
}
