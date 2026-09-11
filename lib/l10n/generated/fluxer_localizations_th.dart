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
      'มีบางอย่างผิดปกติกับอินสแตนซ์\nน่าจะแก้ไขได้ในเร็วๆ นี้!';

  @override
  String get gatewayReconnectingToast => 'กำลังเชื่อมต่อใหม่…';

  @override
  String get gatewayConnectedToast => 'เชื่อมต่อแล้ว';

  @override
  String get sessionExpiredToast =>
      'เซสชันของคุณหมดอายุแล้ว โปรดลงชื่อเข้าใช้อีกครั้ง';

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
  String get nagbarLearnMore => 'ดูเพิ่มเติม';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'มีกำหนดการบำรุงรักษาในเวลา $localizedTime คาดว่าจะใช้เวลา: $duration';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'กำลังอยู่ระหว่างการบำรุงรักษา คาดว่าจะใช้เวลา: $duration';
  }

  @override
  String get nagbarMaintenanceComplete => 'การบำรุงรักษาเสร็จสมบูรณ์แล้ว';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'สวัสดี $displayName โปรดยืนยันบัญชีของคุณเพื่อป้องกันการสูญเสียสิทธิ์เข้าถึง';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'สวัสดี $displayName โปรดยืนยันที่อยู่อีเมลของคุณ';
  }

  @override
  String get nagbarOpenSettings => 'เปิดการตั้งค่า';

  @override
  String get systemPermissionSettingsTitle => 'เปิดใช้งานสิทธิ์';

  @override
  String get systemPermissionSettingsOpenSettings => 'เปิดการตั้งค่า';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName ไม่สามารถเข้าถึงไมโครโฟนของคุณได้ คุณสามารถเปิดใช้งานได้ในการตั้งค่าความเป็นส่วนตัวของอุปกรณ์';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName ไม่สามารถเข้าถึงกล้องของคุณได้ คุณสามารถเปิดใช้งานได้ในการตั้งค่าความเป็นส่วนตัวของอุปกรณ์';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName ไม่สามารถเข้าถึงคลังรูปภาพของคุณได้ คุณสามารถเปิดใช้งานได้ในการตั้งค่าความเป็นส่วนตัวของอุปกรณ์';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName ไม่มีสิทธิ์ส่งการแจ้งเตือน คุณสามารถเปิดใช้งานได้ในการตั้งค่าอุปกรณ์ของคุณ';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'การสมัครสมาชิกของคุณต่ออายุไม่สำเร็จ แต่คุณยังคงเข้าถึงสิทธิประโยชน์ของ $productName ได้จนถึงวันที่ $graceDate ดำเนินการทันที มิฉะนั้นคุณจะสูญเสียสิทธิประโยชน์ทั้งหมด';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'การสมัครสมาชิก $productName ของคุณหมดอายุแล้ว ต่ออายุตอนนี้เพื่อรับสิทธิประโยชน์ของคุณ';
  }

  @override
  String get nagbarManageSubscription => 'จัดการการสมัครสมาชิก';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'ยินดีต้อนรับสู่ $productFullName สำรวจสิทธิประโยชน์ของ $productName ของคุณ และจัดการการสมัครสมาชิกของคุณ';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'ดูฟีเจอร์ $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'คุณมีรหัสของขวัญใหม่รออยู่ในคลังของขวัญของคุณ';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'คุณมีโค้ดของขวัญใหม่ที่ยังไม่ได้เปิดอีก $count รายการในคลังของขวัญของคุณ';
  }

  @override
  String get nagbarViewGiftInventory => 'ดูคลังของขวัญ';

  @override
  String get nagbarVisionaryMfa =>
      'เปิดใช้งานการยืนยันตัวตนสองปัจจัยเพื่อปกป้องบัญชี Visionary ของคุณ';

  @override
  String get nagbarEnableMfa => 'เปิดใช้งาน 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'เราได้อัปเดตข้อกำหนดแล้ว โปรดตรวจสอบและยอมรับเพื่อดำเนินการต่อ';

  @override
  String get nagbarReviewTerms => 'ตรวจสอบข้อกำหนด';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'เข้าร่วม $communityName เพื่อแชทกับทีมและติดตามข่าวสารล่าสุด';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'เข้าร่วม $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'เปิดการแจ้งเตือนเพื่อไม่ให้พลาดข้อความและการกล่าวถึง';

  @override
  String get nagbarEnableNotifications => 'เปิดการแจ้งเตือน';

  @override
  String get nagbarBillingPortalFailed =>
      'ไม่สามารถเปิดหน้าชำระเงินได้ โปรดลองอีกครั้งในสักครู่';

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
  String get next => 'ถัดไป';

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
  String get registerPendingApproval =>
      'คำขอบัญชีของคุณกำลังรอการอนุมัติ คุณจะลงชื่อเข้าใช้ได้หลังจากผู้ดูแลระบบอนุมัติแล้ว';

  @override
  String get registerClosed =>
      'ขณะนี้ปิดการลงทะเบียนอยู่ ใช้ลิงก์ลงทะเบียนจากผู้ดูแลระบบเพื่อสร้างบัญชี';

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
  String get errorServiceUnavailable =>
      'อินสแตนซ์นี้ไม่พร้อมใช้งานชั่วคราว โปรดลองอีกครั้งในอีกสักครู่';

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
  String get embedInviteJoinGroup => 'เข้าร่วมกลุ่ม';

  @override
  String get embedInviteAlreadyJoined => 'เข้าร่วมแล้ว';

  @override
  String get embedInviteDisabled => 'ปิดใช้งานคำเชิญแล้ว';

  @override
  String get embedInvitePaused => 'ปิดรับคำเชิญสำหรับคอมมูนิตี้นี้ชั่วคราว';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName ตรวจพบการโจมตีที่อาจเกิดขึ้น ผู้ใช้ใหม่จึงไม่สามารถเข้าร่วมได้ในขณะนี้';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'คอมมูนิตี้นี้หยุดรับคำเชิญชั่วคราว ลองใหม่อีกครั้งในภายหลังได้เลย';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName ตรวจพบการโจมตีที่อาจเกิดขึ้นในคอมมูนิตี้นี้ การเชิญถูกหยุดชั่วคราว ผู้ใช้ใหม่จึงไม่สามารถเข้าร่วมได้ในขณะนี้';
  }

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
  String get invalidDeepLinkTitle => 'ลิงก์เปิดไม่ได้';

  @override
  String get invalidDeepLinkDescription =>
      'ลิงก์นี้อาจเสีย, ใช้งานได้เฉพาะบนเว็บ, หรือคุณอาจไม่มีสิทธิ์เข้าถึง โปรดตรวจสอบลิงก์แล้วลองอีกครั้ง';

  @override
  String get invalidDeepLinkGoHomeButton => 'กลับหน้าหลัก';

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
    return 'Visionary (ตลอดชีพ $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วันของ $productName',
      one: '1 วันของ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count สัปดาห์ของ $productName',
      one: '1 สัปดาห์ของ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count เดือนสำหรับ $productName',
      one: '1 เดือนสำหรับ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ปีของ $productName',
      one: '1 ปีของ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'จาก $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'คลิกเพื่อรับของขวัญของคุณ!';

  @override
  String get embedGiftAlreadyRedeemed => 'แลกไปแล้ว';

  @override
  String get embedGiftClaimAccountHelp => 'ยืนยันบัญชีเพื่อรับของขวัญนี้';

  @override
  String get embedGiftClaim => 'รับของขวัญ';

  @override
  String get embedGiftClaimed => 'รับของขวัญแล้ว';

  @override
  String get embedGiftClaimAccount => 'ยืนยันบัญชีเพื่อรับของขวัญ';

  @override
  String get embedGiftUnknownTitle => 'ของขวัญไม่รู้จัก';

  @override
  String get embedGiftUnknownSubtitle =>
      'รหัสของขวัญนี้ไม่ถูกต้องหรือถูกใช้ไปแล้ว';

  @override
  String get embedGiftUnavailable => 'ไม่สามารถส่งของขวัญได้';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'รับของขวัญของคุณเพื่อเปิดใช้งานการสมัครสมาชิก $productName ของคุณ!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'ของขวัญชิ้นนี้ถูกรับไปแล้ว';

  @override
  String get giftAcceptMaybeLater => 'ไว้ทีหลัง';

  @override
  String get giftRedeemedToast => 'แลกของขวัญแล้ว!';

  @override
  String get giftRedeemInvalidTitle => 'รหัสของขวัญไม่ถูกต้อง';

  @override
  String get giftRedeemInvalidMessage => 'รหัสนี้ไม่ถูกต้องหรือถูกใช้ไปแล้ว';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'ของขวัญถูกแลกไปแล้ว';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'รหัสนี้ถูกแลกไปแล้ว';

  @override
  String get giftRedeemNotFoundTitle => 'ไม่พบของขวัญ';

  @override
  String get giftRedeemNotFoundMessage => 'รหัสนี้ไม่มีอยู่จริง';

  @override
  String get giftRedeemFailedTitle => 'ไม่สามารถแลกของขวัญได้';

  @override
  String get giftRedeemFailedMessage => 'แลกของขวัญนี้ไม่ได้ ลองอีกครั้ง';

  @override
  String get giftVisionaryCannotRedeemTitle => 'ไม่สามารถแลกของขวัญชิ้นนี้ได้';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'บัญชี Visionary ไม่สามารถแลกรับ Plutonium ได้ คัดลอกลิงก์เพื่อแชร์กับเพื่อนแทน';

  @override
  String get giftCopyLink => 'คัดลอกลิงก์ของขวัญ';

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
  String get notificationUseCategoryDefault => 'ใช้ค่าเริ่มต้นของหมวดหมู่';

  @override
  String get notificationUseCommunityDefault => 'ใช้ค่าเริ่มต้นของชุมชน';

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
  String get dmDeleteMyMessagesTitle =>
      'ลบข้อความของคุณในการสนทนานี้ใช่หรือไม่';

  @override
  String get dmDeleteMyMessagesDescription =>
      'ข้อความทั้งหมดที่คุณเคยส่งในการสนทนานี้จะถูกลบอย่างถาวร การดำเนินการนี้ไม่สามารถเลิกทำได้';

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
  String get dmUnnamedGroup => 'กลุ่มที่ไม่มีชื่อ';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'กลุ่มของ$resolvedName';
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
  String get dmDebugCategory => 'ดีบักหมวดหมู่';

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
  String get addFriendVerifyToSend => 'ยืนยันอีเมลของคุณก่อนส่งคำขอเป็นเพื่อน';

  @override
  String get addFriendFriendsListFull =>
      'รายชื่อเพื่อนของคุณหรือของอีกฝ่ายเต็มแล้ว ลบเพื่อนบางคนออกแล้วลองอีกครั้ง';

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
  String emojiInfoDefaultDescription(String productName) {
    return 'นี่คืออิโมจิเริ่มต้นบน $productName';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'อิโมจินี้มาจากชุมชนนี้ คุณสามารถใช้ได้ทุกที่';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'นี่คืออิโมจิที่กำหนดเองจากชุมชน';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'นี่คืออิโมจิที่กำหนดเองจากชุมชน ลองขอให้ผู้สร้างเชิญคุณเพื่อใช้อิโมจินี้';

  @override
  String get emojiInfoFromHeader => 'อิโมจินี้มาจาก';

  @override
  String get emojiInfoDiscoverableCommunity => 'คอมมูนิตี้ที่ค้นพบได้';

  @override
  String get emojiInfoPrivateCommunity => 'ชุมชนส่วนตัว';

  @override
  String get emojiInfoVerifiedCommunity => 'คอมมูนิตี้ที่ตรวจสอบแล้ว';

  @override
  String get emojiInfoAddToFavorites => 'เพิ่มในรายการโปรด';

  @override
  String get emojiInfoRemoveFromFavorites => 'นำออกจากรายการโปรด';

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
  String get gifPickerFavoritesEmptyTitle => 'ยังไม่มี GIF ที่ชอบ';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'ปักหมุด GIF ที่ชอบเพื่อดูที่นี่';

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
  String externalLinkWarningLeaving(String productName) {
    return 'คุณกำลังจะออกจาก $productName';
  }

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
  String profilePreviewMemberSince(String productName) {
    return 'สมาชิก $productName ตั้งแต่';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return 'จัดการที่อยู่อีเมลที่คุณใช้ลงชื่อเข้าใช้ $productName';
  }

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
      'เราจะส่งรหัส SMS ไปให้เมื่อพร้อม หมายเลขของคุณจะไม่เชื่อมโยงกับบัญชีของคุณ เราจะเก็บเฉพาะเครื่องหมายที่เข้ารหัสไว้เท่านั้น โดยไม่มีรหัสผู้ใช้ เพื่อให้สามารถยืนยันได้สูงสุด 2 ครั้งภายในประมาณ 30 วัน';

  @override
  String get phoneAddSendCode => 'ส่งรหัส';

  @override
  String get phoneVerifyTitle => 'ยืนยันหมายเลขโทรศัพท์';

  @override
  String get phoneVerifyDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังหมายเลขโทรศัพท์ของคุณ';

  @override
  String get phoneAddSuccess => 'ยืนยันเบอร์โทรศัพท์แล้ว';

  @override
  String get phoneCountryLabel => 'ประเทศ';

  @override
  String get phoneSearchCountries => 'ค้นหาประเทศ...';

  @override
  String get phoneNumberRequired => 'ต้องระบุหมายเลขโทรศัพท์';

  @override
  String get phoneEnterValidNumber => 'ป้อนหมายเลขโทรศัพท์มือถือที่ถูกต้อง';

  @override
  String get phoneCannotBeUsed =>
      'ไม่สามารถใช้หมายเลขโทรศัพท์นี้ได้ โปรดลองใช้หมายเลขโทรศัพท์มือถืออื่นหรือติดต่อฝ่ายสนับสนุน';

  @override
  String get phoneAlreadyUsed =>
      'หมายเลขโทรศัพท์นี้ถูกใช้ไปแล้ว ลองใช้หมายเลขอื่นหรือติดต่อฝ่ายสนับสนุน';

  @override
  String get phoneCodeDidNotWork => 'รหัสไม่ถูกต้อง โปรดตรวจสอบแล้วลองอีกครั้ง';

  @override
  String get phoneTooManyAttempts =>
      'พยายามหลายครั้งเกินไป โปรดรอสักครู่แล้วลองอีกครั้ง';

  @override
  String get phoneSmsUnavailable =>
      'ไม่สามารถยืนยัน SMS ได้ในขณะนี้ โปรดลองอีกครั้งในภายหลังหรือติดต่อฝ่ายสนับสนุน';

  @override
  String get phoneNotEligible =>
      'การยืนยันทางโทรศัพท์ไม่พร้อมใช้งานสำหรับบัญชีนี้ โปรดใช้วิธีอื่นหรือติดต่อฝ่ายสนับสนุน';

  @override
  String get phoneCaptchaRequired =>
      'ต้องมีการตรวจสอบเบราว์เซอร์ก่อนยืนยันเบอร์โทรศัพท์ ลองอีกครั้งจากหน้าลงชื่อเข้าใช้หรือติดต่อฝ่ายสนับสนุน';

  @override
  String get phoneSomethingWentWrong =>
      'เกิดข้อผิดพลาดบางอย่าง โปรดลองอีกครั้ง';

  @override
  String get phoneInboundExpensiveDescription =>
      'การส่ง SMS ไปยังหมายเลขโทรศัพท์นี้มีค่าใช้จ่ายสูง เราจึงต้องการให้คุณส่ง SMS มาให้เราแทน คุณสามารถติดต่อฝ่ายสนับสนุนเพื่อขอให้เรายกเลิกข้อกำหนดนี้สำหรับบัญชีของคุณได้';

  @override
  String get phoneInboundDefaultDescription =>
      'เราต้องการให้คุณส่ง SMS เพื่อยืนยันหมายเลขโทรศัพท์ของคุณ';

  @override
  String get phoneInboundStepOpenMessaging =>
      'เปิดแอปข้อความในโทรศัพท์ของคุณ แล้วสร้างข้อความใหม่';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'ส่งรหัส $code ไปยัง $number';
  }

  @override
  String get phoneInboundStepWait =>
      'รอสักครู่เพื่อให้เราได้รับข้อความของคุณ อาจใช้เวลาสักครู่';

  @override
  String get phoneInboundGetNewCode => 'ขอรหัสใหม่';

  @override
  String get phoneInboundChallengeCodeLabel => 'รหัสที่จะส่ง';

  @override
  String get phoneInboundOurNumberLabel => 'ส่งไปที่';

  @override
  String get requiredActionTitle => 'ต้องยืนยันบัญชี';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'ดำเนินการยืนยันที่จำเป็นเพื่อใช้งาน $productName ต่อไป';
  }

  @override
  String get requiredActionIntroPhone =>
      'การลงทะเบียนของคุณต้องผ่านการตรวจสอบสแปมเพิ่มเติมก่อนดำเนินการต่อ';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'ยืนยันอีเมลหรือเบอร์โทรศัพท์ของคุณเพื่อใช้งาน $productName ต่อไป';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'โปรดยืนยันอีเมลและเบอร์โทรศัพท์ให้เรียบร้อยเพื่อใช้งาน $productName ต่อไป';
  }

  @override
  String get requiredActionChooseMethodTitle => 'เลือกวิธีการยืนยัน';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'ดำเนินการยืนยันตัวตนวิธีใดวิธีหนึ่งด้านล่างเพื่อใช้งาน $productName ต่อไป';
  }

  @override
  String get requiredActionUseEmail => 'ใช้ที่อยู่อีเมล';

  @override
  String get requiredActionUsePhone => 'ใช้โทรศัพท์';

  @override
  String get requiredActionCheckEmailTitle => 'ตรวจสอบอีเมลของคุณ';

  @override
  String get requiredActionCheckEmailDescription =>
      'เราส่งลิงก์ยืนยันไปยังอีเมลของคุณแล้ว เปิดลิงก์นั้นเพื่อดำเนินการต่อ';

  @override
  String get requiredActionResendVerificationEmail => 'ส่งอีเมลยืนยันอีกครั้ง';

  @override
  String get requiredActionVerificationEmailSent =>
      'ส่งอีเมลยืนยันแล้ว โปรดตรวจสอบกล่องจดหมายเข้าของคุณ';

  @override
  String get requiredActionSignOut => 'ออกจากระบบ';

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
  String get networkErrorMessage => 'เกิดข้อผิดพลาดบางอย่าง โปรดลองอีกครั้ง';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count สัปดาห์ที่แล้ว',
      one: '1 สัปดาห์ที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count นาที',
      one: '1 นาที',
    );
    return 'ในอีก $_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชั่วโมง',
      one: '1 ชั่วโมง',
    );
    return 'ในอีก $_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ในอีก $count วัน',
      one: 'ใน 1 วัน',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ใน $count สัปดาห์',
      one: 'ใน 1 สัปดาห์',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ในอีก $count เดือน',
      one: 'ใน 1 เดือน',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ในอีก $count ปี',
      one: 'ใน 1 ปี',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'เมื่อสักครู่';

  @override
  String get authorizedAppsTitle => 'แอปพลิเคชันที่ได้รับอนุญาต';

  @override
  String authorizedAppsDescription(String productName) {
    return 'แอปพลิเคชันเหล่านี้ได้รับอนุญาตให้เข้าถึงบัญชี $productName ของคุณ';
  }

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
  String get userProfileLoading => 'กำลังโหลดโปรไฟล์';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return 'ทีมงาน $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'ทีมชุมชน $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'พันธมิตร $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'ผู้ล่าบั๊ก $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return '$productName Plutonium';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return 'สมาชิก $productName Plutonium ตั้งแต่ $date';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return '$productName Visionary';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Visionary ตั้งแต่ $date';
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
  String get userProfileRoles => 'บทบาท';

  @override
  String get memberRoleAdd => 'เพิ่มบทบาท';

  @override
  String memberRoleRemove(String roleName) {
    return 'ลบตำแหน่ง $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'ผู้ใช้รายนี้ไม่มีบทบาทในคอมมูนิตี้นี้';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'ยังไม่มีบทบาท เพิ่มบทบาทได้ที่ $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'ไม่มีบทบาทให้เลือก';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'ขณะนี้ยังไม่มีบทบาทให้กำหนดในชุมชนนี้ แต่คุณสามารถสร้างบทบาทใหม่ได้ที่ $rolesSettingsPath';
  }

  @override
  String get guildSettingsTitle => 'การตั้งค่าชุมชน';

  @override
  String get guildSettingsRolesTab => 'บทบาท';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'เวลาท้องถิ่น';

  @override
  String get userProfileSameTimeAsYou => 'เวลาเดียวกับคุณ';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'เร็วกว่าคุณ $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'ช้ากว่าคุณ $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ชั่วโมง',
      one: '1 ชั่วโมง',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes นาที',
      one: '1 นาที',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ชั่วโมง',
      one: '1 ชั่วโมง',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes นาที',
      one: '1 นาที',
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
  String get iarReportGuildTitle => 'รายงานคอมมูนิตี้';

  @override
  String get iarReportGuildPreconfirmBody =>
      'หากรายงานนี้เกี่ยวกับข้อความใดข้อความหนึ่งในคอมมูนิตี้นี้ ให้รายงานข้อความนั้นแทน การรายงานข้อความจะช่วยให้ทีมความปลอดภัยของเราเข้าใจบริบทได้ชัดเจนที่สุด และการเพิ่มรายละเอียดในความคิดเห็นจะช่วยให้เราตรวจสอบได้เร็วขึ้น ดำเนินการรายงานทั้งคอมมูนิตี้ก็ต่อเมื่อการรายงานข้อความไม่สามารถครอบคลุมปัญหาในวงกว้างได้';

  @override
  String get iarContinueToReportCommunity => 'รายงานคอมมูนิตี้ต่อ';

  @override
  String get iarPreviewCommunitySubtitle => 'ชุมชน';

  @override
  String get iarReasonHarassmentGuildLabel => 'การคุกคามหรือการกลั่นแกล้ง';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'ชุมชนอาจนำไปสู่การรุมโจมตีหรือการกลั่นแกล้ง';

  @override
  String get iarReasonHateGuildDescription =>
      'ส่งเสริมความเกลียดชังต่อกลุ่มที่ได้รับการคุ้มครอง';

  @override
  String get iarReasonTerrorismLabel => 'การก่อการร้ายหรือแนวคิดสุดโต่ง';

  @override
  String get iarReasonTerrorismDescription =>
      'ส่งเสริม ชักชวน หรือประสานงานกิจกรรมความรุนแรงสุดโต่ง';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'เนื้อหาสำหรับผู้ใหญ่หรือไม่ปลอดภัย';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'เนื้อหาสำหรับผู้ใหญ่ที่ไม่มีการคัดกรองที่เหมาะสม';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'เป็นอันตรายต่อผู้เยาว์หรือมีเนื้อหาเกี่ยวกับการแสวงหาประโยชน์จากเด็ก';

  @override
  String get iarReasonRaidLabel => 'ประสานงานการโจมตี';

  @override
  String get iarReasonRaidDescription =>
      'ประสานงานการโจมตี, การรวมกลุ่ม หรือการคุกคามต่อบุคคลหรือชุมชน';

  @override
  String get iarReasonSpamGuildDescription =>
      'ชุมชนมีไว้เพื่อสแปม หลอกลวง หรือใช้แพลตฟอร์มในทางที่ผิด';

  @override
  String get iarReasonMalwareGuildLabel => 'เผยแพร่มัลแวร์';

  @override
  String get iarReasonMalwareGuildDescription =>
      'เผยแพร่มัลแวร์, ขโมยข้อมูลประจำตัว หรือไฟล์อันตราย';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'การละเมิดความเป็นส่วนตัวหรือการเปิดเผยข้อมูลส่วนตัว';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'แชร์ข้อมูลส่วนตัว, สะกดรอยตามผู้ใช้ หรือประสานงานการละเมิดความเป็นส่วนตัว';

  @override
  String get iarReasonSelfHarmGuildLabel => 'ส่งเสริมการทำร้ายตัวเอง';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'สนับสนุนการฆ่าตัวตาย ทำร้ายตัวเอง หรือการกินที่ผิดปกติ';

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
      other:
          'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์เหล่านั้น',
      one:
          'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์นั้น',
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
  String get slowmodeStatusEnabled => 'เปิดโหมดจำกัดเวลา';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'โหมดจำกัดเวลาทำงานอยู่ ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'โหมดจำกัดเวลาถูกตั้งเป็น $durationLabel แต่คุณไม่ถูกจำกัด';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'โหมดจำกัดเวลาถูกตั้งเป็น $durationLabel รอก่อนส่งข้อความถัดไป';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'โหมดจำกัดเวลาถูกตั้งเป็น $durationLabel สำหรับช่องนี้';
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
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName มีขนาดใหญ่เกินขีดจำกัด ($fileSize)';
  }

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
      'กดค้างเพื่อบันทึก ลากไปที่ถังขยะเพื่อลบ เลื่อนขึ้นเพื่อล็อค หรือปล่อยเพื่อส่ง';

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
  String get voiceMessageSeekForward => 'กรอไปข้างหน้า';

  @override
  String get voiceMessageSeekBackward => 'กรอเสียงไปข้างหลัง';

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
  String get chatAttachmentDownloadedToast => 'บันทึกไปยังรูปภาพแล้ว';

  @override
  String get chatAttachmentDownloadFailedToast => 'ดาวน์โหลดไฟล์แนบไม่สำเร็จ';

  @override
  String get chatAttachmentExpiredTooltip => 'ไฟล์แนบหมดอายุ';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ขยาย ($count บรรทัด)',
      one: 'ขยาย ($count บรรทัด)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ยุบ ($count บรรทัด)',
      one: 'ยุบ ($count บรรทัด)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ขยาย ($count แถว)',
      one: 'ขยาย ($count แถว)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ยุบ ($count แถว)',
      one: 'ยุบ ($count แถว)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (เหลืออีก $count บรรทัด)',
      one: '... (เหลืออีก $count บรรทัด)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (เหลืออีก $count แถว)',
      one: '... (เหลืออีก $count แถว)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'ดูไฟล์ทั้งหมด';

  @override
  String get chatTextualPreviewChangeLanguage => 'เปลี่ยนภาษา';

  @override
  String get chatTextualPreviewSearchLanguage => 'ค้นหาภาษา…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'การเน้นไวยากรณ์';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'ไม่พบผลลัพธ์';

  @override
  String get chatTextualPreviewMoreOptions => 'ตัวเลือกเพิ่มเติม';

  @override
  String get chatTextualPreviewWrapText => 'ตัดข้อความขึ้นบรรทัดใหม่';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'ไฟล์ใหญ่เกินไปสำหรับการแสดงตัวอย่างแบบอินไลน์ (จำกัด $previewLimitKb KB)';
  }

  @override
  String get chatTextualPreviewLoadError => 'ไม่สามารถโหลดตัวอย่างได้';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'ข้อความธรรมดา';

  @override
  String get chatTextualPreviewCopy => 'คัดลอก';

  @override
  String get chatAttachmentSourceGallery => 'คลังภาพ';

  @override
  String get chatAttachmentSourceCamera => 'กล้อง';

  @override
  String get chatAttachmentSourceBrowse => 'เรียกดูไฟล์';

  @override
  String get chatAttachmentPasteTooltip => 'วางไฟล์จากคลิปบอร์ด';

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
  String connectionsDescription(String productName) {
    return 'เชื่อมโยงบัญชีและโดเมนภายนอกเข้ากับโปรไฟล์ $productName ของคุณ การเชื่อมต่อที่ยืนยันแล้วจะแสดงบนโปรไฟล์ของคุณเพื่อให้ผู้อื่นเห็น';
  }

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
  String get lookAndFeelHdrSectionTitle => 'ช่วงไดนามิกสูง';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'ควบคุมการแสดงภาพ HDR บนจอภาพที่รองรับ HDR';

  @override
  String get lookAndFeelHdrFullName => 'ช่วงไดนามิกเต็มรูปแบบ';

  @override
  String get lookAndFeelHdrFullDescription =>
      'แสดงภาพ HDR ด้วยความสว่างและช่วงสีเต็มรูปแบบ';

  @override
  String get lookAndFeelHdrStandardName => 'ช่วงสีมาตรฐาน';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'ปรับโทนภาพ HDR เป็นช่วงมาตรฐาน ลดความสว่างสูงสุด';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'โหมดการแสดงผลแบบ HDR';

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
  String get lookAndFeelChatFontScalingTitle => 'ขนาดตัวอักษรแชท';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'ปรับขนาดฟอนต์ในพื้นที่แชท';

  @override
  String get lookAndFeelChatFontSizeLabel => 'ขนาดตัวอักษรแชท';

  @override
  String get lookAndFeelAppZoomTitle => 'ระดับการซูมของแอป';

  @override
  String get lookAndFeelAppZoomDescription => 'ปรับระดับการซูมของแอป';

  @override
  String get lookAndFeelChatWallpaperTitle => 'วอลเปเปอร์แชท';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'เลือกพื้นหลังสำหรับแชทของคุณ สิ่งนี้จะอยู่ในอุปกรณ์นี้';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'การตั้งค่านี้จะอยู่ในอุปกรณ์นี้';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'วอลเปเปอร์แชทจะถูกบันทึกไว้ในอุปกรณ์นี้เท่านั้น และจะไม่ซิงค์ไปยังอุปกรณ์อื่น';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'ค่าเริ่มต้น';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'รูปภาพที่กำหนดเอง';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'สี $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'ไล่เฉดสี $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'ปรับความเข้มวอลเปเปอร์';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'ไม่สามารถตั้งค่ารูปภาพนั้นเป็นวอลเปเปอร์ของคุณได้';

  @override
  String get lookAndFeelMessagesSectionTitle => 'ข้อความ';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'เลือกวิธีแสดงข้อความในช่องแชท';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'ระยะห่างระหว่างกลุ่มข้อความ';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'โหมดการแสดงข้อความ';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'สบายตา';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'เลย์เอาต์กว้างขวาง แยกข้อความชัดเจน';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'กระชับ';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'เพิ่มข้อความที่มองเห็นได้สูงสุดด้วยระยะห่างที่น้อยที่สุด';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'ซ่อนรูปโปรไฟล์ผู้ใช้';

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
      one:
          '1 ชุมชนไม่พร้อมใช้งานชั่วคราวเนื่องจากความผิดปกติของฟลักซ์คาปาซิเตอร์',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'คอมมูนิตี้ใช้งานชั่วคราวไม่ได้';

  @override
  String get guildUnavailableDescription =>
      'เกิดข้อผิดพลาดบางอย่าง เรากำลังดำเนินการแก้ไขอยู่';

  @override
  String get guildNotFoundTitle => 'นี่ไม่ใช่คอมมูนิตี้ที่คุณกำลังมองหา';

  @override
  String get guildNotFoundDescription =>
      'ชุมชนที่คุณกำลังมองหาอาจถูกลบไปแล้ว หรือคุณอาจไม่ได้รับสิทธิ์เข้าถึง';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'ขณะนี้ $communityName เข้าถึงได้เฉพาะเจ้าหน้าที่ของ $productName เท่านั้น';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'ไม่พร้อมใช้งานชั่วคราว';

  @override
  String get lookAndFeelCollapseDMsLabel => 'ยุบ DM เป็นโฟลเดอร์';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'เมื่อเปิดใช้งาน DM ที่ยังไม่ได้อ่านในแถบด้านข้างเซิร์ฟเวอร์จะถูกยุบเป็นโฟลเดอร์ในปุ่ม $productName คลิกปุ่ม $productName ขณะที่อยู่ในหน้า DM เพื่อขยายหรือยุบโฟลเดอร์';
  }

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
  String get favoritesAddToSavedMedia => 'เพิ่มไปยังสื่อที่บันทึกไว้';

  @override
  String get favoritesRemoveFromSavedMedia => 'ลบออกจากสื่อที่บันทึกไว้';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'เพิ่มลงในรายการ GIF ที่ชื่นชอบ (จาก URL)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'ลบออกจากรายการ GIF ที่บันทึกโดยใช้ URL';

  @override
  String get savedMediaAddTitle => 'เพิ่มไปยังสื่อที่บันทึกไว้';

  @override
  String get savedMediaFormNameLabel => 'ชื่อ';

  @override
  String get savedMediaFormNameHint => 'มีเดียสุดเจ๋งของฉัน';

  @override
  String get savedMediaFormAltTextLabel => 'ข้อความ Alt';

  @override
  String get savedMediaFormAltTextHint => 'อธิบายสื่อนี้';

  @override
  String get savedMediaFormTagsLabel => 'แท็ก';

  @override
  String get savedMediaFormTagsHint => 'ตลก, รีแอคชัน, งาน';

  @override
  String get savedMediaSaveError => 'ไม่สามารถอัปเดตสื่อที่บันทึกไว้ได้';

  @override
  String get savedMediaNameRequired => 'ต้องระบุชื่อ';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'เราควรบันทึกรายการ GIF ที่คุณชื่นชอบไว้อย่างไร';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'คุณสามารถเก็บ GIF ที่ติดดาวไว้เป็นรายการโปรดแบบ URL เท่านั้น หรืออัปโหลดไปยังสื่อที่บันทึกไว้ของคุณก็ได้ เลือกแบบที่เหมาะกับการใช้งานของคุณ คุณสามารถเปลี่ยนแปลงได้ตลอดเวลาใน การตั้งค่า > ขั้นสูง > สื่อ';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'รายการโปรดเฉพาะ URL (ค่าเริ่มต้น): ซิงค์ข้ามอุปกรณ์ของคุณ ไม่มีการอัปโหลด ไม่นับรวมในสื่อที่บันทึกไว้ สื่อต้นฉบับอาจหายไปหากโฮสต์ลบออก';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'สื่อที่บันทึกไว้: อัปโหลดได้ ติดแท็กได้ ค้นหาได้ และคงอยู่ถาวร แต่จะนับรวมกับขีดจำกัดสื่อที่บันทึกไว้ของคุณ';

  @override
  String get gifFavoriteFirstTimeHint => 'เราจะถามคุณเพียงครั้งเดียว';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'ใช้เฉพาะ URL (แนะนำ)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'ใช้สื่อที่บันทึกไว้';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'เมื่ออัปโหลดโดยตรงไปยัง $productName';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'การอัปโหลดจากกล้อง';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'เลือกว่าจะเก็บรูปภาพและวิดีโอที่ถ่ายด้วยกล้องในแอปไว้ในอุปกรณ์ของคุณหรือไม่';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'บันทึกไปยังอุปกรณ์';

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
  String get accessibilitySaturationTitle => 'ความอิ่มตัวของสี';

  @override
  String get accessibilitySaturationDescription =>
      'ปรับความสดใสของสีธีมที่แสดงทั่วทั้งแอป';

  @override
  String get accessibilityVisualGroupTitle => 'การแสดงผล';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'ขีดเส้นใต้ลิงก์เสมอ';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'หรี่ข้อความขีดทับ';

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
  String get accessibilityScreenReaderGroupTitle => 'โปรแกรมอ่านหน้าจอ';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'ควบคุมการทำงานของ $productName กับโปรแกรมอ่านหน้าจอ';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'ประกาศข้อความใหม่';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'ให้โปรแกรมอ่านหน้าจอประกาศข้อความใหม่เมื่อมาถึงในช่องที่เปิดอยู่ เสียงแจ้งเตือนจะไม่ได้รับผลกระทบ';

  @override
  String get accessibilityTtsGroupTitle => 'ข้อความเป็นเสียงพูด';

  @override
  String get accessibilityTtsGroupDescription =>
      'เลือกระดับความเร็วสำหรับข้อความที่อ่านออกเสียง';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'ความเร็วในการเล่นเสียงพูด';

  @override
  String get accessibilityTtsPlaySampleLabel => 'เล่นตัวอย่าง';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'ตัวอย่างเสียงเงียบ';

  @override
  String get accessibilityPreviewButtonLabel => 'ปุ่มดูตัวอย่าง';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'นี่คือตัวอย่างการแสดงลิงก์: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'ผู้ใช้ตัวอย่าง';

  @override
  String get accessibilityKeyboardGroupTitle => 'แป้นพิมพ์';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'แสดงวงแหวนโฟกัสบนช่องข้อความแชท';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'ปุ่ม Esc ออกจากโหมดแป้นพิมพ์';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'แสดงปุ่มลัดเมนูบริบท';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'ยืนยันก่อนเริ่มการโทร';

  @override
  String get accessibilityAnimationGroupTitle => 'ภาพเคลื่อนไหว';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'เปิดการเคลื่อนไหวแบบลดลงแล้ว แอนิเมชันเนื้อหาจึงหยุดชั่วคราวโดยค่าเริ่มต้น คุณยังคงสามารถเปิดแอนิเมชันเหล่านี้กลับมาได้เพื่อให้เล่นต่อ';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'เล่นอิโมจิเคลื่อนไหว';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'เล่น GIF อัตโนมัติ';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'เล่น GIF อัตโนมัติเมื่อ $productName อยู่ในโฟกัส';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'กำลังเล่นแม้จะลดการเคลื่อนไหวแล้วก็ตาม';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'หยุดชั่วคราวเนื่องจากการเคลื่อนไหวลดลง เปิดเพื่อเล่นอิโมจิเคลื่อนไหวต่อ';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'หยุดชั่วคราวเนื่องจากการเคลื่อนไหวลดลง เปิดเพื่อเล่น GIF ต่อไป';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'ค่าเริ่มต้นคือปิดในมือถือเพื่อประหยัดแบตเตอรี่และอินเทอร์เน็ต';

  @override
  String get accessibilityStickerAnimationsTitle => 'ภาพเคลื่อนไหวสติกเกอร์';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'การตั้งค่าภาพเคลื่อนไหวสติกเกอร์';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'เล่นภาพเคลื่อนไหวเสมอ';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'สติกเกอร์จะเคลื่อนไหวเสมอ';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'ภาพเคลื่อนไหวเมื่อมีการโต้ตอบ';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'สติกเกอร์จะเคลื่อนไหวเมื่อคุณกด';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'สติกเกอร์จะเคลื่อนไหวเมื่อคุณวางเมาส์หรือแตะ';

  @override
  String get accessibilityStickerNeverAnimateName => 'ไม่เล่นภาพเคลื่อนไหวเลย';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'สติกเกอร์จะไม่เคลื่อนไหว';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'แสดงภาพเคลื่อนไหวเสมอแม้จะเปิดโหมดลดการเคลื่อนไหว';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'การเคลื่อนไหวแบบลดจะจำกัดสติกเกอร์ให้เคลื่อนไหวเมื่อมีการโต้ตอบเท่านั้น หากต้องการให้เคลื่อนไหวตลอดเวลา ให้เลือก \'เคลื่อนไหวตลอดเวลา\'';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'ค่าเริ่มต้นคือเล่นภาพเคลื่อนไหวเมื่อมีการโต้ตอบบนมือถือเพื่อประหยัดแบตเตอรี่';

  @override
  String get accessibilityMotionGroupTitle => 'การเคลื่อนไหว';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'ซิงค์การตั้งค่าลดการเคลื่อนไหวกับระบบ';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'ใช้การตั้งค่าลดการเคลื่อนไหวของระบบของอุปกรณ์นี้ หรือปรับแต่งด้านล่าง';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'ลดการเคลื่อนไหว';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'ปิดภาพเคลื่อนไหวและการเปลี่ยนฉาก ขณะนี้ควบคุมโดยการตั้งค่าระบบของคุณ';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'ปิดภาพเคลื่อนไหวและการเปลี่ยนฉากในแอป';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'คุณสามารถควบคุมอิโมจิ, GIF และสติกเกอร์แบบเคลื่อนไหวได้ในแท็บภาพเคลื่อนไหว';

  @override
  String get accessibilityConfirmStartCallTitle => 'เริ่มการโทรหรือไม่';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการเริ่มการโทรนี้?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'เริ่มโทร';

  @override
  String get accessibilityTtsSampleDescription =>
      'ฟังตัวอย่างประโยคด้วยความเร็วที่คุณเลือก';

  @override
  String get accessibilityTtsSampleText =>
      'ด็อก ผมมาจากอนาคต ผมมาที่นี่ด้วยไทม์แมชชีนที่คุณเป็นคนประดิษฐ์ขึ้นมา ตอนนี้ผมต้องการความช่วยเหลือจากคุณเพื่อกลับไปยังปี 1985';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'การสังเคราะห์คำพูดไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'เล่นเสียงไม่ได้ ลองอีกครั้ง หรือตรวจสอบว่าลำโพงทำงานปกติ';

  @override
  String get ttsSubstitutionUnknownUser => 'ผู้ใช้ไม่ทราบชื่อ';

  @override
  String get ttsSubstitutionUnknownRole => 'ไม่ทราบบทบาท';

  @override
  String get ttsSubstitutionUnknownChannel => 'ช่องทางไม่รู้จัก';

  @override
  String get ttsSubstitutionCodeBlock => 'บล็อกโค้ด';

  @override
  String get ttsSubstitutionSpoiler => 'สปอยล์';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'อิโมจิ $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName พูดว่า: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'ตอบกลับ $replyAuthorName, $authorName พูดว่า: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'ส่งสติกเกอร์';

  @override
  String get ttsSentAttachment => 'ส่งไฟล์แนบ';

  @override
  String ttsSentAttachments(int count) {
    return 'ส่งไฟล์แนบ $count รายการ';
  }

  @override
  String get ttsSentEmbed => 'ส่ง Embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author ส่ง $summary';
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
  String get systemCallJoinTheCall => 'เข้าร่วมการโทร';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username เริ่มต้นการโทรซึ่งกินเวลา $duration';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'คุณพลาดสายจาก $username ที่นาน $duration';
  }

  @override
  String systemCallMissed(String username) {
    return 'คุณพลาดสายจาก $username';
  }

  @override
  String get systemCallDurationFewSeconds => 'ไม่กี่วินาทีที่ผ่านมา';

  @override
  String get systemCallDurationMinute => '1 นาที';

  @override
  String get systemCallDurationOneYear => '1 ปี';

  @override
  String get systemCallDurationOneMonth => '1 เดือน';

  @override
  String get systemCallDurationOneWeek => '1 สัปดาห์';

  @override
  String get systemCallDurationOneDay => '1 วัน';

  @override
  String get systemCallDurationOneHour => '1 ชั่วโมง';

  @override
  String systemCallDurationYears(int count) {
    return '$count ปี';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count เดือน';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count สัปดาห์';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count วัน';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count ชั่วโมง';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count นาที';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'อัปเดต $productName เพื่อดูข้อความนี้';
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
      one:
          'คุณเชื่อมต่อกับช่องเสียงนี้จากอุปกรณ์อื่นแล้ว 1 เครื่อง ต้องการทำอะไร?',
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
  String get voiceJoinFailedTitle => 'เข้าร่วมเสียงไม่ได้';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'ไม่สามารถตัดการเชื่อมต่ออุปกรณ์อื่นของคุณได้ ลองอีกครั้งในสักครู่';

  @override
  String get voiceChannelEmptyDescription =>
      'นี่คือช่องเสียง เชื่อมต่อเพื่อเริ่มพูดคุย!';

  @override
  String get voiceChannelJoin => 'เข้าร่วมช่องเสียง';

  @override
  String get voiceCallJoin => 'เข้าร่วม';

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
  String get voiceControlFlipCamera => 'สลับกล้อง';

  @override
  String get voiceControlScreenShare => 'แชร์หน้าจอ';

  @override
  String get voiceScreenShareNotificationText => 'กำลังแชร์หน้าจอของคุณ';

  @override
  String get voiceControlMore => 'เพิ่มเติม';

  @override
  String get voiceControlDisconnect => 'ตัดการเชื่อมต่อ';

  @override
  String get voiceInChat => 'ในการสนทนาด้วยเสียง';

  @override
  String get voiceConnectionFailed => 'การเชื่อมต่อล้มเหลว';

  @override
  String get voiceConnectionRetry => 'ลองอีกครั้ง';

  @override
  String get voiceConnectionDismiss => 'ปิด';

  @override
  String get voiceConnectionDisconnected => 'ตัดการเชื่อมต่อแล้ว';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency มิลลิวินาที';
  }

  @override
  String get voiceMeasuringLatency => 'กำลังวัดเวลาแฝง...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'ข้ามไปที่ $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'การเชื่อมต่อด้วยเสียง';

  @override
  String get voiceConnectionAdvancedStats => 'ขั้นสูง';

  @override
  String get voiceShowCallAvatars => 'แสดงรูปโปรไฟล์ในสาย';

  @override
  String get voiceShowConnectionId => 'แสดง ID การเชื่อมต่อ';

  @override
  String get voiceAudioProcessing => 'กำลังประมวลผลเสียง';

  @override
  String get voiceConnectionSessionSection => 'เซสชัน';

  @override
  String get voiceConnectionDurationLabel => 'ระยะเวลา';

  @override
  String get voiceConnectionParticipantsLabel => 'ผู้เข้าร่วม';

  @override
  String get voiceConnectionNetworkSection => 'เครือข่าย';

  @override
  String get voiceConnectionPingLabel => 'ปิง';

  @override
  String get voiceConnectionJitterLabel => 'ความผันผวนของสัญญาณ';

  @override
  String get voiceConnectionSendLabel => 'ส่ง';

  @override
  String get voiceConnectionReceiveLabel => 'รับ';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes นาที $seconds วินาที';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency มิลลิวินาที';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter มิลลิวินาที';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth กิโลบิตต่อวินาที';
  }

  @override
  String get userAreaMuteMicrophone => 'ปิดเสียงไมโครโฟน';

  @override
  String get userAreaUnmuteMicrophone => 'เปิดเสียงไมโครโฟน';

  @override
  String get userAreaUserSettings => 'การตั้งค่าผู้ใช้';

  @override
  String get voiceParticipantMenuViewProfile => 'ดูโปรไฟล์';

  @override
  String get voiceParticipantMenuFocus => 'โฟกัสคนนี้';

  @override
  String get voiceParticipantMenuUnfocus => 'เลิกโฟกัส';

  @override
  String get voiceParticipantMenuCommunityMute => 'ปิดเสียงในคอมมูนิตี้';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'ปิดเสียงในคอมมูนิตี';

  @override
  String get voiceParticipantMenuUserVolume => 'ระดับเสียงของผู้ใช้';

  @override
  String get voiceParticipantMenuStreamVolume => 'ระดับเสียงสตรีม';

  @override
  String get voiceParticipantMenuStopStreaming => 'หยุดสตรีม';

  @override
  String get voiceParticipantModerationFailed =>
      'ไม่สามารถอัปเดตสมาชิกนั้นได้ โปรดลองอีกครั้ง';

  @override
  String get voiceControlChat => 'แชท';

  @override
  String get voiceCallViewModeLabel => 'ดู';

  @override
  String get voiceCallViewModeGrid => 'ตาราง';

  @override
  String get voiceCallViewModeFocus => 'โหมดโฟกัส';

  @override
  String get voicePanelSettingsSectionTitle => 'การตั้งค่าเสียง';

  @override
  String get voicePanelUseEarpieceLabel => 'ใช้หูฟัง';

  @override
  String get voicePanelOnlyShowVideosLabel => 'แสดงเฉพาะวิดีโอ';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'แสดงเฉพาะผู้เข้าร่วมที่เปิดกล้องอยู่';

  @override
  String get voicePanelShowOwnCameraLabel => 'แสดงกล้องของฉัน';

  @override
  String get voicePrioritizeSpeakersLabel => 'จัดลำดับความสำคัญของผู้พูด';

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
  String get privacyDashboardProfilePrivacySection =>
      'ความเป็นส่วนตัวของโปรไฟล์';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'เพื่อนและการส่งข้อความโดยตรง';

  @override
  String get privacyDashboardActivitySharingSection => 'การแชร์กิจกรรม';

  @override
  String get privacyDashboardSensitiveContentSection => 'เนื้อหาที่ละเอียดอ่อน';

  @override
  String get privacyDashboardDataExportSection => 'ส่งออกข้อมูล';

  @override
  String get privacyDashboardDataDeletionSection => 'การลบข้อมูล';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'ใครดูโปรไฟล์ทั้งหมดของคุณได้บ้าง';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'เพื่อนและทุกชุมชน';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'โปรไฟล์ทั้งหมดของคุณจะแสดงให้เพื่อนและทุกคนในชุมชนของคุณเห็น';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'เฉพาะเพื่อนและชุมชนขนาดเล็ก';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'โปรไฟล์แบบเต็มของคุณจะแสดงให้เพื่อนและสมาชิกในชุมชนที่มีสมาชิก 200 คนหรือน้อยกว่าเห็น';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'เฉพาะเพื่อน';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'โปรไฟล์แบบเต็มของคุณจะแสดงให้เพื่อนเห็นเท่านั้น';

  @override
  String get privacyDashboardFriendRequestsTitle => 'คำขอเป็นเพื่อน';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'ทุกคน';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'อนุญาตให้ทุกคนส่งคำขอเป็นเพื่อนถึงคุณได้';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'เพื่อนของเพื่อน';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'อนุญาตให้เพื่อนของเพื่อนส่งคำขอหาคุณได้';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => 'สมาชิกชุมชน';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'อนุญาตให้สมาชิกจากชุมชนที่คุณอยู่ส่งคำขอถึงคุณได้';

  @override
  String get privacyDashboardDirectMessagesTitle => 'ข้อความส่วนตัว';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'อนุญาตข้อความโดยตรงจากสมาชิกในชุมชน';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'อนุญาตให้สมาชิกจากชุมชนที่คุณอยู่ส่งข้อความส่วนตัวถึงคุณได้';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'อนุญาตข้อความโดยตรงจากบอทของคอมมูนิตี้';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'อนุญาตให้บอทจากชุมชนที่คุณอยู่ส่งข้อความส่วนตัวถึงคุณได้';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'ควบคุมว่าใครสามารถส่งคำขอเป็นเพื่อนและข้อความส่วนตัวถึงคุณได้';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'ควบคุมว่าใครสามารถโทรหาคุณและเพิ่มคุณเข้ากลุ่มแชทได้';

  @override
  String get privacyDashboardIncomingCallsTitle => 'สายเรียกเข้า';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'ควบคุมว่าใครสามารถโทรหาคุณได้';

  @override
  String get privacyDashboardAllowedCallers => 'ผู้ที่ได้รับอนุญาตให้โทรออก';

  @override
  String get privacyDashboardIncomingCallNobody => 'ไม่มีใคร';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'บล็อกสายเรียกเข้าทั้งหมด';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'เฉพาะเพื่อน';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'อนุญาตให้เฉพาะเพื่อนโทรหาคุณเท่านั้น (แนะนำ)';

  @override
  String get privacyDashboardIncomingCallCustom => 'เพื่อน + กำหนดเอง';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'อนุญาตให้เพื่อนและกลุ่มเพิ่มเติมที่คุณเลือก';

  @override
  String get privacyDashboardIncomingCallEveryone => 'ทุกคน';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'อนุญาตให้ทุกคนโทรหาคุณได้ แม้แต่คนแปลกหน้า';

  @override
  String get privacyDashboardAdditionalGroups => 'กลุ่มเพิ่มเติม';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'เพื่อนของเพื่อนของคุณสามารถโทรหาคุณได้';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'คนจากชุมชนที่คุณอยู่ร่วมกันสามารถโทรหาคุณได้';

  @override
  String get privacyDashboardRingBehavior => 'พฤติกรรมวงแหวน';

  @override
  String get privacyDashboardSilentCalls => 'ปิดเสียงสายเรียกเข้าจากทุกคน';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'สายเรียกเข้าทั้งหมดจะแจ้งเตือนแบบเงียบแทนการส่งเสียงเรียกเข้า โดยปกติแล้ว สายจากผู้ที่ไม่ใช่เพื่อนจะเงียบเสมอ';

  @override
  String get privacyDashboardGroupDmTitle =>
      'ใครสามารถเพิ่มคุณเข้ากลุ่มแชทได้บ้าง';

  @override
  String get privacyDashboardGroupDmDesc =>
      'ควบคุมว่าใครสามารถเพิ่มคุณเข้ากลุ่มแชทได้โดยไม่ต้องขออนุญาต ทุกคนยังคงสามารถส่งลิงก์เชิญให้คุณเข้าร่วมได้';

  @override
  String get privacyDashboardAllowedInvites => 'ผู้ที่ได้รับอนุญาตให้เชิญ';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'ห้ามใครเพิ่มคุณเข้ากลุ่มแชทโดยไม่ได้รับอนุญาต';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'อนุญาตให้เพื่อนเพิ่มคุณได้โดยไม่ต้องขอ (แนะนำ)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'อนุญาตให้เพื่อนและกลุ่มเพิ่มเติมเพิ่มคุณได้';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'อนุญาตให้ทุกคนเพิ่มคุณเข้ากลุ่มแชทได้โดยไม่ต้องขอ';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'เพื่อนของเพื่อนของคุณสามารถเพิ่มคุณเข้ากลุ่มแชทได้';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'ผู้คนจากชุมชนที่คุณอยู่ร่วมกันสามารถเพิ่มคุณเข้ากลุ่มแชทได้';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'กิจกรรมเสียงบนกำลังใช้งานอยู่';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'แชร์กิจกรรมเสียงของคุณกับเพื่อน';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'แชร์กิจกรรมเสียงกับเพื่อนทั้งหมดหรือไม่';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'หยุดแชร์กิจกรรมเสียงกับเพื่อนทั้งหมดใช่หรือไม่';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'คุณกำลังจะเริ่มแชร์กิจกรรมเสียงของคุณกับเพื่อนทุกคนที่คุณมี รวมถึงเพื่อนในอนาคตด้วย ซึ่งจะส่งการอัปเดตถึงเพื่อนทุกคนและสามารถเปลี่ยนแปลงได้อีกครั้งใน 24 ชั่วโมง';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'คุณกำลังจะหยุดแชร์กิจกรรมเสียงของคุณกับเพื่อนทุกคน รวมถึงเพื่อนในอนาคตด้วย การดำเนินการนี้จะส่งการอัปเดตถึงเพื่อนทุกคน และจะสามารถเปลี่ยนแปลงได้อีกครั้งใน 24 ชั่วโมง';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'ใช่ แชร์กับเพื่อนทั้งหมด';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'ใช่ หยุดแชร์';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'จะใช้งานได้อีกครั้งใน $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'อัปเดตการแชร์กิจกรรมเสียงแล้ว';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'ไม่สามารถอัปเดตการแชร์กิจกรรมเสียงได้ในขณะนี้';

  @override
  String get privacyDashboardDataExportDesc =>
      'สร้างไฟล์เก็บถาวรที่ดาวน์โหลดได้ของข้อมูลบัญชีของคุณ รวมถึงข้อความและ URL ของไฟล์แนบ ผู้ใช้ส่วนใหญ่ต้องการทุกอย่าง แต่คุณสามารถจำกัดขอบเขตได้ด้านล่าง';

  @override
  String get privacyDashboardExportMyData => 'ส่งออกข้อมูลของฉัน';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'ลบข้อความที่คุณส่งในการสนทนาส่วนตัว, การสนทนากลุ่มส่วนตัว และชุมชนอย่างถาวร การดำเนินการนี้จะทำงานในเบื้องหลัง และคุณจะได้รับการแจ้งเตือนทางข้อความส่วนตัวเมื่อเสร็จสิ้น';

  @override
  String get privacyDashboardDeleteMyMessages => 'ลบข้อความของฉัน';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'อนุญาตข้อความโดยตรงจากสมาชิกในชุมชนหรือไม่';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'บล็อกข้อความส่วนตัวจากสมาชิกคอมมูนิตี้ไหม';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'อนุญาตให้บอทส่งข้อความส่วนตัวถึงคุณใช่ไหม';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'บล็อกไม่ให้บอทส่งข้อความส่วนตัวถึงคุณใช่ไหม';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'คุณต้องการอนุญาตให้สมาชิกในคอมมูนิตี้ปัจจุบันของคุณส่งข้อความส่วนตัวถึงคุณด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'คุณต้องการบล็อกข้อความโดยตรงจากสมาชิกในชุมชนปัจจุบันของคุณด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'คุณต้องการอนุญาตให้บอทจากชุมชนที่คุณเป็นสมาชิกอยู่ส่งข้อความส่วนตัวถึงคุณด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'คุณต้องการบล็อกบอทจากชุมชนที่คุณเป็นสมาชิกอยู่ด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'คุณสามารถเปลี่ยนการตั้งค่านี้ต่อชุมชนได้โดยการกดที่ชื่อชุมชนค้างไว้แล้วเลือก การตั้งค่าความเป็นส่วนตัว';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'อนุญาตสำหรับทุกชุมชน';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'บล็อกสำหรับทุกคอมมูนิตี้';

  @override
  String get privacyDashboardDmConfirmSkip => 'ข้ามขั้นตอนนี้';

  @override
  String get privacyDashboardDataRequestGoBack => 'ย้อนกลับ';

  @override
  String get privacyDashboardDataRequestExportTitle => 'ส่งออกข้อมูลของฉัน';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'ลบข้อความของฉัน';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'เราจะดำเนินการโดยเร็วที่สุด คุณจะได้รับอีเมลเมื่อไฟล์เก็บถาวรของคุณพร้อมใช้งาน';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'เราจะดำเนินการให้เร็วที่สุด คุณจะได้รับการแจ้งเตือนทางข้อความส่วนตัวเมื่อดำเนินการเสร็จสิ้น';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'สิ่งที่ต้องการรวม';

  @override
  String get privacyDashboardDataRequestExportEverything => 'ทุกอย่าง';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'ส่งออกข้อความทั้งหมดที่คุณเคยส่ง รวมถึงการตั้งค่าบัญชี การเป็นสมาชิก และข้อมูลเมตาของคุณทั้งหมด';

  @override
  String get privacyDashboardDataRequestExportCustom => 'เลือกเอง';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'เลือกประเภทการสนทนา ชุมชน และช่วงเวลาที่จะรวมไว้ในไฟล์เก็บถาวร';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'เลือกสิ่งที่ต้องการรวม';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'เลือกประเภทการสนทนาที่ต้องการล้างข้อมูล';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'เฉพาะที่ที่ฉันเข้าถึงไม่ได้แล้ว';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'ลบเฉพาะข้อความจากชุมชนและกลุ่ม DM ที่คุณออกจากกลุ่มหรือถูกนำออกจากกลุ่มแล้ว';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'การสนทนาใดบ้าง';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'เลือกประเภทการสนทนาที่คุณต้องการรวม';

  @override
  String get privacyDashboardDataRequestKindDms => 'แชทส่วนตัว';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'ข้อความส่วนตัวที่ปิดไปแล้ว';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'ข้อความกลุ่ม';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'คอมมูนิตี้';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'ชุมชนใดบ้าง';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'ตัวกรองชุมชน';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'รวมทั้งหมด ยกเว้นที่เลือก';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'เฉพาะที่เลือกไว้';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'ขณะนี้คุณยังไม่ได้อยู่ในชุมชนใดๆ';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'ช่วงเวลา';

  @override
  String get privacyDashboardDataRequestDateMode => 'ช่วงเวลา';

  @override
  String get privacyDashboardDataRequestAllTime => 'ตลอดเวลา';

  @override
  String get privacyDashboardDataRequestCustomRange => 'กำหนดช่วงเอง';

  @override
  String get privacyDashboardDataRequestStartDate => 'วันที่เริ่มต้น';

  @override
  String get privacyDashboardDataRequestEndDate => 'วันที่สิ้นสุด';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'เว้นว่างช่องใดช่องหนึ่งไว้ หากไม่ต้องการกำหนดช่วงเวลาสิ้นสุด';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'เลือกประเภทการสนทนาอย่างน้อยหนึ่งประเภทที่จะรวม';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'วันที่เริ่มต้นต้องเร็วกว่าวันที่สิ้นสุด';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'ตรวจสอบและยืนยัน';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'เราจะสร้างไฟล์เก็บถาวรที่ดาวน์โหลดได้ของทุกข้อความที่คุณเคยส่ง และจะส่งอีเมลแจ้งให้คุณทราบเมื่อไฟล์พร้อมใช้งาน ลิงก์ดาวน์โหลดในอีเมลนั้นจะหมดอายุใน 7 วัน';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'เราจะสร้างไฟล์เก็บถาวรที่ดาวน์โหลดได้ซึ่งตรงกับตัวกรองด้านล่าง และจะส่งอีเมลแจ้งให้คุณทราบเมื่อไฟล์พร้อมใช้งาน ลิงก์ดาวน์โหลดในอีเมลจะหมดอายุหลังจาก 7 วัน';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'ลบข้อความที่ตรงกับตัวกรองด้านล่างอย่างถาวร การดำเนินการนี้ไม่สามารถเลิกทำได้';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'เมื่อเริ่มแล้วจะไม่สามารถกู้คืนได้ เราจะส่งข้อความส่วนตัวถึงคุณเมื่อดำเนินการเสร็จสิ้น';

  @override
  String get privacyDashboardDataRequestRequestExport => 'ขอส่งออกข้อมูล';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'ลบข้อความ';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'ขอบเขต';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'การสนทนา';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'คอมมูนิตี้';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'ช่วงเวลา';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'ไม่มี';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'ตั้งแต่ $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'จนถึง $end';
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
      other: '# ชุมชน',
      one: '# ชุมชน',
    );
    return 'ทั้งหมด ยกเว้น $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ชุมชน',
      one: '# ชุมชน',
    );
    return 'เพียง $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'ข้อความส่วนตัวที่เปิดอยู่';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'ข้อความส่วนตัวที่ปิดไปแล้ว';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'ข้อความส่วนตัว (ทั้งที่เปิดและปิด)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'ข้อความกลุ่ม';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'คอมมูนิตี้';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ชั่วโมง',
      one: '# ชั่วโมง',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'และ # นาที',
      one: 'และ # นาที',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ชั่วโมง',
      one: '# ชั่วโมง',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# นาที',
      one: '# นาที',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# วินาที',
      one: '# วินาที',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'ไม่สามารถโหลดการตั้งค่าความเป็นส่วนตัวได้';

  @override
  String get privacyDashboardRetry => 'ลองอีกครั้ง';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'ไม่สามารถบันทึกการตั้งค่าเนื้อหาที่ละเอียดอ่อนได้';

  @override
  String get privacyDashboardDataRequestFailed =>
      'ไม่สามารถดำเนินการตามคำขอได้สำเร็จ';

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
      'รอ Slow Mode ในช่องทางที่เลือกหมดเวลา';

  @override
  String get slowmodeRateLimitedTitle => 'เปิดโหมดจำกัดเวลา';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'โหมดหน่วงเวลาเปิดอยู่ — รออีก $duration ก่อนส่งข้อความถัดไป';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'การอัปโหลดโดยตรงถูกปิดใช้งานในช่วงโหมดหน่วงเวลา';

  @override
  String get shareMediaTitle => 'แชร์ไปยัง';

  @override
  String get shareMediaMessageHint => 'เพิ่มข้อความเสริม…';

  @override
  String get shareMediaSendButton => 'ส่ง';

  @override
  String get shareMediaSuccessToast => 'แชร์สื่อแล้ว';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'แชร์ไปยังปลายทาง $count รายการ';
  }

  @override
  String get shareMediaFailedToast => 'แชร์สื่อไม่สำเร็จ';

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
  String get chatMessageCopyEmbedText => 'คัดลอกข้อความที่ฝัง';

  @override
  String get chatMessageTranslate => 'แปลภาษา';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'แปลจาก $language';
  }

  @override
  String get chatMessageSeeOriginal => 'ดูต้นฉบับ';

  @override
  String get chatMessageSeeTranslation => 'ดูการแปล';

  @override
  String get chatMessageTranslating => 'กำลังแปล…';

  @override
  String get chatMessageTranslateFailed => 'แปลข้อความนี้ไม่ได้';

  @override
  String get chatMessageTranslateUnavailable =>
      'การแปลไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get chatMessageSpeak => 'พูดข้อความ';

  @override
  String get chatMessageStopSpeaking => 'หยุดพูด';

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
  String get chatMessageOpenLink => 'เปิดลิงก์';

  @override
  String get chatMessageCopyLink => 'คัดลอกลิงก์';

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
  String get chatReactionAddFailed => 'ไม่สามารถเพิ่มอิโมจิได้';

  @override
  String get chatReactionRemoveFailed => 'ไม่สามารถลบอิโมจิได้';

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
  String iarReasonOtherDescription(String productName) {
    return 'ใช้เฉพาะเมื่อละเมิดกฎของ $productName อย่างชัดเจนและไม่เข้าข่ายข้างต้น';
  }

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
  String get chatMessageDeleteAttachment => 'ลบไฟล์แนบ';

  @override
  String get chatMessageEditAttachmentAltText => 'แก้ไขข้อความสลับ';

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
      other: 'ข้อความที่ถูกบล็อก $count รายการ',
      one: 'ข้อความที่ถูกบล็อก 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ข้อความสแปมที่อาจเกิดขึ้น',
      one: 'ข้อความสแปมที่อาจเกิดขึ้น 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'ซ่อนการตอบกลับเนื่องจากคุณบล็อกผู้เขียนต้นฉบับ';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'ซ่อนข้อความตอบกลับ เนื่องจากผู้เขียนต้นฉบับถูกระบุว่าเป็นสแปม';

  @override
  String get devMarkAsSpamLocally => 'บล็อกสแปมนี้ (เฉพาะฉัน)';

  @override
  String get devIgnoreSpamFlag => 'ไม่สนใจการแจ้งว่าเป็นสแปม';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'ตัวเลือกสื่อ';

  @override
  String get mediaViewerCopyLink => 'คัดลอกลิงก์';

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
    return 'ไฟล์แนบ $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'ปิด';

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
  String get composerAutocompleteSuggestions => 'คำแนะนำ';

  @override
  String get composerAutocompleteCommandsHeading => 'คำสั่ง';

  @override
  String get composerAutocompleteChoicesHeading => 'ตัวเลือก';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'อาร์กิวเมนต์เสริม';

  @override
  String get composerAutocompleteChannelsHeading => 'ช่อง';

  @override
  String get composerAutocompleteMembersHeading => 'สมาชิก';

  @override
  String get composerAutocompleteUsersHeading => 'ผู้ใช้';

  @override
  String get composerAutocompleteMentionsHeading => 'การกล่าวถึง';

  @override
  String get composerAutocompleteRolesHeading => 'บทบาท';

  @override
  String get composerAutocompleteMediaHeading => 'สื่อ';

  @override
  String get composerAutocompleteStickersHeading => 'สติกเกอร์';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'ไม่พบ GIF';

  @override
  String get composerCommandShrugDescription =>
      'เพิ่ม ¯\\_(ツ)_/¯ ต่อท้ายข้อความของคุณ';

  @override
  String get composerCommandTableflipDescription =>
      'เพิ่ม (╯°□°)╯︵ ┻━┻ ไปยังข้อความของคุณ';

  @override
  String get composerCommandUnflipDescription =>
      'เพิ่ม ┬─┬ ノ( ゜-゜ノ) ต่อท้ายข้อความของคุณ';

  @override
  String get composerCommandMeDescription =>
      'ส่งข้อความการทำงาน (แสดงเป็นตัวเอียง)';

  @override
  String get composerCommandSpoilerDescription =>
      'ส่งข้อความสปอยล์ (จะซ่อนข้อความไว้)';

  @override
  String get composerCommandTtsDescription => 'ส่งข้อความเสียง';

  @override
  String get composerCommandNickDescription =>
      'เปลี่ยนชื่อเล่นของคุณในคอมมูนิตี้นี้';

  @override
  String get composerCommandKickDescription => 'เตะสมาชิกออกจากคอมมูนิตี้นี้';

  @override
  String get composerCommandBanDescription => 'แบนสมาชิกออกจากคอมมูนิตี้นี้';

  @override
  String get composerCommandMsgDescription => 'ส่งข้อความส่วนตัวถึงผู้ใช้';

  @override
  String get composerCommandSavedDescription => 'ส่งรายการสื่อที่บันทึกไว้';

  @override
  String get composerCommandStickerDescription => 'ส่งสติกเกอร์';

  @override
  String get composerCommandGifDescription => 'ค้นหาและส่ง GIF';

  @override
  String get composerCommandMemberOption => 'สมาชิกที่จะดำเนินการ';

  @override
  String get composerCommandReasonOption => 'เหตุผล (ไม่บังคับ)';

  @override
  String get composerCommandMessageOption => 'ข้อความที่จะส่ง';

  @override
  String get composerCommandQueryOption => 'สิ่งที่ต้องการค้นหา';

  @override
  String get composerCommandNicknameOption =>
      'ชื่อเล่นใหม่ของคุณ หรือเว้นว่างไว้เพื่อรีเซ็ต';

  @override
  String get composerCommandDeleteMessagesOption =>
      'จะลบประวัติข้อความล่าสุดของสมาชิกจำนวนเท่าใด';

  @override
  String get composerCommandDeleteMessagesNone => 'ไม่ลบข้อความใดๆ';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '$count วันที่ผ่านมา';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '24 ชั่วโมงที่ผ่านมา';

  @override
  String get composerCommandOptionRequired => 'ตัวเลือกนี้จำเป็น โปรดระบุค่า';

  @override
  String get composerCommandClear => 'ล้างคำสั่ง';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'คุณเปลี่ยนชื่อเล่นในชุมชนนี้จาก **$previousNickname** เป็น **$newNickname**';
  }

  @override
  String get composerCommandUnknownUser => 'ผู้ใช้ไม่รู้จัก';

  @override
  String composerCommandMsgFailed(String username) {
    return 'ส่งข้อความถึง **$username** ไม่สำเร็จ พวกเขาอาจปิดใช้งานข้อความส่วนตัว หรือคุณอาจถูกบล็อก';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count เพิ่มเติม';
  }

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
  String get addGuildCreateTitle => 'สร้างคอมมูนิตี้';

  @override
  String get addGuildCreateDescription =>
      'สร้างคอมมูนิตี้ให้คุณและเพื่อนๆ ได้แชทกัน';

  @override
  String get addGuildCreateNameLabel => 'ชื่อคอมมูนิตี้';

  @override
  String get addGuildCreateSubmit => 'สร้างคอมมูนิตี้';

  @override
  String get addGuildCreateFailed => 'ไม่สามารถสร้างชุมชนได้ โปรดลองอีกครั้ง';

  @override
  String get addGuildCreateClaimTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get addGuildCreateClaimDescription =>
      'คุณต้องยืนยันบัญชีก่อนจึงจะสร้างคอมมูนิตี้ได้';

  @override
  String get addGuildCreateVerifyTitle => 'ยืนยันอีเมลของคุณ';

  @override
  String get addGuildCreateVerifyDescription =>
      'คุณต้องยืนยันอีเมลก่อนจึงจะสร้างคอมมูนิตี้ได้';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'ไม่รองรับไอคอนแบบเคลื่อนไหวเมื่อสร้างชุมชนใหม่ ใช้ภาพนิ่ง';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'การสร้างคอมมูนิตี้แสดงว่าคุณตกลงที่จะปฏิบัติตามและยึดถือ ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'แนวทางปฏิบัติของชุมชน $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'อินสแตนซ์นี้มีชุมชนเดียว จึงไม่สามารถสร้างชุมชนเพิ่มเติมได้';

  @override
  String get addGuildCreateChangeIcon => 'เปลี่ยนไอคอน';

  @override
  String get addGuildCreateIconLabel => 'ไอคอนคอมมูนิตี้';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG ขนาดสูงสุด 10MB แนะนำ: 512×512px';

  @override
  String get addGuildImportDescription =>
      'วาง URL เทมเพลต Discord เพื่อนำเข้าโครงสร้างไปยังชุมชนใหม่';

  @override
  String get addGuildImportUrlLabel => 'ลิงก์เทมเพลต';

  @override
  String get addGuildImportUrlInvalid =>
      'กรุณากรอก URL หรือโค้ดเทมเพลต Discord ที่ถูกต้อง';

  @override
  String get addGuildImportFetchFailed =>
      'ไม่สามารถดึงเทมเพลตชุมชนได้ เทมเพลตอาจไม่มีอยู่ หรือบริการภายนอกไม่พร้อมใช้งาน';

  @override
  String get addGuildImportInvalidResponse =>
      'นี่ไม่ใช่เทมเพลตการตอบกลับที่ถูกต้อง';

  @override
  String get addGuildImportTemplateLabel => 'เทมเพลต';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return 'ข้อความ $textChannelCount ช่อง, เสียง $voiceChannelCount ช่อง, $categoryCount หมวดหมู่, $roleCount บทบาท';
  }

  @override
  String get addGuildImportRemoveIcon => 'ลบไอคอน';

  @override
  String get addGuildImportTemplateInvalid =>
      'ข้อมูลเทมเพลตชุมชนไม่ถูกต้องหรือไม่สมบูรณ์';

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
  String get channelDetailsFallbackTitle => 'รายละเอียด';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'กลุ่ม DM · สมาชิก $count คน';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'ปิดการสนทนากับ $name หรือไม่?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'ออกจาก $name ไหม';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'การตั้งค่าช่อง';

  @override
  String get channelDetailsGroupSettingsTitle => 'การตั้งค่ากลุ่ม';

  @override
  String get channelDetailsDmSettingsTitle => 'การตั้งค่าข้อความส่วนตัว';

  @override
  String get channelDetailsInvitePeople => 'เชิญผู้คน';

  @override
  String get channelDetailsCopyLink => 'คัดลอกลิงก์';

  @override
  String get channelMenuCopyChannelLink => 'คัดลอกลิงก์ช่อง';

  @override
  String get channelMenuCopyRedirectLink => 'คัดลอกลิงก์เปลี่ยนเส้นทาง';

  @override
  String get channelDetailsAddFriendsToGroup => 'เพิ่มเพื่อนเข้ากลุ่ม';

  @override
  String get channelDetailsGroupInvites => 'คำเชิญกลุ่ม';

  @override
  String get channelDetailsEditChannel => 'แก้ไขช่อง';

  @override
  String get channelDetailsDeleteChannel => 'ลบช่อง';

  @override
  String get channelSettingsCategorySettingsTitle => 'การตั้งค่าหมวดหมู่';

  @override
  String get channelSettingsEditCategory => 'แก้ไขหมวดหมู่';

  @override
  String get channelSettingsTabOverview => 'ภาพรวม';

  @override
  String get channelSettingsTabPermissions => 'สิทธิ์';

  @override
  String get channelSettingsTabInvites => 'คำเชิญ';

  @override
  String get channelSettingsTabWebhooks => 'เว็บฮุก';

  @override
  String get channelSettingsDeleteChannel => 'ลบช่อง';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $channelName นี้? การดำเนินการนี้ไม่สามารถย้อนกลับได้';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $categoryName การดำเนินการนี้จะไม่สามารถย้อนกลับได้';
  }

  @override
  String get channelSettingsDeleteCategory => 'ลบหมวดหมู่';

  @override
  String get channelSettingsChannelUpdated => 'อัปเดตช่องแล้ว';

  @override
  String get channelSettingsChannelName => 'ชื่อช่อง';

  @override
  String get channelSettingsCategoryName => 'ชื่อหมวดหมู่';

  @override
  String get channelSettingsMyCategory => 'หมวดหมู่ของฉัน';

  @override
  String get categoryExpandCategory => 'ขยายหมวดหมู่';

  @override
  String get categoryCollapseCategory => 'ยุบหมวดหมู่';

  @override
  String get categoryExpandAllCategories => 'ขยายหมวดหมู่ทั้งหมด';

  @override
  String get categoryCollapseAllCategories => 'ยุบหมวดหมู่ทั้งหมด';

  @override
  String get categoryMuteCategory => 'ปิดเสียงหมวดหมู่นี้';

  @override
  String get categoryUnmuteCategory => 'เลิกปิดเสียงหมวดหมู่';

  @override
  String get categoryCopyCategoryId => 'คัดลอก ID หมวดหมู่';

  @override
  String get categoryIdCopied => 'คัดลอก ID หมวดหมู่แล้ว';

  @override
  String get channelSettingsChannelNamePlaceholder => 'ทั่วไป';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'หัวข้อ';

  @override
  String get channelSettingsTopicPlaceholder => 'เพิ่มหัวข้อในช่องนี้';

  @override
  String get channelSettingsInsertEmoji => 'แทรกอิโมจิ';

  @override
  String get channelSettingsTopicTooLongTitle => 'หัวข้อช่องยาวเกินไป';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'หัวข้อสั้นเกินไป โปรดลองอีกครั้ง';

  @override
  String get channelSettingsSlowmode => 'โหมดจำกัดเวลา';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'รอระหว่างข้อความ \"$bypassSlowmodePermissionLabel\" สามารถข้ามได้';
  }

  @override
  String get channelSettingsSlowmodeOff => 'ปิด';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds วินาที';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours ชั่วโมง';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute นาที';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour ชั่วโมง';
  }

  @override
  String get channelSettingsVoiceQuality => 'คุณภาพเสียง';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'บิตเรตที่สูงขึ้น = คุณภาพดีขึ้นและใช้แบนด์วิธมากขึ้น';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits กิโลบิตต่อวินาที';
  }

  @override
  String get channelSettingsParticipantLimit => 'จำกัดจำนวนผู้เข้าร่วม';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'จำนวนสมาชิกสูงสุดที่เข้าร่วมได้พร้อมกัน 0 หมายถึงไม่จำกัด';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ผู้เข้าร่วม',
      one: '1 ผู้เข้าร่วม',
      zero: '∞ ไม่จำกัด',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'จำกัดการเชื่อมต่อ';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'จำนวนการเชื่อมต่อสูงสุดที่สมาชิกหนึ่งคนสามารถใช้งานได้ในช่องนี้';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count การเชื่อมต่อ',
      one: '1 การเชื่อมต่อ',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'ภูมิภาคของเสียง';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'เลือกภูมิภาคเสียงสำหรับช่องนี้ ภูมิภาคอัตโนมัติจะใช้ภูมิภาคที่ใกล้ที่สุด';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'อัตโนมัติ';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'ไม่สามารถโหลดภูมิภาคเสียงได้';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'ลองอีกครั้งในอีกสักครู่';

  @override
  String get channelSettingsResetSlider => 'รีเซ็ตแถบเลื่อนเป็นค่าเริ่มต้น';

  @override
  String get channelSettingsAdvanced => 'ขั้นสูง';

  @override
  String get channelSettingsMatureContentOverride =>
      'การแทนที่เนื้อหาสำหรับผู้ใหญ่';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'เปลี่ยนการตั้งค่าระดับ $scopeLevel สำหรับช่องนี้ เนื้อหาสำหรับผู้ใหญ่จะแสดงหลังประตูทางเข้า';
  }

  @override
  String get channelSettingsMatureContentInherit => 'รับค่าต่อ';

  @override
  String get channelSettingsMatureContentOn => 'เปิด';

  @override
  String get channelSettingsMatureContentOff => 'ปิด';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'ตั้งค่าช่องนี้สำหรับเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'เปิดช่องทางนี้ให้แสดงเนื้อหาสำหรับผู้ใหญ่ได้';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'สืบทอดมาจาก $inheritedSourceLabel: เปิด';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'สืบทอดมาจาก $inheritedSourceLabel: ปิด';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'หมวดหมู่';

  @override
  String get channelSettingsMatureContentCommunitySource => 'ชุมชน';

  @override
  String get channelSettingsMatureContentCategoryScope => 'หมวดหมู่';

  @override
  String get channelSettingsMatureContentCommunityScope => 'ชุมชน';

  @override
  String get channelSettingsContentWarningToggle =>
      'แสดงคำเตือนเนื้อหาในช่องนี้';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'เปิดการแจ้งเตือนเพื่อขอความยินยอมก่อนเข้าสู่แชนเนลนี้';

  @override
  String get channelSettingsContentWarningText => 'ข้อความเตือนที่กำหนดเอง';

  @override
  String get channelSettingsContentWarningDefault => 'มีเนื้อหาที่ละเอียดอ่อน';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'คุณต้องมีสิทธิ์ \"$manageChannelsPermissionLabel\" เพื่อแก้ไขการอนุญาตเหล่านี้';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'คุณต้องมีสิทธิ์ \"$manageRolesPermissionLabel\" เพื่อแก้ไขการอนุญาตเหล่านี้';
  }

  @override
  String get channelSettingsUnknownRole => 'บทบาทไม่รู้จัก';

  @override
  String get channelSettingsUnknownUser => 'ผู้ใช้ไม่รู้จัก';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'การตั้งค่าการเข้าถึง';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'แก้ไขสิทธิ์สำหรับ $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => 'กลับไปที่การตั้งค่า';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'ตั้งค่าการเข้าถึงพื้นฐานสำหรับช่องนี้';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'กำหนดการตั้งค่าสำหรับบทบาทนี้';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'ตั้งค่าการอนุญาตพิเศษสำหรับสมาชิกนี้';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'ค้นหาสิทธิ์…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'อัปเดตการเข้าถึงช่องแล้ว';

  @override
  String get channelSettingsPermissionsTitle => 'การควบคุมการเข้าถึง';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'ช่องนี้ซิงค์กับหมวดหมู่หลัก ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'ช่องนี้ไม่ได้ซิงค์กับหมวดหมู่หลัก ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'ซิงค์กับหมวดหมู่';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'ช่องซิงค์กับหมวดหมู่หลักแล้ว';

  @override
  String get channelSettingsPermissionsAddOverride => 'เพิ่มการตั้งค่าเฉพาะ';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'ค้นหาบทบาทหรือสมาชิก…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'บทบาทและสมาชิก';

  @override
  String get channelSettingsDeleteInvite => 'ลบคำเชิญ';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'ลบคำเชิญนี้ใช่ไหม? เลิกทำไม่ได้นะ';

  @override
  String get channelSettingsCopyInviteCode => 'คัดลอกรหัสเชิญ';

  @override
  String get channelSettingsCopyInviteUrl => 'คัดลอก URL คำเชิญ';

  @override
  String get channelSettingsWebhookCreated => 'สร้าง Webhook แล้ว';

  @override
  String get channelSettingsWebhookCreateFailed => 'สร้าง webhook ไม่สำเร็จ';

  @override
  String get channelSettingsCreateWebhook => 'สร้าง Webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'จัดการลิงก์คำเชิญสำหรับช่องนี้';

  @override
  String get channelSettingsInvitesCreate => 'สร้างคำเชิญ';

  @override
  String get channelSettingsInvitesEmpty => 'ไม่มีลิงก์เชิญ';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'ช่องนี้ยังไม่มีลิงก์เชิญ สร้างลิงก์เพื่อเชิญผู้คนมาที่ช่องนี้';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลดลิงก์เชิญสำหรับช่องนี้ โปรดลองอีกครั้ง';

  @override
  String get channelSettingsWebhooksDescription =>
      'จัดการเว็บฮุกขาเข้าที่สามารถโพสต์ข้อความในช่องนี้ได้';

  @override
  String get channelSettingsWebhooksEmpty => 'ไม่มี Webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'ยังไม่มีการตั้งค่า Webhook สำหรับช่องนี้ สร้าง Webhook เพื่อให้แอปพลิเคชันภายนอกสามารถโพสต์ข้อความได้';

  @override
  String get channelSettingsWebhooksUnsupported => 'ช่องนี้ไม่รองรับ Webhook';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'คุณต้องมีสิทธิ์ \"$permission\" เพื่อดูและแก้ไขเว็บฮุกสำหรับช่องนี้';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'โหลดเว็บฮุกไม่สำเร็จ';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลดเว็บฮุกสำหรับช่องนี้ โปรดลองอีกครั้ง';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'สร้างโดย $creator เมื่อ $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'ผู้ใช้ไม่รู้จัก';

  @override
  String get channelSettingsWebhooksAvatar => 'รูปโปรไฟล์';

  @override
  String get channelSettingsWebhooksUploadImage => 'อัปโหลดรูปภาพ';

  @override
  String get channelSettingsWebhooksRemove => 'ลบ';

  @override
  String get channelSettingsWebhooksName => 'ชื่อ';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'ชื่อ Webhook';

  @override
  String get channelSettingsWebhooksChannel => 'ช่อง';

  @override
  String get channelSettingsWebhooksUrl => 'URL ของ Webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'คัดลอก URL เว็บฮุค';

  @override
  String get channelSettingsWebhooksDelete => 'ลบ Webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed => 'ไม่สามารถลบเว็บฮุกนี้ได้';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'ลบ webhook นี้หรือไม่? การดำเนินการนี้ไม่สามารถยกเลิกได้';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'ลองอีกครั้งในอีกสักครู่';

  @override
  String get channelMenuOpenChat => 'เปิดแชท';

  @override
  String get channelMenuDuplicateChannel => 'ทำซ้ำช่อง';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'รีเซ็ตสถานะข้อตกลงเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'ลบข้อความของคุณในช่องนี้ใช่หรือไม่';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'ข้อความทั้งหมดที่คุณเคยส่งในช่องนี้จะถูกลบอย่างถาวร การดำเนินการนี้ไม่สามารถยกเลิกได้';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'ลบข้อความของฉัน';

  @override
  String get channelMenuDeletedYourMessages => 'ลบข้อความของคุณแล้ว';

  @override
  String get channelMenuCouldNotDeleteYourMessages => 'ลบข้อความของคุณไม่ได้';

  @override
  String get channelDetailsSystemMessage => 'ข้อความระบบ';

  @override
  String get channelDetailsTextChannel => 'ช่องข้อความ';

  @override
  String get channelDetailsVoiceChannel => 'ช่องเสียง';

  @override
  String get channelDetailsCategory => 'หมวดหมู่';

  @override
  String get channelDetailsLinkChannel => 'ลิงก์ช่อง';

  @override
  String get channelDetailsGenericChannel => 'ช่อง';

  @override
  String get channelDetailsMutedConversation => 'ปิดเสียงการสนทนา';

  @override
  String get channelDetailsUnmutedConversation => 'ยกเลิกการปิดเสียงการสนทนา';

  @override
  String get channelDetailsMutedChannel => 'ปิดเสียงช่อง';

  @override
  String get channelDetailsUnmutedChannel => 'ยกเลิกการปิดเสียงช่อง';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'อัปเดตการตั้งค่าการแจ้งเตือนแล้ว';

  @override
  String get channelDetailsTabMembers => 'สมาชิก';

  @override
  String get channelDetailsTabPins => 'ปักหมุด';

  @override
  String get channelDetailsActionMute => 'ปิดเสียง';

  @override
  String get channelDetailsActionUnmute => 'ยกเลิกปิดเสียง';

  @override
  String get channelDetailsActionSearch => 'ค้นหา';

  @override
  String get channelDetailsActionMore => 'เพิ่มเติม';

  @override
  String get channelDetailsMembersEmptyTitle => 'ไม่มีสมาชิกให้แสดง';

  @override
  String get channelDetailsMembersEmptyBody =>
      'สมาชิกจะปรากฏที่นี่เมื่อข้อมูลชุมชนโหลดเสร็จแล้ว';

  @override
  String get memberListPermissionDeniedTitle =>
      'คุณไม่สามารถดูรายชื่อสมาชิกได้';

  @override
  String get memberListPermissionDeniedBody =>
      'คุณไม่สามารถดูสมาชิกของช่องนี้ในคอมมูนิตี้นี้ได้';

  @override
  String get memberListUnavailableTitle => 'ไม่สามารถดูรายชื่อสมาชิกได้';

  @override
  String get memberListUnavailableBody =>
      'ขณะนี้ยังไม่สามารถดูรายชื่อสมาชิกในคอมมูนิตี้นี้ได้';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'ไม่สามารถโหลดหมุดได้';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'สมาชิกที่มีสิทธิ์ \"ปักหมุดข้อความ\" สามารถปักหมุดข้อความเพื่อให้ทุกคนเห็นได้';

  @override
  String get channelDetailsPinsDmEndHint =>
      'คุณสามารถปักหมุดข้อความในบทสนทนานี้เพื่อให้ทุกคนเห็นได้';

  @override
  String get channelDetailsPinsEndReached => 'คุณดูจนหมดแล้ว';

  @override
  String get channelHeaderOpenDetails => 'เปิดรายละเอียดช่อง';

  @override
  String get channelHeaderPinnedMessages => 'ข้อความปักหมุด';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'ข้อความปักหมุด, ที่ยังไม่ได้อ่าน';

  @override
  String get channelHeaderMemberList => 'รายชื่อสมาชิก';

  @override
  String get channelHeaderInbox => 'กล่องข้อความ';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'การตั้งค่าการแจ้งเตือน, ปิดเสียง';

  @override
  String get channelDetailsSearchTitle => 'ค้นหา';

  @override
  String get channelDetailsSearchHint => 'ค้นหาข้อความ';

  @override
  String get channelDetailsSearchFilterFrom => 'จาก';

  @override
  String get channelDetailsSearchFilterHas => 'มี';

  @override
  String get channelDetailsSearchFilterIn => 'ใน';

  @override
  String get channelDetailsSearchFilterMentions => 'การกล่าวถึง';

  @override
  String get channelDetailsSearchFilterMore => 'เพิ่มเติม';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'ใช้งานอยู่';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count ช่อง';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count ผู้ใช้';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'ผู้ใช้';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'บอท';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'เว็บฮุค';

  @override
  String get channelDetailsSearchFilterByChannel => 'กรองตามช่อง';

  @override
  String get channelDetailsSearchChannelsHint => 'ค้นหาช่อง';

  @override
  String get channelDetailsSearchChannelsEmpty => 'ไม่พบช่อง';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'ปักหมุด';

  @override
  String get channelDetailsSearchPinnedTrue => 'ปักหมุดเท่านั้น';

  @override
  String get channelDetailsSearchPinnedFalse => 'ไม่รวมรายการปักหมุด';

  @override
  String get channelDetailsSearchClearFilter => 'ล้าง';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'ประเภทผู้เขียน';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'วันที่';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'โหมดวันที่';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'เลือกวันที่';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'ลิงก์โฮสต์';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'ชื่อไฟล์มีคำว่า';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'นามสกุลไฟล์';

  @override
  String get channelDetailsSearchContentPoll => 'โพล';

  @override
  String get channelDetailsSearchContentPollDescription => 'ข้อความที่มีโพล';

  @override
  String get channelDetailsSearchContentForward => 'ส่งต่อ';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'ข้อความที่ส่งต่อ';

  @override
  String get channelDetailsSearchFilterSort => 'จัดเรียง';

  @override
  String get channelHeaderSearchFiltersTitle => 'ตัวกรองการค้นหา';

  @override
  String get channelHeaderSearchRecentTitle => 'การค้นหาล่าสุด';

  @override
  String get channelHeaderSearchUsersTitle => 'ผู้ใช้';

  @override
  String get channelHeaderSearchChannelsTitle => 'ช่อง';

  @override
  String get channelHeaderSearchValuesTitle => 'ค่า';

  @override
  String get channelHeaderSearchDatesTitle => 'วันที่';

  @override
  String get channelHeaderSearchDefaultBadge => 'ค่าเริ่มต้น';

  @override
  String get channelHeaderSearchClearHistory => 'ล้าง';

  @override
  String get channelHeaderSearchFilterDescFrom => 'ผู้ใช้';

  @override
  String get channelHeaderSearchFilterDescMentions => 'ผู้ใช้';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'ลิงก์, ไฟล์แนบ, รูปภาพ, วิดีโอ, เสียง, ไฟล์, สติกเกอร์, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescOn => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescDuring => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescAfter => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescIn => 'ช่อง';

  @override
  String get channelHeaderSearchFilterDescPinned => 'จริงหรือไม่จริง';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'ผู้ใช้, บอท หรือเว็บฮุค';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'โฮสต์เนม เช่น example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => 'ส่วนหนึ่งของชื่อไฟล์แนบ';

  @override
  String get channelHeaderSearchFilterDescFileType => 'นามสกุลไฟล์ เช่น png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'เวลาที่โพสต์ หรือ ความเกี่ยวข้อง';

  @override
  String get channelHeaderSearchFilterDescOrder =>
      'จากน้อยไปมาก หรือ จากมากไปน้อย';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ผลลัพธ์',
      one: '1 ผลลัพธ์',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'กรองตามผู้ใช้';

  @override
  String get channelDetailsSearchFilterByContent => 'กรองตามเนื้อหา';

  @override
  String get channelDetailsSearchSortBy => 'เรียงผลลัพธ์ตาม';

  @override
  String get channelDetailsSearchIn => 'ค้นหาใน';

  @override
  String get channelDetailsSearchEmptyTitle => 'ค้นหาในบทสนทนานี้';

  @override
  String get channelDetailsSearchEmptyBody =>
      'พิมพ์ข้อความ ผู้เขียน หรือตัวกรองเนื้อหาเพื่อค้นหาข้อความ';

  @override
  String get channelDetailsSearchIndexingTitle => 'กำลังจัดทำดัชนีข้อความ';

  @override
  String get channelDetailsSearchIndexingBody =>
      'ลองใหม่อีกครั้งในไม่ช้าเมื่อการค้นหาเสร็จสิ้นการจัดทำดัชนีขอบเขตนี้';

  @override
  String get channelDetailsSearchNoResultsTitle => 'ไม่พบผลลัพธ์';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'ลองใช้คำค้นหาหรือตัวกรองอื่น';

  @override
  String get channelDetailsMembersOnline => 'ออนไลน์';

  @override
  String get channelDetailsMembersOffline => 'ออฟไลน์';

  @override
  String get channelDetailsMemberYou => 'คุณ';

  @override
  String get channelDetailsSearchUsersHint => 'ค้นหาผู้ใช้';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'พิมพ์เพื่อค้นหาสมาชิก';

  @override
  String get channelDetailsSearchUsersEmpty => 'ไม่พบผู้ใช้';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'ไม่มีผู้ใช้';

  @override
  String get channelDetailsDone => 'เสร็จสิ้น';

  @override
  String get channelDetailsHasFilterPrompt => 'แสดงข้อความที่มี:';

  @override
  String get channelDetailsRetry => 'ลองอีกครั้ง';

  @override
  String get channelDetailsPinnedMessageTitle => 'ข้อความปักหมุด';

  @override
  String get channelDetailsSearchResultTitle => 'ผลการค้นหา';

  @override
  String get channelDetailsJumpToMessage => 'ไปที่ข้อความ';

  @override
  String get channelDetailsUnpinMessage => 'เลิกปักหมุดข้อความ';

  @override
  String get channelDetailsCopyMessageLink => 'คัดลอกลิงก์ข้อความ';

  @override
  String get channelDetailsCopyMessageId => 'คัดลอกรหัสข้อความ';

  @override
  String get channelDetailsMessageUnpinned => 'ปักหมุดข้อความออกแล้ว';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'ชุมชนปัจจุบัน';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'แชทส่วนตัวปัจจุบัน';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'ทุกชุมชน';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'เฉพาะ DM ทั้งหมด';

  @override
  String get channelDetailsSearchScopeAllDms => 'แชทส่วนตัวทั้งหมด';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'เฉพาะ DM ที่เปิดอยู่';

  @override
  String get channelDetailsSearchScopeOpenDms => 'แชทส่วนตัว';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'ข้อความทั้งหมด + ชุมชน';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'ข้อความส่วนตัวและชุมชนที่เปิดอยู่';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'ค้นหาเฉพาะในชุมชนปัจจุบัน';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'ค้นหาเฉพาะในแชทนี้';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'ในทุกชุมชนที่คุณอยู่';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'เฉพาะในแชทส่วนตัวทั้งหมดที่คุณเคยเข้าร่วม';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'ในทุกแชทที่คุณเคยเข้าร่วม';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'ในข้อความส่วนตัวทั้งหมดที่คุณเปิดอยู่เท่านั้น';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'ใน DM ทั้งหมดที่คุณเปิดอยู่';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'ในทุกข้อความส่วนตัวที่คุณเคยมี + ทุกชุมชนที่คุณอยู่ในปัจจุบัน';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'ใน DM ทั้งหมดที่คุณเปิดอยู่ + ในทุกชุมชนที่คุณเป็นสมาชิก';

  @override
  String get channelDetailsSearchSortNewest => 'ใหม่ล่าสุดก่อน';

  @override
  String get channelDetailsSearchSortOldest => 'เก่าสุดก่อน';

  @override
  String get channelDetailsSearchSortRelevance => 'เกี่ยวข้องมากที่สุด';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'แสดงข้อความล่าสุดก่อน';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'แสดงข้อความเก่าสุดก่อน';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'แสดงข้อความที่เกี่ยวข้องมากที่สุดก่อน';

  @override
  String get channelDetailsSearchContentImage => 'การอัปโหลดรูปภาพ';

  @override
  String get channelDetailsSearchContentVideo => 'วิดีโอที่อัปโหลด';

  @override
  String get channelDetailsSearchContentAudio => 'การอัปโหลดเสียง';

  @override
  String get channelDetailsSearchContentFile => 'ไฟล์ที่อัปโหลด';

  @override
  String get channelDetailsSearchContentLink => 'ลิงก์';

  @override
  String get channelDetailsSearchContentEmbed =>
      'แสดงตัวอย่างลิงก์ หรือ การฝัง';

  @override
  String get channelDetailsSearchContentSticker => 'สติกเกอร์';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'เฉพาะไฟล์รูปภาพที่อัปโหลด';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'เฉพาะไฟล์วิดีโอที่อัปโหลด';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'เฉพาะไฟล์เสียงที่อัปโหลด';

  @override
  String get channelDetailsSearchContentFileDescription => 'ไฟล์ที่อัปโหลด';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'พิมพ์ URL ในข้อความ';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'พรีวิวที่แก้ไขแล้วและ Rich Embed ไม่ใช่ไฟล์ที่อัปโหลด';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'สติกเกอร์ที่แนบกับข้อความ';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count ประเภท';
  }

  @override
  String get personalNotesTitle => 'บันทึกส่วนตัว';

  @override
  String get personalNotesSubtitle =>
      'พื้นที่ส่วนตัวของคุณสำหรับความคิดและสิ่งเตือนใจ';

  @override
  String groupDmWelcome(String displayName) {
    return 'ยินดีต้อนรับสู่ $displayName เพิ่มเพื่อนเพื่อเริ่มกลุ่มกันเลย';
  }

  @override
  String get groupDmWelcomeEditGroup => 'แก้ไขกลุ่ม';

  @override
  String get groupDmWelcomeAddFriends => 'เพิ่มเพื่อนเข้ากลุ่ม';

  @override
  String get dmGroupInvites => 'คำเชิญ';

  @override
  String get groupDmEditTitle => 'แก้ไขกลุ่ม';

  @override
  String get groupDmEditDetailsTooltip => 'แก้ไขรายละเอียดกลุ่ม';

  @override
  String get groupDmGroupName => 'ชื่อกลุ่ม';

  @override
  String get groupDmMyGroup => 'กลุ่มของฉัน';

  @override
  String get groupDmGroupNameMaxLength => 'ชื่อกลุ่มต้องไม่เกิน 100 ตัวอักษร';

  @override
  String get groupDmGroupIcon => 'ไอคอนกลุ่ม';

  @override
  String get groupDmUploadIcon => 'อัปโหลดไอคอน';

  @override
  String get groupDmChangeIcon => 'เปลี่ยนไอคอน';

  @override
  String get groupDmRemoveIcon => 'ลบไอคอน';

  @override
  String get groupDmUpdated => 'อัปเดตกลุ่มแล้ว';

  @override
  String get groupDmUpdateFailed => 'อัปเดตกลุ่มไม่สำเร็จ ลองอีกครั้ง';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'ไม่รองรับไอคอนแบบเคลื่อนไหว ใช้ภาพนิ่ง';

  @override
  String get groupDmAnimatedIconNotSupportedTitle => 'ไม่รองรับไอคอนเคลื่อนไหว';

  @override
  String get groupDmIconFileTooLargeTitle => 'ไฟล์ไอคอนมีขนาดใหญ่เกินไป';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'ไฟล์ไอคอนใหญ่เกินไป เลือกไฟล์ที่มีขนาดเล็กกว่า $maxSize';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'รูปแบบไอคอนไม่รองรับ';

  @override
  String get groupDmUnsupportedIconFormatBody => 'ประเภทไฟล์ไม่รองรับ';

  @override
  String get groupDmCouldntProcessImage => 'ประมวลผลรูปภาพไม่ได้';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'ประมวลผลรูปภาพที่ครอบตัดไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get groupDmInvalidImage => 'รูปภาพไม่ถูกต้อง';

  @override
  String get groupDmInvalidImageBody => 'รูปภาพไม่ถูกต้อง ลองใหม่อีกครั้ง';

  @override
  String get groupDmAddFriends => 'เพิ่ม';

  @override
  String get groupDmOrSendInvite => 'หรือส่งคำเชิญให้เพื่อน:';

  @override
  String get groupDmGenerateInviteLink => 'สร้างลิงก์เชิญ';

  @override
  String get groupDmCreateInvite => 'สร้าง';

  @override
  String get groupDmInviteExpires24Hours => 'คำเชิญจะหมดอายุใน 24 ชั่วโมง';

  @override
  String get groupDmAddFriendFailed =>
      'เพิ่มเพื่อนคนนี้เข้ากลุ่มไม่ได้ โปรดลองอีกครั้ง';

  @override
  String get groupDmAddFailed => 'เพิ่มเข้ากลุ่มไม่ได้';

  @override
  String get groupDmGroupFull =>
      'กลุ่มนี้เต็มแล้ว ลบสมาชิกบางคนออกก่อนที่จะเพิ่มคนอื่น';

  @override
  String get groupDmRateLimited =>
      'คุณกำลังดำเนินการเร็วเกินไป โปรดรอสักครู่แล้วลองอีกครั้ง';

  @override
  String get groupDmCreateInviteFailed => 'สร้างลิงก์เชิญไม่ได้';

  @override
  String get groupDmCreateInviteFailedBody =>
      'สร้างลิงก์เชิญไม่ได้ โปรดลองอีกครั้ง';

  @override
  String get guildNavbarCreateInviteFailed =>
      'สร้างลิงก์เชิญไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'คุณไม่มีสิทธิ์สร้างคำเชิญในช่องนี้';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'ชุมชนนี้ถึงขีดจำกัดการเชิญแล้ว';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'การสร้างคำเชิญถูกปิดใช้งานชั่วคราวสำหรับชุมชนนี้';

  @override
  String get groupDmCopyInviteFailed => 'คัดลอกลิงก์เชิญไม่สำเร็จ';

  @override
  String get groupDmInvitesOwnerOnly =>
      'เฉพาะเจ้าของกลุ่มเท่านั้นที่จัดการคำเชิญได้';

  @override
  String get groupDmNoInvitesCreated => 'ยังไม่มีคำเชิญ';

  @override
  String get groupDmLoadingInvites => 'กำลังโหลดคำเชิญ...';

  @override
  String get groupDmInvitesLoadFailed => 'โหลดคำเชิญไม่สำเร็จ ลองอีกครั้ง';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'เพิกถอนคำเชิญนี้ใช่ไหม การดำเนินการนี้จะย้อนกลับไม่ได้';

  @override
  String get groupDmInviteRevoked => 'ยกเลิกคำเชิญแล้ว';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'สร้างโดย $name หมดอายุใน $time';
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
  String get composerOpenExpressionPicker => 'เปิดตัวเลือกอิโมจิ';

  @override
  String get composerShowKeyboard => 'แสดงแป้นพิมพ์';

  @override
  String get composerCloseAttachmentPanel => 'ปิดตัวเลือกไฟล์แนบ';

  @override
  String get chatAttachmentPanelPhotos => 'รูปภาพ';

  @override
  String get chatAttachmentPanelFiles => 'ไฟล์';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'จำเป็นต้องเข้าถึงคลังรูปภาพ';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'อนุญาตให้เข้าถึงคลังรูปภาพเพื่อเรียกดูและแนบรูปภาพและวิดีโอล่าสุด';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'เปิดการตั้งค่า';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', กำลังส่ง';

  @override
  String get messageAccessibilityFailedSuffix => ', ส่งไม่สำเร็จ';

  @override
  String get messageAccessibilityAttachmentSummary => 'ไฟล์แนบ';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return 'ไฟล์แนบ $count รายการ';
  }

  @override
  String get messageAccessibilityImageSummary => 'รูปภาพ';

  @override
  String get messageAccessibilityVideoSummary => 'วิดีโอ';

  @override
  String get messageAccessibilityAudioSummary => 'ไฟล์เสียง';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'สติกเกอร์ $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'ไฟล์ $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'ไฟล์แนบที่ถูกซ่อน';

  @override
  String get messageAccessibilityEmbedSummary => 'การฝัง';

  @override
  String get messageAccessibilityEmptySummary => 'ข้อความ';

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
  String get userSettingsSearchPlaceholder => 'ค้นหาการตั้งค่า...';

  @override
  String get userSettingsSearchFieldLabel => 'ค้นหาการตั้งค่า';

  @override
  String get userSettingsSearchClear => 'ล้างการค้นหา';

  @override
  String get userSettingsSearchNoResults => 'ไม่พบการตั้งค่า';

  @override
  String get userSettingsNavProfile => 'โปรไฟล์';

  @override
  String get userSettingsNavSecurityLogin => 'ความปลอดภัยและการเข้าสู่ระบบ';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'ของขวัญ';

  @override
  String get giftSettingsClaimAccountTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get giftSettingsClaimAccountDescription =>
      'ยืนยันบัญชีของคุณเพื่อรับหรือจัดการรหัสของขวัญ Plutonium';

  @override
  String get giftSettingsRedeemTitle => 'แลกของขวัญ';

  @override
  String get giftSettingsRedeemDescription =>
      'กรอกรหัสของขวัญเพื่อรับ Plutonium สำหรับบัญชีของคุณ';

  @override
  String get giftSettingsRedeemPlaceholder => 'กรอกรหัสของขวัญ…';

  @override
  String get giftSettingsRedeemButton => 'แลก';

  @override
  String get giftSettingsRedeemSuccess =>
      'แลกรับของขวัญสำเร็จแล้ว ขอให้สนุกกับ Plutonium นะ';

  @override
  String get giftSettingsPurchasedTitle => 'ของขวัญที่ซื้อแล้ว';

  @override
  String get giftSettingsPurchasedDescription =>
      'จัดการโค้ดของขวัญ Plutonium ที่คุณซื้อไปแล้ว แชร์ลิงก์ของขวัญให้คนพิเศษ หรือแลกรับด้วยตัวเอง!';

  @override
  String get giftSettingsEmptyTitle => 'ยังไม่มีของขวัญ';

  @override
  String get giftSettingsEmptyDescription =>
      'ซื้อของขวัญ Plutonium จากแท็บ Plutonium เพื่อแชร์กับเพื่อนๆ';

  @override
  String get giftSettingsGoToPlutonium => 'ไปที่ Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'ไม่สามารถโหลดคลังของขวัญได้';

  @override
  String get giftSettingsLoadFailedDescription => 'ลองอีกครั้งในภายหลัง';

  @override
  String get giftSettingsTryAgain => 'ลองอีกครั้ง';

  @override
  String get giftSettingsGiftUrl => 'ลิงก์ของขวัญ';

  @override
  String get giftSettingsCopy => 'คัดลอก';

  @override
  String get giftSettingsCopied => 'คัดลอกแล้ว';

  @override
  String get giftSettingsGiftUrlCopied => 'คัดลอกลิงก์ของขวัญแล้ว';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'คัดลอก URL ของขวัญไม่ได้';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'ซื้อเมื่อ $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'แลกรับแล้ว $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'รับโดย $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'แลกของขวัญนี้แล้ว';

  @override
  String get giftSettingsRedeemForYourself => 'แลกให้ตัวเอง';

  @override
  String get giftSettingsShareWithFriend => 'แชร์ให้เพื่อน';

  @override
  String get premiumPlutoniumTagline =>
      'ปลดล็อกขีดจำกัดที่สูงขึ้นและฟีเจอร์พิเศษ พร้อมสนับสนุนแพลตฟอร์มการสื่อสารอิสระ';

  @override
  String get premiumPurchaseMode => 'ช่องทางการซื้อ';

  @override
  String get premiumForMe => 'สำหรับฉัน';

  @override
  String get premiumAsAGift => 'เป็นของขวัญ';

  @override
  String get premiumMonthly => 'รายเดือน';

  @override
  String get premiumYearly => 'รายปี';

  @override
  String get premiumPerMonth => '/ เดือน';

  @override
  String get premiumPerYear => '/ ปี';

  @override
  String get premiumOneTimePurchase => 'ซื้อครั้งเดียว';

  @override
  String get premiumSave17 => 'ประหยัด 17%';

  @override
  String get premiumUpgradeNow => 'อัปเกรดเลย';

  @override
  String get premiumBuyGift => 'ซื้อของขวัญ';

  @override
  String get premiumOneYearGift => 'ของขวัญ 1 ปี';

  @override
  String get premiumOneMonthGift => 'ของขวัญ 1 เดือน';

  @override
  String get premiumMostPopular => 'เป็นที่นิยมที่สุด';

  @override
  String get premiumScrollPrompt =>
      'เลื่อนลงเพื่อดูสิทธิประโยชน์ทั้งหมดที่มีให้สำหรับ Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'ฟรีเทียบกับ Plutonium';

  @override
  String get premiumFreeColumn => 'ฟรี';

  @override
  String get premiumGiftSectionTitle => 'มอบ Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'มอบประสบการณ์ Plutonium ให้เพื่อนของคุณด้วยการซื้อการสมัครสมาชิกล่วงหน้า';

  @override
  String get premiumGiftBannerOne => 'คุณมีรหัสของขวัญใหม่รอคุณอยู่!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'คุณมีโค้ดของขวัญใหม่ $count รายการรอคุณอยู่!';
  }

  @override
  String get premiumViewGifts => 'ดูของขวัญ';

  @override
  String get premiumReadyToUpgrade => 'พร้อมจะอัปเกรดหรือยัง?';

  @override
  String get premiumReadyToBuyGift => 'พร้อมซื้อของขวัญหรือยัง';

  @override
  String premiumMonthlyPrice(String price) {
    return 'รายเดือน $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'รายปี $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 ปี $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 เดือน $price';
  }

  @override
  String get premiumManageSubscription => 'จัดการการสมัครสมาชิก';

  @override
  String get premiumRedeemGiftCode => 'แลกรหัสของขวัญ';

  @override
  String get premiumGiftBadge => 'ของขวัญ';

  @override
  String get premiumCancelSubscriptionTitle => 'ยกเลิกการสมัครสมาชิกใช่หรือไม่';

  @override
  String get premiumCancelSubscriptionBody =>
      'คุณจะยังคงได้รับสิทธิพิเศษจนถึงวันต่ออายุครั้งถัดไป จากนั้นจะมีระยะเวลาผ่อนผัน 3 วันในการสมัครสมาชิกอีกครั้งและรักษาวันที่สมัครสมาชิกของคุณไว้';

  @override
  String get premiumCancelSubscriptionConfirm => 'ยกเลิกการสมัครสมาชิก';

  @override
  String get premiumKeepSubscription => 'คงการสมัครสมาชิก';

  @override
  String get premiumPurchaseHistoryTitle => 'ประวัติการซื้อ';

  @override
  String get premiumPurchaseHistoryDescription =>
      'ใบแจ้งหนี้ล่าสุดของคุณ หากต้องการเปลี่ยนวิธีการชำระเงินสำหรับการสมัครใช้งานของคุณ ให้เพิ่มหรือเลือกวิธีการชำระเงินในพอร์ทัลการเรียกเก็บเงิน แล้วตั้งเป็นค่าเริ่มต้น';

  @override
  String get premiumManagePaymentMethods => 'จัดการวิธีการชำระเงิน';

  @override
  String get premiumBillingHistory => 'ประวัติการเรียกเก็บเงิน';

  @override
  String get premiumSelfServeRefundTitle => 'การคืนเงินด้วยตนเอง';

  @override
  String get premiumSelfServeRefundButton => 'คืนเงินการซื้อล่าสุด';

  @override
  String get premiumDisclaimerAgreementPrefix => 'เมื่อซื้อ คุณยอมรับ ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => 'เมื่อซื้อ คุณได้ตกลงตาม ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' และ ';

  @override
  String premiumActiveUntil(String date) {
    return 'ใช้งานได้ถึง $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'กำลังยกเลิก';

  @override
  String premiumCancelsOn(String date) {
    return 'จะยกเลิกในวันที่ $date สิทธิประโยชน์จะยังคงใช้งานได้จนถึงตอนนั้น';
  }

  @override
  String get premiumReactivateSubscription => 'เปิดใช้งานอีกครั้ง';

  @override
  String premiumGiftedUntil(String date) {
    return 'ได้รับเป็นของขวัญจนถึงวันที่ $date จะไม่ต่ออายุอัตโนมัติ';
  }

  @override
  String get premiumComparisonFeatureColumn => 'ฟีเจอร์';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'เมื่อซื้อสินค้า คุณได้ยอมรับ$termsและ$privacyของเรา';
  }

  @override
  String get premiumDisclaimerRefund =>
      'สามารถขอคืนเงินด้วยตนเองได้ภายใน 3 วันหลังชำระเงิน และทำได้เดือนละครั้ง การคืนเงินค่าสมัครสมาชิกจะถือเป็นการยกเลิกการสมัครสมาชิก ผู้ซื้อใน EU/EEA สละสิทธิ์การถอนเงินภายใน 14 วันเมื่อชำระเงินเพื่อเข้าถึงเนื้อหาได้ทันที โปรดใช้ปุ่มคืนเงินในแอปแทนการปฏิเสธการชำระเงิน การปฏิเสธการชำระเงินอาจจำกัดบัญชีของคุณอย่างถาวร Stripe จัดการการชำระเงินอย่างปลอดภัย เราไม่เคยเห็นหมายเลขบัตรเต็มของคุณ';

  @override
  String get premiumTermsOfService => 'ข้อกำหนดในการให้บริการ';

  @override
  String get premiumPrivacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get premiumCheckoutStartFailedTitle => 'ไม่สามารถเริ่มชำระเงินได้';

  @override
  String get premiumCheckoutStartFailedBody =>
      'เกิดข้อผิดพลาดขณะเริ่มต้นการชำระเงิน โปรดลองอีกครั้งในภายหลัง';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'คุณกำลังใช้การสมัครสมาชิกแบบของขวัญ ซึ่งจะไม่มีการต่ออายุ คุณสามารถแลกรหัสของขวัญเพิ่มเพื่อขยายระยะเวลาได้ การสมัครสมาชิกแบบต่ออายุอัตโนมัติจะสามารถเริ่มต้นได้หลังจากระยะเวลาของขวัญของคุณสิ้นสุดลง';

  @override
  String get premiumPlanUnavailable =>
      'แพ็กเกจนี้ไม่พร้อมใช้งาน โปรดติดต่อฝ่ายสนับสนุน';

  @override
  String get premiumCompletePaymentTitle => 'ชำระเงินให้เสร็จสมบูรณ์';

  @override
  String get premiumCompletePaymentBody =>
      'คุณกำลังไปยัง Stripe เพื่อดำเนินการชำระเงินให้เสร็จสิ้น กลับไปที่ Fluxer เมื่อคุณดำเนินการเสร็จแล้ว';

  @override
  String get premiumChoosePaymentMethodTitle => 'เลือกช่องทางการชำระเงิน';

  @override
  String get premiumPixPaymentPromptDescription =>
      'ชำระเงินด้วย Pix อัตโนมัติเพื่ออนุญาตให้เรียกเก็บเงินเป็นประจำโดยตรงจากธนาคารในบราซิลของคุณ หรือเลือกใช้บัตรเพื่อป้อนข้อมูลบัตรเครดิตในหน้าถัดไปของ Stripe';

  @override
  String get premiumUsePix => 'ใช้ Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'ชำระเงินด้วย UPI เพื่อตั้งค่า e-mandate ที่เป็นไปตามข้อกำหนดของ RBI จากธนาคารอินเดียของคุณ หรือเลือกใช้บัตรเพื่อกรอกข้อมูลบัตรเครดิตในหน้าถัดไปของ Stripe';

  @override
  String get premiumUseUpi => 'ใช้ UPI';

  @override
  String get premiumUseCard => 'ใช้บัตร';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'ไม่สามารถเปิดพอร์ทัลการเรียกเก็บเงินได้';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'เกิดข้อผิดพลาดขณะเปิดพอร์ทัลการเรียกเก็บเงิน โปรดลองอีกครั้งในภายหลัง';

  @override
  String get premiumAlreadyVisionaryTitle => 'คุณเป็น Visionary อยู่แล้ว';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary มีสิทธิ์เข้าถึงถาวรอยู่แล้ว จึงไม่จำเป็นต้องสมัครสมาชิกแบบรายเดือน คุณยังสามารถซื้อของขวัญให้ผู้อื่นได้';

  @override
  String get premiumExistingSubscriptionTitle => 'มีแพ็กเกจนี้อยู่แล้ว';

  @override
  String get premiumExistingSubscriptionBody =>
      'เราพบการสมัครใช้งาน Fluxer Plutonium ที่มีอยู่สำหรับบัญชีนี้ จัดการได้ที่พอร์ทัลการเรียกเก็บเงินที่ปลอดภัยเพื่ออัปเดตรายละเอียดการชำระเงินหรือตรวจสอบสถานะการต่ออายุ หากคุณเพิ่งชำระเงิน โปรดรอสักครู่แล้วเปิดหน้านี้อีกครั้ง';

  @override
  String get premiumPurchasesDisabledTitle => 'ซื้อไม่ได้';

  @override
  String get premiumPurchasesDisabledBody =>
      'การซื้อถูกปิดใช้งานสำหรับบัญชีนี้ ติดต่อ support@fluxer.app หากดูเหมือนว่ามีข้อผิดพลาด';

  @override
  String get premiumClaimAccountToPurchase =>
      'รับสิทธิ์บัญชีของคุณเพื่อซื้อ Fluxer Plutonium';

  @override
  String get premiumVerifyEmailToPurchase =>
      'คุณต้องยืนยันอีเมลของคุณก่อนจึงจะสามารถซื้อ Fluxer Plutonium ได้';

  @override
  String get premiumPerkCustomUsernameTag => 'แท็กชื่อผู้ใช้แบบกำหนดเอง';

  @override
  String get premiumPerkPerCommunityProfiles => 'โปรไฟล์แยกตามแต่ละชุมชน';

  @override
  String get premiumPerkMessageScheduling => 'การตั้งเวลาข้อความ';

  @override
  String get premiumPerkProfileBadge => 'ป้ายโปรไฟล์';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'พื้นหลังวิดีโอแบบกำหนดเอง';

  @override
  String get premiumPerkEntranceSounds => 'เสียงเข้าห้องแชท';

  @override
  String get premiumPerkCommunities => 'คอมมูนิตี้';

  @override
  String get premiumPerkMessageCharacterLimit => 'จำกัดจำนวนอักขระในข้อความ';

  @override
  String get premiumPerkBookmarkedMessages => 'ข้อความที่คั่นหน้า';

  @override
  String get premiumPerkFileUploadSize => 'ขนาดไฟล์ที่อัปโหลด';

  @override
  String get premiumPerkEmojiStickerPacks => 'ชุดอิโมจิและสติกเกอร์';

  @override
  String get premiumPerkSavedMedia => 'สื่อที่บันทึกไว้';

  @override
  String get premiumPerkUseAnimatedEmojis => 'ใช้อีโมจิเคลื่อนไหว';

  @override
  String get premiumPerkGlobalEmojiStickerAccess => 'อิโมจิและสติกเกอร์ทั่วโลก';

  @override
  String get premiumPerkVideoQuality => 'คุณภาพวิดีโอ';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'อวตารและแบนเนอร์โปรไฟล์แบบเคลื่อนไหว';

  @override
  String get premiumPerkEarlyAccess => 'เข้าถึงฟีเจอร์ใหม่ก่อนใคร';

  @override
  String get premiumPerkCustomThemes => 'ธีมที่กำหนดเอง';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'สูงสุด 4K/60fps';

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
  String get userSettingsNavShortcuts => 'ปุ่มลัด';

  @override
  String get audioAndVideoAudioSectionTitle => 'เสียง';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'ตั้งค่าไมโครโฟน ลำโพง และการประมวลผลเสียงของคุณ';

  @override
  String get audioAndVideoVideoSectionTitle => 'วิดีโอ';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'ตั้งค่าคุณภาพกล้องและการแชร์หน้าจอของคุณ';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'การทำงานขณะอยู่ในสาย';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'ควบคุมการแจ้งเตือนเพื่อยืนยันระหว่างการโทรด้วยเสียงและวิดีโอ';

  @override
  String get audioAndVideoInputDeviceLabel => 'อุปกรณ์นำเข้า';

  @override
  String get audioAndVideoOutputDeviceLabel => 'อุปกรณ์เอาต์พุต';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'ค่าเริ่มต้น';

  @override
  String get audioAndVideoUseSpeakerLabel => 'ใช้ลำโพง';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'เมื่อปิดอยู่ เสียงจะเล่นผ่านลำโพงหูฟังหรือหูฟังที่เชื่อมต่อ';

  @override
  String get audioAndVideoInputVolumeLabel => 'ระดับเสียงไมโครโฟน';

  @override
  String get audioAndVideoOutputVolumeLabel => 'ระดับเสียงขาออก';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'การประมวลผลเสียง';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'เสียงที่เน้น';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'แนะนำ: ปรับปรุงไมโครโฟนของคุณเพื่อให้เสียงพูดชัดเจน';

  @override
  String get audioAndVideoDirectInputLabel => 'อินพุตโดยตรง';

  @override
  String get audioAndVideoDirectInputDescription =>
      'ส่งเสียงของคุณโดยไม่มีการปรับแต่ง เหมาะที่สุดหากคุณใช้ซอฟต์แวร์เสียงภายนอก';

  @override
  String get audioAndVideoCustomProfileLabel => 'กำหนดเอง';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'ปรับการตั้งค่าแต่ละรายการด้วยตัวเอง: การลดเสียงรบกวน, การตัดเสียงสะท้อน และเกน';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'การลดเสียงรบกวน';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'ปรับปรุงแล้ว';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'มาตรฐาน';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'ไม่มี';

  @override
  String get audioAndVideoEchoCancellationLabel => 'การตัดเสียงสะท้อน';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'ควบคุมอัตราขยายเสียงอัตโนมัติ';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'ปรับระดับเสียงไมโครโฟนให้สม่ำเสมอ ปิดเมื่อเปิดใช้งานการลดเสียงรบกวนขั้นสูง';

  @override
  String get audioAndVideoMicTestSectionTitle => 'ทดสอบไมโครโฟน';

  @override
  String get audioAndVideoMicTestStartLabel => 'เริ่มทดสอบไมโครโฟน';

  @override
  String get audioAndVideoMicTestStopLabel => 'หยุดทดสอบไมโครโฟน';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName ต้องการสิทธิ์เข้าถึงไมโครโฟนเพื่อทดสอบอินพุตของคุณ';
  }

  @override
  String get audioAndVideoCameraLabel => 'กล้อง';

  @override
  String get audioAndVideoMirrorCameraLabel => 'กลับด้านกล้อง';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'คุณภาพกล้อง';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'คุณภาพการแชร์หน้าจอ';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'อัตราเฟรม';

  @override
  String get audioAndVideoFrameRate15Label => '15 เฟรมต่อวินาที';

  @override
  String get audioAndVideoFrameRate30Label => '30 เฟรมต่อวินาที';

  @override
  String get audioAndVideoFrameRate60Label => '60 เฟรมต่อวินาที';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p และ 60 FPS ต้องใช้ $premiumProductName';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'อินสแตนซ์นี้ปัจจุบันอนุญาตให้แชร์หน้าจอได้สูงสุด 720p ที่ 30 FPS';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName ต้องได้รับอนุญาตให้เข้าถึงไมโครโฟนเพื่อแสดงรายการอุปกรณ์ของคุณ';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName ต้องเข้าถึงกล้องเพื่อแสดงรายการอุปกรณ์ของคุณ';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'ไม่ถามเมื่อซ่อนกล้องของฉัน';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'ไม่ถามเมื่อซ่อนการแชร์หน้าจอของฉัน';

  @override
  String get userSettingsNavNotifications => 'การแจ้งเตือน';

  @override
  String get notificationsGeneralSectionTitle => 'ทั่วไป';

  @override
  String get notificationsEnableNotificationsLabel => 'เปิดการแจ้งเตือน';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'รับการแจ้งเตือนเมื่อคุณได้รับข้อความ คุณอาจต้องอนุญาตการแจ้งเตือนสำหรับ $productName ในการตั้งค่าอุปกรณ์ของคุณ สำหรับการควบคุมรายช่อง/รายชุมชน ให้เปิดการตั้งค่าการแจ้งเตือนจากเมนูของชุมชน';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'เปิดการแจ้งเตือนบนเดสก์ท็อป';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'ใช้ศูนย์การแจ้งเตือนของระบบปฏิบัติการ หากต้องการควบคุมการแจ้งเตือนแต่ละช่อง/แต่ละชุมชน ให้คลิกขวาที่ไอคอนชุมชนแล้วเปิดการตั้งค่าการแจ้งเตือน';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'เปิดการแจ้งเตือนในเบราว์เซอร์';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'รับการแจ้งเตือนเมื่อมีข้อความเข้า คุณอาจต้องอนุญาตการแจ้งเตือนในการตั้งค่าเบราว์เซอร์ หากต้องการควบคุมการแจ้งเตือนแต่ละช่อง/แต่ละคอมมูนิตี้ ให้คลิกขวาที่ไอคอนคอมมูนิตี้แล้วเปิดการตั้งค่าการแจ้งเตือน';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'หมดเวลาการแจ้งเตือนแบบพุชเมื่อไม่ใช้งาน';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName จะไม่ส่งการแจ้งเตือนแบบพุชไปยังอุปกรณ์มือถือของคุณเมื่อคุณใช้อุปกรณ์คอมพิวเตอร์ เลือกช่วงเวลาที่คุณต้องการให้ระบบหยุดส่งการแจ้งเตือนแบบพุชบนเดสก์ท็อป';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute นาที';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'การตั้งค่าการกล่าวถึง';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'การตั้งค่าการกล่าวถึงในการตอบกลับ';

  @override
  String get notificationsMentionNoPreferenceName => 'ไม่มีการตั้งค่า';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'เคารพการตั้งค่าของผู้ส่ง โดยไม่มีการแจ้งเตือนเมื่อผู้ส่งเปิด/ปิดการกล่าวถึง (@)';

  @override
  String get notificationsMentionPreferMentionName => 'ต้องการ @mention';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'ตอบกลับเมื่อมีคน @พูดถึงคุณ และเตือนผู้ส่งหากปิดการตั้งค่านี้';

  @override
  String get notificationsMentionPreferNoMentionName => 'ไม่ต้องการถูกกล่าวถึง';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'ตอบกลับโดยไม่ใส่ @mention และเตือนผู้ส่งหากเปิดใช้งาน';

  @override
  String get notificationsTtsSectionTitle =>
      'การแจ้งเตือนแบบแปลงข้อความเป็นเสียง';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'เปิดใช้งานการอ่านออกเสียง /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'ให้ /tts อ่านข้อความของคุณออกเสียง การปิดการตั้งค่านี้จะทำให้คำสั่งเหล่านั้นเป็นข้อความปกติ';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'ปรับความเร็วในการเล่นได้ใน ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'การช่วยการเข้าถึง';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'อ่านข้อความอัตโนมัติ';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'แปลงเนื้อหาที่เข้ามาเป็นเสียงพูด ไม่ว่าจะมาจาก /tts หรือไม่ก็ตาม';

  @override
  String get notificationsTtsModeAllChannelsName => 'ทุกช่อง';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'ให้ระบบอ่านทุกข้อความที่เข้ามา ไม่ว่าจะเปิดช่องทางไหนอยู่ก็ตาม';

  @override
  String get notificationsTtsModeCurrentChannelName => 'เฉพาะช่องที่ใช้งานอยู่';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'บรรยายเฉพาะช่องที่คุณกำลังดู การบรรยายจะติดตามคุณไปในแต่ละช่อง';

  @override
  String get notificationsTtsModeNeverName => 'ไม่เลย';

  @override
  String get notificationsTtsModeNeverDescription =>
      'จะไม่มีเสียงพูดจนกว่าจะมีคนใช้คำสั่ง /tts ด้วยตัวเอง';

  @override
  String get notificationsTtsModeAriaLabel => 'อ่านออกเสียงทุกข้อความ';

  @override
  String get notificationsSoundsSectionTitle => 'เสียง';

  @override
  String get notificationsMasterVolumeLabel => 'ระดับเสียงหลัก';

  @override
  String get notificationsMasterVolumeDescription =>
      'ตั้งค่าระดับเสียงสำหรับเอฟเฟกต์เสียงทั้งหมด การตั้งค่าเฉพาะเสียงจะข้ามการตั้งค่านี้';

  @override
  String get notificationsResetToDefaultVolume =>
      'รีเซ็ตระดับเสียงเป็นค่าเริ่มต้น';

  @override
  String get notificationsDisableAllSoundsLabel => 'ปิดเสียงแจ้งเตือนทั้งหมด';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'ระบบจะยังคงใช้การตั้งค่าเสียงแจ้งเตือนเดิมของคุณ';

  @override
  String get notificationsShowMoreSoundEffects => 'แสดงเอฟเฟกต์เสียงทั้งหมด';

  @override
  String get notificationsShowFewerSoundEffects => 'แสดงเอฟเฟกต์เสียงให้น้อยลง';

  @override
  String get notificationsPreviewSound => 'ลองฟังเสียง';

  @override
  String get notificationsPerSoundVolumeTitle => 'ระดับเสียงแต่ละเสียง';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'ตั้งค่าระดับเสียงเฉพาะสำหรับแต่ละเสียง เสียงที่ไม่ได้ตั้งค่าเองจะใช้ระดับเสียงหลัก';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'มีการตั้งค่าระดับเสียงที่กำหนดเองไว้: $overrideCount';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'ติดตามหลัก • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'รีเซ็ต $label เป็นระดับเสียงหลัก';
  }

  @override
  String get notificationsResetAllOverrides => 'รีเซ็ตการตั้งค่าทั้งหมด';

  @override
  String notificationsMuteSound(String label) {
    return 'ปิดเสียง $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'เปิดเสียง $label';
  }

  @override
  String get notificationsSoundMessage => 'การแจ้งเตือนข้อความของคอมมูนิตี้';

  @override
  String get notificationsSoundDirectMessage => 'การแจ้งเตือนข้อความส่วนตัว';

  @override
  String get notificationsSoundSameChannelMessage =>
      'การแจ้งเตือนข้อความช่องปัจจุบัน';

  @override
  String get notificationsSoundMute => 'ปิดเสียงพูด';

  @override
  String get notificationsSoundUnmute => 'เปิดเสียงสนทนา';

  @override
  String get notificationsSoundDeaf => 'ปิดเสียงหูฟัง';

  @override
  String get notificationsSoundUndeaf => 'เลิกปิดเสียงไมค์';

  @override
  String get notificationsSoundUserJoin => 'ผู้ใช้เข้าร่วมช่อง';

  @override
  String get notificationsSoundUserLeave => 'ผู้ใช้ออกจากช่อง';

  @override
  String get notificationsSoundUserMove => 'ผู้ใช้ย้ายช่อง';

  @override
  String get notificationsSoundViewerJoin => 'ผู้ชมเข้าร่วมไลฟ์';

  @override
  String get notificationsSoundViewerLeave => 'ผู้ชมออกจากไลฟ์';

  @override
  String get notificationsSoundVoiceDisconnect => 'เสียงถูกตัดการเชื่อมต่อ';

  @override
  String get notificationsSoundIncomingRing => 'สายเรียกเข้า';

  @override
  String get notificationsSoundCameraOn => 'เปิดกล้อง';

  @override
  String get notificationsSoundCameraOff => 'ปิดกล้อง';

  @override
  String get notificationsSoundScreenShareStart => 'เริ่มแชร์หน้าจอ';

  @override
  String get notificationsSoundScreenShareStop => 'หยุดแชร์หน้าจอ';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'ไม่สามารถอัปเดตการหมดเวลาการแจ้งเตือนแบบพุชได้ ลองอีกครั้ง';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'ไม่สามารถอัปเดตการตั้งค่าการกล่าวถึงได้ ลองอีกครั้ง';

  @override
  String get notificationsPermissionDeniedTitle => 'ปิดการแจ้งเตือน';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'ไม่สามารถเปิดใช้งานการแจ้งเตือนได้ โปรดยืนยันสิทธิ์การแจ้งเตือนเพื่อดำเนินการต่อ';

  @override
  String get userSettingsNavLanguageAndTime => 'ภาษาและเวลา';

  @override
  String get languageAndTimeLanguageSectionTitle => 'ภาษาของส่วนติดต่อผู้ใช้';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'เลือกภาษาที่จะใช้ทั่วทั้งแอป';

  @override
  String get languageAndTimeOpenLanguageSettings => 'เปิดการตั้งค่าภาษา';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'รูปแบบเวลา';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'เลือกวิธีแสดงเวลาในแอป';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'การเลือกรูปแบบเวลา';

  @override
  String get languageAndTimeTimeFormatAuto => 'อัตโนมัติ';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 ชั่วโมง';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 ชั่วโมง';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'ภาษาของแอป: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'ภาษาของระบบ: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'ใช้รูปแบบเวลาตามภาษาของระบบ';

  @override
  String get languageAndTimeTimeFormatSyncFailed => 'อัปเดตรูปแบบเวลาไม่สำเร็จ';

  @override
  String get userSettingsNavDefaultApps => 'แอปเริ่มต้น';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'เว็บเบราว์เซอร์';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'เลือกเบราว์เซอร์ที่จะเปิดเมื่อคุณแตะลิงก์';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'หากมีการติดตั้งแอปสำหรับเว็บไซต์ ลิงก์จะเปิดในแอปนั้นก่อน';

  @override
  String get defaultAppsWebBrowserInApp => 'เบราว์เซอร์ในแอป';

  @override
  String get defaultAppsWebBrowserExternal => 'เบราว์เซอร์ภายนอก';

  @override
  String get userSettingsNavAdvanced => 'ขั้นสูง';

  @override
  String get advancedPerformanceReportingTitle => 'การรายงานประสิทธิภาพ';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'ช่วยปรับปรุง $productName ด้วยการแชร์ข้อมูลประสิทธิภาพและข้อมูลขัดข้องแบบไม่ระบุตัวตน';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'ส่งรายงานข้อขัดข้องและประสิทธิภาพ';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'ข้อมูลที่รายงานทั้งหมดไม่ระบุตัวตนและจะถูกส่งไปยังบริการตรวจสอบของ $productName เท่านั้น — ไม่มีผู้ให้บริการบุคคลที่สาม';
  }

  @override
  String get advancedSettingsConfigure => 'กำหนดค่า';

  @override
  String get advancedSettingsCategoryPrivacy => 'ความเป็นส่วนตัว';

  @override
  String get advancedSettingsCategoryAppearance => 'ลักษณะที่แสดง';

  @override
  String get advancedSettingsCategoryAccessibility => 'การช่วยการเข้าถึง';

  @override
  String get advancedSettingsCategoryChat => 'แชท';

  @override
  String get advancedSettingsCategoryMedia => 'สื่อ';

  @override
  String get advancedSettingsCategoryVoice => 'เสียง';

  @override
  String get advancedSettingsCategoryDeveloper => 'นักพัฒนา';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'เปิดใช้งานการเลือกข้อความ';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'อนุญาตให้เลือกข้อความในแอป';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'เปิดใช้งานภาพตัวอย่างการเลื่อนวิดีโอ';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'ภาพขนาดย่อหรือเฟรมสดขณะเลื่อนวิดีโอ';

  @override
  String get advancedSettingHapticFeedbackLabel => 'การสั่น';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'การสั่นเพื่อตอบสนองต่อการแตะและการดำเนินการต่างๆ จะไม่ซิงค์ข้ามอุปกรณ์';

  @override
  String get advancedSettingShowNekoLabel => 'แสดง Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'แมวเนะโกะไล่ตามเคอร์เซอร์ของคุณ';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'แสดง Neko ที่ช่องป้อนข้อความแชทของคุณ';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'ภาพเคลื่อนไหวซูมตอนเปิด';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'ย่อโลโก้ออกเมื่อออกจากหน้าจอเริ่มต้น';

  @override
  String get advancedSettingKeyboardHintsLabel => 'คำแนะนำแป้นพิมพ์';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'คำแนะนำสำหรับปุ่มลัดบนคีย์บอร์ดในส่วนช่วยเหลือ';

  @override
  String get advancedSettingEnableFavoritesLabel => 'เปิดใช้งานรายการโปรด';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'แสดงรายการโปรดทั่วทั้งแอป';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'ลักษณะการเข้าร่วมช่องเสียง';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'ยืนยันหรือดับเบิลคลิกเพื่อเข้าร่วมช่องเสียงของชุมชน';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'ต้องดับเบิลคลิกเพื่อเข้าร่วมช่องเสียง';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'ยืนยันก่อนเข้าร่วมช่องเสียง';

  @override
  String get advancedSettingAutoSendGifsLabel => 'ส่ง GIF อัตโนมัติเมื่อเลือก';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'ส่ง GIF อัตโนมัติจากตัวเลือกโดยไม่ต้องยืนยัน';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'บันทึก GIF ที่ชอบเป็นมีเดียที่บันทึกไว้';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'เลือกวิธีจัดเก็บ GIF ที่ติดดาวเป็นรายการโปรด';

  @override
  String get advancedSettingMediaButtonsLabel => 'ปุ่มสื่อ';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'ปรับแต่งปุ่มและตัวบ่งชี้ที่จะแสดงบนไฟล์แนบสื่อและการฝัง';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'อัปโหลดไฟล์แนบก่อนส่ง';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'เริ่มอัปโหลดไฟล์แนบเมื่อเพิ่มลงในช่องข้อความ';

  @override
  String get advancedSettingStripTrackingLabel =>
      'ลบพารามิเตอร์ติดตามออกจาก URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'ลบพารามิเตอร์ติดตามออกจาก URL ในข้อความที่คุณส่งโดยอัตโนมัติ';

  @override
  String get advancedSettingTrustAllLinksLabel => 'เชื่อถือลิงก์ภายนอกทั้งหมด';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'ข้ามคำเตือนลิงก์ภายนอกสำหรับทุกโดเมน';

  @override
  String get advancedSettingSearchEnginesLabel => 'เครื่องมือค้นหา';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'กำหนดค่าเครื่องมือค้นหาที่จะใช้เมื่อเลือกข้อความ';

  @override
  String get advancedSettingTranslatorsLabel => 'ผู้แปล';

  @override
  String get advancedSettingTranslatorsDescription =>
      'กำหนดค่าผู้ให้บริการแปลที่ใช้สำหรับข้อความที่เลือก';

  @override
  String get advancedSettingReverseImageSearchLabel => 'ค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'ผู้ให้บริการค้นหารูปภาพแบบย้อนกลับ';

  @override
  String get advancedSettingMessageActionBarLabel => 'แถบการทำงานของข้อความ';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'ปรับแต่งแถบการทำงานที่ปรากฏขึ้นเมื่อวางเมาส์เหนือข้อความ';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'เติมคำอัตโนมัติ (Expression)';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'เลือกสิ่งที่แสดงเมื่อคุณพิมพ์เครื่องหมายทวิภาคในช่องป้อนข้อความ';

  @override
  String get advancedSettingInputButtonsLabel => 'ปุ่มป้อนข้อความ';

  @override
  String get advancedSettingInputButtonsDescription =>
      'เลือกปุ่มที่จะแสดงในช่องพิมพ์ข้อความ';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'เลื่อนไปด้านล่างเมื่อส่งข้อความ';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'เลือกวิธีที่แชทจะเลื่อนหลังจากที่คุณส่งข้อความ';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'ข้ามการยืนยัน \"ทำเครื่องหมายว่าอ่านแล้วทั้งหมด\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'ทำเครื่องหมายช่องที่ยังไม่ได้อ่านทั้งหมดในกล่องข้อความเป็นอ่านแล้วทันที โดยไม่ต้องยืนยัน';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'ซ่อนช่องที่ปิดเสียงไว้เป็นค่าเริ่มต้น';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'ซ่อนช่องที่คุณปิดเสียงจากแถบด้านข้างของคอมมูนิตี้';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'แสดงตัวบ่งชี้ GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'แสดงตัวบ่งชี้วันหมดอายุของไฟล์แนบ';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'แสดงปุ่มลบ';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'แสดงปุ่มดาวน์โหลด';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'แสดงปุ่มรายการโปรด';

  @override
  String get advancedSettingShowSuppressEmbedsLabel => 'แสดงปุ่มซ่อนการฝัง';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'แสดงแถบการทำงานของข้อความ';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'แสดงเฉพาะปุ่มเพิ่มเติม';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'แสดงปฏิกิริยาด่วน';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'เปิดใช้ Shift เพื่อขยาย';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'แสดงอิโมจิเริ่มต้นในการเติมข้อความอัตโนมัติของช่องแสดงอารมณ์';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'แสดงอิโมจิที่กำหนดเองในการเติมข้อความอัตโนมัติ';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'แสดงสติกเกอร์ในคำแนะนำการพิมพ์';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'แสดงสื่อที่บันทึกไว้ในการเติมข้อความอัตโนมัติ';

  @override
  String get advancedSettingShowGifsButtonLabel => 'แสดงปุ่ม GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'แสดงปุ่มสื่อ';

  @override
  String get advancedSettingShowStickersButtonLabel => 'แสดงปุ่มสติกเกอร์';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'แสดงปุ่มอิโมจิ';

  @override
  String get advancedSettingShowSendButtonLabel => 'แสดงปุ่มส่ง';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'แสดงการแจ้งเตือนอุปกรณ์ใหม่';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'แจ้งเตือนเมื่อมีอุปกรณ์เสียงใหม่';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'การควบคุมระดับเสียงการเชื่อมต่อ';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'แสดงแถบเลื่อนระดับเสียงของผู้เข้าร่วมตามอุปกรณ์ในเมนูเสียง';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'พฤติกรรมการแสดงตัวอย่างการแชร์หน้าจอ';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'ดูตัวอย่าง พฤติกรรมการป็อปอัพ และพฤติกรรมของภาพขนาดย่อสตรีม';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'ตัวแปลงสัญญาณการแชร์หน้าจอ';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'ตัวแปลงสัญญาณวิดีโอสำหรับการแชร์หน้าจอ';

  @override
  String get advancedSettingScreenShareCodecAuto => 'อัตโนมัติ (แนะนำ)';

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
      'หยุดแสดงตัวอย่างการแชร์หน้าจอของฉันในพื้นหลังชั่วคราว';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'ซ่อนภาพตัวอย่างสตรีมของฉัน';

  @override
  String get advancedSettingDeveloperModeLabel => 'เปิดโหมดนักพัฒนา';

  @override
  String get advancedSettingDeveloperModeDescription => 'เปิดโหมดนักพัฒนา';

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
  String get advancedSettingDefaultSearchEngineLabel =>
      'เครื่องมือค้นหาเริ่มต้น';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'เลือกเครื่องมือค้นหาที่จะใช้เป็นค่าเริ่มต้นเมื่อค้นหาข้อความที่เลือก';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'เครื่องมือค้นหาในตัว';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'เปิดหรือปิดเครื่องมือค้นหาในตัว เครื่องมือค้นหาที่เปิดใช้งานจะแสดงในเมนูบริบทข้อความเมื่อเลือกข้อความ';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'เครื่องมือค้นหาที่กำหนดเอง';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'เพิ่มเครื่องมือค้นหาของคุณเองด้วยรูปแบบ URL ที่กำหนดเอง ใช้ \'$query\' เป็นตัวยึดสำหรับข้อความค้นหา';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'เพิ่มเครื่องมือค้นหา';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'เปิดใช้งานเครื่องมือค้นหาอย่างน้อยหนึ่งรายการด้านล่าง';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'ลบเครื่องมือค้นหา';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'เครื่องมือแปลภาษาเริ่มต้น';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'เลือกเครื่องมือแปลภาษาที่จะใช้เป็นค่าเริ่มต้นเมื่อแปลข้อความที่เลือก';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'เครื่องมือแปลภาษาในตัว';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'เปิดหรือปิดเครื่องมือแปลภาษาในตัว เครื่องมือแปลภาษาที่เปิดใช้งานจะแสดงในเมนูบริบทของข้อความเมื่อเลือกข้อความ';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'นักแปลที่กำหนดเอง';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'เพิ่มตัวแปลของคุณเองด้วยรูปแบบ URL ที่กำหนดเอง ใช้ \'$query\' เป็นตัวยึดสำหรับข้อความที่จะแปล';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'เพิ่มนักแปล';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'เปิดใช้งานเครื่องมือแปลภาษาอย่างน้อยหนึ่งรายการด้านล่าง';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'ลบนักแปล';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'การค้นหารูปภาพย้อนกลับเริ่มต้น';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'เลือกบริการค้นหารูปภาพย้อนกลับที่จะใช้เป็นค่าเริ่มต้นเมื่อค้นหารูปภาพ';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'ค้นหารูปภาพย้อนกลับในตัว';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'เปิดหรือปิดผู้ให้บริการค้นหารูปภาพย้อนกลับในตัว ผู้ให้บริการที่เปิดใช้งานจะปรากฏในเมนูบริบทของรูปภาพ, รูปโปรไฟล์, แบนเนอร์, สติกเกอร์ และอิโมจิ';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'ค้นหารูปภาพย้อนกลับแบบกำหนดเอง';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'เพิ่มผู้ให้บริการค้นหารูปภาพย้อนกลับของคุณเองด้วยรูปแบบ URL ที่กำหนดเอง ใช้ \'$url\' เป็นตัวยึดตำแหน่งสำหรับ URL ของรูปภาพ';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'เพิ่มการค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'เปิดใช้งานผู้ให้บริการค้นหารูปภาพย้อนกลับอย่างน้อยหนึ่งรายด้านล่าง';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'ลบการค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingAddSearchEngineTitle => 'เพิ่มเครื่องมือค้นหา';

  @override
  String get advancedSettingEditSearchEngineTitle => 'แก้ไขเครื่องมือค้นหา';

  @override
  String get advancedSettingAddTranslatorTitle => 'เพิ่มผู้ให้บริการแปลภาษา';

  @override
  String get advancedSettingEditTranslatorTitle => 'แก้ไขผู้ให้บริการแปลภาษา';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'เพิ่มเครื่องมือค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'แก้ไขเครื่องมือค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingSearchProviderNameLabel => 'ชื่อ';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'รูปแบบ URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'เครื่องมือค้นหาของฉัน';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'นักแปลของฉัน';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'ค้นหารูปภาพย้อนกลับของฉัน';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'ใช้ \'$query\' ในตำแหน่งที่ควรแทรกข้อความค้นหา';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'ใช้ \'$query\' ในที่ที่ควรแทรกข้อความที่จะแปล';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'ใช้ \'$url\' ในตำแหน่งที่ต้องการแทรก URL ของรูปภาพ';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'ต้องระบุชื่อ';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'ต้องระบุรูปแบบ URL';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'รูปแบบ URL ต้องมีตัวยึดตำแหน่ง \"$query\"';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'รูปแบบ URL ต้องมีตัวยึดตำแหน่ง \"$url\"';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'รูปแบบ URL ต้องเป็น URL ที่ถูกต้อง';

  @override
  String get advancedSettingAddSearchProviderAction => 'เพิ่ม';

  @override
  String get advancedSettingEditSearchProviderAction => 'แก้ไข';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'ลบ';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $engineName';
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
  String get userSettingsJoinFluxerLabs => 'เข้าร่วม Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'ใบอนุญาตแอป';

  @override
  String get userSettingsAppLicensesDescription =>
      'ซอฟต์แวร์โอเพนซอร์สที่ใช้ในแอปนี้ แอปนี้สร้างด้วย Flutter';

  @override
  String get userSettingsAppLicensesLoadError =>
      'ไม่สามารถโหลดรายการใบอนุญาตแอปได้';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ใบอนุญาต',
      one: '1 ใบอนุญาต',
    );
    return '$_temp0';
  }

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
  String get savedMessagesEmptyTitle => 'ไม่มีที่คั่นหน้า';

  @override
  String get savedMessagesEmptyBody =>
      'บุ๊กมาร์กข้อความเพื่อบันทึกไว้อ่านภายหลัง';

  @override
  String get savedMessagesEndBody => 'ไม่มีอะไรให้ดูอีกแล้ว';

  @override
  String get savedMessagesRemoveTooltip => 'ลบบุ๊กมาร์ก';

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
  String get uiSearch => 'ค้นหา';

  @override
  String get uiStartCall => 'เริ่มโทร';

  @override
  String get uiStartVideoCall => 'เริ่มวิดีโอคอล';

  @override
  String get uiPlay => 'เล่น';

  @override
  String get uiPause => 'หยุดชั่วคราว';

  @override
  String get uiDownload => 'ดาวน์โหลด';

  @override
  String get uiMoreActions => 'เพิ่มเติม';

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
    return 'การดำเนินการนี้จะแจ้งเตือนสมาชิก $count คนที่มีบทบาท $roleName ต่อไปไหม';
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
  String get guildNavbarGuildSelected => '(เลือกแล้ว)';

  @override
  String get guildNavbarGuildUnread => 'ยังไม่ได้อ่าน';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count การกล่าวถึง',
      one: 'การกล่าวถึง 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'ปิดเสียง';

  @override
  String get authShowPassword => 'แสดงรหัสผ่าน';

  @override
  String get authHidePassword => 'ซ่อนรหัสผ่าน';

  @override
  String get chatLoadingMessages => 'กำลังโหลดข้อความ';

  @override
  String get friendsMessageFriend => 'ส่งข้อความ';

  @override
  String get friendsFriendActions => 'การดำเนินการของเพื่อน';

  @override
  String get friendsAcceptRequest => 'ตอบรับคำขอเป็นเพื่อน';

  @override
  String get friendsDeclineRequest => 'ปฏิเสธคำขอเป็นเพื่อน';

  @override
  String get friendsCancelRequest => 'ยกเลิกคำขอเป็นเพื่อน';

  @override
  String get friendsOpenInbox => 'กล่องข้อความ';

  @override
  String get profileRemoveFriend => 'ลบเพื่อน';

  @override
  String get profileUnblockUser => 'เลิกบล็อกผู้ใช้';

  @override
  String get profileAcceptFriendRequest => 'ตอบรับคำขอเป็นเพื่อน';

  @override
  String get profileCancelFriendRequest => 'ยกเลิกคำขอเป็นเพื่อน';

  @override
  String get profileSendFriendRequest => 'เพิ่มเพื่อน';

  @override
  String get accountOverflowMenu => 'ตัวเลือกบัญชี';

  @override
  String get navHome => 'หน้าหลัก';

  @override
  String get navNotifications => 'การแจ้งเตือน';

  @override
  String get navYou => 'คุณ';

  @override
  String get guildFolderSettingsTitle => 'การตั้งค่าโฟลเดอร์';

  @override
  String get guildFolderNameLabel => 'ชื่อโฟลเดอร์';

  @override
  String get guildFolderColorLabel => 'สีของโฟลเดอร์';

  @override
  String get guildFolderShowIconWhenCollapsed => 'แสดงไอคอนเมื่อยุบ';

  @override
  String get guildFolderIconLabel => 'ไอคอนโฟลเดอร์';

  @override
  String get guildFolderDelete => 'ลบโฟลเดอร์';

  @override
  String get guildFolderIconFolder => 'โฟลเดอร์';

  @override
  String get guildFolderIconStar => 'ติดดาว';

  @override
  String get guildFolderIconHeart => 'หัวใจ';

  @override
  String get guildFolderIconBookmark => 'บุ๊กมาร์ก';

  @override
  String get guildFolderIconGameController => 'จอยเกม';

  @override
  String get guildFolderIconShield => 'ซ่อน';

  @override
  String get guildFolderIconMusicNote => 'โน้ตเพลง';

  @override
  String get guildFolderMarkAsRead => 'ทำเครื่องหมายโฟลเดอร์ว่าอ่านแล้ว';

  @override
  String get guildBulkMuteCommunities => 'ปิดเสียงคอมมูนิตี้';

  @override
  String get guildBulkUnmuteCommunities => 'เลิกปิดเสียงคอมมูนิตี้';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'การตั้งค่าการแจ้งเตือนของคอมมูนิตี้';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'การตั้งค่าความเป็นส่วนตัวของชุมชน';

  @override
  String get guildBulkAllowEveryoneAndHere => 'อนุญาตให้ @everyone และ @here';

  @override
  String get guildBulkAllowRoleMentions => 'อนุญาตให้กล่าวถึงบทบาท';

  @override
  String get guildBulkEnableMobilePush => 'เปิดการแจ้งเตือนแบบพุชบนมือถือ';

  @override
  String get guildBulkDisableMobilePush => 'ปิดการแจ้งเตือนบนมือถือ';

  @override
  String get guildBulkAllowDirectMessages => 'อนุญาตข้อความโดยตรง';

  @override
  String get guildBulkBlockDirectMessages => 'บล็อกข้อความส่วนตัว';

  @override
  String get guildBulkAllowBotDirectMessages => 'อนุญาตให้บอทส่งข้อความส่วนตัว';

  @override
  String get guildBulkBlockBotDirectMessages => 'บล็อกข้อความส่วนตัวจากบอท';

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
  String get guildNavbarChannelTypeSelection => 'เลือกประเภทช่อง';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'เข้าถึงได้โดยเจ้าหน้าที่ $productName เท่านั้น';
  }

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
  String get guildMenuSettingsEmoji => 'อิโมจิ';

  @override
  String get guildMenuSettingsStickers => 'สติกเกอร์';

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
  String get guildMenuSettingsInviteLinks => 'คำเชิญ';

  @override
  String get guildMenuSettingsBans => 'การแบน';

  @override
  String get guildMenuSettingsChannels => 'ช่อง';

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
  String get guildSettingsRolesNewRole => 'บทบาทใหม่';

  @override
  String get guildSettingsRolesDeleteRole => 'ลบบทบาท';

  @override
  String get guildSettingsRolesBackToRoles => 'กลับไปที่บทบาท';

  @override
  String get guildSettingsBackToSettings => 'กลับไปที่การตั้งค่า';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'แก้ไข \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle => 'ตั้งค่าบทบาทและสิทธิ์';

  @override
  String get guildSettingsRolesDisplaySection => 'การแสดงผล';

  @override
  String get guildSettingsRolesRoleName => 'ชื่อบทบาท';

  @override
  String get guildSettingsRolesRoleColor => 'สีของบทบาท';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'พิมพ์สี (hex, rgb(), hsl() หรือชื่อ) หรือใช้เครื่องมือเลือกสี';

  @override
  String get guildSettingsRolesShowSeparately => 'แสดงบทบาทนี้แยกกัน';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'แสดงสมาชิกที่มีบทบาทนี้ในส่วนของตนเองในรายการสมาชิก';

  @override
  String get guildSettingsRolesAllowMentions =>
      'อนุญาตให้กล่าวถึงสำหรับบทบาทนี้';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'สมาชิกที่มีสิทธิ์ \"$permission\" สามารถกล่าวถึงบทบาทได้เสมอ โดยไม่คำนึงถึงการตั้งค่านี้';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'ใช้ปุ่มนี้เพื่อล้างสิทธิ์ทั้งหมดอย่างรวดเร็ว';

  @override
  String get guildSettingsRolesClearPermissions => 'ล้างสิทธิ์';

  @override
  String get guildSettingsRolesPermissionsSection => 'สิทธิ์';

  @override
  String get guildSettingsRolesSearchPermissions => 'ค้นหาสิทธิ์';

  @override
  String get guildSettingsRolesDenseLayout => 'เลย์เอาต์กะทัดรัด';

  @override
  String get guildSettingsRolesComfyLayout => 'เลย์เอาต์ที่ดูสบายตา';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'เปลี่ยนเป็นเลย์เอาต์แบบกระชับ';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'เปลี่ยนเป็นเลย์เอาต์สบายตา';

  @override
  String get guildSettingsRolesSingleColumn => 'คอลัมน์เดียว';

  @override
  String get guildSettingsRolesTwoColumns => 'สองคอลัมน์';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'เปลี่ยนเป็นคอลัมน์เดียว';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'เปลี่ยนเป็นสองคอลัมน์';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'ไม่พบสิทธิ์';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'ลำดับการแสดงผลแบบกำหนดเอง';

  @override
  String get guildSettingsRolesHoistOrder => 'ลำดับการแสดงแยก';

  @override
  String get guildSettingsRolesResetHoistOrder => 'รีเซ็ตเป็นค่าเริ่มต้น';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'ลากบทบาทเพื่อจัดเรียงลำดับการแสดงในรายการสมาชิก';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'ไม่มีบทบาทที่แสดงแยกกัน เปิดใช้ \"แสดงบทบาทนี้แยกกัน\" ในบทบาทเพื่อดูที่นี่';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'คุณไม่สามารถแก้ไขบทบาทนี้ได้ เนื่องจากเป็นบทบาทสูงสุดของคุณหรือสูงกว่าคุณ';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'คุณต้องมีสิทธิ์ \"$permission\" เพื่อแก้ไขสิทธิ์เหล่านี้';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'คุณไม่สามารถแก้ไขบทบาทที่เท่ากันหรือสูงกว่าบทบาทสูงสุดของคุณได้';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'คุณไม่สามารถให้สิทธิ์ที่คุณไม่มีได้';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'คุณไม่สามารถลบสิทธิ์นี้ได้ เนื่องจากจะเป็นการลบสิทธิ์ออกจากตัวคุณเอง';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'อัปเดตบทบาทแล้ว';

  @override
  String get guildSettingsRolesCreatedSuccess => 'สร้างบทบาทสำเร็จแล้ว';

  @override
  String get guildSettingsRolesDeletedSuccess => 'ลบบทบาทแล้ว';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'ลำดับการแสดงผลกลับเป็นค่าเริ่มต้นแล้ว';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'ต้องระบุชื่อบทบาท';

  @override
  String get guildSettingsRolesNameRequiredBody => 'ตั้งชื่อบทบาทก่อนบันทึก';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'สร้างบทบาทไม่ได้';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'อัปเดตบทบาทไม่ได้';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'ลบบทบาทไม่ได้';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" ลบไม่ได้ ลองอีกครั้ง';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'รีเซ็ตลำดับการจัดกลุ่มไม่สำเร็จ';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'ลองอีกครั้งในอีกสักครู่';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบสิทธิ์ $name สมาชิกทุกคนที่มีสิทธิ์นี้จะไม่มีสิทธิ์อีกต่อไป';
  }

  @override
  String get permissionCategoryCommunityWide => 'ทั้งชุมชน';

  @override
  String get permissionCategoryMessagesMedia => 'ข้อความและสื่อ';

  @override
  String get permissionCategoryModeration => 'การดูแล';

  @override
  String get permissionCategoryChannelAccess => 'การเข้าถึงช่อง';

  @override
  String get permissionCategoryChannelManagement => 'การจัดการช่อง';

  @override
  String get permissionCategoryAudioVideo => 'เสียงและวิดีโอ';

  @override
  String get permissionUnknown => 'สิทธิ์ที่ไม่รู้จัก';

  @override
  String get permissionAdministrator => 'ผู้ดูแลระบบ';

  @override
  String get permissionAdministratorDescription =>
      'ให้สิทธิ์ทั้งหมดและข้ามข้อจำกัดของช่อง มีความละเอียดอ่อนสูง';

  @override
  String get permissionViewActivityLog => 'ดูบันทึกกิจกรรม';

  @override
  String get permissionViewActivityLogDescription =>
      'อ่านบันทึกกิจกรรมของชุมชนเกี่ยวกับการเปลี่ยนแปลงและการดำเนินการดูแล';

  @override
  String get permissionManageCommunity => 'จัดการชุมชน';

  @override
  String get permissionManageCommunityDescription =>
      'แก้ไขการตั้งค่าทั่วไป เช่น ชื่อ, คำอธิบาย และไอคอน';

  @override
  String get permissionManageRoles => 'จัดการบทบาท';

  @override
  String get permissionManageRolesDescription =>
      'สร้าง, แก้ไข หรือลบบทบาทที่ต่ำกว่าบทบาทสูงสุดของคุณ รวมถึงแก้ไขการแทนที่สิทธิ์ช่องได้ด้วย';

  @override
  String get permissionManageChannels => 'จัดการช่อง';

  @override
  String get permissionManageChannel => 'จัดการช่อง';

  @override
  String get permissionManageChannelDescription =>
      'เปลี่ยนชื่อและแก้ไขการตั้งค่าช่องนี้';

  @override
  String get permissionManagePermissions => 'จัดการสิทธิ์';

  @override
  String get permissionManagePermissionsDescription =>
      'แก้ไขการตั้งค่าสำหรับบทบาทและสมาชิกในช่องนี้';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'สร้าง แก้ไข หรือลบ Webhook สำหรับช่องนี้';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'ดูรายชื่อสมาชิกของช่องนี้';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'จัดการลิงก์คำเชิญสำหรับช่องนี้';

  @override
  String get permissionOverwriteDeny => 'ปฏิเสธ';

  @override
  String get permissionOverwriteInherit => 'เป็นกลาง (รับค่ามา)';

  @override
  String get permissionOverwriteAllow => 'อนุญาต';

  @override
  String get permissionOverwriteSetAllHelp =>
      'ใช้ปุ่มเหล่านี้เพื่อตั้งค่าการอนุญาตทั้งหมดอย่างรวดเร็ว';

  @override
  String get permissionManageChannelsDescription =>
      'สร้าง, แก้ไข หรือลบช่องและหมวดหมู่';

  @override
  String get permissionKickMembers => 'เตะสมาชิกออก';

  @override
  String get permissionBanMembers => 'แบนสมาชิก';

  @override
  String get permissionCreateInviteLinks => 'สร้างลิงก์เชิญ';

  @override
  String get permissionChangeOwnNickname => 'เปลี่ยนชื่อเล่นของตัวเอง';

  @override
  String get permissionChangeOwnNicknameDescription => 'อัปเดตชื่อเล่นของคุณ';

  @override
  String get permissionManageNicknames => 'จัดการชื่อเล่น';

  @override
  String get permissionManageNicknamesDescription =>
      'เปลี่ยนชื่อเล่นของสมาชิกคนอื่น';

  @override
  String get permissionCreateEmojiStickers => 'สร้างอิโมจิและสติกเกอร์';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'อัปโหลดอิโมจิและสติกเกอร์ใหม่ รวมถึงจัดการผลงานของคุณเอง';

  @override
  String get permissionManageEmojiStickers => 'จัดการอิโมจิและสติกเกอร์';

  @override
  String get permissionManageEmojiStickersDescription =>
      'แก้ไขหรือลบอิโมจิและสติกเกอร์ที่สมาชิกคนอื่นสร้างไว้';

  @override
  String get permissionManageWebhooks => 'จัดการเว็บฮุก';

  @override
  String get permissionManageWebhooksDescription =>
      'สร้าง, แก้ไข หรือลบ Webhook';

  @override
  String get permissionSendMessages => 'ส่งข้อความ';

  @override
  String get permissionSendTtsMessages => 'ส่งข้อความ TTS';

  @override
  String get permissionSendTtsMessagesDescription => 'ส่งข้อความเสียงพูด';

  @override
  String get permissionManageMessages => 'จัดการข้อความ';

  @override
  String get permissionManageMessagesDescription =>
      'ลบข้อความของสมาชิกคนอื่นได้ การปักหมุดข้อความจะถูกควบคุมแยกต่างหาก';

  @override
  String get permissionPinMessages => 'ปักหมุดข้อความ';

  @override
  String get permissionEmbedLinks => 'ฝังลิงก์';

  @override
  String get permissionAttachFiles => 'แนบไฟล์';

  @override
  String get permissionMentionEveryone => 'ใช้ @everyone/@here และ @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'กล่าวถึงทุกคนหรือบทบาทใดก็ได้ (แม้ว่าจะไม่ได้ตั้งค่าให้กล่าวถึงบทบาทนั้นได้)';

  @override
  String get permissionUseExternalEmoji => 'ใช้ภาพอิโมจิภายนอก';

  @override
  String get permissionUseExternalEmojiDescription =>
      'ใช้อีโมจิจากคอมมูนิตี้อื่น';

  @override
  String get permissionUseExternalStickers => 'ใช้สติกเกอร์จากภายนอก';

  @override
  String get permissionAddReactions => 'เพิ่มการแสดงความรู้สึก';

  @override
  String get permissionAddReactionsDescription =>
      'เพิ่มรีแอ็กชันใหม่ให้ข้อความ';

  @override
  String get permissionBypassSlowmode => 'ข้ามโหมดหน่วงเวลา';

  @override
  String get permissionBypassSlowmodeDescription =>
      'ไม่สนใจการจำกัดอัตราข้อความต่อช่อง';

  @override
  String get permissionTimeOutMembers => 'พักการใช้งานสมาชิกชั่วคราว';

  @override
  String get permissionTimeOutMembersDescription =>
      'ป้องกันสมาชิกจากการส่งข้อความ, การโต้ตอบ และการเข้าร่วมการโทรด้วยเสียงตามระยะเวลาที่กำหนด';

  @override
  String get permissionViewChannel => 'ดูช่อง';

  @override
  String get permissionViewChannelMembers => 'ดูสมาชิกช่อง';

  @override
  String get permissionViewChannelMembersDescription =>
      'ดูรายชื่อสมาชิกของช่องต่างๆ ในคอมมูนิตี้นี้';

  @override
  String get permissionConnect => 'เชื่อมต่อ';

  @override
  String get permissionSpeak => 'พูด';

  @override
  String get permissionStreamVideo => 'สตรีมวิดีโอ';

  @override
  String get permissionUseVoiceActivity => 'ใช้การตรวจจับเสียงพูด';

  @override
  String get permissionUseVoiceActivityDescription =>
      'หากไม่มีสิทธิ์นี้ จะต้องใช้การกดเพื่อพูด';

  @override
  String get permissionPrioritySpeaker => 'ผู้พูดคนสำคัญ';

  @override
  String get permissionMuteMembers => 'ปิดเสียงสมาชิก';

  @override
  String get permissionDeafenMembers => 'ปิดเสียงสมาชิก';

  @override
  String get permissionMoveMembers => 'ย้ายสมาชิก';

  @override
  String get permissionMoveMembersDescription =>
      'ลากสมาชิกไปยังช่องอื่นที่พวกเขาสามารถเข้าถึงได้';

  @override
  String get permissionSetVoiceRegion => 'ตั้งค่าภูมิภาคเสียง';

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
      'ดูและจัดการ Webhook ทั้งหมดที่ตั้งค่าไว้ในคอมมูนิตี้ของคุณ';

  @override
  String get guildSettingsWebhooksEmpty => 'ไม่มี Webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'ชุมชนนี้ยังไม่มีเว็บฮุคเลย ไปที่ $channelSettingsPath เพื่อสร้างเว็บฮุค';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'คุณต้องมีสิทธิ์ \"$permission\" เพื่อดูและแก้ไขเว็บฮุกสำหรับชุมชนนี้';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'โหลดเว็บฮุกไม่สำเร็จ';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลดเว็บฮุก ลองอีกครั้ง';

  @override
  String get guildSettingsWebhooksUpdated => 'อัปเดต Webhook แล้ว';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'อัปเดตเว็บฮุกล้มเหลว';

  @override
  String get guildSettingsUnknownChannel => 'ช่องทางไม่ทราบชื่อ';

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
      'แสดงคอมมูนิตี้ของคุณในหน้าค้นหา เพื่อให้คนอื่นหาเจอและเข้าร่วมได้';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'สมาชิกไม่พอ';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'ชุมชนของคุณต้องมีสมาชิกอย่างน้อย $count คนก่อนจึงจะสามารถแสดงใน Discovery ได้';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'สถานะ:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'รอดำเนินการ';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'อนุมัติแล้ว';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'ถูกปฏิเสธ';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'นำออกแล้ว';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'เหตุผล: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'คอมมูนิตี้ของคุณอยู่ในส่วนแนะนำแล้ว คุณสามารถอัปเดตรายละเอียดด้านล่าง หรือจะถอนออกก็ได้';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'ใบสมัครของคุณอยู่ระหว่างการตรวจสอบ คุณยังสามารถอัปเดตรายละเอียดประกาศหรือถอนใบสมัครได้';

  @override
  String get guildSettingsDiscoveryCategory => 'หมวดหมู่';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'เลือกหมวดหมู่ที่ตรงกับคอมมูนิตี้ของคุณมากที่สุด เปลี่ยนได้ทุกเมื่อ';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'ภาษาหลัก';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'ภาษาที่คนส่วนใหญ่ในคอมมูนิตี้ของคุณใช้ ใช้เพื่อกรองผลการค้นหาในหน้าสำรวจ';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'คำอธิบาย';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'อธิบายเกี่ยวกับคอมมูนิตี้ของคุณ';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'ต้องระบุคำอธิบาย';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'คำอธิบายต้องมีความยาวอย่างน้อย $minLength ตัวอักษร';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'คำอธิบายต้องไม่เกิน $maxLength ตัวอักษร';
  }

  @override
  String get guildSettingsDiscoveryTags => 'แท็กที่กำหนดเอง';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'แท็กสูงสุด $maxTags แท็กจะช่วยให้ผู้คนค้นหาชุมชนของคุณได้ แท็กเหล่านี้จะแสดงในการค้นหาของ Discovery';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'เพิ่มแท็กแล้วกด Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'เพิ่ม';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'ลบแท็ก $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'เพิ่มแท็กไม่ได้';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'แท็กต้องมีความยาว 2 ถึง $maxLength ตัวอักษร และเป็นตัวอักษรหรือตัวเลขเท่านั้น';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'คุณสามารถเพิ่มแท็กได้สูงสุด $maxTags แท็กเท่านั้น';
  }

  @override
  String get guildSettingsDiscoveryApply => 'ใช้';

  @override
  String get guildSettingsDiscoverySave => 'บันทึก';

  @override
  String get guildSettingsDiscoveryWithdraw => 'ถอน';

  @override
  String get guildSettingsDiscoveryApplicationSent => 'ส่งคำขอค้นพบแล้ว';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'อัปเดตรายการแนะนำแล้ว';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'ยกเลิกการสมัครเข้าร่วมแล้ว';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => 'ถอนใบสมัครไม่ได้';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'ลองอีกครั้งในอีกสักครู่';

  @override
  String get guildSettingsMembersDescription =>
      'ค้นหาและจัดการสมาชิกเซิร์ฟเวอร์';

  @override
  String get guildSettingsMembersSearchHint => 'ค้นหาด้วยชื่อผู้ใช้หรือ ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return 'สมาชิก $count คน';
  }

  @override
  String get guildMembersRecentTitle => 'สมาชิกเมื่อเร็วๆ นี้';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'แสดงสมาชิก $displayedCount จากทั้งหมด $totalCount คน';
  }

  @override
  String get guildMembersSort => 'จัดเรียง';

  @override
  String get guildSettingsMembersSortNewest => 'ใหม่ล่าสุดก่อน';

  @override
  String get guildMembersSortOldest => 'เก่าสุดขึ้นก่อน';

  @override
  String get guildMembersColumnName => 'ชื่อ';

  @override
  String get guildMembersColumnMemberSince => 'เป็นสมาชิกเมื่อ';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'เข้าร่วม $productName เมื่อ';
  }

  @override
  String get guildMembersColumnJoinMethod => 'วิธีเข้าร่วม';

  @override
  String get guildMembersColumnRoles => 'บทบาท';

  @override
  String get guildMembersColumnActions => 'การดำเนินการ';

  @override
  String get guildMembersFilterMemberSince => 'กรองตามวันที่เป็นสมาชิก';

  @override
  String get guildMembersFilterJoinedProduct => 'กรองตามวันที่สร้างบัญชี';

  @override
  String get guildMembersFilterJoinMethod => 'กรองตามวิธีเข้าร่วม';

  @override
  String get guildMembersFilterRoles => 'กรองตามบทบาท';

  @override
  String get guildMembersFilterAll => 'ทั้งหมด';

  @override
  String get guildMembersFilterPast1Hour => '1 ชั่วโมงที่ผ่านมา';

  @override
  String get guildMembersFilterPast24Hours => '24 ชั่วโมงที่ผ่านมา';

  @override
  String get guildMembersFilterPast7Days => '7 วันที่ผ่านมา';

  @override
  String get guildMembersFilterPast2Weeks => '2 สัปดาห์ที่ผ่านมา';

  @override
  String get guildMembersFilterPast3Weeks => '3 สัปดาห์ที่ผ่านมา';

  @override
  String get guildMembersFilterPast4Weeks => '4 สัปดาห์ที่ผ่านมา';

  @override
  String get guildMembersFilterPast3Months => '3 เดือนที่ผ่านมา';

  @override
  String get guildMembersFilterCustomRange => 'กำหนดช่วงเอง...';

  @override
  String get guildMembersDateRangeTitle => 'กำหนดช่วงวันที่เอง';

  @override
  String get guildMembersDateAfter => 'หลังวันที่';

  @override
  String get guildMembersDateBefore => 'ก่อนวันที่';

  @override
  String get guildMembersClearAll => 'ล้างทั้งหมด';

  @override
  String get guildMembersRowsPerPage => 'จำนวนแถวต่อหน้า';

  @override
  String get guildMembersEmptySearch => 'ไม่มีใครตรงกับการค้นหานั้น';

  @override
  String get guildMembersLoadError =>
      'มีบางอย่างผิดพลาดในการโหลดสมาชิก โปรดลองอีกครั้งในภายหลัง';

  @override
  String get guildMembersIndexing => 'กำลังจัดทำดัชนีสมาชิก…';

  @override
  String get guildMembersGoToPage => 'ไปที่หน้า';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'ไปที่หน้า $page';
  }

  @override
  String get guildMembersJumpToPage => 'ข้ามไปที่หน้า';

  @override
  String get guildMembersJoinSourceCreator => 'ผู้สร้างคอมมูนิตี้';

  @override
  String get guildMembersJoinSourceInvite => 'เชิญ';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'เชิญ ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'ได้รับเชิญจาก $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL เฉพาะ';

  @override
  String get guildMembersJoinSourceBotInvite => 'เชิญบอท';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'ผู้ดูแลแพลตฟอร์ม';

  @override
  String get guildMembersJoinSourceDiscovery => 'การค้นพบ';

  @override
  String get guildMembersJoinMethodUnknown => 'ไม่ทราบ';

  @override
  String get guildMembersCommunityOwner => 'เจ้าของคอมมูนิตี้';

  @override
  String get guildMembersViewAllRoles => 'ดูบทบาททั้งหมด';

  @override
  String get guildMembersJoinedJustNow => 'เมื่อสักครู่';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count นาทีที่แล้ว',
      one: '1 นาทีที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชั่วโมงที่แล้ว',
      one: '1 ชั่วโมงที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วันที่แล้ว',
      one: 'เมื่อวานนี้',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'สมาชิก';

  @override
  String get guildMembersChannelListSelected => 'สมาชิกที่เลือก';

  @override
  String get guildSettingsInvitesTitle => 'คำเชิญ';

  @override
  String get guildSettingsInvitesDescription =>
      'ดูคำเชิญทั้งหมดสำหรับชุมชนนี้ หากต้องการสร้างคำเชิญใหม่ ให้ไปที่ช่องและใช้ปุ่มเชิญ';

  @override
  String get guildSettingsInvitesEmpty => 'ไม่มีลิงก์เชิญ';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'คอมมูนิตี้นี้ยังไม่มีลิงก์เชิญ ไปที่ช่องแล้วสร้างลิงก์เชิญเพื่อเชิญผู้คน';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'โหลดคำเชิญไม่สำเร็จ';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลดคำเชิญ โปรดลองอีกครั้ง';

  @override
  String get guildSettingsInvitesTryAgain => 'ลองอีกครั้ง';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'แสดงวันที่สร้างแทนวันหมดอายุ';

  @override
  String get guildSettingsInvitesPauseInvites => 'พักการเชิญ';

  @override
  String get guildSettingsInvitesEnableInvites => 'เปิดใช้งานคำเชิญ';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'หยุดเชิญสำหรับคอมมูนิตี้นี้ชั่วคราว';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'เปิดใช้งานคำเชิญสำหรับคอมมูนิตี้นี้';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'หยุดรับคำเชิญชั่วคราว? ผู้ใช้ใหม่จะไม่สามารถเข้าร่วมผ่านลิงก์คำเชิญได้จนกว่าคุณจะเปิดใช้งานอีกครั้ง สมาชิกปัจจุบันจะไม่ได้รับผลกระทบ';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'เปิดใช้งานคำเชิญใช่ไหม ผู้ใช้จะสามารถเข้าร่วมคอมมูนิตี้นี้ผ่านลิงก์คำเชิญได้อีกครั้ง';

  @override
  String get guildSettingsInvitesPause => 'หยุดชั่วคราว';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'ปิดรับคำเชิญสำหรับคอมมูนิตี้นี้ชั่วคราว';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'คำเชิญถูกหยุดชั่วคราวเนื่องจาก $productName ตรวจพบการโจมตีที่อาจเกิดขึ้น ผู้ใช้ใหม่ไม่สามารถเข้าร่วมได้ในขณะนี้';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'ผู้เชิญ:';

  @override
  String get guildSettingsInvitesLabelChannel => 'ช่อง:';

  @override
  String get guildSettingsInvitesLabelCode => 'รหัส:';

  @override
  String get guildSettingsInvitesLabelUses => 'ใช้:';

  @override
  String get guildSettingsInvitesLabelCreated => 'สร้างเมื่อ:';

  @override
  String get guildSettingsInvitesLabelExpires => 'หมดอายุ:';

  @override
  String get guildSettingsInvitesUnknown => 'ไม่ทราบ';

  @override
  String get guildSettingsInvitesNoCategory => 'ไม่มีหมวดหมู่';

  @override
  String get guildSettingsInvitesExpired => 'หมดอายุ';

  @override
  String get guildSettingsInvitesNever => 'ไม่เลย';

  @override
  String get guildSettingsInvitesCopyLink => 'คัดลอกลิงก์เชิญ';

  @override
  String get guildSettingsInvitesRevoke => 'ยกเลิกคำเชิญ';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'ยกเลิกคำเชิญไม่ได้';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'ลิงก์อาจยังใช้งานได้ ลองอีกครั้งในภายหลัง';

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
  String get guildSettingsEmojiSlotsTitle => 'ช่องอิโมจิ';

  @override
  String get guildSettingsEmojiDropZone => 'ลากและวางไฟล์อิโมจิที่นี่';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'โหลดอิโมจิไม่สำเร็จ ลองอีกครั้งในภายหลัง';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'ไม่พบอิโมจิที่ตรงกับการค้นหาของคุณ';

  @override
  String get guildSettingsEmojiNoSlots => 'ไม่มีช่องใส่อีโมจิว่าง';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'คุณใช้จำนวนอีโมจิสูงสุดแล้ว ลบอีโมจิที่มีอยู่บางส่วนเพื่อเพิ่มพื้นที่ว่าง';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'ชื่ออีโมจิควรมีอย่างน้อย 2 ตัวอักษร และสามารถใช้ตัวอักษร ตัวเลข และขีดล่างได้ อีโมจิจะต้องมีขนาดไม่เกิน $maxSize ภาพนิ่งจะถูกปรับขนาดเป็น 128x128 พิกเซลและบีบอัดโดยอัตโนมัติ ภาพเคลื่อนไหวและ SVG จะต้องมีขนาดตามที่กำหนด';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'กำลังอัปโหลดอิโมจิ';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# อิโมจิ',
      one: '# อิโมจิ',
    );
    return 'กำลังอัปโหลด $_temp0 อาจใช้เวลาสักครู่';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'อัปโหลดอิโมจิไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get guildSettingsEmojiSomeFailedTitle => 'เพิ่มอิโมจิบางรายการไม่ได้';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'ตรวจสอบไฟล์เหล่านี้แล้วลองอีกครั้งด้วยรูปภาพที่เล็กลงหรือเรียบง่ายขึ้น';

  @override
  String get guildSettingsEmojiRenameTitle => 'เปลี่ยนชื่ออิโมจิ';

  @override
  String get guildSettingsEmojiRenameHint => '2-32 ตัวอักษร, ตัวเลข, ขีดล่าง';

  @override
  String get guildSettingsEmojiColumnEmoji => 'อิโมจิ';

  @override
  String get guildSettingsEmojiColumnName => 'ชื่อ';

  @override
  String get guildSettingsEmojiColumnUploader => 'อัปโหลดโดย';

  @override
  String get guildSettingsEmojiUnknownUploader => 'ไม่ทราบ';

  @override
  String get guildSettingsEmojiDeleteTitle => 'ลบอิโมจิ';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'ลบ :$name:? การดำเนินการนี้ไม่สามารถยกเลิกได้';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'ลบอิโมจินี้ออกจากที่จัดเก็บและ CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'ชื่ออิโมจิควรมีความยาวอย่างน้อย 2 ตัวอักษร';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'ชื่ออิโมจิมีความยาวได้สูงสุด 32 ตัวอักษร';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'ชื่ออิโมจิไม่ถูกต้อง';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'เปลี่ยนชื่ออิโมจินี้ไม่ได้';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'ชื่อถูกเปลี่ยนกลับเป็นชื่อเดิม โปรดลองอีกครั้งในภายหลัง';

  @override
  String get guildSettingsEmojiGoneTitle => 'อิโมจินี้ไม่มีแล้ว';

  @override
  String get guildSettingsEmojiGoneBody =>
      'อิโมจิอาจถูกลบไปแล้ว ชื่อจึงเปลี่ยนกลับไปเป็นชื่อเดิม';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'คุณไม่สามารถเปลี่ยนชื่ออิโมจินี้ได้';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'คุณไม่มีสิทธิ์เปลี่ยนชื่ออีโมจินี้ ชื่อจึงถูกเปลี่ยนกลับเป็นชื่อเดิม';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'คุณทำเร็วเกินไป';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'โปรดรอสักครู่แล้วลองเปลี่ยนชื่ออีกครั้ง';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => 'ไม่สามารถลบอิโมจินี้ได้';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'คุณไม่สามารถลบอิโมจินี้ได้';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'อนุญาตให้ผู้อื่นโคลนอิโมจิของคุณได้';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'เมื่อเปิดใช้งาน สมาชิกของชุมชนอื่นจะสามารถใช้ปุ่ม \"คัดลอก\" ในแอปเพื่อคัดลอกอิโมจิที่คุณกำหนดเองได้ทันที อย่างไรก็ตาม การตั้งค่านี้ไม่ได้ป้องกันไม่ให้พวกเขาบันทึกรูปภาพและอัปโหลดด้วยตนเอง';

  @override
  String get guildSettingsCloneStickerTitle =>
      'อนุญาตให้ผู้อื่นคัดลอกสติกเกอร์ของคุณได้';

  @override
  String get guildSettingsCloneStickerDescription =>
      'เมื่อเปิดใช้งาน สมาชิกของชุมชนอื่นจะสามารถใช้ทางลัด \"โคลน\" ในแอปเพื่อคัดลอกสติกเกอร์ที่คุณกำหนดเองได้ การดำเนินการนี้ไม่ได้ป้องกันไม่ให้พวกเขาบันทึกรูปภาพและอัปโหลดด้วยตนเอง';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'เฉพาะสมาชิกที่มีสิทธิ์ \"$permission\" เท่านั้นที่สามารถเปลี่ยนแปลงสิ่งนี้ได้';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed => 'อัปเดตการโคลนอิโมจิไม่ได้';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'อัปเดตการโคลนสติกเกอร์ไม่ได้';

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
  String get guildSettingsStickerSlotsTitle => 'ช่องสติกเกอร์';

  @override
  String get guildSettingsStickerUploadTitle => 'อัปโหลดสติกเกอร์';

  @override
  String get guildSettingsStickerDropZone =>
      'ลากและวางไฟล์สติกเกอร์ที่นี่ (ครั้งละหนึ่งไฟล์)';

  @override
  String get guildSettingsStickerDensity => 'ความหนาแน่นของสติกเกอร์';

  @override
  String get guildSettingsStickerDensityCozy => 'อบอุ่น';

  @override
  String get guildSettingsStickerDensityCompact => 'กะทัดรัด';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'โหลดสติกเกอร์ไม่สำเร็จ';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'เกิดข้อผิดพลาดในการโหลดสติกเกอร์ โปรดลองอีกครั้ง';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'ไม่พบสติกเกอร์ที่ตรงกับการค้นหาของคุณ';

  @override
  String get guildSettingsStickersEmptySearch => 'ไม่พบสติกเกอร์';

  @override
  String get guildSettingsStickerNoSlots => 'ไม่มีช่องสติกเกอร์ว่าง';

  @override
  String get guildSettingsStickerSlotsFull =>
      'คุณใช้สติกเกอร์ครบตามจำนวนสูงสุดแล้ว ลบสติกเกอร์บางส่วนออกเพื่อเพิ่มพื้นที่';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'สติกเกอร์จะถูกบันทึกที่ 320x320 พิกเซล และต้องมีขนาดไม่เกิน $maxSize ภาพนิ่งจะถูกปรับขนาดและบีบอัดโดยอัตโนมัติ ภาพเคลื่อนไหวและ SVG จะต้องมีขนาดตามที่กำหนด';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => 'ไฟล์สติกเกอร์ไม่รองรับ';

  @override
  String get guildSettingsStickerAddTitle => 'เพิ่มสติกเกอร์';

  @override
  String get guildSettingsStickerEditTitle => 'แก้ไขสติกเกอร์';

  @override
  String get guildSettingsStickerNameLabel => 'ชื่อ';

  @override
  String get guildSettingsStickerNameHint => 'สติกเกอร์สุดเจ๋งของฉัน';

  @override
  String get guildSettingsStickerDescriptionLabel => 'คำอธิบาย';

  @override
  String get guildSettingsStickerDescriptionHint => 'อธิบายสติกเกอร์';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'แท็ก ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'เพิ่มแท็ก';

  @override
  String get guildSettingsStickerTagAdd => 'เพิ่ม';

  @override
  String get guildSettingsStickerNameRequired => 'ต้องระบุชื่อ';

  @override
  String get guildSettingsStickerNameTooShort =>
      'ชื่อต้องมีอย่างน้อย 2 ตัวอักษร';

  @override
  String get guildSettingsStickerNameTooLong =>
      'ชื่อต้องมีความยาวไม่เกิน 30 ตัวอักษร';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'คำอธิบายต้องมีความยาวไม่เกิน 500 ตัวอักษร';

  @override
  String get guildSettingsStickerCreateFailedTitle => 'สร้างสติกเกอร์นี้ไม่ได้';

  @override
  String get guildSettingsStickerTooLargeTitle => 'สติกเกอร์มีขนาดใหญ่เกินไป';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'บีบอัดสติกเกอร์ไม่สำเร็จ';

  @override
  String get guildSettingsStickerDeleteTitle => 'ลบสติกเกอร์';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'ลบ \"$name\" หรือไม่? การดำเนินการนี้ไม่สามารถย้อนกลับได้';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'ลบสติกเกอร์นี้ออกจากที่เก็บและ CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'ไม่สามารถลบสติกเกอร์นี้ได้';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'คุณไม่สามารถลบสติกเกอร์นี้ได้';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'หากต้องการสร้างเว็ةฮุค ให้เปิดที่ $channelSettingsPath คุณยังสามารถแก้ไขและจัดระเบียบเว็ะฮุคที่มีอยู่ทั้งหมดได้ที่นี่';
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
  String get guildSettingsInvitesTableExpires => 'หมดอายุ';

  @override
  String get guildSettingsAuditLogFilterUser => 'กรองตามผู้ใช้';

  @override
  String get guildSettingsAuditLogFilterAction => 'กรองตามการดำเนินการ';

  @override
  String get createDm => 'สร้างแชท';

  @override
  String get createGroupDm => 'สร้างกลุ่มแชท';

  @override
  String get createDmNewMessage => 'ข้อความใหม่';

  @override
  String get createDmSelectFriends => 'เลือกเพื่อน';

  @override
  String get createDmChooseFriendsSubtitle => 'เลือกเพื่อนเพื่อส่งข้อความ';

  @override
  String get createDmSearchFriends => 'ค้นหาเพื่อน';

  @override
  String get createDmNoFriendsFound => 'ไม่พบเพื่อน';

  @override
  String get createDmNoFriendsYet => 'คุณยังไม่มีเพื่อน';

  @override
  String get createDmClaimToStartDms =>
      'ยืนยันบัญชีของคุณเพื่อเริ่มส่งข้อความส่วนตัว';

  @override
  String get createDmVerifyToStartDms =>
      'ยืนยันอีเมลของคุณเพื่อเริ่มส่งข้อความส่วนตัว';

  @override
  String get createDmVerifyYourEmail => 'ยืนยันอีเมลของคุณ';

  @override
  String get createDmNewGroup => 'สร้างกลุ่มใหม่';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'สร้างกลุ่มใหม่กับ $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'ยืนยันสร้างกลุ่มใหม่';

  @override
  String get createDmCreateNewGroup => 'สร้างกลุ่มใหม่';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'ลบ $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'คุณมีกลุ่มที่มีผู้ใช้เหล่านี้อยู่แล้ว ต้องการสร้างกลุ่มใหม่อีกกลุ่มใช่ไหม ทำได้เลย!';

  @override
  String get createDmNoActivityYet => 'ยังไม่มีกิจกรรม';

  @override
  String get createDmSomeUsersCantBeAdded => 'เพิ่มผู้ใช้บางคนไม่ได้';

  @override
  String get createDmCreateWithoutThem => 'สร้างโดยไม่มีพวกเขา';

  @override
  String get createDmUnaddableIntro =>
      'ไม่สามารถเพิ่มบุคคลเหล่านี้เข้าสู่กลุ่ม DM นี้ได้:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'สร้าง DM กลุ่มกับผู้รับที่เหลืออีก $count คน และข้ามคนอื่นไปหรือไม่';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'ไม่มีผู้รับที่เหลือให้สร้างกลุ่ม DM ด้วย';

  @override
  String get createDmUnaddableUserNotFound => 'ไม่พบผู้ใช้';

  @override
  String get createDmUnaddableBlocked =>
      'คุณไม่สามารถส่งข้อความถึงผู้ใช้นี้ได้';

  @override
  String get createDmUnaddableNotFriends => 'ไม่ได้อยู่ในรายชื่อเพื่อนของคุณ';

  @override
  String get createDmUnaddableGroupDisabled => 'เพิ่มเข้ากลุ่มแชทไม่ได้';

  @override
  String get createDmFailed => 'ไม่สามารถสร้างการสนทนาได้ ลองอีกครั้ง';

  @override
  String get dmListMessagesTitle => 'ข้อความ';

  @override
  String get dmListDirectMessagesTitle => 'ข้อความส่วนตัว';

  @override
  String get keybindsSearchShortcuts => 'ค้นหาปุ่มลัด';

  @override
  String get keybindSectionDefaults => 'ค่าเริ่มต้น';

  @override
  String get keybindSectionMessages => 'ข้อความ';

  @override
  String get keybindSectionNavigation => 'การนำทาง';

  @override
  String get keybindSectionDragAndDrop => 'ลากและวาง';

  @override
  String get keybindSectionChat => 'แชท';

  @override
  String get keybindSectionVoiceAndVideo => 'เสียงและวิดีโอ';

  @override
  String get keybindSectionMisc => 'เบ็ดเตล็ด';

  @override
  String get keybindActionShowShortcutsList => 'แสดงรายการแป้นพิมพ์ลัด';

  @override
  String get keybindActionCopyText => 'คัดลอกข้อความ';

  @override
  String get keybindActionMarkUnread => 'ทำเครื่องหมายว่ายังไม่ได้อ่าน';

  @override
  String get keybindActionFocusTextarea => 'โฟกัสช่องข้อความ';

  @override
  String get keybindActionSwitchCommunities => 'สลับคอมมูนิตี้';

  @override
  String get keybindActionSwitchChannels => 'สลับช่อง';

  @override
  String get keybindActionHistoryBack => 'ย้อนดูประวัติช่องที่เคยเปิด';

  @override
  String get keybindActionHistoryForward =>
      'เลื่อนไปข้างหน้าในประวัติช่องที่ดูแล้ว';

  @override
  String get keybindActionJumpUnreadChannels => 'ข้ามไปยังช่องที่ยังไม่ได้อ่าน';

  @override
  String get keybindActionJumpMentionChannels =>
      'ข้ามไปมาระหว่างช่องที่ยังไม่ได้อ่านที่มีการกล่าวถึง';

  @override
  String get keybindActionJumpCurrentCall => 'ข้ามไปที่การโทรปัจจุบัน';

  @override
  String get keybindActionToggleLastGuildDms =>
      'สลับระหว่างคอมมูนิตี้ล่าสุดและข้อความส่วนตัว';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'สลับไปคอมมูนิตี้หรือแชทส่วนตัวก่อนหน้า';

  @override
  String get keybindActionNextCommunityOrDms =>
      'สลับไปคอมมูนิตี้หรือแชทส่วนตัวถัดไป';

  @override
  String get keybindActionGoToDms => 'ไปที่ข้อความส่วนตัว';

  @override
  String get keybindActionGoToFirstCommunity => 'ไปที่คอมมูนิตี้แรก';

  @override
  String get keybindActionGoToSecondCommunity => 'ไปที่ชุมชนที่สอง';

  @override
  String get keybindActionGoToThirdCommunity => 'ไปที่ชุมชนที่สาม';

  @override
  String get keybindActionGoToFourthCommunity => 'ไปที่ชุมชนที่สี่';

  @override
  String get keybindActionGoToFifthCommunity => 'ไปที่ชุมชนที่ห้า';

  @override
  String get keybindActionGoToSixthCommunity => 'ไปที่ชุมชนที่ 6';

  @override
  String get keybindActionGoToSeventhCommunity => 'ไปที่ชุมชนที่เจ็ด';

  @override
  String get keybindActionGoToEighthCommunity => 'ไปที่ชุมชนที่แปด';

  @override
  String get keybindActionToggleQuickSwitcher => 'สลับหน้าต่างด่วน';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'สร้างหรือเข้าร่วมคอมมูนิตี้';

  @override
  String get keybindActionStartDragAndDrop => 'เริ่มลากและวาง';

  @override
  String get keybindActionMove => 'ย้าย';

  @override
  String get keybindActionDropItem => 'วางไอเทม';

  @override
  String get keybindActionCancel => 'ยกเลิก';

  @override
  String get keybindActionMarkCommunityRead =>
      'ทำเครื่องหมายคอมมูนิตี้ว่าอ่านแล้ว';

  @override
  String get keybindActionMarkChannelRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get keybindActionStartGroupDm => 'เริ่มแชทกลุ่ม';

  @override
  String get keybindActionTogglePinnedMessages => 'สลับข้อความปักหมุด';

  @override
  String get keybindActionToggleInbox => 'สลับกล่องข้อความ';

  @override
  String get keybindActionMarkTopInboxRead =>
      'ทำเครื่องหมายช่องในกล่องขาเข้าด้านบนว่าอ่านแล้ว';

  @override
  String get keybindActionMarkAllInboxRead => 'ทำเครื่องหมายว่าอ่านแล้วทั้งหมด';

  @override
  String get keybindActionToggleMemberList => 'สลับรายการสมาชิกหรือแชทเสียง';

  @override
  String get keybindActionToggleEmojiPicker => 'สลับตัวเลือกอิโมจิ';

  @override
  String get keybindActionToggleGifPicker => 'สลับตัวเลือก GIF';

  @override
  String get keybindActionToggleStickerPicker => 'สลับตัวเลือกสติกเกอร์';

  @override
  String get keybindActionScrollChatUp => 'เลื่อนแชทขึ้น';

  @override
  String get keybindActionScrollChatDown => 'เลื่อนแชทลง';

  @override
  String get keybindActionJumpOldestUnread =>
      'ข้ามไปยังข้อความที่ยังไม่ได้อ่านเก่าสุด';

  @override
  String get keybindActionFocusComposer => 'โฟกัสช่องข้อความ';

  @override
  String get keybindActionUploadFile => 'อัปโหลดไฟล์';

  @override
  String get keybindActionCopyChannelLink => 'คัดลอกลิงก์ช่อง';

  @override
  String get keybindActionToggleSavedMedia => 'สลับสื่อที่บันทึกไว้';

  @override
  String get keybindActionSendVoiceMessage => 'ส่งข้อความเสียง';

  @override
  String get keybindActionAnswerCall => 'รับสายเรียกเข้า';

  @override
  String get keybindActionDeclineCall => 'ปฏิเสธสายเรียกเข้า';

  @override
  String get keybindActionStartDmCall => 'เริ่มการโทรในแชทส่วนตัวหรือกลุ่ม';

  @override
  String get keybindActionToggleSoundboard => 'เปิด/ปิดซาวด์บอร์ด';

  @override
  String get keybindActionToggleCompactCallView =>
      'ขยายหรือยุบมุมมองการโทรแบบกะทัดรัด';

  @override
  String get keybindActionPushToTalkPriority => 'กดเพื่อพูด (สำคัญ)';

  @override
  String get keybindActionVoiceActivityPriority => 'จัดลำดับความสำคัญของเสียง';

  @override
  String get keybindActionOpenHelp => 'เปิดวิธีใช้';

  @override
  String get keybindActionSearchMessages => 'ค้นหาข้อความ';

  @override
  String get keybindActionOpenContextMenu => 'เปิดเมนูตัวเลือก';

  @override
  String get keybindActionOpenSettings => 'เปิดการตั้งค่า';

  @override
  String get keybindActionOpenThemeStudio =>
      'เปิดสตูดิโอธีมในหน้าต่างป๊อปเอาต์';

  @override
  String get keybindActionZoomIn => 'ซูมเข้า';

  @override
  String get keybindActionZoomOut => 'ย่อ';

  @override
  String get keybindActionZoomReset => 'รีเซ็ตการซูม';

  @override
  String get clipboardPasteFailed =>
      'วางไม่ได้ คลิปบอร์ดว่างเปล่า หรือแอปนี้ไม่ได้รับอนุญาตให้เข้าถึง';

  @override
  String get homeQuickActionDms => 'ข้อความส่วนตัว';
}
