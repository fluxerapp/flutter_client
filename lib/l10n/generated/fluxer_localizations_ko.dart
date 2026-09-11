// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class FluxerLocalizationsKo extends FluxerLocalizations {
  FluxerLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get reconnectingTitle => '서버에 문제가 생겼어요!';

  @override
  String get reconnectingBody => '인스턴스에 문제가 발생했습니다.\n곧 해결될 것입니다!';

  @override
  String get gatewayReconnectingToast => '재연결 중…';

  @override
  String get gatewayConnectedToast => '연결됨';

  @override
  String get sessionExpiredToast => '세션이 만료되었습니다. 다시 로그인해 주세요.';

  @override
  String splashStartupFailed(String error) {
    return '시작 실패: $error';
  }

  @override
  String get retry => '다시 시도';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => '연결이 끊어졌습니다';

  @override
  String get splashViewOnStatusPage => '상태 페이지에서 보기';

  @override
  String get splashConnectionIssuesPrompt => '연결 문제?';

  @override
  String get splashStatusPageLink => '상태 페이지';

  @override
  String get splashReadIncident => '사고 내용 보기';

  @override
  String get splashIncidentHistory => '사고 기록';

  @override
  String get nagbarLearnMore => '자세히 알아보기';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return '$localizedTime에 예정된 점검이 있습니다. 예상 소요 시간: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return '점검이 진행 중입니다. 예상 소요 시간: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => '점검이 완료되었습니다.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return '$displayName님, 계정을 소유하여 액세스 권한을 잃지 않도록 하세요.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return '$displayName님, 이메일 주소를 확인해 주세요.';
  }

  @override
  String get nagbarOpenSettings => '설정 열기';

  @override
  String get systemPermissionSettingsTitle => '권한 사용 설정';

  @override
  String get systemPermissionSettingsOpenSettings => '설정 열기';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName에서 마이크에 액세스할 수 없습니다. 기기 개인 정보 설정에서 마이크 액세스를 사용 설정할 수 있습니다.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName에서 카메라에 액세스할 수 없습니다. 기기 개인 정보 설정에서 카메라 액세스를 사용 설정할 수 있습니다.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName이(가) 사진 라이브러리에 액세스할 수 없습니다. 기기 개인 정보 설정에서 액세스를 사용 설정할 수 있습니다.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName에서 알림을 보내려면 권한이 필요합니다. 기기 설정에서 권한을 활성화할 수 있습니다.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return '구독 갱신에 실패했지만 $productName 혜택을 $graceDate까지 계속 이용할 수 있습니다. 지금 조치를 취하지 않으면 모든 혜택을 잃게 됩니다.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return '$productName 구독이 만료되었습니다. 혜택을 계속 이용하려면 지금 갱신하세요.';
  }

  @override
  String get nagbarManageSubscription => '구독 관리';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return '$productFullName에 오신 것을 환영합니다. $productName의 특별 혜택을 살펴보고 구독을 관리하세요.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return '$productName 기능 보기';
  }

  @override
  String get nagbarGiftInventoryOne => '선물 인벤토리에 새 선물 코드가 있습니다.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return '선물 인벤토리에 새 선물 코드 $count개가 있습니다.';
  }

  @override
  String get nagbarViewGiftInventory => '선물함 보기';

  @override
  String get nagbarVisionaryMfa => 'Visionary 계정을 보호하기 위해 2단계 인증을 사용 설정하세요.';

  @override
  String get nagbarEnableMfa => '2단계 인증 사용';

  @override
  String get nagbarTermsAcceptance => '약관이 업데이트되었습니다. 계속하려면 검토하고 동의해 주세요.';

  @override
  String get nagbarReviewTerms => '이용약관 검토';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return '$communityName에 참여하여 팀과 채팅하고 최신 소식을 받아보세요.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return '$communityName에 참여하기';
  }

  @override
  String get nagbarPushNotification => '메시지와 멘션을 놓치지 않도록 알림을 허용하세요.';

  @override
  String get nagbarEnableNotifications => '알림 켜기';

  @override
  String get nagbarBillingPortalFailed => '결제 포털을 열 수 없습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get welcomeBack => '다시 오신 것을 환영합니다';

  @override
  String get email => '이메일';

  @override
  String get emailInvalid => '유효한 이메일 주소를 입력해주세요.';

  @override
  String get password => '비밀번호';

  @override
  String get forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get logIn => '로그인';

  @override
  String get logInWithPasskey => '보안 키로 로그인';

  @override
  String continueWithSso(String provider) {
    return '$provider로 계속하기';
  }

  @override
  String get ssoRequired => '이 인스턴스에 액세스하려면 SSO가 필요합니다.';

  @override
  String get organizationSsoProvider => '조직의 싱글 사인온 제공업체로 로그인하세요.';

  @override
  String get failedToStartSso => 'SSO 시작 실패';

  @override
  String get ssoCancelled => 'SSO 로그인이 취소되었습니다';

  @override
  String preferSso(String provider) {
    return '$provider를 사용하시겠어요? $provider로 계속 진행하세요.';
  }

  @override
  String get logInViaBrowser => '브라우저로 로그인';

  @override
  String get needAccountPrompt => '계정이 없으신가요? ';

  @override
  String get register => '등록';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => '인간임을 인증하세요';

  @override
  String get captchaDescription => '봇이 아님을 확인해야 합니다. 아래 인증을 완료해주세요.';

  @override
  String get captchaSwitchToHcaptcha => '문제가 있으신가요? 대신 hCaptcha를 사용해보세요';

  @override
  String get captchaSwitchToTurnstile => '대신 Turnstile을 사용해보세요';

  @override
  String get cancel => '취소';

  @override
  String get ipAuthCheckEmail => '이메일을 확인하세요';

  @override
  String ipAuthDescription(String email) {
    return '로그인을 승인하는 링크를 이메일로 보냈습니다. $email 받은 편지함을 열어주세요.';
  }

  @override
  String get ipAuthConnectionLost => '연결이 끊어졌습니다';

  @override
  String get ipAuthConnectionLostDescription =>
      '승인을 기다리는 동안 연결이 끊어졌습니다. 다시 시도해주세요.';

  @override
  String get ipAuthLinkExpired => '로그인 링크가 만료되었습니다';

  @override
  String get ipAuthLinkExpiredDescription => '이 인증 링크가 만료되었습니다. 다시 로그인해주세요.';

  @override
  String get ipAuthResendEmail => '이메일 다시 보내기';

  @override
  String get ipAuthResent => '다시 보냄';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds초';
  }

  @override
  String get back => '뒤로';

  @override
  String get next => '다음';

  @override
  String get mfaTitle => '2단계 인증';

  @override
  String get mfaChooseMethod => '인증 방법 선택';

  @override
  String get mfaMethodTotp => '인증 앱';

  @override
  String get mfaMethodWebauthn => '보안 키 / 보안 암호';

  @override
  String get mfaTotpDescription => '인증 앱의 6자리 코드 또는 백업 코드 중 하나를 입력하세요.';

  @override
  String get mfaCodeLabel => '코드';

  @override
  String get mfaTryAnotherMethod => '다른 방법 시도';

  @override
  String get mfaUseSecurityKey => '보안 키 / 비밀번호 키 사용';

  @override
  String get accountSelectorTitle => '계정 선택';

  @override
  String get accountSelectorDescription => '계정을 선택하여 계속 진행하거나 다른 계정을 추가하세요.';

  @override
  String get accountAdd => '계정 추가';

  @override
  String get accountRemove => '삭제';

  @override
  String accountRemoveTitle(String username) {
    return '$username 삭제';
  }

  @override
  String get accountRemoveDescription => '이 계정에 대한 저장된 세션이 삭제됩니다.';

  @override
  String get accountRemoveOnlyDescription => '이 기기에서 저장된 유일한 계정이 삭제됩니다.';

  @override
  String get accountExpired => '만료됨';

  @override
  String accountSessionExpired(String identifier) {
    return '$identifier의 세션이 만료되었습니다. 다시 로그인하세요.';
  }

  @override
  String get accountManageTitle => '계정 관리';

  @override
  String get accountSwitchFailed => '계정을 전환하지 못했습니다. 다시 시도하세요.';

  @override
  String get profileTabMenuSwitchAccounts => '계정 전환';

  @override
  String get statusChangeSheetTitle => '상태 설정';

  @override
  String get statusOnlineStatusSection => '온라인 상태';

  @override
  String get statusOnline => '온라인';

  @override
  String get statusIdle => '자리 비움';

  @override
  String get statusDnd => '방해 금지';

  @override
  String get statusInvisible => '오프라인 상태';

  @override
  String get statusOffline => '오프라인';

  @override
  String get statusUntilIChangeIt => '변경할 때까지';

  @override
  String get statusDontClear => '지우지 않음';

  @override
  String get statusFor10Seconds => '10초 동안';

  @override
  String get statusClearAfter10Seconds => '10초';

  @override
  String get statusClearAfter15Minutes => '15분';

  @override
  String get statusClearAfter30Minutes => '30분';

  @override
  String get statusClearAfter1Hour => '1시간';

  @override
  String get statusClearAfter3Hours => '3시간';

  @override
  String get statusClearAfter4Hours => '4시간';

  @override
  String get statusClearAfter8Hours => '8시간';

  @override
  String get statusClearAfter24Hours => '24시간';

  @override
  String get statusClearAfter3Days => '3일';

  @override
  String get statusDndDescription => '데스크톱에서 알림을 받지 않습니다.';

  @override
  String get statusInvisibleDescription => '오프라인으로 표시됩니다.';

  @override
  String get customStatusSetTitle => '맞춤 상태 설정';

  @override
  String get customStatusCurrentHint => '현재 맞춤 상태';

  @override
  String get customStatusClear => '맞춤 상태 지우기';

  @override
  String get customStatusPlaceholder => '무슨 일이 일어나고 있나요?';

  @override
  String get customStatusChooseEmoji => '이모지 선택';

  @override
  String get customStatusClearAfter => '후에 지우기';

  @override
  String get customStatusSave => '저장';

  @override
  String get accountActive => '활성 계정';

  @override
  String get signOut => '로그아웃';

  @override
  String get suspendedPermanentTitle => '계정이 영구적으로 정지되었습니다.';

  @override
  String get suspendedTemporaryTitle => '계정이 정지되었습니다.';

  @override
  String get suspendedPermanentDescription => '서비스 약관 위반으로 계정이 영구적으로 정지되었습니다.';

  @override
  String get suspendedTemporaryDescription =>
      '계정이 일시적으로 정지되었습니다. 정지 기간이 끝나면 계정에 액세스할 수 있습니다.';

  @override
  String get suspendedIssuedAt => '발급일';

  @override
  String get suspendedEndsAt => '종료일';

  @override
  String get suspendedDuration => '정지 기간';

  @override
  String get suspendedPermanent => '영구 정지';

  @override
  String get suspendedReason => '정지 사유';

  @override
  String get suspendedAppealDeadline => '이의 제기 마감일';

  @override
  String suspendedDeletionWarning(String date) {
    return '계정이 $date에 삭제될 예정입니다.';
  }

  @override
  String get suspendedRecheck => '업데이트 확인';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return '$seconds초 후에 다시 확인';
  }

  @override
  String get suspendedBackToLogin => '로그인으로 돌아가기';

  @override
  String get suspendedAppealTitle => '이의 제기';

  @override
  String get suspendedAppealHint => '정지가 재고되어야 하는 이유를 설명해주세요 (최소 50자)...';

  @override
  String get suspendedAppealSubmit => '이의 제기 제출';

  @override
  String get suspendedAppealPending => '검토 대기 중';

  @override
  String get suspendedAppealAccepted => '이의 제기 수락됨';

  @override
  String get suspendedAppealRejected => '이의 제기 거부됨';

  @override
  String get suspendedAppealAcceptedDescription => '이의 제기가 수락되었으며 계정이 복구되었습니다.';

  @override
  String get suspendedSignIn => '계정에 로그인';

  @override
  String get forgotPasswordTitle => '비밀번호를 잊으셨나요?';

  @override
  String get forgotPasswordDescription => '이메일 주소를 입력하시면 비밀번호 재설정 링크를 보내드립니다.';

  @override
  String get forgotPasswordSubmit => '재설정 링크 보내기';

  @override
  String get forgotPasswordSentTitle => '이메일을 확인하세요';

  @override
  String get forgotPasswordSentDescription =>
      '비밀번호 재설정 안내를 이메일로 보내드렸습니다. 받은 편지함을 확인하고 비밀번호를 재설정하려면 링크를 따르세요.';

  @override
  String get forgotPasswordBackToLogin => '로그인으로 돌아가기';

  @override
  String get resetPasswordTitle => '새 비밀번호 설정';

  @override
  String get resetPasswordDescription => '재설정 프로세스를 완료하려면 아래에 새 비밀번호를 입력하세요.';

  @override
  String get resetPasswordNewPassword => '새 비밀번호';

  @override
  String get resetPasswordConfirm => '새 비밀번호 확인';

  @override
  String get resetPasswordSubmit => '비밀번호 재설정';

  @override
  String get resetPasswordMismatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get registerTitle => '계정 만들기';

  @override
  String get registerDisplayName => '표시 이름 (선택 사항)';

  @override
  String get registerDisplayNameHint => '사람들이 당신을 뭐라고 부르기를 원하시나요?';

  @override
  String get registerUsername => '사용자 이름 (선택 사항)';

  @override
  String get registerUsernameHint => '무작위 사용자 이름을 사용하려면 비워 두세요';

  @override
  String get registerUsernameTagHint => '고유성을 보장하기 위해 4자리 태그가 자동으로 추가됩니다';

  @override
  String get registerDateOfBirth => '생년월일';

  @override
  String get registerMonth => '월';

  @override
  String get registerDay => '일';

  @override
  String get registerYear => '년';

  @override
  String get registerConsent => '이용약관 및 개인정보처리방침에 동의합니다';

  @override
  String get registerConsentPrefix => '동의합니다';

  @override
  String get registerConsentTerms => '이용약관';

  @override
  String get registerConsentAnd => ' 및 ';

  @override
  String get registerConsentPrivacy => '개인정보처리방침';

  @override
  String get registerConfirmPassword => '비밀번호 확인';

  @override
  String get registerSubmit => '계정 만들기';

  @override
  String get registerHaveAccount => '이미 계정이 있으신가요? ';

  @override
  String get registerPendingApproval =>
      '계정 요청이 승인 대기 중입니다. 관리자가 승인한 후 로그인할 수 있습니다.';

  @override
  String get registerClosed =>
      '현재 가입이 닫혀 있습니다. 계정을 만들려면 관리자가 제공한 가입 링크를 사용하세요.';

  @override
  String get passkeyNoCredentials => '이 앱에 대한 패스키가 없습니다. 대신 이메일과 비밀번호로 로그인하세요.';

  @override
  String get passkeyDeviceNotSupported => '이 기기에서는 패스키를 지원하지 않습니다.';

  @override
  String get passkeyDomainNotAssociated =>
      '이 앱에 대한 패스키가 구성되지 않았습니다. 대신 이메일과 비밀번호로 로그인하세요.';

  @override
  String get passkeyTimeout => '패스키 인증 시간이 초과되었습니다. 다시 시도해주세요.';

  @override
  String get passkeyNotAvailable =>
      '이 앱에서는 패스키를 사용할 수 없습니다. 대신 이메일과 비밀번호로 로그인하세요.';

  @override
  String get passkeyFailed => 'Passkey 인증에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get errorUnableToCreateAccount => '계정을 만들 수 없습니다. 다시 시도해 주세요.';

  @override
  String get errorUnableToSignIn => '지금 로그인할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get errorServiceUnavailable =>
      '이 인스턴스를 일시적으로 사용할 수 없습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get errorInvalidEmailOrPassword => '잘못된 이메일 또는 비밀번호입니다.';

  @override
  String get errorUnableToSendResetLink => '재설정 링크를 보낼 수 없습니다. 다시 시도해 주세요.';

  @override
  String get errorUnableToResetPassword => '비밀번호를 재설정할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get embedInviteJoin => '커뮤니티 참여';

  @override
  String get embedInviteGoTo => '커뮤니티로 이동';

  @override
  String embedInviteOnline(String count) {
    return '$count명 온라인';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count명 멤버';
  }

  @override
  String get embedInviteUnknownTitle => '알 수 없는 초대';

  @override
  String get embedInviteUnknownSubtitle => '새로운 초대를 다시 요청해 보세요.';

  @override
  String get embedInviteUnavailable => '초대 사용 불가';

  @override
  String get embedInviteJoinGroup => '그룹 참여';

  @override
  String get embedInviteAlreadyJoined => '이미 참여함';

  @override
  String get embedInviteDisabled => '초대 비활성화됨';

  @override
  String get embedInvitePaused => '이 커뮤니티의 초대 기능이 일시 중지되었습니다.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName에서 잠재적인 레이드를 감지했습니다. 현재 새 사용자는 참여할 수 없습니다.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      '커뮤니티에서 초대를 일시 중지했습니다. 나중에 다시 시도해 주세요.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName에서 이 커뮤니티에 대한 잠재적인 공격을 감지했습니다. 초대가 일시 중지되어 지금은 새 사용자가 참여할 수 없습니다.';
  }

  @override
  String get inviteAcceptTitle => '참여하도록 초대되었습니다';

  @override
  String get inviteAcceptJoinButton => '커뮤니티 참여';

  @override
  String get inviteAcceptGoToButton => '커뮤니티로 이동';

  @override
  String get inviteAcceptInvitesPaused => '초대 일시 중지됨';

  @override
  String get inviteAcceptNotFoundTitle => '초대 유효하지 않음';

  @override
  String get inviteAcceptNotFoundDescription => '이 초대는 만료되었거나 유효하지 않을 수 있습니다.';

  @override
  String get invalidDeepLinkTitle => '링크를 열 수 없습니다';

  @override
  String get invalidDeepLinkDescription =>
      '이 링크가 잘못되었거나, 웹에서만 사용할 수 있거나, 액세스 권한이 없을 수 있습니다. 링크를 확인하고 다시 시도해 보세요.';

  @override
  String get invalidDeepLinkGoHomeButton => '홈으로 이동';

  @override
  String get inviteAcceptJoinGroupButton => '그룹 참여';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return '$inviterName님이 그룹 DM에 초대했습니다.';
  }

  @override
  String get inviteAcceptSomeone => '누군가';

  @override
  String get inviteAcceptEmojiPack => '이모티콘 팩';

  @override
  String get inviteAcceptStickerPack => '스티커 팩';

  @override
  String get inviteAcceptInstallEmojiPack => '이모티콘 팩 설치';

  @override
  String get inviteAcceptInstallStickerPack => '스티커 팩 설치';

  @override
  String get inviteAcceptPackInstallNote => '이 초대를 수락하면 팩이 자동으로 설치됩니다.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => '채널 접근 거부됨';

  @override
  String get channelAccessDeniedDescription => '이 메시지가 전송된 채널에 접근할 수 없습니다.';

  @override
  String get messageJumpLinkNoAccess => '접근 불가';

  @override
  String get okay => '확인';

  @override
  String get embedThemeTitle => '공유된 테마';

  @override
  String get embedThemeSubtitle => '이 클라이언트에서는 사용자 지정 테마를 지원하지 않습니다.';

  @override
  String get embedThemeUnavailableButton => '테마 사용 불가';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return '평생 $productName 비저너리';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$productName $count일',
      one: '$productName 1일',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$productName $count주',
      one: '$productName 1주',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$productName $count개월',
      one: '$productName 1개월',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$productName $count년',
      one: '$productName 1년',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return '$creatorTag 님으로부터';
  }

  @override
  String get embedGiftClaimHelp => '선물 받으려면 클릭하세요!';

  @override
  String get embedGiftAlreadyRedeemed => '이미 사용됨';

  @override
  String get embedGiftClaimAccountHelp => '선물을 받으려면 계정을 등록하세요.';

  @override
  String get embedGiftClaim => '선물 받기';

  @override
  String get embedGiftClaimed => '선물 받음';

  @override
  String get embedGiftClaimAccount => '선물 받으려면 계정을 등록하세요';

  @override
  String get embedGiftUnknownTitle => '알 수 없는 선물';

  @override
  String get embedGiftUnknownSubtitle => '선물 코드가 유효하지 않거나 이미 사용되었습니다.';

  @override
  String get embedGiftUnavailable => '선물 불가';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '$productName 구독을 활성화하려면 선물을 받으세요!';
  }

  @override
  String get giftAcceptAlreadyClaimed => '이미 수락된 선물입니다.';

  @override
  String get giftAcceptMaybeLater => '나중에';

  @override
  String get giftRedeemedToast => '선물 등록 완료!';

  @override
  String get giftRedeemInvalidTitle => '유효하지 않은 선물 코드';

  @override
  String get giftRedeemInvalidMessage => '코드가 유효하지 않거나 이미 사용되었습니다.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => '선물이 이미 사용되었습니다';

  @override
  String get giftRedeemAlreadyRedeemedMessage => '이미 사용된 코드입니다.';

  @override
  String get giftRedeemNotFoundTitle => '선물을 찾을 수 없음';

  @override
  String get giftRedeemNotFoundMessage => '이 코드는 존재하지 않습니다.';

  @override
  String get giftRedeemFailedTitle => '선물 등록에 실패했습니다';

  @override
  String get giftRedeemFailedMessage => '선물을 사용할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get giftVisionaryCannotRedeemTitle => '이 선물은 사용할 수 없어요';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary 계정은 Plutonium 선물을 사용할 수 없습니다. 대신 친구에게 공유할 링크를 복사하세요.';

  @override
  String get giftCopyLink => '선물 링크 복사';

  @override
  String get privacySettings => '개인 정보 보호 설정';

  @override
  String get privacyDirectMessages => '직접 메시지';

  @override
  String get privacyDirectMessagesDescription =>
      '이 커뮤니티의 다른 멤버로부터 직접 메시지를 허용합니다.';

  @override
  String get privacyBotDirectMessages => '봇 직접 메시지';

  @override
  String get privacyBotDirectMessagesDescription =>
      '이 커뮤니티의 봇이 보낸 직접 메시지를 받습니다.';

  @override
  String get privacyMutualDmsDisabled =>
      '커뮤니티 관리자가 이 커뮤니티에서 상호 멤버로부터의 직접 메시지 수신을 비활성화했습니다.';

  @override
  String get communityDebug => '커뮤니티 디버그';

  @override
  String get copiedToClipboard => '클립보드에 복사됨';

  @override
  String get notificationSettings => '알림 설정';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName 음소거';
  }

  @override
  String get notificationMuteDescription =>
      '커뮤니티를 음소거하면 멘션되지 않는 한 읽지 않은 표시와 알림이 표시되지 않습니다.';

  @override
  String get notificationCommunitySettings => '커뮤니티 알림 설정';

  @override
  String get notificationAllMessages => '모든 메시지';

  @override
  String get notificationOnlyMentions => '멘션만';

  @override
  String get notificationNothing => '없음';

  @override
  String get notificationSuppressEveryone => '@everyone 및 @here 억제';

  @override
  String get notificationSuppressRoles => '모든 역할 멘션 @무시';

  @override
  String get notificationMobilePush => '모바일 푸시 알림';

  @override
  String get notificationOverrides => '알림 재정의';

  @override
  String get notificationSelectChannel => '채널 또는 카테고리 선택';

  @override
  String get notificationOnlyAtMentions => '멘션 시에만 @';

  @override
  String get notificationMuteChannel => '채널 음소거';

  @override
  String get notificationUnmuteChannel => '채널 음소거 해제';

  @override
  String get notificationUseCategoryDefault => '카테고리 기본값 사용';

  @override
  String get notificationUseCommunityDefault => '커뮤니티 기본값 사용';

  @override
  String get notificationNoCategory => '카테고리 없음';

  @override
  String get dmMarkAsRead => '읽음으로 표시';

  @override
  String get dmMuteConversation => 'DM 음소거';

  @override
  String get dmUnmuteConversation => 'DM 음소거 해제';

  @override
  String get dmPinDm => 'DM 고정';

  @override
  String get dmUnpinDm => 'DM 고정 해제';

  @override
  String get dmAlwaysShowInSidebar => '항상 사이드바에 표시';

  @override
  String get dmRemoveFromAlwaysShown => '항상 표시에서 제거';

  @override
  String get dmCloseDm => 'DM 닫기';

  @override
  String get dmCloseDmConfirmTitle => 'DM 닫기';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '$username님과의 DM을 정말 닫으시겠어요? 나중에 언제든지 다시 열 수 있습니다.';
  }

  @override
  String get dmDeleteMyMessagesTitle => '이 대화에서 내 메시지를 삭제하시겠어요?';

  @override
  String get dmDeleteMyMessagesDescription =>
      '이 대화에서 회원님이 보낸 모든 메시지가 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get dmCopyChannelId => '채널 ID 복사';

  @override
  String get dmChannelIdCopied => '채널 ID 복사됨';

  @override
  String get dmCopyUserId => '사용자 ID 복사';

  @override
  String get dmUserIdCopied => '사용자 ID 복사됨';

  @override
  String get dmViewProfile => '프로필 보기';

  @override
  String get dmVoiceCall => '음성 통화 시작';

  @override
  String get incomingVoiceCallTitle => '수신 음성 통화';

  @override
  String get incomingVoiceCallAccept => '수락';

  @override
  String get incomingVoiceCallDecline => '거절';

  @override
  String get incomingVoiceCallLabel => '수신 통화';

  @override
  String get incomingVoiceCallIgnore => '무시';

  @override
  String get directVoiceCallNotEligible =>
      '지금은 이 통화를 시작할 수 없습니다. 잠시 후 다시 시도하세요.';

  @override
  String get voiceJoinCallFailed => '이 통화에 연결할 수 없습니다. 연결 상태를 확인하고 다시 시도하세요.';

  @override
  String get voiceJoinIncomingCallFailed =>
      '이 통화에 참여할 수 없습니다. 연결 상태를 확인하고 다시 시도하세요.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      '서버에서 이 통화 업데이트에 실패했습니다. 연결 상태를 확인하고 다시 시도하세요.';

  @override
  String get dmAddNote => '메모 추가';

  @override
  String get dmEditGroup => '그룹 편집';

  @override
  String get dmInviteToCommunity => '커뮤니티에 초대';

  @override
  String get dmBlock => '차단';

  @override
  String get dmLeaveGroup => '그룹 나가기';

  @override
  String get dmNoCommunitiesAvailable => '사용 가능한 커뮤니티 없음';

  @override
  String dmGroupMemberCount(int count) {
    return '$count명';
  }

  @override
  String get dmMuteFor15Min => '15분 동안';

  @override
  String get dmMuteFor30Min => '30분 동안';

  @override
  String get dmMuteFor1Hour => '1시간 동안';

  @override
  String get dmMuteFor3Hours => '3시간 동안';

  @override
  String get dmMuteFor4Hours => '4시간 동안';

  @override
  String get dmMuteFor8Hours => '8시간 동안';

  @override
  String get dmMuteFor24Hours => '24시간 동안';

  @override
  String get dmMuteFor3Days => '3일 동안';

  @override
  String get dmMuteForever => '다시 켤 때까지';

  @override
  String get dmPinGroupDm => '그룹 DM 고정';

  @override
  String get dmUnpinGroupDm => '그룹 DM 고정 해제';

  @override
  String get dmUnnamedGroup => '이름 없는 그룹';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName 그룹';
  }

  @override
  String get dmFavoriteDm => 'DM 즐겨찾기';

  @override
  String get dmUnfavoriteDm => 'DM 즐겨찾기 해제';

  @override
  String get dmFavoriteGroupDm => '그룹 DM 즐겨찾기';

  @override
  String get dmUnfavoriteGroupDm => '그룹 DM 즐겨찾기 해제';

  @override
  String get dmChangeFriendNickname => '친구 별명 변경';

  @override
  String get dmRemoveFriend => '친구 삭제';

  @override
  String get dmAddFriend => '친구 추가';

  @override
  String get dmAcceptFriendRequest => '친구 요청 수락';

  @override
  String get dmIgnoreFriendRequest => '친구 요청 무시';

  @override
  String get dmFriendRequestSent => '친구 요청 보냄';

  @override
  String get dmUnblock => '차단 해제';

  @override
  String get dmDebugUser => '사용자 디버그';

  @override
  String get dmDebugChannel => '채널 디버그';

  @override
  String get dmDebugCategory => '카테고리 디버그';

  @override
  String get dmPinned => 'DM 고정됨';

  @override
  String get dmUnpinned => 'DM 고정 해제됨';

  @override
  String get dmMuted => 'DM 음소거됨';

  @override
  String get dmUnmuted => 'DM 음소거 해제됨';

  @override
  String get dmRemoveFriendConfirmTitle => '친구 삭제';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '$username님을 친구에서 삭제하시겠어요?';
  }

  @override
  String get dmBlockConfirmTitle => '사용자 차단';

  @override
  String dmBlockConfirmDescription(String username) {
    return '$username님을 차단하시겠어요? 이 사용자는 메시지를 보내거나 친구 요청을 보낼 수 없습니다.';
  }

  @override
  String get dmFriendRequestSentToast => '친구 요청을 보냈습니다';

  @override
  String get dmFriendRequestFailed => '친구 요청 보내기 실패';

  @override
  String get dmAcceptFriendRequestFailed => '친구 요청 수락 실패';

  @override
  String get dmRemoveFriendFailed => '친구 삭제 실패';

  @override
  String get dmBlockFailed => '사용자 차단 실패';

  @override
  String get dmUnblockFailed => '사용자 차단 해제 실패';

  @override
  String get dmIgnoreFriendRequestFailed => '친구 요청 무시 실패';

  @override
  String get dmAddFriends => '친구 추가';

  @override
  String get addFriendSheetTitle => '친구 추가';

  @override
  String get addFriendUsernameHint => '사용자이름#0000';

  @override
  String get addFriendUsernameLabel => '친구의 사용자 이름';

  @override
  String get addFriendSendRequest => '요청 보내기';

  @override
  String get addFriendNoUserFound => '해당 사용자 이름의 사용자를 찾을 수 없습니다.';

  @override
  String get addFriendInvalidUsername => '유효한 사용자 이름(사용자이름#0000)을 입력하세요.';

  @override
  String get addFriendOutgoingSuccess => '친구 요청을 보냈습니다';

  @override
  String get addFriendClaimTitle => '계정 소유권 주장';

  @override
  String get addFriendClaimDescription => '친구 요청을 보내려면 계정 소유권을 주장하세요.';

  @override
  String get addFriendVerifyTitle => '이메일 인증';

  @override
  String get addFriendVerifyDescription => '친구 요청을 보내려면 이메일 주소를 인증해야 합니다.';

  @override
  String get addFriendVerifyEmail => '이메일 인증';

  @override
  String addFriendIncomingRequests(int count) {
    return '받은 친구 요청 ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return '보낸 친구 요청 ($count)';
  }

  @override
  String get addFriendIncomingStatus => '받은 친구 요청';

  @override
  String get addFriendOutgoingStatus => '친구 요청 보냄';

  @override
  String get addFriendViewProfile => '프로필 보기';

  @override
  String get addFriendAccept => '수락';

  @override
  String get addFriendIgnore => '무시';

  @override
  String get addFriendAcceptTitle => '친구 요청 수락';

  @override
  String get addFriendIgnoreTitle => '친구 요청 무시';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '$userName님의 친구 요청을 수락하시겠어요?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '$displayName님의 친구 요청을 무시하시겠어요?';
  }

  @override
  String get addFriendCancelRequest => '요청 취소';

  @override
  String get addFriendCancelRequestFailed => '친구 요청을 취소할 수 없습니다. 다시 시도하세요.';

  @override
  String get addFriendNotAcceptingRequests => '현재 친구 요청을 받지 않고 있습니다.';

  @override
  String get addFriendUnblockFirst => '친구 요청을 보내려면 먼저 차단을 해제하세요.';

  @override
  String get addFriendCannotSendToSelf => '자신에게 친구 요청을 보낼 수 없습니다.';

  @override
  String get addFriendAlreadyFriends => '이미 이 사용자와 친구입니다.';

  @override
  String get addFriendClaimToSend => '친구 요청을 보내려면 가입을 완료하세요.';

  @override
  String get addFriendVerifyToSend => '친구 요청을 보내려면 먼저 이메일을 인증하세요.';

  @override
  String get addFriendFriendsListFull =>
      '친구 목록이 가득 찼거나 상대방의 친구 목록이 가득 찼습니다. 친구를 삭제하고 다시 시도해 주세요.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => '시스템';

  @override
  String get emojiSearchPlaceholder => '꿈에 그리던 이모티콘 찾기';

  @override
  String get emojiSearchEmpty => '검색어와 일치하는 이모티콘이 없습니다.';

  @override
  String get emojiAutocompleteDefaultLabel => '기본 이모티콘';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return '이모티콘은 $productName의 기본 이모티콘입니다.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      '이 이모지는 이 커뮤니티에서 가져온 것입니다. 어디서든 사용할 수 있습니다.';

  @override
  String get emojiInfoCustomUnknownDescription => '커뮤니티에서 만든 이모티콘입니다.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      '이모티콘은 커뮤니티에서 만든 이모티콘입니다. 이모티콘을 사용하려면 작성자에게 초대를 요청하세요.';

  @override
  String get emojiInfoFromHeader => '이 이모지는';

  @override
  String get emojiInfoDiscoverableCommunity => '둘러보기 가능 커뮤니티';

  @override
  String get emojiInfoPrivateCommunity => '비공개 커뮤니티';

  @override
  String get emojiInfoVerifiedCommunity => '인증된 커뮤니티';

  @override
  String get emojiInfoAddToFavorites => '즐겨찾기에 추가';

  @override
  String get emojiInfoRemoveFromFavorites => '즐겨찾기에서 삭제';

  @override
  String get emojiFrequentlyUsed => '자주 사용한 이모티콘';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => '미디어';

  @override
  String get emojiTabStickers => '스티커';

  @override
  String get emojiTabEmojis => '이모티콘';

  @override
  String get gifPickerSearch => 'GIF 검색';

  @override
  String get gifPickerSearchKlipy => 'KLIPY 검색';

  @override
  String get gifPickerSearchTenor => 'Tenor 검색';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => '즐겨찾기';

  @override
  String get gifPickerFavoritesEmptyTitle => '아직 즐겨찾는 GIF가 없습니다';

  @override
  String get gifPickerFavoritesEmptyDescription => 'GIF에 별표를 표시하면 여기에 표시됩니다.';

  @override
  String get gifPickerTrending => '인기 GIF';

  @override
  String get gifPickerNoResultsTitle => '검색 결과 없음';

  @override
  String get gifPickerNoResultsDescription => '다른 검색어를 사용해 보세요.';

  @override
  String get gifPickerLoadFailedTitle => 'GIF를 불러올 수 없습니다.';

  @override
  String get gifPickerLoadFailedBody => '연결 상태를 확인하고 다시 시도하세요.';

  @override
  String get emojiCategoryPeople => '사람';

  @override
  String get emojiCategoryNature => '자연';

  @override
  String get emojiCategoryFood => '음식 및 음료';

  @override
  String get emojiCategoryActivity => '활동';

  @override
  String get emojiCategoryTravel => '여행 및 장소';

  @override
  String get emojiCategoryObjects => '사물';

  @override
  String get emojiCategorySymbols => '기호';

  @override
  String get emojiCategoryFlags => '국기';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Plutonium으로 $communityCount개의 커뮤니티에서 $emojiCount개를 잠금 해제하세요.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Plutonium 받기';

  @override
  String get emojiPlutoniumUpsellDismiss => '다시 표시 안 함';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '맞춤 이모티콘 #개',
      one: '맞춤 이모티콘 1개',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '커뮤니티 #개',
      one: '커뮤니티 1개',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => '외부 링크 경고';

  @override
  String externalLinkWarningLeaving(String productName) {
    return '$productName를 벗어나려고 합니다.';
  }

  @override
  String get externalLinkWarningDescription => '외부 링크는 위험할 수 있습니다. 주의하세요.';

  @override
  String get externalLinkWarningDestinationUrl => '대상 URL:';

  @override
  String get externalLinksSectionTitle => '외부 링크';

  @override
  String get externalLinksSectionDescription => '외부 링크 경고 처리 방식을 설정하세요.';

  @override
  String get externalLinkWarningTrustPrefix => '항상 신뢰 ';

  @override
  String get externalLinkWarningTrustSuffix => ' — 다음부터 이 경고 건너뛰기';

  @override
  String get externalLinkVisitSite => '사이트 방문';

  @override
  String get externalLinkTrustAllLabel => '모든 외부 링크 신뢰';

  @override
  String get externalLinkStripTrackingLabel => 'URL에서 추적 매개변수 제거';

  @override
  String get externalLinkStripTrackingDescription =>
      '보내는 메시지의 URL에서 추적 매개변수(예: utm_source, fbclid, gclid)를 자동으로 제거합니다. 링크가 다른 사람에게 도달하기 전에 정리합니다.';

  @override
  String get externalLinkTrustAllConfirmTitle => '모든 외부 링크를 신뢰하시겠습니까?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      '이렇게 하면 모든 외부 링크가 신뢰되며 모든 도메인에 대한 경고가 건너뛰어집니다. 기존에 신뢰한 도메인은 대체됩니다. 보안 수준이 낮아집니다.';

  @override
  String get externalLinkTrustAllConfirmAction => '모두 신뢰';

  @override
  String get externalLinkStopTrustingAllTitle => '모든 링크 신뢰 중지?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      '외부 링크 경고가 다시 표시됩니다. 신뢰할 도메인을 개별적으로 추가해야 합니다.';

  @override
  String get externalLinkStopTrustingAllAction => '모두 신뢰 비활성화';

  @override
  String get externalLinkTrustedAllDescription =>
      '모든 외부 링크가 신뢰됩니다. 경고가 표시되지 않습니다.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return '$count개의 신뢰하는 도메인이 있습니다. 외부 링크를 방문할 때 확인란을 선택하여 더 추가하세요.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      '활성화하면 외부 링크 경고가 표시되지 않습니다. 보안 수준이 낮아집니다.';

  @override
  String get imageFileTooLarge => '이미지 파일이 너무 큽니다. 10MB 미만의 파일을 선택하세요.';

  @override
  String get animatedAvatarsRequirePlutonium => '애니메이션 아바타에는 Plutonium이 필요합니다.';

  @override
  String get animatedBannersRequirePlutonium => '애니메이션 배너에는 Plutonium이 필요합니다.';

  @override
  String get animatedAvifNotSupported => '애니메이션 AVIF 지원 안 함';

  @override
  String get animatedAvifNotSupportedBody =>
      '애니메이션 AVIF 파일 자르기 및 회전은 아직 지원되지 않습니다. 계속 진행하면 원본 형식으로 업로드됩니다.';

  @override
  String get uploadAsIs => '있는 그대로 업로드';

  @override
  String get croppingAnimatedNotSupported =>
      '애니메이션 이미지 자르기는 아직 지원되지 않습니다. 원본 업로드가 사용됩니다.';

  @override
  String get cropAvatar => '아바타 자르기';

  @override
  String get cropBanner => '배너 자르기';

  @override
  String get skip => '건너뛰기';

  @override
  String get crop => '자르기';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => '사용자 이름 변경';

  @override
  String get fluxerTagInputLabel => '사용자 이름';

  @override
  String get fluxerTagDescriptionBase =>
      '사용자 이름에는 문자(a-z, A-Z), 숫자(0-9) 및 밑줄만 포함될 수 있습니다. 사용자 이름은 대소문자를 구분하지 않습니다.';

  @override
  String get fluxerTagDescriptionVisionary =>
      '사용자 이름에는 문자(a-z, A-Z), 숫자(0-9) 및 밑줄만 포함될 수 있습니다. 사용자 이름은 대소문자를 구분하지 않습니다. #0000부터 #9999까지 사용 가능한 4자리 태그를 선택할 수 있습니다.';

  @override
  String get fluxerTagDescriptionPremium =>
      '사용자 이름에는 문자(a-z, A-Z), 숫자(0-9) 및 밑줄만 포함될 수 있습니다. 사용자 이름은 대소문자를 구분하지 않습니다. #0001부터 #9999까지 사용 가능한 4자리 태그를 선택할 수 있습니다.';

  @override
  String validationLengthRange(int min, int max) {
    return '$min자에서 $max자 사이';
  }

  @override
  String get validationAllowedChars => '문자(a-z, A-Z), 숫자(0-9) 및 밑줄(_)만 가능';

  @override
  String get discriminatorPremiumTooltip =>
      'Plutonium을 사용하여 태그를 사용자 지정하거나 사용자 이름을 변경할 때 유지하세요.';

  @override
  String get fluxerTagAlreadyTaken => '사용자 이름 이미 사용 중입니다.';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return '$username#$discriminator 사용자 이름 이미 사용 중입니다. 계속하면 자동으로 디스커리미네이터가 다시 롤링됩니다.';
  }

  @override
  String get customTagIsTemporary => '사용자 지정 태그는 임시입니다.';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return '사용자 지정 4자리 태그는 Plutonium 구독이 활성 상태인 동안에만 사용할 수 있습니다. 구독이 $date에 만료되면 3일의 유예 기간 후 태그가 무작위로 할당된 숫자로 되돌아갑니다.';
  }

  @override
  String get customTagTemporaryBody =>
      '사용자 지정 4자리 태그는 Plutonium 구독이 활성 상태인 동안에만 사용할 수 있습니다. 구독이 만료되면 3일의 유예 기간 후 태그가 무작위로 할당된 숫자로 되돌아갑니다.';

  @override
  String get iUnderstandContinue => '알겠습니다, 계속';

  @override
  String get premiumWarningPendingDiscriminator =>
      '이 사용자 이름 저장하면 Plutonium 구독이 종료될 때 사용자 지정 4자리 태그가 무작위 숫자로 되돌아갑니다. 구독이 갱신되지 않으면 태그가 변경되기 전에 3일의 유예 기간이 있습니다.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return '사용자 지정 4자리 태그(#$discriminator)는 Plutonium 구독이 활성 상태인 동안 활성입니다. 구독이 종료되거나 3일의 유예 기간 후 갱신되지 않으면 태그가 무작위 숫자로 되돌아갑니다.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      '사용자 지정 4자리 태그를 사용자 지정하거나 사용자 이름을 변경할 때 유지하세요.';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Plutonium 평가판이 $date에 만료됩니다. 사용자 지정 태그를 유지하고 프로필에 배지를 얻으려면 업그레이드하세요.';
  }

  @override
  String get premiumTrialActive =>
      'Plutonium 평가판을 사용 중입니다. 사용자 지정 태그를 유지하고 프로필에 배지를 얻으려면 업그레이드하세요.';

  @override
  String get fluxerTagUpdated => '사용자 이름 업데이트되었습니다.';

  @override
  String get fluxerTagUpdateFailed => '사용자 이름 업데이트에 실패했습니다. 다시 시도하세요.';

  @override
  String get continueAction => '계속';

  @override
  String get profileCustomizationTitle => '프로필 사용자 지정';

  @override
  String get profileCustomizationDescription =>
      '프로필 모양을 편집하고 실시간 미리 보기를 확인하세요.';

  @override
  String get usernameLabel => '사용자 이름';

  @override
  String get claimAccountToChangeFluxerTag => '사용자 이름 변경하려면 계정을 청구하세요.';

  @override
  String get changeFluxerTag => '사용자 이름 변경';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Plutonium으로 4자리 태그(#$discriminator)를 원하는 대로 꾸며보세요';
  }

  @override
  String get changeUsernameAndTagHint => '사용자 이름 및 4자리 태그 변경';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return '맞춤 태그(#$discriminator)는 Plutonium 구독에 연결되어 있으며, 만료 시 무작위 태그로 돌아갑니다.';
  }

  @override
  String get displayNameLabel => '표시 이름';

  @override
  String get pronounsLabel => '대명사';

  @override
  String get avatarLabel => '아바타';

  @override
  String get changeAvatar => '아바타 변경';

  @override
  String get removeAvatar => '아바타 삭제';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. 최대 10MB. 권장: 512×512px';

  @override
  String get bannerLabel => '배너';

  @override
  String get changeBanner => '배너 변경';

  @override
  String get removeBanner => '배너 삭제';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. 최대 10MB. 최소: 960×540px (16:9)';

  @override
  String get accentColorLabel => '강조 색상';

  @override
  String get accentColorDescription => '프로필의 테두리 및 배너 색상을 사용자 지정합니다.';

  @override
  String get aboutMeLabel => '자기소개';

  @override
  String get aboutMeHelperText => '링크, 이모지, Markdown을 사용할 수 있습니다.';

  @override
  String get emojiPickerTitle => '이모지';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium 배지 개인 정보';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Plutonium 배지가 다른 사용자에게 표시되는 방식을 제어하세요.';

  @override
  String get hidePlutoniumBadgeLabel => 'Plutonium 배지 전체 숨기기';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Plutonium 배지를 다른 사용자에게 완전히 숨깁니다.';

  @override
  String get hidePlutoniumPurchaseDate => 'Plutonium 구매 날짜 숨기기';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Plutonium 구매 날짜 숨기기($date)';
  }

  @override
  String get hidePurchaseDateDescription => '배지에서 Plutonium을 처음 구매한 날짜를 삭제합니다.';

  @override
  String get maskVisionaryAsSubscription => 'Visionary를 구독으로 표시';

  @override
  String get maskVisionaryDescription => 'Visionary를 일반 구독으로 표시합니다.';

  @override
  String get hideVisionaryIdBadge => 'Visionary ID 배지 숨기기';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Visionary ID 배지 숨기기(#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Visionary ID 배지를 삭제합니다.';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Plutonium 체험판을 사용 중입니다. 구독은 $date에 시작됩니다.';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      '체험 기간이 끝나면 구독이 자동으로 시작됩니다. 별도의 조치가 필요하지 않습니다.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Plutonium 체험판이 $date에 만료됩니다.';
  }

  @override
  String get premiumTrialActiveProfile => 'Plutonium 체험판을 사용 중입니다.';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. 최대 10MB. 권장: 512×512px. 애니메이션 아바타(GIF)에는 Plutonium이 필요합니다.';

  @override
  String get bannerPlutoniumUpsell => '정적 또는 애니메이션 배너 이미지로 프로필을 꾸며 돋보이게 하세요.';

  @override
  String get getPlutonium => 'Plutonium 받기';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      '이 플랫폼에서는 아직 인앱 구매를 사용할 수 없습니다. 곧 출시될 예정이니 기대해 주세요!';

  @override
  String get profilePreviewLabel => '미리보기';

  @override
  String get profilePreviewMessage => '메시지';

  @override
  String profilePreviewMemberSince(String productName) {
    return '$productName 가입일';
  }

  @override
  String get unclaimedAccountTitle => '미청구 계정';

  @override
  String get unclaimedAccountDescription =>
      '계정이 아직 청구되지 않았습니다. 이메일과 비밀번호가 없으면 액세스 권한을 잃을 수 있습니다. 지금 계정을 청구하여 안전하게 보호하세요.';

  @override
  String get claimAccount => '계정 청구';

  @override
  String get profileTypeLabel => '프로필 유형';

  @override
  String get profileTypeGlobal => '전체 프로필';

  @override
  String get profileTypeGuildDescription =>
      '커뮤니티별 프로필을 편집하고 있습니다. 이 프로필은 이 커뮤니티에서만 표시되며 전체 프로필을 재정의합니다.';

  @override
  String get communityNicknameLabel => '커뮤니티 별명';

  @override
  String get perGuildPremiumUpsellText =>
      '커뮤니티별 아바타, 배너, 강조 색상 및 소개 문구 사용자 지정에는 Plutonium이 필요합니다. 커뮤니티 별칭 및 대명사는 모든 사용자에게 무료입니다.';

  @override
  String get avatarModeInherit => '전역 프로필 사용';

  @override
  String get avatarModeCustom => '사용자 지정 이미지 사용';

  @override
  String get avatarModeUnset => '표시 안 함';

  @override
  String get profileSavedToast => '프로필이 업데이트되었습니다.';

  @override
  String get profileEditButton => '프로필 수정';

  @override
  String get profileNoteLabel => '메모';

  @override
  String get profileNoteVisibility => '(나에게만 보임)';

  @override
  String get profileNoteEmpty => '아직 메모가 없습니다.';

  @override
  String get sudoTitle => '본인 인증';

  @override
  String get sudoDescription => '이 작업은 계속 진행하기 위해 인증이 필요합니다.';

  @override
  String get sudoAuthenticatorCode => '인증 코드';

  @override
  String get sudoMethodPassword => '비밀번호';

  @override
  String get sudoMethodTotp => '인증기';

  @override
  String get sudoVerificationFailed => '인증에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get securityAccountTitle => '계정';

  @override
  String get securityAccountDescription => '이메일, 비밀번호 및 계정 설정을 관리하세요.';

  @override
  String get securitySectionTitle => '보안';

  @override
  String get securitySectionDescription => '2단계 인증 및 암호 키로 계정을 보호하세요.';

  @override
  String get securityLoginEmailSectionTitle => '이메일 설정';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return '$productName에 로그인하는 데 사용하는 이메일 주소를 관리하세요.';
  }

  @override
  String get securityLoginEmailAddressLabel => '이메일 주소';

  @override
  String get securityLoginNoEmailSet => '이메일 주소가 설정되지 않았습니다.';

  @override
  String get securityLoginChangeEmail => '이메일 변경';

  @override
  String get securityLoginAddEmail => '이메일 추가';

  @override
  String get securityLoginReveal => '보기';

  @override
  String get securityLoginHide => '숨기기';

  @override
  String get securityLoginPasswordSectionTitle => '비밀번호';

  @override
  String get securityLoginPasswordSectionDescription =>
      '계정 보안을 위해 비밀번호를 변경하세요.';

  @override
  String get securityLoginCurrentPasswordLabel => '현재 비밀번호';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return '마지막 변경: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => '마지막 변경: 없음';

  @override
  String get securityLoginNoPasswordSet => '비밀번호가 설정되지 않았습니다.';

  @override
  String get securityLoginChangePassword => '비밀번호 변경';

  @override
  String get securityLoginSetPassword => '비밀번호 설정';

  @override
  String get passwordChangeTitle => '비밀번호 변경';

  @override
  String get passwordChangeIntroDescription =>
      '비밀번호를 변경하기 전에 본인 확인을 위해 이메일 주소로 인증 코드를 보내드립니다.';

  @override
  String get passwordChangeStart => '시작';

  @override
  String get passwordChangeVerifyTitle => '이메일 인증';

  @override
  String get passwordChangeVerifyDescription => '이메일 주소로 보낸 인증 코드를 입력하세요.';

  @override
  String get passwordChangeVerificationCode => '인증 코드';

  @override
  String get passwordChangeVerify => '인증';

  @override
  String get passwordChangeNewPasswordTitle => '새 비밀번호 설정';

  @override
  String get passwordChangeNewPasswordDescription => '아래에 새 비밀번호를 입력하세요.';

  @override
  String get passwordChangeNewPassword => '새 비밀번호';

  @override
  String get passwordChangeConfirmPassword => '새 비밀번호 확인';

  @override
  String get passwordChangeSubmit => '비밀번호 변경';

  @override
  String get passwordChangeSuccess => '비밀번호가 변경되었습니다.';

  @override
  String get passwordChangePasswordsDoNotMatch => '비밀번호가 일치하지 않습니다.';

  @override
  String get passwordChangeInvalidCode => '잘못되었거나 만료된 코드입니다.';

  @override
  String get emailChangeTitle => '이메일 변경';

  @override
  String get emailChangeIntroDescription =>
      '이메일 주소를 변경하기 전에 본인 확인을 위해 인증 코드를 보내드립니다.';

  @override
  String get emailChangeStart => '시작하기';

  @override
  String get emailChangeVerifyOriginalTitle => '현재 이메일 인증';

  @override
  String get emailChangeVerifyOriginalDescription =>
      '현재 이메일 주소로 전송된 인증 코드를 입력하세요.';

  @override
  String get emailChangeNewEmailTitle => '새 이메일 입력';

  @override
  String get emailChangeNewEmailDescription => '사용하려는 새 이메일 주소를 입력하세요.';

  @override
  String get emailChangeNewEmailLabel => '새 이메일';

  @override
  String get emailChangeNewEmailSubmit => '인증 코드 보내기';

  @override
  String get emailChangeVerifyNewTitle => '새 이메일 인증';

  @override
  String get emailChangeVerifyNewDescription => '새 이메일 주소로 전송된 인증 코드를 입력하세요.';

  @override
  String get emailChangeSuccess => '이메일이 변경되었습니다.';

  @override
  String get emailChangeInvalidCode => '코드가 잘못되었거나 만료되었습니다.';

  @override
  String get resend => '다시 보내기';

  @override
  String resendCountdown(int seconds) {
    return '다시 보내기 ($seconds초)';
  }

  @override
  String get verificationCode => '인증 코드';

  @override
  String get verify => '인증';

  @override
  String get enable => '활성화';

  @override
  String get disable => '비활성화';

  @override
  String get delete => '삭제';

  @override
  String get save => '저장';

  @override
  String get securityTfaSectionTitle => '2단계 인증';

  @override
  String get securityTfaSectionDescription => '계정에 추가 보안 계층을 추가하세요.';

  @override
  String get securityTfaAuthenticatorApp => '인증 앱';

  @override
  String get securityTfaAuthenticatorEnabled => '2단계 인증이 활성화되었습니다.';

  @override
  String get securityTfaAuthenticatorDisabled =>
      '2단계 인증 코드를 생성하려면 인증 앱을 사용하세요.';

  @override
  String get securityTfaBackupCodes => '백업 코드';

  @override
  String get securityTfaBackupCodesDescription =>
      '계정 복구를 위한 백업 코드를 확인하고 관리하세요.';

  @override
  String get securityTfaViewCodes => '코드 보기';

  @override
  String get securityPasskeysSectionTitle => 'Passkey';

  @override
  String get securityPasskeysSectionDescription =>
      'Passkey를 사용하여 비밀번호 없이 로그인하고 2단계 인증을 하세요.';

  @override
  String get securityPasskeysRegistered => '등록된 Passkey';

  @override
  String get securityPasskeysNone => '등록된 Passkey가 없습니다.';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '보안 키',
      one: '보안 키',
    );
    return '등록된 $count개의 $_temp0 (최대 10개)';
  }

  @override
  String get securityPasskeysAdd => 'Passkey 추가';

  @override
  String securityPasskeysAdded(String date) {
    return '추가됨: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return '마지막 사용: $date';
  }

  @override
  String get securityPasskeysRename => '이름 변경';

  @override
  String get securityPasskeysDeleteTitle => 'Passkey 삭제';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return '정말로 \"$name\" Passkey를 삭제하시겠습니까?';
  }

  @override
  String get securityPasskeyNameTitle => 'Passkey 이름 지정';

  @override
  String get securityPasskeyNameLabel => 'Passkey 이름';

  @override
  String get securityPasskeyNameHint => '예: YubiKey, iPhone, 업무용 컴퓨터';

  @override
  String get securityPhoneSectionTitle => '전화번호';

  @override
  String get securityPhoneSectionDescription => '전화번호를 관리하세요.';

  @override
  String get securityPhoneLabel => '전화번호';

  @override
  String get securityPhoneNone => '전화번호가 추가되지 않았습니다.';

  @override
  String get securityPhoneAdd => '전화번호 추가';

  @override
  String get securityPhoneRemove => '삭제';

  @override
  String get securityPhoneRemoveTitle => '전화번호 삭제';

  @override
  String get securityPhoneRemoveDescription => '전화번호를 삭제하시겠습니까?';

  @override
  String get securityPhoneRemoved => '전화번호가 삭제되었습니다.';

  @override
  String get securityClaimTitle => '계정 소유권 주장';

  @override
  String get securityClaimDescription =>
      '2단계 인증 및 비밀번호 키와 같은 보안 기능을 사용하려면 계정 소유권을 주장하세요.';

  @override
  String get securityVerifyEmailRequired =>
      '2단계 인증, 비밀번호 키 또는 SMS 인증을 설정하기 전에 이메일 주소를 인증해야 합니다.';

  @override
  String get totpEnableTitle => '인증 앱 설정';

  @override
  String get totpEnableDescription => '인증 앱으로 QR 코드를 스캔하여 2단계 인증 코드를 생성하세요.';

  @override
  String get totpEnableCodeLabel => '코드';

  @override
  String get totpEnableCodeHint => '인증 앱에서 6자리 코드를 입력하세요';

  @override
  String get totpEnableSuccess => '2단계 인증이 활성화되었습니다.';

  @override
  String get totpDisableTitle => '인증 앱 삭제';

  @override
  String get totpDisableDescription => '2단계 인증을 비활성화하려면 인증 앱에서 6자리 코드를 입력하세요.';

  @override
  String get totpDisableSuccess => '2단계 인증이 비활성화되었습니다.';

  @override
  String get backupCodesTitle => '백업 코드';

  @override
  String get backupCodesWarning =>
      '인증 앱에 액세스할 수 없고 이 코드가 없으면 계정에 영구적으로 액세스할 수 없게 됩니다. 지금 다운로드하거나 복사하여 안전한 곳에 보관하세요.';

  @override
  String get backupCodesDownload => '다운로드';

  @override
  String get backupCodesCopy => '복사';

  @override
  String get backupCodesCopied => '백업 코드가 클립보드에 복사되었습니다.';

  @override
  String get backupCodesAcknowledge => '백업 코드를 다운로드하거나 복사하여 안전한 곳에 보관했습니다.';

  @override
  String get backupCodesDone => '완료';

  @override
  String get backupCodesViewTitle => '백업 코드 보기';

  @override
  String get backupCodesViewDescription => '백업 코드를 보기 전에 인증이 필요할 수 있습니다.';

  @override
  String get phoneAddTitle => '전화번호 추가';

  @override
  String get phoneAddLabel => '전화번호';

  @override
  String get phoneAddHint => '전화번호를 입력하세요';

  @override
  String get phoneAddFooter =>
      '코드가 준비되면 SMS로 보내드립니다. 전화번호는 계정에 연결되지 않습니다. 사용자 ID 없이 암호화된 마커만 보관하며, 약 30일 동안 최대 2회 인증할 수 있습니다.';

  @override
  String get phoneAddSendCode => '코드 보내기';

  @override
  String get phoneVerifyTitle => '전화번호 인증';

  @override
  String get phoneVerifyDescription => '전화번호로 전송된 인증 코드를 입력하세요.';

  @override
  String get phoneAddSuccess => '전화번호 인증 완료';

  @override
  String get phoneCountryLabel => '국가';

  @override
  String get phoneSearchCountries => '국가 검색...';

  @override
  String get phoneNumberRequired => '전화번호를 입력해주세요';

  @override
  String get phoneEnterValidNumber => '유효한 휴대폰 번호를 입력하세요.';

  @override
  String get phoneCannotBeUsed =>
      '이 전화번호는 사용할 수 없습니다. 다른 휴대폰 번호를 시도하거나 지원팀에 문의하세요.';

  @override
  String get phoneAlreadyUsed => '이 전화번호는 이미 사용 중입니다. 다른 번호를 시도하거나 지원팀에 문의하세요.';

  @override
  String get phoneCodeDidNotWork => '코드가 올바르지 않습니다. 다시 확인하고 시도해 주세요.';

  @override
  String get phoneTooManyAttempts => '시도 횟수가 너무 많습니다. 잠시 기다린 후 다시 시도해 주세요.';

  @override
  String get phoneSmsUnavailable =>
      '지금은 SMS 인증을 이용할 수 없습니다. 나중에 다시 시도하거나 지원팀에 문의하세요.';

  @override
  String get phoneNotEligible =>
      '이 계정에서는 전화 인증을 사용할 수 없습니다. 다른 방법을 사용하거나 지원팀에 문의하세요.';

  @override
  String get phoneCaptchaRequired =>
      '전화번호 인증 전에 브라우저 확인이 필요합니다. 로그인 페이지에서 다시 시도하거나 고객 지원팀에 문의하세요.';

  @override
  String get phoneSomethingWentWrong => '문제가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get phoneInboundExpensiveDescription =>
      '이 전화번호로 SMS를 보내는 것은 비용이 많이 들기 때문에, 대신 저희에게 SMS를 보내주셔야 합니다. 지원팀에 문의하여 계정에서 이 요구사항을 해제할 수도 있습니다.';

  @override
  String get phoneInboundDefaultDescription => '전화번호를 인증하려면 SMS를 보내주세요.';

  @override
  String get phoneInboundStepOpenMessaging =>
      '휴대폰 메시지 앱을 열고 새 문자 메시지를 작성해 주세요.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return '$code 코드를 $number로 보내세요.';
  }

  @override
  String get phoneInboundStepWait => '메시지를 받을 때까지 기다려 주세요. 1분 정도 소요될 수 있습니다.';

  @override
  String get phoneInboundGetNewCode => '새 코드 받기';

  @override
  String get phoneInboundChallengeCodeLabel => '보낼 코드';

  @override
  String get phoneInboundOurNumberLabel => '다음으로 전송';

  @override
  String get requiredActionTitle => '계정 인증 필요';

  @override
  String requiredActionIntroGeneric(String productName) {
    return '$productName을(를) 계속 사용하려면 필요한 인증을 완료하세요.';
  }

  @override
  String get requiredActionIntroPhone => '계속하려면 추가 스팸 방지 확인이 필요합니다.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return '$productName을(를) 계속 사용하려면 이메일 또는 전화번호를 인증하세요.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return '$productName을(를) 계속 사용하려면 아래에서 이메일 및 전화번호 인증을 완료하세요.';
  }

  @override
  String get requiredActionChooseMethodTitle => '인증 방법 선택';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return '$productName을(를) 계속 사용하려면 아래 인증 경로 중 하나를 완료하세요.';
  }

  @override
  String get requiredActionUseEmail => '이메일 사용';

  @override
  String get requiredActionUsePhone => '휴대폰 사용';

  @override
  String get requiredActionCheckEmailTitle => '이메일을 확인해 주세요';

  @override
  String get requiredActionCheckEmailDescription =>
      '이메일 주소로 인증 링크를 보냈습니다. 계속하려면 링크를 여세요.';

  @override
  String get requiredActionResendVerificationEmail => '인증 이메일 다시 보내기';

  @override
  String get requiredActionVerificationEmailSent =>
      '인증 이메일을 보냈습니다. 받은 편지함을 확인해 주세요.';

  @override
  String get requiredActionSignOut => '로그아웃';

  @override
  String get dangerZoneSectionTitle => '위험 구역';

  @override
  String get dangerZoneSectionDescription => '되돌릴 수 없는 파괴적인 작업';

  @override
  String get dangerZoneDisableTitle => '계정 비활성화';

  @override
  String get dangerZoneDisableDescription =>
      '계정을 일시적으로 비활성화합니다. 나중에 다시 로그인하여 다시 활성화할 수 있습니다.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      '계정을 비활성화하면 모든 세션에서 로그아웃됩니다. 다시 로그인하여 언제든지 계정을 다시 활성화할 수 있습니다.';

  @override
  String get dangerZoneDeleteTitle => '계정 삭제';

  @override
  String get dangerZoneDeleteDescription =>
      '계정 및 모든 관련 데이터를 영구적으로 삭제합니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      '계정을 삭제하기 전에 Plutonium 설정에서 활성 Plutonium 구독을 취소하세요.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => '계정을 삭제할 수 없습니다.';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      '커뮤니티를 소유하고 있는 동안에는 계정을 삭제할 수 없습니다. 먼저 다음 커뮤니티의 소유권을 이전하세요:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return '$count개 더';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return '소유권을 이전하려면 $settingsPath로 이동하여 소유권 이전 옵션을 사용하세요.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      '계정을 삭제하시겠습니까? 이 작업은 계정의 영구 삭제를 예약합니다.';

  @override
  String get dangerZoneDeleteBullet1 => '14일 이내에 삭제 절차를 취소할 수 있습니다.';

  @override
  String get dangerZoneDeleteBullet2 => '14일 후 계정이 영구적으로 삭제됩니다.';

  @override
  String get dangerZoneDeleteBullet3 => '삭제가 처리되면 계정에 더 이상 액세스할 수 없습니다.';

  @override
  String get dangerZoneDeleteBullet4 => '계정이 삭제된 후에는 보낸 메시지를 삭제할 수 없습니다.';

  @override
  String get dangerZoneDeleteDisclaimer =>
      '데이터를 내보내거나 먼저 메시지를 삭제하려면 진행하기 전에 사용자 설정의 개인정보 보호 대시보드 섹션을 방문하세요.';

  @override
  String get claimAccountTitle => '계정 소유권 주장';

  @override
  String get claimAccountDescription =>
      '이메일과 비밀번호를 추가하여 계정 소유권을 주장하세요. 완료하기 전에 이메일을 확인하기 위해 인증 코드를 보내드립니다.';

  @override
  String get claimAccountEmailLabel => '이메일';

  @override
  String get claimAccountPasswordLabel => '비밀번호';

  @override
  String get claimAccountSendCode => '코드 보내기';

  @override
  String get claimAccountVerifyDescription =>
      '인증을 위해 이메일로 보낸 코드를 입력하세요. 코드가 확인되면 비밀번호가 설정됩니다.';

  @override
  String get claimAccountSuccess => '계정이 성공적으로 등록되었습니다';

  @override
  String get importantInformation => '중요 정보:';

  @override
  String get genericError => '오류가 발생했습니다';

  @override
  String get networkErrorMessage => '문제가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get invalidCode => '잘못된 코드';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count년 전',
      one: '1년 전',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개월 전',
      one: '1개월 전',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 전',
      one: '1일 전',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count시간 전',
      one: '1시간 전',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분 전',
      one: '1분 전',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count주 전',
      one: '1주 전',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분 후',
      one: '1분 후',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count시간 후',
      one: '1시간 후',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 뒤',
      one: '하루 뒤',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count주 후',
      one: '1주 후',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개월 후',
      one: '1개월 후',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count년 후',
      one: '1년 후',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => '방금 전';

  @override
  String get authorizedAppsTitle => '승인된 애플리케이션';

  @override
  String authorizedAppsDescription(String productName) {
    return '다음 애플리케이션에 $productName 계정 액세스가 허용되었습니다.';
  }

  @override
  String get authorizedAppsEmptyTitle => '승인된 애플리케이션 없음';

  @override
  String get authorizedAppsEmptyDescription => '계정에 액세스하도록 승인한 애플리케이션이 없습니다.';

  @override
  String get authorizedAppsLoadError => '승인된 애플리케이션을 불러오지 못했습니다';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '$date에 승인됨';
  }

  @override
  String get authorizedAppsPermissionsGranted => '권한 부여됨';

  @override
  String get authorizedAppsRevoke => '철회';

  @override
  String get authorizedAppsRevokeTitle => '애플리케이션 액세스 철회';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return '정말로 $appName의 액세스를 철회하시겠습니까? 이 애플리케이션은 더 이상 계정에 액세스할 수 없습니다.';
  }

  @override
  String get authorizedAppsScopeIdentify => '기본 프로필 정보(사용자 이름, 아바타 등) 액세스';

  @override
  String get authorizedAppsScopeEmail => '이메일 주소 보기';

  @override
  String get authorizedAppsScopeGuilds => '가입한 커뮤니티 보기';

  @override
  String get authorizedAppsScopeConnections => '연결된 계정 보기';

  @override
  String get authorizedAppsScopeBot => '요청된 권한으로 커뮤니티에 봇 추가';

  @override
  String get authorizedAppsScopeAdmin => '관리자 엔드포인트 액세스';

  @override
  String get privacyPendingDeletionTitle => '삭제 대기 중';

  @override
  String get blockedUsersTitle => '차단된 사용자';

  @override
  String get blockedUsersDescription =>
      '차단된 사용자는 친구 요청을 보내거나 직접 메시지를 보낼 수 없습니다.';

  @override
  String get blockedUsersEmptyTitle => '차단된 사용자 없음';

  @override
  String get blockedUsersEmptyDescription => '아직 아무도 차단하지 않았습니다.';

  @override
  String get blockedUsersLoadError => '차단된 사용자를 불러오지 못했습니다';

  @override
  String get blockedUsersUnblock => '차단 해제';

  @override
  String get blockedUsersUnblockTitle => '사용자 차단 해제';

  @override
  String blockedUsersUnblockDescription(String username) {
    return '정말로 $username의 차단을 해제하시겠습니까?';
  }

  @override
  String get blockedUsersCopyTag => '사용자 이름 복사';

  @override
  String get blockedUsersCopyId => '사용자 ID 복사';

  @override
  String get userProfileLoadError => '프로필을 불러올 수 없습니다';

  @override
  String get userProfileLoading => '프로필 로드 중';

  @override
  String get userProfileRetry => '다시 시도';

  @override
  String get userProfileMessage => '메시지';

  @override
  String get userProfileVoiceCall => '음성 통화';

  @override
  String get userProfileVideoCall => '영상 통화';

  @override
  String get userProfileEditProfile => '프로필 수정';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName 팀';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName 커뮤니티 팀';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName 파트너';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName 버그 헌터';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return '$productName 플루토늄';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$date부터 $productName 플루토늄 구독자';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return '$productName 비저너리';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$date부터 $productName 비저너리';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return '비저너리 ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return '공통 친구 ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return '공통 커뮤니티 ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => '공통 친구';

  @override
  String get userProfileMutualCommunitiesTitle => '공통 커뮤니티';

  @override
  String get userProfileNoMutualFriends => '공통 친구가 없습니다.';

  @override
  String get userProfileNoMutualCommunities => '공통 커뮤니티가 없습니다.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return '닉네임: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DM 열기';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return '$username님을 차단했습니다. 차단을 해제하기 전까지는 메시지를 보낼 수 없습니다.';
  }

  @override
  String get blockedUserComposerBarrierAction => '차단 해제';

  @override
  String get userProfileOpenDm => 'DM 열기';

  @override
  String get userProfileNoteTitle => '메모';

  @override
  String get userProfileNoteVisibility => '(나에게만 보임)';

  @override
  String get userProfileNoteSave => '저장';

  @override
  String get userProfileNoteDelete => '삭제';

  @override
  String get userProfileNoteEmpty => '메모를 추가하려면 클릭하세요';

  @override
  String get userProfileMemberSince => '가입일';

  @override
  String get userProfileAboutMe => '자기소개';

  @override
  String get userProfileRoles => '역할';

  @override
  String get memberRoleAdd => '역할 추가';

  @override
  String memberRoleRemove(String roleName) {
    return '역할 $roleName 삭제';
  }

  @override
  String get userProfileNoRolesInCommunity => '이 사용자는 이 커뮤니티에서 역할이 없습니다.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return '아직 역할이 없습니다. $rolesSettingsPath에서 역할을 추가하세요';
  }

  @override
  String get memberRolesNoRolesAvailable => '역할 없음';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return '지금은 이 커뮤니티에 할당할 역할이 없지만, $rolesSettingsPath에서 새 역할을 만들 수 있습니다.';
  }

  @override
  String get guildSettingsTitle => '커뮤니티 설정';

  @override
  String get guildSettingsRolesTab => '역할';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => '현지 시간';

  @override
  String get userProfileSameTimeAsYou => '회원님과 동일한 시간대';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '회원님보다 $duration 빠름';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '회원님보다 $duration 느림';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours시간',
      one: '1시간',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes분',
      one: '1분',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours시간',
      one: '1시간',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes분',
      one: '1분',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => '사용자 이름 복사';

  @override
  String get userProfileCopyUserId => '사용자 ID 복사';

  @override
  String get userProfileViewMainProfile => '기본 프로필 보기';

  @override
  String get userProfileViewCommunityProfile => '커뮤니티 프로필 보기';

  @override
  String get userProfileBlockUser => '사용자 차단';

  @override
  String get userProfileUnblockUser => '사용자 차단 해제';

  @override
  String get userProfileRemoveFriend => '친구 삭제';

  @override
  String get userProfileBlockConfirmTitle => '사용자 차단';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '$username님을 차단하시겠습니까?';
  }

  @override
  String get userProfileUnblockConfirmTitle => '사용자 차단 해제';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '$username님의 차단을 해제하시겠습니까?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => '친구 삭제';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '$username님을 친구 목록에서 삭제하시겠습니까?';
  }

  @override
  String get userProfileFailedOpenDm => 'DM을 열 수 없습니다.';

  @override
  String get userProfileFailedSaveNote => '메모를 저장할 수 없습니다.';

  @override
  String get userProfileActionFailed => '작업 실패, 다시 시도해 주세요.';

  @override
  String get userProfileChangeNickname => '닉네임 변경';

  @override
  String get userProfileKick => '추방';

  @override
  String get userProfileBan => '차단';

  @override
  String get userProfileTimeout => '타임아웃';

  @override
  String get userProfileRemoveTimeout => '타임아웃 해제';

  @override
  String get userProfileTransferOwnership => '소유권 이전';

  @override
  String get userProfileReportUser => '사용자 신고';

  @override
  String get userProfileReportMessage => '메시지 신고';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '$username님을 추방하시겠습니까?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '$username님을 추방하시겠습니까? 다시 초대하면 다시 참여할 수 있습니다.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => '타임아웃 해제?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return '$username님은 이제 다시 메시지를 보내고, 반응하고, 음성 채널에 참여할 수 있습니다.';
  }

  @override
  String get userProfileTransferConfirmTitle => '소유권 이전?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return '이 커뮤니티의 소유권을 $username님에게 이전하시겠습니까? 이 작업은 되돌릴 수 없으며 모든 소유자 권한을 잃게 됩니다.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$username님 차단';
  }

  @override
  String get userProfileBanDurationLabel => '차단 기간';

  @override
  String get userProfileBanCustomSecondsLabel => '사용자 지정 기간(초)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return '$min초에서 $max초 사이의 값을 입력하세요';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => '메시지 기록 삭제';

  @override
  String get userProfileBanDeleteNone => '아무것도 삭제 안 함';

  @override
  String get userProfileBanDelete24h => '지난 24시간';

  @override
  String get userProfileBanDelete7d => '지난 7일';

  @override
  String get userProfileBanReasonLabel => '사유(선택 사항)';

  @override
  String get userProfileBanReasonHint => '차단 사유 입력';

  @override
  String get userProfileBanSubmit => '멤버 차단';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username님 타임아웃';
  }

  @override
  String get userProfileTimeoutDurationLabel => '타임아웃 기간';

  @override
  String get userProfileTimeoutSubmit => '멤버 타임아웃';

  @override
  String get userProfileNicknameLabel => '별명';

  @override
  String get userProfileNicknameHint => '별명 입력';

  @override
  String get userProfileNicknameSave => '저장';

  @override
  String userProfileKickSuccess(String username) {
    return '$username님을 추방했습니다';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username님을 차단했습니다';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username님 타임아웃 처리됨';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return '$username님의 타임아웃을 해제했습니다';
  }

  @override
  String get userProfileNicknameSuccess => '별명이 업데이트되었습니다';

  @override
  String get userProfileTransferSuccess => '소유권이 이전되었습니다';

  @override
  String get durationPermanent => '영구';

  @override
  String get duration60Seconds => '60초';

  @override
  String get duration5Minutes => '5분';

  @override
  String get duration10Minutes => '10분';

  @override
  String get duration1Hour => '1시간';

  @override
  String get duration12Hours => '12시간';

  @override
  String get duration1Day => '1일';

  @override
  String get duration3Days => '3일';

  @override
  String get duration5Days => '5일';

  @override
  String get duration1Week => '1주';

  @override
  String get duration2Weeks => '2주';

  @override
  String get duration1Month => '1개월';

  @override
  String get durationCustom => '사용자 지정…';

  @override
  String get iarReportUserTitle => '사용자 신고';

  @override
  String get iarReportGuildTitle => '커뮤니티 신고';

  @override
  String get iarReportGuildPreconfirmBody =>
      '이 신고가 이 커뮤니티의 특정 메시지에 관한 것이라면 해당 메시지를 신고해 주세요. 메시지 신고는 안전팀에 가장 명확한 맥락을 제공하며, 댓글에 세부 정보를 추가하면 더 빠르게 검토할 수 있습니다. 메시지 신고로 더 큰 문제를 파악할 수 없는 경우에만 커뮤니티 전체 신고를 진행해 주세요.';

  @override
  String get iarContinueToReportCommunity => '커뮤니티 신고 계속하기';

  @override
  String get iarPreviewCommunitySubtitle => '커뮤니티';

  @override
  String get iarReasonHarassmentGuildLabel => '괴롭힘 또는 표적 학대';

  @override
  String get iarReasonHarassmentGuildDescription =>
      '커뮤니티는 집단 공격 또는 표적 학대를 조장합니다.';

  @override
  String get iarReasonHateGuildDescription => '보호 대상 집단에 대한 증오 조장.';

  @override
  String get iarReasonTerrorismLabel => '테러 또는 폭력적 극단주의';

  @override
  String get iarReasonTerrorismDescription => '폭력적인 극단주의 활동을 조장, 모집 또는 조정합니다.';

  @override
  String get iarReasonMatureContentGuildLabel => '성인 콘텐츠 또는 안전하지 않은 콘텐츠 차단';

  @override
  String get iarReasonMatureContentGuildDescription => '적절한 제한이 없는 성인용 콘텐츠입니다.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      '미성년자를 위험에 빠뜨리거나 아동 착취 콘텐츠를 호스팅합니다.';

  @override
  String get iarReasonRaidLabel => '레이드 조율';

  @override
  String get iarReasonRaidDescription =>
      '특정인 또는 커뮤니티에 대한 공격, 집단 괴롭힘, 또는 희롱을 조장합니다.';

  @override
  String get iarReasonSpamGuildDescription =>
      '커뮤니티는 스팸, 사기 또는 플랫폼 남용을 위해 존재합니다.';

  @override
  String get iarReasonMalwareGuildLabel => '악성코드 유포';

  @override
  String get iarReasonMalwareGuildDescription =>
      '멀웨어, 개인 정보 도용 또는 유해 파일을 배포합니다.';

  @override
  String get iarReasonPrivacyGuildLabel => '개인 정보 침해 또는 신상 털이';

  @override
  String get iarReasonPrivacyGuildDescription =>
      '개인 정보를 공유하거나, 다른 사용자를 스토킹하거나, 개인 정보 침해를 조장합니다.';

  @override
  String get iarReasonSelfHarmGuildLabel => '자해 권유';

  @override
  String get iarReasonSelfHarmGuildDescription => '자살, 자해 또는 섭식 장애 조장.';

  @override
  String get iarReasonInappropriateProfile => '부적절한 프로필';

  @override
  String get iarReasonInappropriateProfileDescription =>
      '이 사용자의 프로필에 부적절한 콘텐츠가 포함되어 있습니다';

  @override
  String typingIndicatorOne(String name) {
    return '$name님이 입력 중...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1님과 $name2님이 입력 중...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1님, $name2님, $name3님이 입력 중...';
  }

  @override
  String get typingIndicatorMultiple => '여러 명이 입력 중...';

  @override
  String get typingIndicatorHandful => '몇몇 키보드 워리어들이 모이고 있습니다...';

  @override
  String get typingIndicatorSymphony => '키보드 소리의 교향곡이 시작되었습니다...';

  @override
  String get typingIndicatorFiesta => '여기서 완전한 타이핑 축제가 벌어지고 있습니다';

  @override
  String get typingIndicatorApocalypse => '와, 타이핑 대재앙이에요';

  @override
  String systemJoinGladYoureHere(String username) {
    return '$username님, 와주셔서 기뻐요!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return '$username님, 환영해요! 편하게 계세요.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return '$username님, 안녕하세요! 함께하게 되어 기쁩니다.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return '$username님, 안녕하세요! 준비되시면 언제든 참여하세요.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return '$username님, 만나서 반가워요! 와주셔서 기쁩니다!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return '$username님, 안녕하세요! 즐거운 시간 보내시길 바랍니다.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return '$username님, 환영합니다!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return '$username님, 와주셔서 기뻐요!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return '$username님, 환영합니다!';
  }

  @override
  String systemJoinWelcome(String username) {
    return '$username님, 환영합니다!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return '$username님, 환영합니다! 함께하게 되어 기쁩니다.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return '$username님, 환영합니다! 이곳에서 즐거운 시간을 보내시길 바랍니다.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return '$username님, 환영합니다! 다음 대화가 여기서 시작됩니다.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return '$username님, 환영합니다. 함께하게 되어 기쁩니다.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '$username님, 만나서 반가워요! 환영합니다.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return '$username님, 오셨군요! 함께하게 되어 좋습니다.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return '$username님, 도착하셨군요! 시작해 봅시다.';
  }

  @override
  String get relativeTimeShortNow => '지금';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분',
      one: '1분',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count시간',
      one: '1시간',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일',
      one: '1일',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개월',
      one: '1개월',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count년',
      one: '1년',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => '내 기기';

  @override
  String get linkedDevicesDescription =>
      '현재 계정에 로그인된 모든 기기를 확인하세요. 알 수 없는 세션은 연결을 해제하세요.';

  @override
  String get linkedDevicesCurrentDevice => '현재 기기';

  @override
  String get linkedDevicesOtherDevices => '다른 기기';

  @override
  String get linkedDevicesEnterSelection => '선택 모드 시작';

  @override
  String get linkedDevicesExitSelection => '선택 모드 종료';

  @override
  String get linkedDevicesSelectAll => '모두 선택';

  @override
  String get linkedDevicesClearSelection => '선택 해제';

  @override
  String get linkedDevicesRevokeTooltip => '기기 연결 해제';

  @override
  String get linkedDevicesSignOutAll => '다른 모든 기기 로그아웃';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기기 $count개 로그아웃',
      one: '기기 1개 로그아웃',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기기 $count개 로그아웃',
      one: '기기 1개 로그아웃',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle => '다른 모든 기기 로그아웃';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '선택한 기기들의 계정에서 로그아웃됩니다. 해당 기기들에서 다시 로그인해야 합니다.',
      one: '선택한 기기의 계정에서 로그아웃됩니다. 해당 기기에서 다시 로그인해야 합니다.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      '선택한 기기들의 계정에서 로그아웃됩니다. 해당 기기들에서 다시 로그인해야 합니다.';

  @override
  String get linkedDevicesSignOutConfirm => '계속';

  @override
  String get linkedDevicesLogoutDisclaimer => '로그아웃된 모든 기기에서 다시 로그인해야 합니다.';

  @override
  String get linkedDevicesLoadErrorTitle => '네트워크 오류';

  @override
  String get linkedDevicesLoadErrorDescription =>
      '시공간 연속체에 연결하는 데 문제가 있습니다. 연결 상태를 확인하고 다시 시도해 주세요.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '기기 연결 해제됨',
      one: '기기 연결 해제됨',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => '로그아웃할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get linkedDevicesUnknownOs => '알 수 없는 OS';

  @override
  String get linkedDevicesUnknownPlatform => '알 수 없는 플랫폼';

  @override
  String slowmodeLabel(String duration) {
    return '$duration 느린 모드';
  }

  @override
  String get slowmodeTooltipActive => '느린 모드입니다. 메시지를 보내기 전에 잠시 기다려 주세요.';

  @override
  String get slowmodeTooltipImmune => '느린 모드가 활성화되었지만 면역 대상입니다.';

  @override
  String get slowmodeStatusEnabled => '슬로우 모드 활성화됨';

  @override
  String slowmodeStatusActive(String remaining) {
    return '슬로우 모드 활성화 중 ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return '슬로우 모드가 $durationLabel로 설정되어 있지만, 당신은 면제됩니다.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return '슬로우 모드가 $durationLabel로 설정되어 있습니다. 다음 메시지를 보내기 전에 기다려 주세요.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return '이 채널은 슬로우 모드가 $durationLabel로 설정되어 있습니다.';
  }

  @override
  String get channelNoSendPermissionHint => '이 채널에서는 메시지를 보낼 수 없습니다.';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productName 팀의 시스템 공지입니다. 답장할 수 없습니다.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      '이 커뮤니티에서는 메시지 전송이 일시적으로 중단되었습니다.';

  @override
  String get channelComposerBarrierTimedOut =>
      '타임아웃되었습니다. 타임아웃이 만료될 때까지 메시지, 반응, 음성 사용이 중지됩니다.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      '이 커뮤니티에서 메시지를 보내려면 계정을 등록해야 합니다.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      '이 커뮤니티에서 메시지를 보내려면 이메일을 인증해야 합니다.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      '계정이 너무 최신이라 이 커뮤니티에서 메시지를 보낼 수 없습니다.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      '이 커뮤니티의 멤버가 된 지 충분하지 않아 메시지를 보낼 수 없습니다.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      '이 커뮤니티에서 메시지를 보내려면 전화번호를 인증해야 합니다.';

  @override
  String get channelComposerBarrierVerifyEmail => '이메일 인증';

  @override
  String get channelComposerBarrierVerifyPhone => '전화번호 인증';

  @override
  String chatAttachmentTooMany(int max) {
    return '첨부 파일이 너무 많습니다(최대 $max개)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName이(가) 크기 제한을 초과합니다 ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge => '파일이 너무 커서 함께 보낼 수 없습니다';

  @override
  String get chatAttachmentDropToUpload => '파일을 여기에 놓아 업로드하세요';

  @override
  String get chatAttachmentDropToSend => '파일을 여기에 놓아 즉시 보내세요';

  @override
  String get chatAttachmentSendVoiceMessage => '음성 메시지 보내기';

  @override
  String get voiceMessageTitle => '음성 메시지';

  @override
  String get voiceMessageHoldHint =>
      '누르고 있으면 녹음됩니다. 휴지통으로 드래그하면 삭제, 위로 밀면 잠금, 놓으면 전송됩니다.';

  @override
  String get voiceMessageDiscard => '음성 메시지 삭제';

  @override
  String get voiceMessageSend => '음성 메시지 보내기';

  @override
  String get voiceMessageMicPermissionDenied =>
      '녹음을 시작할 수 없습니다. 마이크 접근을 허용하세요.';

  @override
  String get voiceMessageRecordingNotSupported => '이 기기에서는 음성 녹음을 지원하지 않습니다.';

  @override
  String get voiceMessageMicInUse => '음성 메시지를 녹음하려면 음성 통화를 종료하세요.';

  @override
  String get voiceMessageRecordingFailed => '녹음 실패. 다시 시도하세요.';

  @override
  String get voiceMessageSendFailed => '음성 메시지를 보낼 수 없습니다. 다시 시도하세요.';

  @override
  String get voiceMessageRecordingHint =>
      '지금 말하세요. 완료되면 중지를 누르세요. 나중에 다듬을 수 있습니다.';

  @override
  String get voiceMessageReviewHint => '핸들을 드래그하여 다듬은 다음 보내기를 누르세요.';

  @override
  String get voiceMessageStop => '중지';

  @override
  String get voiceMessageStartRecording => '녹음 시작';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => '재생';

  @override
  String get voiceMessagePause => '일시 중지';

  @override
  String get voiceMessageSeekForward => '음성 메시지 앞으로 건너뛰기';

  @override
  String get voiceMessageSeekBackward => '뒤로 감기';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return '선택 영역은 최소 $secondsString초여야 합니다.';
  }

  @override
  String get chatAttachmentEditTitle => '첨부 파일 편집';

  @override
  String get chatAttachmentFilenameLabel => '파일 이름';

  @override
  String get chatAttachmentDescriptionLabel => '설명';

  @override
  String get chatAttachmentDescriptionHint => '선택 사항: 대체 텍스트';

  @override
  String get chatAttachmentSpoilerLabel => '스포일러로 표시';

  @override
  String get chatAttachmentRemove => '첨부 파일 삭제';

  @override
  String get chatAttachmentDownload => '다운로드';

  @override
  String get chatAttachmentDownloadedToast => '사진에 저장됨';

  @override
  String get chatAttachmentDownloadFailedToast => '첨부 파일을 다운로드할 수 없습니다.';

  @override
  String get chatAttachmentExpiredTooltip => '첨부 파일 만료됨';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '확장 ($count줄)',
      one: '확장 ($count줄)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '줄 ($count개 접기)',
      one: '줄 ($count개 접기)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '확장 ($count개 행)',
      one: '확장 ($count개 행)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '행 $count개 접기',
      one: '행 $count개 접기',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count줄 남음)',
      one: '... ($count줄 남음)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count개 남음)',
      one: '... ($count개 남음)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => '파일 전체 보기';

  @override
  String get chatTextualPreviewChangeLanguage => '언어 변경';

  @override
  String get chatTextualPreviewSearchLanguage => '언어 검색…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => '구문 강조';

  @override
  String get chatTextualPreviewNoLanguagesFound => '검색 결과 없음';

  @override
  String get chatTextualPreviewMoreOptions => '더 보기';

  @override
  String get chatTextualPreviewWrapText => '텍스트 줄 바꿈';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return '파일이 너무 커서 미리 볼 수 없습니다(제한 ${previewLimitKb}KB).';
  }

  @override
  String get chatTextualPreviewLoadError => '미리보기를 불러올 수 없습니다.';

  @override
  String get chatTextualPreviewLanguagePlaintext => '일반 텍스트';

  @override
  String get chatTextualPreviewCopy => '복사';

  @override
  String get chatAttachmentSourceGallery => '갤러리';

  @override
  String get chatAttachmentSourceCamera => '카메라';

  @override
  String get chatAttachmentSourceBrowse => '파일 찾아보기';

  @override
  String get chatAttachmentPasteTooltip => '클립보드에서 파일 붙여넣기';

  @override
  String get chatAttachmentSpoiler => '스포일러';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => '스포일러 보기';

  @override
  String get matureMediaRevealButton => '보기';

  @override
  String get matureMediaRevealHint => '보려면 클릭하세요';

  @override
  String get matureContentTitle => '성인용 콘텐츠';

  @override
  String get matureCommunityTitle => '성인용 커뮤니티';

  @override
  String get matureCategoryTitle => '성인용 카테고리';

  @override
  String get matureChannelTitle => '성인용 채널';

  @override
  String get communityContentWarningTitle => '커뮤니티 콘텐츠 경고';

  @override
  String get categoryContentWarningTitle => '카테고리 콘텐츠 경고';

  @override
  String get channelContentWarningTitle => '채널 콘텐츠 경고';

  @override
  String get defaultContentWarningBody => '이 콘텐츠는 민감한 내용을 포함하고 있습니다.';

  @override
  String get matureCommunityBody =>
      '이 커뮤니티는 성인용 콘텐츠로 표시되었으며 일부 사용자에게 부적절할 수 있는 자료를 포함할 수 있습니다.';

  @override
  String get matureCategoryBody =>
      '이 카테고리는 성인용 콘텐츠로 표시되었으며 일부 사용자에게 부적절할 수 있는 자료를 포함할 수 있습니다.';

  @override
  String get matureChannelBody =>
      '이 채널은 성인용 콘텐츠로 표시되었으며 일부 사용자에게 부적절할 수 있는 자료를 포함할 수 있습니다.';

  @override
  String get matureVoiceChannelBody =>
      '이 음성 채널은 성인용 콘텐츠로 표시되었으며 일부 사용자에게 부적절할 수 있는 자료를 포함할 수 있습니다.';

  @override
  String get matureLinkChannelBody =>
      '이 링크 채널은 성인용 콘텐츠로 표시되었으며 일부 사용자에게 부적절할 수 있는 자료를 열 수 있습니다.';

  @override
  String get matureCommunityUnavailableBody => '이 성인용 커뮤니티는 계정에서 사용할 수 없습니다.';

  @override
  String get matureCategoryUnavailableBody => '이 성인용 카테고리는 계정에서 사용할 수 없습니다.';

  @override
  String get matureChannelUnavailableBody => '이 성인용 채널은 계정에서 사용할 수 없습니다.';

  @override
  String get matureContentProceedButton => '계속하기';

  @override
  String get matureContentUnderstandButton => '이해했습니다';

  @override
  String get matureContentOpenLinkButton => '링크 열기';

  @override
  String get sensitiveContentSectionTitle => '민감한 콘텐츠';

  @override
  String get sensitiveContentSectionDescription =>
      '다양한 상황에서 성인용 또는 민감한 미디어가 필터링되는 방식을 제어하세요.';

  @override
  String get sensitiveContentFriendDmLabel => '친구로부터 온 다이렉트 메시지';

  @override
  String get sensitiveContentNonFriendDmLabel => '다른 사람으로부터 온 다이렉트 메시지';

  @override
  String get sensitiveContentGuildLabel => '커뮤니티 채널의 메시지';

  @override
  String get sensitiveContentFilterShow => '보기';

  @override
  String get sensitiveContentFilterBlur => '흐리게 처리';

  @override
  String get sensitiveContentFilterBlock => '차단';

  @override
  String get sensitiveContentBlurUnscannedLabel => '안전 검사 완료 시까지 미디어 흐리게 하기';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      '사용 설정하면, 콘텐츠 안전 검사가 완료될 때까지 이미지와 동영상이 흐리게 처리됩니다.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      '이 설정은 계정에 항상 사용 설정되어 있습니다.';

  @override
  String get sensitiveContentResetButton => '초기화';

  @override
  String get sensitiveContentSaveButton => '저장';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 파일',
      one: '파일 1개',
    );
    return '$_temp0 업로드 중';
  }

  @override
  String get chatCancelUpload => '업로드 취소';

  @override
  String chatAttachmentExpiresOn(String date) {
    return '$date 만료';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return '$start ~ $end 사이 만료';
  }

  @override
  String get connectionsTitle => '연결';

  @override
  String connectionsDescription(String productName) {
    return '외부 계정 및 도메인을 $productName 프로필에 연결하세요. 인증된 연결은 프로필에 표시되어 다른 사용자가 볼 수 있습니다.';
  }

  @override
  String get connectionsEmptyTitle => '아직 연결된 항목이 없습니다';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      '프로필에 표시할 Bluesky 계정을 연결하거나 도메인 소유권을 확인하세요.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      '프로필에 표시할 도메인 소유권을 확인하세요.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => '도메인';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bluesky 연결 추가';

  @override
  String get connectionsAddDomainAriaLabel => '도메인 연결 추가';

  @override
  String get connectionEdit => '수정';

  @override
  String get connectionRemove => '삭제';

  @override
  String get connectionVerifiedLabel => '이 연결은 인증되었습니다.';

  @override
  String get connectionUnverifiedLabel => '이 연결은 인증되지 않았습니다.';

  @override
  String get connectionAddTitle => '연결 추가';

  @override
  String get connectionTypeLabel => '연결 유형';

  @override
  String get connectionHandleLabel => '핸들';

  @override
  String get connectionDomainLabel => '도메인';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => '이미 이 연결이 있습니다.';

  @override
  String get connectionConnectBluesky => 'Bluesky로 연결';

  @override
  String get connectionContinue => '계속';

  @override
  String get connectionVerifyTitle => '연결 확인';

  @override
  String get connectionVerifyInstructions => '아래 레코드를 사용하여 도메인 소유권을 증명하세요.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT 레코드';

  @override
  String get connectionDnsHostLabel => '호스트';

  @override
  String get connectionDnsValueLabel => '값';

  @override
  String get connectionCopyHost => '호스트 복사';

  @override
  String get connectionCopyValue => '값 복사';

  @override
  String get connectionCopied => '복사됨!';

  @override
  String get connectionTokenFileTitle => '토큰 파일 제공';

  @override
  String get connectionTokenFileDescription =>
      '**fluxer-verification**을 다운로드하여 **.well-known** 폴더에 배치하면 도메인을 확인할 수 있습니다.';

  @override
  String get connectionTokenFileDownload => 'fluxer-verification 다운로드';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return '이 파일에는 **$dnsUrl**에서 가져올 인증 토큰이 포함되어 있습니다.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'fluxer-verification 저장';

  @override
  String get connectionVerifyButton => '확인';

  @override
  String get connectionBack => '뒤로';

  @override
  String get connectionEditTitle => '연결 수정';

  @override
  String get connectionEditDescription => '프로필에서 이 연결을 누가 볼 수 있는지 선택하세요.';

  @override
  String get connectionVisibilityEveryone => '모든 사람';

  @override
  String get connectionVisibilityEveryoneDesc =>
      '모든 사람이 프로필에서 이 연결을 볼 수 있도록 허용';

  @override
  String get connectionVisibilityFriends => '친구';

  @override
  String get connectionVisibilityFriendsDesc => '친구가 이 연결을 볼 수 있도록 허용';

  @override
  String get connectionVisibilityCommunityMembers => '커뮤니티 회원';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      '가입한 커뮤니티의 회원이 이 연결을 볼 수 있도록 허용';

  @override
  String get connectionRemoveTitle => '연결 삭제';

  @override
  String get connectionRemoveDescription => '이 연결을 삭제하시겠습니까? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get connectionRemoveConfirm => '삭제';

  @override
  String get connectionsLoadError => '연결을 로드하지 못했습니다.';

  @override
  String get connectionsReorderError => '순서 업데이트 실패';

  @override
  String get connectionInitiateFailed => '확인 시작 불가. 다시 시도하세요.';

  @override
  String get connectionVerifyFailed => '확인 불가. DNS 레코드를 확인하고 다시 시도하세요.';

  @override
  String get connectionBlueskyAuthorizeFailed => 'Bluesky 인증 시작 불가.';

  @override
  String get connectionUpdateFailed => '연결 업데이트 불가';

  @override
  String get connectionRemoveFailed => '연결 삭제 불가';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification 저장됨';

  @override
  String get connectionTokenSaveFailedToast => '파일 저장 불가';

  @override
  String get connectionEnterHandle => 'Bluesky 핸들을 입력하세요.';

  @override
  String get connectionEnterDomain => '도메인을 입력하세요.';

  @override
  String get lookAndFeelTitle => '모양 및 느낌';

  @override
  String get lookAndFeelThemeSectionTitle => '테마';

  @override
  String get lookAndFeelThemeSectionDescription =>
      '어둡게, 석탄색 또는 밝은 모양 중에서 선택하세요.';

  @override
  String get lookAndFeelHdrSectionTitle => '높은 동적 범위';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'HDR 지원 모니터에서 HDR 이미지가 표시되는 방식을 제어합니다.';

  @override
  String get lookAndFeelHdrFullName => '풀 다이내믹 레인지';

  @override
  String get lookAndFeelHdrFullDescription => 'HDR 이미지를 최대 밝기 및 색상 범위로 표시합니다.';

  @override
  String get lookAndFeelHdrStandardName => '표준 범위';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'HDR 이미지를 표준 범위로 톤 매핑하여 최고 밝기를 줄입니다.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'HDR 디스플레이 모드';

  @override
  String get lookAndFeelThemeDark => '어두운 테마';

  @override
  String get lookAndFeelThemeCoal => '석탄 테마';

  @override
  String get lookAndFeelThemeLight => '밝은 테마';

  @override
  String get lookAndFeelThemeSystem => '시스템 테마';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel => '기기 간 테마 동기화';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      '활성화하면 테마 변경 사항이 모든 기기로 동기화됩니다. 비활성화하면 이 기기에서 자체 테마 설정을 사용합니다.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      '시스템 테마는 이 기기에서 시스템의 기본 설정을 추적하기 위해 동기화를 자동으로 비활성화합니다.';

  @override
  String get lookAndFeelThemeSyncFailed => '테마를 계정으로 동기화할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get lookAndFeelChatFontScalingTitle => '채팅 글자 크기';

  @override
  String get lookAndFeelChatFontScalingDescription => '채팅 영역의 글꼴 크기를 조절합니다.';

  @override
  String get lookAndFeelChatFontSizeLabel => '채팅 글자 크기';

  @override
  String get lookAndFeelAppZoomTitle => '앱 확대/축소 수준';

  @override
  String get lookAndFeelAppZoomDescription => '앱 확대/축소 수준을 조정합니다.';

  @override
  String get lookAndFeelChatWallpaperTitle => '채팅 배경화면';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      '채팅 배경을 선택하세요. 이 배경은 이 기기에 저장됩니다.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip => '이 설정은 이 기기에 유지됩니다';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      '채팅 배경화면은 이 기기에만 저장되며 다른 기기로 동기화되지 않습니다.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => '기본';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => '사용자 지정 이미지';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return '색상 $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return '그라데이션 $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => '배경 화면 어둡게';

  @override
  String get lookAndFeelChatWallpaperPickFailed => '이미지를 배경화면으로 설정할 수 없습니다.';

  @override
  String get lookAndFeelMessagesSectionTitle => '메시지';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      '채팅 채널에서 메시지가 표시되는 방식을 선택하세요.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => '메시지 그룹 간 간격';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => '메시지 표시 모드';

  @override
  String get lookAndFeelMessageDisplayComfyName => '편안하게';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      '메시지 간 구분이 명확하여 시원시원한 레이아웃입니다.';

  @override
  String get lookAndFeelMessageDisplayDenseName => '좁게';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      '메시지 간격을 최소화하여 더 많은 메시지를 볼 수 있습니다.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => '프로필 사진 숨기기';

  @override
  String get lookAndFeelInterfaceTitle => '인터페이스';

  @override
  String get lookAndFeelInterfaceDescription => '인터페이스 요소 및 동작을 사용자 지정합니다.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle => '채널 목록 입력 표시기';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      '채널에서 누군가 입력 중일 때 채널 목록에 입력 표시기가 나타나는 방식을 선택합니다.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName => '입력 표시기 + 아바타';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      '채널 목록에서 사용자 아바타와 함께 입력 표시기를 표시합니다.';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName => '입력 표시기만';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      '아바타 없이 입력 표시기만 표시합니다.';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => '숨김';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      '채널 목록에서 입력 표시기를 표시하지 않습니다.';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      '선택한 채널에 입력 표시';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      '비활성화(기본값)하면 현재 보고 있는 채널에 입력 표시기가 나타나지 않습니다.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => '일반';

  @override
  String get lookAndFeelKeyboardHintsTitle => '키보드 힌트';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      '툴팁에 키보드 단축키 힌트가 표시되는지 여부를 제어합니다.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel => '툴팁에서 키보드 힌트 숨기기';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      '활성화하면 툴팁 팝업에서 단축키 배지가 숨겨집니다.';

  @override
  String get lookAndFeelNekoTitle => '기타';

  @override
  String get lookAndFeelNekoDescription => '기타 인터페이스 옵션입니다.';

  @override
  String get lookAndFeelShowNekoLabel => 'Neko 표시';

  @override
  String get lookAndFeelShowNekoDescription => '활성화하면 Neko가 채팅 입력창 근처에 나타납니다.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle => '음성 채널 참여 동작';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      '커뮤니티에서 음성 채널에 참여하는 방식을 제어합니다.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel => '음성 채널 참여 시 더블 클릭 필요';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      '활성화하면 음성 채널에 참여하려면 두 번 클릭해야 합니다. 비활성화(기본값)하면 한 번 클릭하면 즉시 채널에 참여합니다.';

  @override
  String get lookAndFeelChatFontPreviewSample => '빠른 갈색 여우가 게으른 개를 뛰어넘습니다.';

  @override
  String get lookAndFeelGuildSidebarTitle => '서버 사이드바';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      '서버 사이드바에서 직접 메시지를 표시하는 방법을 구성합니다.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 커뮤니티가 플럭스 커패시터 오작동으로 인해 일시적으로 사용할 수 없습니다.',
      one: '1개의 커뮤니티가 플럭스 커패시터 오작동으로 인해 일시적으로 사용할 수 없습니다.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable => '커뮤니티를 일시적으로 이용할 수 없습니다';

  @override
  String get guildUnavailableDescription => '문제가 발생했습니다. 다시 시도 중입니다.';

  @override
  String get guildNotFoundTitle => '찾으시는 커뮤니티가 아닌 것 같아요.';

  @override
  String get guildNotFoundDescription => '찾으시는 커뮤니티가 삭제되었거나 접근 권한이 없을 수 있습니다.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName은(는) 현재 $productName 직원만 이용할 수 있습니다';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => '일시적으로 이용 불가';

  @override
  String get lookAndFeelCollapseDMsLabel => 'DM을 폴더로 축소';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return '활성화하면 서버 사이드바의 읽지 않은 DM이 $productName 버튼 폴더로 축소됩니다. 폴더를 확장하거나 축소하려면 DM 페이지에서 $productName 버튼을 클릭하세요.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => '채널 목록';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      '채널 목록에서 음소거된 채널의 읽지 않은 표시기 동작을 제어합니다.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      '음소거된 채널에 읽지 않음 표시';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      '활성화하면 음소거된 채널 왼쪽에 흐릿한 읽지 않음 표시기가 표시됩니다. 멘션은 이 설정과 관계없이 항상 표시됩니다.';

  @override
  String get lookAndFeelActiveNowSectionTitle => '지금 활동 중';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      '앱 전체에서 지금 활동 중이 표시되는 방식을 제어합니다.';

  @override
  String get lookAndFeelShowActiveNowLabel => '홈 화면에 지금 활동 중 표시';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      '홈 화면에 지금 활동 중을 표시하여 음성 채널에서 활동 중인 친구를 보여줍니다. 미리 보기, 채널 컨텍스트, 이미 참여 중인 사용자, 그리고 참여할 수 있는 빠른 방법을 볼 수 있습니다.';

  @override
  String get lookAndFeelFavoritesSectionTitle => '즐겨찾기';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      '앱 전체에서 즐겨찾기의 표시 여부를 제어합니다.';

  @override
  String get lookAndFeelEnableFavoritesLabel => '즐겨찾기 활성화';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      '활성화하면 채널을 즐겨찾기에 추가할 수 있으며 즐겨찾기 섹션에 표시됩니다. 비활성화하면 즐겨찾기 관련 UI 요소(버튼, 메뉴 항목)가 모두 숨겨집니다. 기존 즐겨찾기는 유지됩니다.';

  @override
  String get favoritesTitle => '즐겨찾기';

  @override
  String get favoritesEmptyTitle => '아직 즐겨찾기가 없습니다';

  @override
  String get favoritesEmptyDescription => '채팅 헤더에서 채널을 별표 표시하여 여기에 보관하세요.';

  @override
  String get favoritesWelcomeTitle => '즐겨찾기에 오신 것을 환영합니다';

  @override
  String get favoritesWelcomeDescription =>
      '좋아하는 채널, DM 및 그룹에 빠르게 액세스할 수 있는 나만의 공간입니다. 채널에서 별표를 눌러 여기에 추가하세요.';

  @override
  String get favoritesWelcomeTip => '마음에 들지 않으신가요? 언제든지 끌 수 있습니다.';

  @override
  String get favoritesDisableButton => '즐겨찾기 비활성화';

  @override
  String get favoritesAddedToast => '즐겨찾기에 추가됨';

  @override
  String get favoritesRemovedToast => '즐겨찾기에서 삭제됨';

  @override
  String get favoritesHiddenToast => '즐겨찾기 숨김';

  @override
  String get favoritesMute => '즐겨찾기 음소거';

  @override
  String get favoritesUnmute => '즐겨찾기 음소거 해제';

  @override
  String get favoritesHeaderMenu => '즐겨찾기 메뉴';

  @override
  String get favoritesCreateCategory => '카테고리 만들기';

  @override
  String get favoritesCategoryNameLabel => '카테고리 이름';

  @override
  String get favoritesHideMutedChannels => '음소거된 채널 숨기기';

  @override
  String get favoritesShowMutedChannels => '음소거된 채널 표시';

  @override
  String get favoritesSetNickname => '별명 설정';

  @override
  String get favoritesNicknameLabel => '별명';

  @override
  String get favoritesSaveNickname => '별명 저장';

  @override
  String get favoritesMoveToCategory => '카테고리로 이동';

  @override
  String get favoritesUncategorized => '미분류';

  @override
  String get favoritesOtherCategory => '기타';

  @override
  String get favoritesRemoveFromFavorites => '즐겨찾기에서 삭제';

  @override
  String get favoritesAddToFavorites => '즐겨찾기에 추가';

  @override
  String get favoritesAddToSavedMedia => '저장한 미디어에 추가';

  @override
  String get favoritesRemoveFromSavedMedia => '저장된 미디어에서 제거';

  @override
  String get favoritesAddToUrlOnlyGifFavorites => 'URL 전용 GIF 즐겨찾기에 추가';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites => 'URL 전용 GIF 즐겨찾기에서 제거';

  @override
  String get savedMediaAddTitle => '저장한 미디어에 추가';

  @override
  String get savedMediaFormNameLabel => '이름';

  @override
  String get savedMediaFormNameHint => '내 멋진 미디어';

  @override
  String get savedMediaFormAltTextLabel => '대체 텍스트';

  @override
  String get savedMediaFormAltTextHint => '미디어 설명';

  @override
  String get savedMediaFormTagsLabel => '태그';

  @override
  String get savedMediaFormTagsHint => '재미, 반응, 업무';

  @override
  String get savedMediaSaveError => '저장된 미디어를 업데이트할 수 없습니다.';

  @override
  String get savedMediaNameRequired => '이름을 입력해 주세요.';

  @override
  String get gifFavoriteFirstTimeTitle => 'GIF 즐겨찾기를 어떻게 저장할까요?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      '별표 표시한 GIF를 URL만 저장된 즐겨찾기로 저장하거나 저장된 미디어에 업로드할 수 있습니다. 사용 방식에 맞는 것을 선택하세요. 설정 > 고급 > 미디어에서 언제든지 변경할 수 있습니다.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL 전용 즐겨찾기(기본값): 기기 간 동기화되며, 업로드되지 않고 저장된 미디어에 포함되지 않습니다. 원본 미디어가 호스트에서 삭제될 경우 사라질 수 있습니다.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      '저장된 미디어: 업로드, 태그 지정, 검색 및 영구 저장이 가능하지만 저장된 미디어 제한에 포함됩니다.';

  @override
  String get gifFavoriteFirstTimeHint => '한 번만 여쭤볼게요.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'URL만 사용 (권장)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => '저장된 미디어 사용';

  @override
  String get favoritesHideConfirmTitle => '즐겨찾기 숨기기';

  @override
  String get favoritesHideConfirmDescription =>
      '이렇게 하면 버튼 및 메뉴 항목을 포함한 모든 즐겨찾기 관련 UI 요소가 숨겨집니다. 기존 즐겨찾기는 유지되며 언제든지 설정 > 고급 > 모양에서 다시 활성화할 수 있습니다.';

  @override
  String get favoritesDirectMessageSubtitle => '다이렉트 메시지';

  @override
  String get messagesMediaDisplayGroupTitle => '표시';

  @override
  String get messagesMediaDisplayGroupDescription =>
      '메시지, 미디어 및 기타 콘텐츠가 표시되는 방식을 제어합니다.';

  @override
  String get messagesMediaMediaGroupTitle => '미디어';

  @override
  String get messagesMediaMediaGroupDescription =>
      '미디어 크기 기본 설정 및 버튼을 사용자 지정합니다.';

  @override
  String get messagesMediaInputGroupTitle => '입력';

  @override
  String get messagesMediaInputGroupDescription => '메시지 입력 설정을 사용자 지정합니다.';

  @override
  String get messagesMediaSidebarGroupTitle => '사이드바';

  @override
  String get messagesMediaSidebarGroupDescription =>
      '커뮤니티 사이드바가 표시되는 방식을 구성합니다.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel => '기본적으로 음소거된 채널 숨기기';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      '새 커뮤니티에 참여할 때 사이드바에서 음소거된 채널을 자동으로 숨깁니다.';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      '기본적으로 음소거된 채널을 숨길까요?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      '가입하는 새 커뮤니티에서는 음소거된 채널이 자동으로 숨겨집니다. 기존 커뮤니티에도 이 설정을 적용하시겠습니까?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      '기본적으로 음소거된 채널 숨기기를 중지할까요?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      '가입하는 새 커뮤니티에서는 더 이상 음소거된 채널이 자동으로 숨겨지지 않습니다. 기존 커뮤니티에서도 음소거된 채널을 표시하시겠습니까?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      '모든 커뮤니티에 적용';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      '모든 커뮤니티에 표시';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction => '새 커뮤니티만 해당';

  @override
  String get messagesMediaDisplaySectionTitle => '미디어 표시';

  @override
  String get messagesMediaDisplaySectionDescription =>
      '이미지, 동영상 및 기타 미디어가 표시되는 방식을 제어합니다. 모든 미디어는 크기가 조정되고 변환됩니다. 미리 보기로 압축할 수 없는 매우 큰 파일은 이러한 설정에 관계없이 포함되지 않습니다.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel => '채팅에 링크로 게시될 때';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return '$productName에 직접 업로드될 때';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => '링크 미리 보기';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      '채팅에서 웹사이트 링크가 미리 보기되는 방식을 제어합니다.';

  @override
  String get messagesMediaLinkPreviewsToggleLabel => '링크 임베드 및 미리 보기 웹사이트 표시';

  @override
  String get messagesMediaReactionsSectionTitle => '반응';

  @override
  String get messagesMediaReactionsSectionDescription => '메시지에서 이모티콘 반응 설정';

  @override
  String get messagesMediaReactionsToggleLabel => '메시지에서 이모티콘 반응 표시';

  @override
  String get messagesMediaSpoilersSectionTitle => '스포일러 콘텐츠';

  @override
  String get messagesMediaSpoilersSectionDescription => '스포일러 콘텐츠 표시 방식 제어';

  @override
  String get messagesMediaSpoilersRadioLabel => '스포일러 콘텐츠 표시';

  @override
  String get messagesMediaSpoilersOnClickName => '클릭 시';

  @override
  String get messagesMediaSpoilersOnClickDescription => '클릭 시 스포일러 콘텐츠 표시';

  @override
  String get messagesMediaSpoilersIfModeratorName => '제가 관리하는 채널에서';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      '메시지 관리 권한이 있는 채널에서는 항상 스포일러 콘텐츠를 표시합니다.';

  @override
  String get messagesMediaSpoilersAlwaysName => '항상';

  @override
  String get messagesMediaSpoilersAlwaysDescription => '항상 스포일러 콘텐츠 표시';

  @override
  String get messagesMediaSizeSectionTitle => '미디어 크기 설정';

  @override
  String get messagesMediaSizeSectionDescription =>
      '포함된 미디어 및 첨부된 미디어의 최대 표시 크기를 사용자 지정합니다. 작은 크기는 화면 공간을 덜 사용하고, 큰 크기는 더 많은 세부 정보를 표시합니다.';

  @override
  String get messagesMediaSizeEmbedLabel => '링크에서 가져온 미디어(포함)';

  @override
  String get messagesMediaSizeAttachmentLabel => '업로드된 첨부 파일';

  @override
  String get messagesMediaSizeCompactName => '작게 (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => '더 작은 미디어 크기';

  @override
  String get messagesMediaSizeComfortableName => '편안하게 (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      '더 많은 세부 정보가 포함된 더 큰 미디어 크기';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF 동작';

  @override
  String get messagesMediaGifsSectionDescription => '채팅에 GIF가 삽입되는 방식 제어';

  @override
  String get messagesMediaGifsAutoSendLabel => '선택한 GIF 자동 보내기';

  @override
  String get messagesMediaCameraUploadsSectionTitle => '카메라 업로드';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      '앱 카메라로 찍은 사진과 동영상을 기기에 저장할지 선택하세요';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => '기기에 저장';

  @override
  String get messagesMediaAutocompleteSectionTitle => '표현 자동 완성 (콜론 자동 완성)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      '콜론을 입력할 때 표현 자동 완성에 표시되는 내용 제어. 기본 설정을 일치하도록 제안 표시 사용자 지정.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      '표현 자동 완성에서 기본 이모티콘 표시';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      '표현 자동 완성에서 사용자 지정 이모티콘 표시';

  @override
  String get messagesMediaAutocompleteStickersLabel => '표현 자동 완성에서 스티커 표시';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      '표현 자동 완성에서 저장된 미디어 표시';

  @override
  String get messagesMediaEditingSectionTitle => '메시지 편집';

  @override
  String get messagesMediaEditingSectionDescription => '취소 시 편집 초안에 대한 작업 제어';

  @override
  String get messagesMediaEditingPreserveDraftLabel => '취소 시 편집 초안 유지';

  @override
  String get accessibilitySaturationTitle => '채도';

  @override
  String get accessibilitySaturationDescription => '앱 전체에서 테마 색상의 생생함을 조절합니다.';

  @override
  String get accessibilityVisualGroupTitle => '화면';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => '링크 항상 밑줄 표시';

  @override
  String get accessibilityDimStrikethroughTextLabel => '취소선 텍스트 흐리게 표시';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM 메시지 미리보기';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'DM 목록에서 메시지 미리보기가 표시되는 시점 제어';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'DM 메시지 미리보기 모드';

  @override
  String get accessibilityDmMessagePreviewAllName => '모든 메시지';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      '모든 DM 대화에 대한 메시지 미리보기 표시';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => '읽지 않은 DM만';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      '읽지 않은 메시지가 있는 DM에 대한 메시지 미리보기만 표시';

  @override
  String get accessibilityDmMessagePreviewNoneName => '없음';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'DM 목록에서 메시지 미리보기 표시 안 함';

  @override
  String get accessibilityScreenReaderGroupTitle => '화면 낭독기';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return '화면 읽기 프로그램에서 $productName 작동 방식을 제어합니다.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel => '새 메시지 알림';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      '열려 있는 채널에 새 메시지가 도착하면 스크린 리더가 메시지를 읽어줍니다. 알림 소리에는 영향을 주지 않습니다.';

  @override
  String get accessibilityTtsGroupTitle => '텍스트 음성 변환';

  @override
  String get accessibilityTtsGroupDescription => '음성 텍스트 속도 선택';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => '음성 재생 속도';

  @override
  String get accessibilityTtsPlaySampleLabel => '샘플 재생';

  @override
  String get accessibilityTtsSilenceSampleLabel => '무음 미리 듣기';

  @override
  String get accessibilityPreviewButtonLabel => '미리보기 버튼';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return '링크 미리보기가 표시되는 방식: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => '미리보기 사용자';

  @override
  String get accessibilityKeyboardGroupTitle => '키보드';

  @override
  String get accessibilityShowTextareaFocusRingLabel => '채팅 입력창에 포커스 링 표시';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel => 'Esc 키로 키보드 모드 종료';

  @override
  String get accessibilityShowContextMenuShortcutsLabel => '상황별 메뉴 단축키 표시';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel => '통화 시작 전 확인';

  @override
  String get accessibilityAnimationGroupTitle => '애니메이션';

  @override
  String get accessibilityReducedMotionActiveNote =>
      '동작 줄이기가 켜져 있어 콘텐츠 애니메이션이 기본적으로 일시 중지됩니다. 계속 재생하려면 언제든지 다시 켤 수 있습니다.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => '움직이는 이모티콘 재생';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'GIF 자동 재생';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return '$productName이(가) 포커스되면 GIF 자동 재생';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      '동작 줄이기 설정에도 애니메이션 재생 중.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      '동작 줄이기로 인해 일시 중지되었습니다. 켜면 움직이는 이모티콘이 계속 재생됩니다.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      '동작 줄이기로 일시 중지됨. GIF를 계속 재생하려면 켜세요.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      '배터리 수명 및 데이터 사용량 보존을 위해 모바일에서는 기본적으로 꺼져 있습니다.';

  @override
  String get accessibilityStickerAnimationsTitle => '스티커 애니메이션';

  @override
  String get accessibilityStickerAnimationPreferenceLabel => '스티커 애니메이션 설정';

  @override
  String get accessibilityStickerAlwaysAnimateName => '항상 애니메이션 사용';

  @override
  String get accessibilityStickerAlwaysAnimateDescription => '스티커는 항상 움직입니다';

  @override
  String get accessibilityStickerAnimateOnInteractionName => '상호작용 시 애니메이션 재생';

  @override
  String get accessibilityStickerAnimateOnPressDescription => '스티커를 누르면 움직여요';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      '스티커에 마우스를 올리거나 스티커를 탭하면 애니메이션이 재생됩니다';

  @override
  String get accessibilityStickerNeverAnimateName => '애니메이션 사용 안 함';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      '스티커는 항상 정지 상태로 표시됩니다';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      '동작 줄이기 설정에도 항상 애니메이션 재생.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      '동작 줄이기가 활성화되면 스티커는 상호 작용 시에만 움직입니다. 항상 애니메이션을 선택하여 이 설정을 재정의할 수 있습니다.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      '배터리 수명 보존을 위해 모바일에서는 상호작용 시 애니메이션이 기본으로 적용됩니다.';

  @override
  String get accessibilityMotionGroupTitle => '움직임';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      '시스템과 동작 줄이기 설정 동기화';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      '이 기기의 시스템 동작 줄이기 기본 설정을 사용하거나 아래에서 사용자 지정하세요.';

  @override
  String get accessibilityReducedMotionOverrideLabel => '동작 줄이기';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      '애니메이션 및 전환 효과를 사용 중지합니다. 현재 시스템 설정에 따라 제어됩니다.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      '앱 전체의 애니메이션과 화면 전환 효과를 끕니다.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      '애니메이션 탭에서 애니메이션 이모티콘, GIF, 스티커를 직접 관리할 수 있습니다.';

  @override
  String get accessibilityConfirmStartCallTitle => '통화하시겠어요?';

  @override
  String get accessibilityConfirmStartCallDescription => '이 통화를 시작하시겠어요?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => '통화 시작';

  @override
  String get accessibilityTtsSampleDescription => '선택한 속도로 샘플 문장을 들어보세요.';

  @override
  String get accessibilityTtsSampleText =>
      '박사님, 저는 미래에서 왔어요. 박사님이 발명한 타임머신을 타고 여기로 왔습니다. 이제 1985년으로 돌아가려면 박사님의 도움이 필요해요.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      '이 기기에서는 음성 합성을 사용할 수 없습니다.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      '음성 재생에 실패했습니다. 다시 시도하거나 오디오 출력이 작동하는지 확인해 주세요.';

  @override
  String get ttsSubstitutionUnknownUser => '알 수 없는 사용자';

  @override
  String get ttsSubstitutionUnknownRole => '알 수 없는 역할';

  @override
  String get ttsSubstitutionUnknownChannel => '알 수 없는 채널';

  @override
  String get ttsSubstitutionCodeBlock => '코드 블록';

  @override
  String get ttsSubstitutionSpoiler => '스포일러';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '이모티콘 $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '$replyAuthorName님에게 답장: $authorName님이 $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName: $description';
  }

  @override
  String get ttsSentSticker => '스티커를 보냈습니다';

  @override
  String get ttsSentAttachment => '첨부파일을 보냈습니다';

  @override
  String ttsSentAttachments(int count) {
    return '$count개의 첨부 파일을 보냈습니다';
  }

  @override
  String get ttsSentEmbed => '임베드 보냄';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author님이 $summary을(를) 보냈습니다.';
  }

  @override
  String get dmListSentAnAttachment => '첨부 파일을 보냈습니다.';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username님이 이 채널에 메시지를 고정했습니다.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username님이 $userName님을 그룹에 추가했습니다.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username님이 누군가를 그룹에 추가했습니다.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username님이 그룹을 나갔습니다.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username님이 $userName님을 그룹에서 삭제했습니다.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username님이 누군가를 그룹에서 삭제했습니다.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username님이 채널 이름을 $newName(으)로 변경했습니다.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username님이 채널 이름을 변경했습니다.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username님이 채널 아이콘을 변경했습니다.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username님이 통화를 시작했습니다.';
  }

  @override
  String get systemCallJoinTheCall => '통화 참여하기';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username님이 통화를 시작했으며, 통화 시간은 $duration입니다.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return '$username님과의 통화가 $duration 동안 이어졌으나 놓치셨습니다.';
  }

  @override
  String systemCallMissed(String username) {
    return '$username님과의 통화를 놓치셨습니다.';
  }

  @override
  String get systemCallDurationFewSeconds => '방금 전';

  @override
  String get systemCallDurationMinute => '1분';

  @override
  String get systemCallDurationOneYear => '1년';

  @override
  String get systemCallDurationOneMonth => '1개월';

  @override
  String get systemCallDurationOneWeek => '1주';

  @override
  String get systemCallDurationOneDay => '1일';

  @override
  String get systemCallDurationOneHour => '1시간';

  @override
  String systemCallDurationYears(int count) {
    return '$count년';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count개월';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count주';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count일';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count시간';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count분';
  }

  @override
  String systemUnknownMessage(String productName) {
    return '이 메시지를 보려면 $productName을(를) 업데이트하세요.';
  }

  @override
  String get voiceConnectionConfirmTitle => '음성 연결 확인';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '이미 다른 기기 $count대에서 이 음성 채널에 연결되어 있습니다. 어떻게 하시겠습니까?',
      one: '이미 다른 기기 1대에서 이 음성 채널에 연결되어 있습니다. 어떻게 하시겠습니까?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => '이 기기로 전환';

  @override
  String get voiceConnectionConfirmJustJoin => '그냥 참여 (다른 연결 유지)';

  @override
  String get voiceConnectionConfirmDoNothing => '아무것도 안 함, 참여하고 싶지 않음';

  @override
  String get voiceJoinFailedTitle => '음성 참여에 실패했습니다';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      '다른 기기에서 연결을 해제하지 못했습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get voiceChannelEmptyDescription => '음성 채널입니다. 대화를 시작하려면 연결하세요!';

  @override
  String get voiceChannelJoin => '음성 채널 참여';

  @override
  String get voiceCallJoin => '통화 참여';

  @override
  String get voiceChannelJoinConnect => '음성 연결';

  @override
  String get voiceChannelNoConnectPermission => '이 음성 채널에 참여할 권한이 없습니다';

  @override
  String get voiceChannelE2eeEncrypted => '마이크, 카메라 및 화면 공유 콘텐츠는 종단 간 암호화됩니다.';

  @override
  String get voiceCallE2eeEncrypted => '마이크, 카메라 및 화면 공유 콘텐츠는 종단 간 암호화됩니다.';

  @override
  String get voiceChannelE2eeBroken =>
      '지원되지 않는 참가자가 이 음성 채널에 있어 종단 간 암호화를 사용할 수 없습니다.';

  @override
  String get voiceCallE2eeBroken =>
      '지원되지 않는 참가자가 이 통화에 있어 종단 간 암호화를 사용할 수 없습니다.';

  @override
  String get voiceE2eeUpdateRequired => '이 암호화된 통화에 참여하려면 이 클라이언트를 업데이트해야 합니다.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      '마이크를 시작할 수 없습니다. 통화에는 계속 연결되어 있습니다.';

  @override
  String get voiceChannelStatusConnecting => '연결 중…';

  @override
  String get voiceChannelStatusConnected => '연결됨';

  @override
  String get voiceChannelStatusError => '오류';

  @override
  String get voiceParticipantTooltipMobileDevice => '모바일 기기';

  @override
  String get voiceParticipantTooltipDesktopDevice => '데스크톱 기기';

  @override
  String get voiceParticipantTooltipCommunityMuted => '커뮤니티에서 음소거됨';

  @override
  String get voiceParticipantTooltipMuted => '음소거됨';

  @override
  String get voiceParticipantTooltipCommunityDeafened => '커뮤니티에서 소리 끔';

  @override
  String get voiceParticipantTooltipDeafened => '소리 끔';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return '연결: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '참가자 $count명',
      one: '참가자 1명',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => '나가기';

  @override
  String get voiceControlMute => '마이크 음소거';

  @override
  String get voiceControlUnmute => '마이크 음소거 해제';

  @override
  String get voiceControlDeafen => '소리 끔';

  @override
  String get voiceControlUndeafen => '소리 끔 해제';

  @override
  String get voiceControlVideo => '카메라';

  @override
  String get voiceControlFlipCamera => '카메라 전환';

  @override
  String get voiceControlScreenShare => '화면 공유';

  @override
  String get voiceScreenShareNotificationText => '화면을 공유 중입니다.';

  @override
  String get voiceControlMore => '더 보기';

  @override
  String get voiceControlDisconnect => '연결 끊기';

  @override
  String get voiceInChat => '음성 채팅 중';

  @override
  String get voiceConnectionFailed => '연결에 실패했습니다';

  @override
  String get voiceConnectionRetry => '다시 시도';

  @override
  String get voiceConnectionDismiss => '닫기';

  @override
  String get voiceConnectionDisconnected => '연결 끊김';

  @override
  String voicePingMs(int currentLatency) {
    return '핑: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => '지연 시간 측정 중...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return '$channelSourceLabel으로 이동';
  }

  @override
  String get voiceConnectionTitle => '음성 연결';

  @override
  String get voiceConnectionAdvancedStats => '고급';

  @override
  String get voiceShowCallAvatars => '통화 아바타 표시';

  @override
  String get voiceShowConnectionId => '연결 ID 보기';

  @override
  String get voiceAudioProcessing => '오디오 처리 중';

  @override
  String get voiceConnectionSessionSection => '세션';

  @override
  String get voiceConnectionDurationLabel => '기간';

  @override
  String get voiceConnectionParticipantsLabel => '참여자';

  @override
  String get voiceConnectionNetworkSection => '네트워크';

  @override
  String get voiceConnectionPingLabel => '핑';

  @override
  String get voiceConnectionJitterLabel => '지터';

  @override
  String get voiceConnectionSendLabel => '보내기';

  @override
  String get voiceConnectionReceiveLabel => '수신';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes분 $seconds초';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '${latency}ms';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '${jitter}ms';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '${bandwidth}kbps';
  }

  @override
  String get userAreaMuteMicrophone => '마이크 음소거';

  @override
  String get userAreaUnmuteMicrophone => '마이크 음소거 해제';

  @override
  String get userAreaUserSettings => '사용자 설정';

  @override
  String get voiceParticipantMenuViewProfile => '프로필 보기';

  @override
  String get voiceParticipantMenuFocus => '이 사람에게 집중';

  @override
  String get voiceParticipantMenuUnfocus => '포커스 해제';

  @override
  String get voiceParticipantMenuCommunityMute => '커뮤니티 음소거';

  @override
  String get voiceParticipantMenuCommunityDeafen => '커뮤니티 듣기 차단';

  @override
  String get voiceParticipantMenuUserVolume => '사용자 볼륨';

  @override
  String get voiceParticipantMenuStreamVolume => '스트림 볼륨';

  @override
  String get voiceParticipantMenuStopStreaming => '스트리밍 중지';

  @override
  String get voiceParticipantModerationFailed =>
      '해당 멤버를 업데이트할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get voiceControlChat => '채팅';

  @override
  String get voiceCallViewModeLabel => '보기';

  @override
  String get voiceCallViewModeGrid => '그리드';

  @override
  String get voiceCallViewModeFocus => '집중 모드';

  @override
  String get voicePanelSettingsSectionTitle => '음성 설정';

  @override
  String get voicePanelUseEarpieceLabel => '이어폰으로 통화하기';

  @override
  String get voicePanelOnlyShowVideosLabel => '동영상만 표시';

  @override
  String get voicePanelOnlyShowVideosDescription => '카메라를 켠 참가자만 표시';

  @override
  String get voicePanelShowOwnCameraLabel => '내 카메라 보기';

  @override
  String get voicePrioritizeSpeakersLabel => '발언자 우선 표시';

  @override
  String get voiceTextChatShow => '채팅 보기';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '읽지 않은 메시지 $count개',
      one: '읽지 않은 메시지 1개',
    );
    return '$_temp0';
  }

  @override
  String get voiceCameraPermissionRequired => '동영상 통화를 위해 카메라 권한이 필요합니다.';

  @override
  String get voiceErrorScreenShareToggle => '화면 공유를 시작할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get voiceErrorScreenSharePermissionDenied => '화면 공유 권한이 거부되었습니다.';

  @override
  String get voiceErrorScreenShareUnsupported => '이 기기에서는 화면 공유를 사용할 수 없습니다.';

  @override
  String get voiceWatchStream => '스트림 보기';

  @override
  String get voiceStopWatching => '시청 중단';

  @override
  String get voiceStopWatchingCurrentStreamTooltip => '현재 스트림 시청 중단';

  @override
  String get voiceOwnScreenShareTitle => '방송 중입니다';

  @override
  String get voiceOwnScreenShareSubtitle => '참가자들에게 스트림이 공개됩니다.';

  @override
  String get voiceLiveBadge => '라이브';

  @override
  String get dmVoiceViewCall => '통화 보기';

  @override
  String get dmVoiceCallFullScreen => '전체 화면';

  @override
  String get dmVoiceCallFullScreenTooltip => '통화를 전체 화면으로 열기';

  @override
  String get dmVoiceStripStatusConnecting => '연결 중…';

  @override
  String get dmVoiceStripStatusInCall => '통화 중';

  @override
  String get dmVoiceEmbeddedFallbackTitle => '음성 통화';

  @override
  String get dmVoiceCallBarConnecting => '연결 중…';

  @override
  String get dmVoiceCallBarDirectPrimary => '직접 통화';

  @override
  String get dmVoiceCallBarGroupPrimary => '그룹 통화';

  @override
  String get dmVoiceCallBarIssueFallback => '음성 문제';

  @override
  String get dmVoiceFullscreenTitle => '음성';

  @override
  String get voiceCallBarGuildConnectedFallback => '음성 연결됨';

  @override
  String get notificationsPageTitle => '알림';

  @override
  String get notificationsFilterUnreads => '읽지 않음';

  @override
  String get notificationsFilterMentions => '멘션';

  @override
  String get notificationsBookmarksTooltip => '북마크';

  @override
  String get notificationsMentionFilterTooltip => '멘션 필터링';

  @override
  String get notificationsMentionFiltersTitle => '멘션 필터';

  @override
  String get notificationsMentionIncludeEveryone => '@everyone 및 @here 멘션 포함';

  @override
  String get notificationsMentionIncludeRoles => '역할 멘션 포함';

  @override
  String get notificationsMentionIncludeGuilds => '모든 커뮤니티 멘션 포함';

  @override
  String get notificationsNoUnreadTitle => '읽지 않은 메시지 없음';

  @override
  String get notificationsNoUnreadBody => '모든 메시지를 확인했습니다.';

  @override
  String get notificationsNoMentionsTitle => '최근 멘션 없음';

  @override
  String get notificationsNoMentionsBody => '나에게 온 모든 @멘션은 7일간 이곳에 표시됩니다.';

  @override
  String get notificationsMentionsEndTitle => '끝에 도달했습니다';

  @override
  String get notificationsMentionsEndBody =>
      '최근 멘션을 모두 확인했습니다. 곧 더 많은 멘션이 이곳에 표시될 것입니다.';

  @override
  String get notificationsJump => '이동';

  @override
  String get notificationsRemoveMentionTooltip => '멘션 삭제';

  @override
  String get notificationsViewAllUnread => '모든 읽지 않은 메시지 보기';

  @override
  String get notificationsMarkAsRead => '읽음으로 표시';

  @override
  String get notificationsExpand => '확장';

  @override
  String get notificationsCollapse => '축소';

  @override
  String get notificationsMessageUnavailable => '이 메시지를 불러올 수 없습니다.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining자 남음';
  }

  @override
  String get characterCounterTooLong => '메시지가 너무 깁니다';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining자 남음. $productName을(를) 사용하여 최대 $premiumMaxLength자까지 작성하세요.';
  }

  @override
  String get chatMessageFailedToSend => '메시지 전송 실패';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return '메시지를 전달할 수 없습니다. 일반적으로 수신자와 커뮤니티를 공유하지 않거나 수신자가 친구의 직접 메시지만 허용하기 때문입니다. 또한 $settingsPath에서 직접 메시지 개인 정보 설정을 조정해야 할 수 있습니다.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      '메시지를 전달할 수 없습니다. 직접 메시지를 보내려면 계정을 등록해야 합니다.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      '메시지를 전달할 수 없습니다. 메시지를 보내려면 계정을 등록해야 합니다.';

  @override
  String get chatSendFailureContentBlocked =>
      '안전 시스템에 의해 플래그가 지정되어 메시지를 전달할 수 없습니다. 실수가 있었다고 생각하시면 지원팀에 문의해 주세요.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      '이 컨텍스트에서 허용되지 않는 성인용 이모지 또는 스티커가 포함되어 있어 메시지를 전달할 수 없습니다.';

  @override
  String get chatClientSystemOnlyYouCanSee => '이 메시지는 본인만 볼 수 있습니다.';

  @override
  String get chatClientSystemDismiss => '닫기';

  @override
  String get privacyDashboardCommunicationSection => '커뮤니케이션';

  @override
  String get privacyDashboardProfilePrivacySection => '프로필 공개 범위';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection => '친구 및 직접 메시지';

  @override
  String get privacyDashboardActivitySharingSection => '활동 공유';

  @override
  String get privacyDashboardSensitiveContentSection => '민감한 콘텐츠';

  @override
  String get privacyDashboardDataExportSection => '데이터 내보내기';

  @override
  String get privacyDashboardDataDeletionSection => '데이터 삭제';

  @override
  String get privacyDashboardProfilePrivacyTitle => '내 전체 프로필을 볼 수 있는 사람';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities => '친구 및 모든 커뮤니티';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      '전체 프로필이 친구와 커뮤니티의 모든 사람에게 표시됩니다';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      '친구 및 소규모 커뮤니티에만 공개';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      '친구 및 200명 이하의 커뮤니티 멤버에게 전체 프로필이 표시됩니다';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => '친구에게만 허용';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      '전체 프로필은 친구에게만 표시됩니다';

  @override
  String get privacyDashboardFriendRequestsTitle => '친구 요청';

  @override
  String get privacyDashboardFriendRequestsEveryone => '모든 사람';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      '모든 사람이 친구 요청을 보낼 수 있도록 허용';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends => '친구의 친구';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      '친구의 친구가 친구 요청을 보낼 수 있도록 허용';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers => '커뮤니티 회원';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      '내가 속한 커뮤니티의 멤버가 친구 요청을 보낼 수 있도록 허용';

  @override
  String get privacyDashboardDirectMessagesTitle => 'DM';

  @override
  String get privacyDashboardDirectMessagesMembers => '커뮤니티 멤버에게서 온 DM 허용';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      '커뮤니티의 멤버가 나에게 다이렉트 메시지를 보낼 수 있도록 허용';

  @override
  String get privacyDashboardDirectMessagesBots => '커뮤니티 봇의 다이렉트 메시지 허용';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      '참여 중인 커뮤니티의 봇이 다이렉트 메시지를 보낼 수 있도록 허용';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      '친구 요청 및 다이렉트 메시지를 보낼 수 있는 사람을 관리하세요';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      '누가 전화를 걸고 그룹 채팅에 추가할 수 있는지 제어하세요';

  @override
  String get privacyDashboardIncomingCallsTitle => '수신 전화';

  @override
  String get privacyDashboardIncomingCallsDesc => '누가 나에게 전화할 수 있는지 제어하세요';

  @override
  String get privacyDashboardAllowedCallers => '허용된 발신자';

  @override
  String get privacyDashboardIncomingCallNobody => '아무도';

  @override
  String get privacyDashboardIncomingCallNobodyDesc => '모든 수신 전화 차단';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => '친구만';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      '친구만 나에게 전화하도록 허용 (권장)';

  @override
  String get privacyDashboardIncomingCallCustom => '친구 + 맞춤';

  @override
  String get privacyDashboardIncomingCallCustomDesc => '친구 및 선택한 추가 그룹 허용';

  @override
  String get privacyDashboardIncomingCallEveryone => '모든 사람';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      '모르는 사람을 포함한 모든 사람이 나에게 전화하도록 허용';

  @override
  String get privacyDashboardAdditionalGroups => '추가 그룹';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      '친구의 친구가 당신에게 전화할 수 있습니다';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      '두 커뮤니티에 속한 사람들이 나에게 전화할 수 있습니다';

  @override
  String get privacyDashboardRingBehavior => '링 동작';

  @override
  String get privacyDashboardSilentCalls => '모든 사람의 통화 무음 처리';

  @override
  String get privacyDashboardSilentCallsDesc =>
      '모든 통화는 벨이 울리는 대신 조용히 알림이 울립니다. 기본적으로 친구가 아닌 사람으로부터 오는 전화는 항상 조용히 울립니다.';

  @override
  String get privacyDashboardGroupDmTitle => '그룹 채팅에 추가할 수 있는 사람';

  @override
  String get privacyDashboardGroupDmDesc =>
      '초대 없이 그룹 채팅에 추가할 수 있는 사람을 제어하세요. 누구나 여전히 참여 초대 링크를 보낼 수 있습니다.';

  @override
  String get privacyDashboardAllowedInvites => '허용된 초대';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      '아무도 묻지 않고 그룹 채팅에 추가하지 못하도록 하세요';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      '친구만 나를 초대할 수 있도록 허용 (권장)';

  @override
  String get privacyDashboardGroupDmCustomDesc => '친구 및 추가 그룹에서 나를 추가하도록 허용';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      '모든 사람이 요청 없이 나를 그룹 채팅에 추가하도록 허용';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      '친구의 친구도 그룹 채팅에 추가할 수 있습니다.';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      '두 커뮤니티에 속한 사람들이 나를 그룹 채팅에 추가할 수 있습니다.';

  @override
  String get privacyDashboardVoiceActivityTitle => '지금 활동 중 음성 활동';

  @override
  String get privacyDashboardShareVoiceActivity => '친구와 음성 활동 공유하기';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      '모든 친구와 음성 활동을 공유하시겠어요?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      '모든 친구와 음성 활동 공유를 중단할까요?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      '현재 활동을 모든 친구(앞으로 추가될 친구 포함)와 공유하게 됩니다. 모든 친구에게 업데이트가 전송되며, 24시간 후에 다시 변경할 수 있습니다.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      '현재 활동 공유를 중단하면 모든 친구(향후 친구 포함)에게 업데이트가 전송되며, 24시간 후에 다시 변경할 수 있습니다.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm => '예, 모든 친구와 공유합니다';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => '예, 공유 중지';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return '$time 후에 다시 사용 가능';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated => '음성 활동 공유 업데이트됨';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      '지금 음성 활동 공유를 업데이트할 수 없습니다';

  @override
  String get privacyDashboardDataExportDesc =>
      '메시지 및 첨부 파일 URL을 포함하여 계정 데이터의 다운로드 가능한 아카이브를 만드세요. 대부분의 사용자는 모든 데이터를 원하지만, 아래에서 범위를 좁힐 수 있습니다.';

  @override
  String get privacyDashboardExportMyData => '내 데이터 내보내기';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'DM, 그룹 DM, 커뮤니티에서 보낸 메시지를 영구적으로 삭제합니다. 이 작업은 백그라운드에서 실행되며, 완료되면 DM으로 알려드립니다.';

  @override
  String get privacyDashboardDeleteMyMessages => '내 메시지 삭제';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      '커뮤니티 멤버에게서 온 DM 허용?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      '커뮤니티 멤버의 쪽지를 차단할까요?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      '봇이 회원님에게 쪽지를 보내도록 허용하시겠어요?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      '봇이 회원님에게 쪽지를 보내지 못하도록 차단할까요?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      '기존 커뮤니티 멤버에게서 오는 쪽지도 허용할까요?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      '기존 커뮤니티 멤버의 쪽지도 차단하시겠어요?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      '기존 커뮤니티의 봇이 회원님에게 쪽지를 보내는 것을 허용하시겠어요?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc => '기존 커뮤니티의 봇도 차단하시겠어요?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      '커뮤니티 이름에 길게 누르고 \'개인정보 보호 설정\'을 선택하여 커뮤니티별로 이 설정을 변경할 수도 있습니다.';

  @override
  String get privacyDashboardDmConfirmAllowAll => '모든 커뮤니티 허용';

  @override
  String get privacyDashboardDmConfirmBlockAll => '모든 커뮤니티에서 차단';

  @override
  String get privacyDashboardDmConfirmSkip => '건너뛰기';

  @override
  String get privacyDashboardDataRequestGoBack => '뒤로 가기';

  @override
  String get privacyDashboardDataRequestExportTitle => '내 데이터 내보내기';

  @override
  String get privacyDashboardDataRequestDeleteTitle => '내 메시지 삭제';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      '가능한 한 빨리 처리해 드릴게요. 보관 파일이 준비되면 이메일로 알려 드립니다.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      '최대한 빨리 처리해 드릴게요. 완료되면 DM으로 알려드릴게요.';

  @override
  String get privacyDashboardDataRequestScopeTitle => '포함할 내용';

  @override
  String get privacyDashboardDataRequestExportEverything => '모든 항목';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      '지금까지 보낸 모든 메시지, 계정 설정, 멤버십, 메타데이터를 내보냅니다.';

  @override
  String get privacyDashboardDataRequestExportCustom => '선택 항목 지정';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      '보관 파일에 포함할 대화 종류, 커뮤니티, 기간을 선택하세요.';

  @override
  String get privacyDashboardDataRequestDeleteSelected => '포함할 항목 선택';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      '어떤 종류의 대화를 정리할지 선택하세요.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      '더 이상 액세스할 수 없는 곳만';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      '회원님께서 나갔거나 삭제된 커뮤니티 및 그룹 DM의 메시지만 삭제합니다.';

  @override
  String get privacyDashboardDataRequestKindsTitle => '대화 선택';

  @override
  String get privacyDashboardDataRequestKindsBody => '포함할 대화 유형을 선택하세요.';

  @override
  String get privacyDashboardDataRequestKindDms => '오픈 DM';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => '종료된 DM';

  @override
  String get privacyDashboardDataRequestKindGroupDms => '그룹 DM';

  @override
  String get privacyDashboardDataRequestKindCommunities => '커뮤니티';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => '어떤 커뮤니티';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => '커뮤니티 필터';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude => '선택된 항목 제외 모두 포함';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => '선택한 항목만';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      '현재 참여 중인 커뮤니티가 없습니다.';

  @override
  String get privacyDashboardDataRequestWhenTitle => '기간';

  @override
  String get privacyDashboardDataRequestDateMode => '기간';

  @override
  String get privacyDashboardDataRequestAllTime => '전체 기간';

  @override
  String get privacyDashboardDataRequestCustomRange => '맞춤 범위';

  @override
  String get privacyDashboardDataRequestStartDate => '시작일';

  @override
  String get privacyDashboardDataRequestEndDate => '종료일';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      '한쪽 필드를 비워두면 해당 기간의 끝이 무제한으로 설정됩니다.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      '포함할 대화 유형을 하나 이상 선택하세요.';

  @override
  String get privacyDashboardDataRequestDateRangeError => '시작일은 종료일보다 빨라야 합니다.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => '검토 및 확인';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      '회원님이 보낸 모든 메시지의 다운로드 가능한 아카이브를 생성하고 준비가 완료되면 이메일로 알려드립니다. 이메일의 다운로드 링크는 7일 후에 만료됩니다.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      '아래 필터와 일치하는 다운로드 가능한 아카이브를 생성하여 준비되면 이메일로 보내드립니다. 이메일의 다운로드 링크는 7일 후에 만료됩니다.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      '아래 필터와 일치하는 메시지를 영구적으로 삭제합니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      '이 작업은 되돌릴 수 없습니다. 완료되면 DM으로 알려드리겠습니다.';

  @override
  String get privacyDashboardDataRequestRequestExport => '내보내기 요청';

  @override
  String get privacyDashboardDataRequestDeleteMessages => '메시지 삭제';

  @override
  String get privacyDashboardDataRequestSummaryScope => '범위';

  @override
  String get privacyDashboardDataRequestSummaryConversations => '대화';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => '커뮤니티';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => '기간';

  @override
  String get privacyDashboardDataRequestSummaryNone => '없음';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return '$start부터';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return '$end까지';
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
      other: '#개 커뮤니티',
      one: '#개 커뮤니티',
    );
    return '$_temp0 제외 모두';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '#개 커뮤니티만',
      one: '#개 커뮤니티만',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen => '열려 있는 DM';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed => '종료된 DM';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth => '쪽지 (열림 및 닫힘)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => '그룹 DM';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => '커뮤니티';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '#시간',
      one: '#시간',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '#분',
      one: '#분',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '#시간',
      one: '#시간',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '#분',
      one: '#분',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '#초',
      one: '#초',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => '개인 정보 설정 로드에 실패했습니다';

  @override
  String get privacyDashboardRetry => '다시 시도';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      '민감한 콘텐츠 설정을 저장하지 못했습니다.';

  @override
  String get privacyDashboardDataRequestFailed => '요청을 완료하지 못했습니다.';

  @override
  String get chatMessageDeleteFailed => '메시지 삭제 실패';

  @override
  String get chatMessageAddReaction => '반응 추가';

  @override
  String get chatMessageEdit => '메시지 수정';

  @override
  String get chatMessageReply => '답장';

  @override
  String get chatMessageForward => '전달';

  @override
  String get forwardMessageTitle => '메시지 전달';

  @override
  String get forwardSearchHint => '채널 또는 DM 검색';

  @override
  String get forwardDirectMessagesSection => '다이렉트 메시지';

  @override
  String get forwardCommentHint => '댓글 추가 (선택 사항)';

  @override
  String forwardSendButton(int count, int limit) {
    return '보내기 ($count/$limit)';
  }

  @override
  String get forwardEmptyState => '채널을 찾을 수 없습니다';

  @override
  String get forwardSuccessToast => '메시지가 전달되었습니다';

  @override
  String get forwardFailed => '메시지 전달 실패';

  @override
  String get forwardCommentSlowmodeDisabled =>
      '선택한 채널에 슬로우 모드가 활성화되어 댓글을 사용할 수 없습니다.';

  @override
  String get forwardSendSlowmodeBlocked =>
      '선택한 채널 중 일부 채널의 슬로우 모드 만료를 기다리는 중입니다.';

  @override
  String get slowmodeRateLimitedTitle => '슬로우 모드 활성화됨';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return '슬로 모드가 켜져 있습니다. $duration 후에 다시 메시지를 보내주세요.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      '슬로우 모드 중에는 직접 업로드가 비활성화됩니다.';

  @override
  String get shareMediaTitle => '공유하기';

  @override
  String get shareMediaMessageHint => '메시지 추가…';

  @override
  String get shareMediaSendButton => '보내기';

  @override
  String get shareMediaSuccessToast => '미디어 공유됨';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return '$count개의 대상에 공유됨';
  }

  @override
  String get shareMediaFailedToast => '미디어를 공유하지 못했습니다.';

  @override
  String get forwardDestinationNoSendPermission => '여기에 메시지를 보낼 수 없습니다';

  @override
  String get forwardDestinationNoEmbedPermission => '여기에 링크를 포함할 수 없습니다';

  @override
  String get forwardDestinationNoAttachPermission => '여기에 파일을 첨부할 수 없습니다';

  @override
  String get forwardDestinationGuildSendDisabled =>
      '이 커뮤니티에서는 메시지 전송이 비활성화되어 있습니다';

  @override
  String get forwardDestinationTimedOut => '이 커뮤니티에서 타임아웃되었습니다';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return '슬로우 모드 - $remaining 후 시도하세요';
  }

  @override
  String get chatMessageCopyText => '메시지 복사';

  @override
  String get chatMessageCopyEmbedText => '임베드 텍스트 복사';

  @override
  String get chatMessageTranslate => '번역';

  @override
  String chatMessageTranslatedFrom(String language) {
    return '$language(으)로부터 번역됨';
  }

  @override
  String get chatMessageSeeOriginal => '원본 보기';

  @override
  String get chatMessageSeeTranslation => '번역 보기';

  @override
  String get chatMessageTranslating => '번역 중…';

  @override
  String get chatMessageTranslateFailed => '이 메시지를 번역할 수 없습니다.';

  @override
  String get chatMessageTranslateUnavailable => '이 기기에서는 번역을 사용할 수 없습니다.';

  @override
  String get chatMessageSpeak => '메시지 소리내어 읽기';

  @override
  String get chatMessageStopSpeaking => '말하기 중단';

  @override
  String get chatMessagePin => '메시지 고정';

  @override
  String get chatMessageUnpin => '메시지 고정 해제';

  @override
  String get chatMessageUnpinIt => '고정 해제';

  @override
  String get chatMessageBookmark => '메시지 북마크';

  @override
  String get chatMessageRemoveBookmark => '북마크 삭제';

  @override
  String get chatMessageMarkAsUnread => '읽지 않음으로 표시';

  @override
  String get chatMessageCopyMessageLink => '메시지 링크 복사';

  @override
  String get chatMessageOpenLink => '링크 열기';

  @override
  String get chatMessageCopyLink => '링크 복사';

  @override
  String get chatMessageCopyMessageId => '메시지 ID 복사';

  @override
  String get chatMessageViewReactions => '반응 보기';

  @override
  String get chatMessageRemoveAllReactions => '모든 반응 삭제';

  @override
  String get chatMessageDebug => '메시지 디버그';

  @override
  String get chatMessageDebugSheetTitle => '메시지 디버그';

  @override
  String get chatMessageDebugCopyJson => 'JSON 복사';

  @override
  String get chatMessageDebugJsonCopiedToast => '메시지 JSON이 클립보드에 복사되었습니다';

  @override
  String get chatReactionsSheetTitle => '반응';

  @override
  String get chatReactionsSheetEmpty => '아직 아무도 반응하지 않았습니다.';

  @override
  String get chatReactionAddFailed => '반응을 추가하지 못했습니다';

  @override
  String get chatReactionRemoveFailed => '반응을 삭제하지 못했습니다';

  @override
  String get chatMessageReport => '메시지 신고';

  @override
  String get iarReportMessageTitle => '메시지 신고';

  @override
  String get iarThisUserFallback => '이 사용자';

  @override
  String get iarModalDescription => '규칙 위반을 신고하거나 연락처 및 기본 설정을 관리하는 도구를 찾으세요.';

  @override
  String get iarPathStepAriaLabel => '무엇이 필요하신가요?';

  @override
  String get iarCategoryStepTitle => '어떤 규칙이 위반되었나요?';

  @override
  String get iarReasonStepTitle => '어떤 규칙이 위반되었나요?';

  @override
  String get iarReasonSelectHint => '이유 선택';

  @override
  String get iarPickAnOptionToast => '계속하려면 옵션을 선택하세요.';

  @override
  String get iarPickARuleToast => '위반된 규칙을 선택하세요.';

  @override
  String get iarPathPlatform => '플랫폼 규칙 위반 신고';

  @override
  String get iarPathCommunity => '이 커뮤니티의 관리자에게 신고';

  @override
  String get iarPathPreferenceMessage => '이 콘텐츠는 마음에 들지 않아요';

  @override
  String get iarCategoryTargetedHarmLabel => '위협, 괴롭힘 또는 유해 콘텐츠';

  @override
  String get iarCategoryTargetedHarmDescription =>
      '괴롭힘, 혐오 발언, 폭력, 습격, 자해 콘텐츠.';

  @override
  String get iarCategorySafetyMinorsLabel => '아동 안전 또는 성인용 콘텐츠';

  @override
  String get iarCategorySafetyMinorsDescription =>
      '미성년자 위험, 부적절한 장소의 성인용 콘텐츠 또는 원치 않는 행동.';

  @override
  String get iarCategoryPrivacyIdentityLabel => '개인 정보 또는 사칭';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      '개인 정보 유출, 스토킹, 타인 사칭 또는 부적절한 프로필.';

  @override
  String get iarCategoryDeceptionLabel => '사기, 악성코드 또는 허위 정보';

  @override
  String get iarCategoryDeceptionDescription =>
      '피싱, 사기, 악성 링크 또는 실제 피해를 유발할 수 있는 허위 주장.';

  @override
  String get iarCategoryIllegalOtherLabel => '불법 활동 또는 기타';

  @override
  String get iarCategoryIllegalOtherDescription => '불법 판매, 범죄 조장 또는 명백한 규칙 위반.';

  @override
  String get iarReasonHarassmentLabel => '괴롭힘 또는 위협';

  @override
  String get iarReasonHarassmentMessageDescription =>
      '괴롭힘, 반복적인 원치 않는 연락, 스토킹 또는 표적 공격.';

  @override
  String get iarReasonHateLabel => '혐오 발언';

  @override
  String get iarReasonHateMessageDescription =>
      '욕설, 비인간적인 언어 또는 보호 대상 그룹에 대한 공격.';

  @override
  String get iarReasonViolenceLabel => '폭력 또는 폭력 위협';

  @override
  String get iarReasonViolenceDescription => '신뢰할 수 있는 위협, 노골적인 폭력 또는 폭력 미화.';

  @override
  String get iarReasonMatureContentLabel => '성인용 콘텐츠 또는 괴롭힘';

  @override
  String get iarReasonMatureContentMessageDescription =>
      '원치 않는 행동 또는 부적절한 장소의 성인용 콘텐츠.';

  @override
  String get iarReasonChildSafetyLabel => '아동 안전 또는 미성년자 착취';

  @override
  String get iarReasonChildSafetyMessageDescription => '그루밍 또는 미성년자 착취 콘텐츠.';

  @override
  String get iarReasonHarmfulMisinfoLabel => '유해한 허위 정보';

  @override
  String get iarReasonHarmfulMisinfoDescription => '실제 피해를 유발할 수 있는 허위 주장.';

  @override
  String get iarReasonSpamLabel => '스팸, 사기 또는 피싱';

  @override
  String get iarReasonSpamMessageDescription => '대량 스팸, 사기, 가짜 경품 또는 계정 남용.';

  @override
  String get iarReasonMalwareLabel => '악성코드 또는 위험한 링크';

  @override
  String get iarReasonMalwareDescription => '악성코드, 자격 증명 탈취 또는 유해 파일.';

  @override
  String get iarReasonPrivacyLabel => '개인 정보 침해';

  @override
  String get iarReasonPrivacyDescription => '개인 정보 유출, 노출된 개인 정보 또는 스토킹.';

  @override
  String get iarReasonImpersonationLabel => '사칭 또는 기만적인 미디어';

  @override
  String get iarReasonImpersonationMessageDescription =>
      '기만적인 AI 생성 콘텐츠를 포함하여 다른 사람인 척하는 행위.';

  @override
  String get iarReasonIllegalLabel => '불법 활동';

  @override
  String get iarReasonIllegalDescription => '불법 판매, 범죄 조장 또는 불법 활동.';

  @override
  String get iarReasonSelfHarmLabel => '자해 또는 자살';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      '자해 또는 섭식 장애를 조장하거나 안내하는 내용.';

  @override
  String get iarReasonOtherLabel => '명백한 다른 규칙 위반';

  @override
  String iarReasonOtherDescription(String productName) {
    return '$productName 규칙을 명확하게 위반하고 위에 해당하지 않는 경우에만 사용하세요.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return '미성년자가 관련된 경우 대신 \"$childSafetyReason\"을(를) 사용하세요.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'CSAM 또는 미성년자 착취와 관련된 경우, 지금 신고하고 자료를 다시 공유하지 마세요.';

  @override
  String get iarSafetyNoteSelfHarm =>
      '누군가가 즉각적인 위험에 처해 있다면, 안전하게 할 수 있다면 지역 응급 서비스에 연락하세요.';

  @override
  String get iarSafetyNoteViolence => '신뢰할 수 있는 임박한 위협인 경우, 지역 응급 서비스에도 연락하세요.';

  @override
  String get iarSafetyNoteTerrorism => '임박한 테러 위협인 경우, 지역 응급 서비스에도 연락하세요.';

  @override
  String get iarActionBlockUserTitle => '이 사용자 차단';

  @override
  String get iarActionBlockUserDescription => '메시지 및 친구 요청 중지.';

  @override
  String get iarActionBlockUserButton => '차단';

  @override
  String get iarActionCopyMessageLinkTitle => '메시지 링크 복사';

  @override
  String get iarActionCopyMessageLinkDescription => '커뮤니티 중재자에게 공유하세요.';

  @override
  String get iarActionCopyMessageLinkButton => '복사';

  @override
  String get iarActionCloseDmTitle => '이 DM 닫기';

  @override
  String get iarActionCloseDmDescription => '차단하지 않습니다. 나중에 다시 열 수 있습니다.';

  @override
  String get iarActionCloseDmButton => 'DM 닫기';

  @override
  String get iarActionLeaveCommunityTitle => '채널 나가기';

  @override
  String get iarActionLeaveCommunityDescription =>
      '채널의 콘텐츠 및 멤버를 더 이상 보지 않습니다.';

  @override
  String get iarActionLeaveCommunityButton => '나가기';

  @override
  String get iarActionDmSettingsTitle => 'DM 및 친구 요청 설정';

  @override
  String get iarActionDmSettingsDescription => '누가 나에게 연락할 수 있는지 변경하세요.';

  @override
  String get iarActionCallSettingsTitle => '통화 및 그룹 채팅 설정';

  @override
  String get iarActionCallSettingsDescription =>
      '누가 나에게 전화하거나 추가할 수 있는지 변경하세요.';

  @override
  String get iarActionOpenButton => '열기';

  @override
  String get iarActionDeleteMessageTitle => '이 메시지 삭제';

  @override
  String get iarActionDeleteMessageDescription => '모든 사람에게서 채널의 메시지를 삭제합니다.';

  @override
  String get iarActionDeleteMessageButton => '삭제';

  @override
  String get iarActionDeleteMessageDeletedButton => '삭제됨';

  @override
  String get iarActionDeleteMessageDeletedTooltip => '이 메시지는 이미 삭제되었습니다.';

  @override
  String get iarActionBanUserTitle => '이 사용자 차단';

  @override
  String get iarActionBanUserDescription => '이 채널에서 사용자를 차단하는 대화상자를 엽니다.';

  @override
  String get iarActionBanUserButton => '차단';

  @override
  String get iarActionBanUserBannedButton => '차단됨';

  @override
  String get iarActionBanUserBannedTooltip => '이 사용자는 이미 채널에서 차단되었습니다.';

  @override
  String get iarCloseDmConfirmTitle => 'DM 닫기';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return '$name과의 현재 DM을 닫습니다. 차단하는 것은 아니며 나중에 다시 열 수 있습니다.';
  }

  @override
  String get iarSuccessTitle => '신고 접수됨';

  @override
  String get iarSuccessBody => '안전팀에서 검토 중입니다. 결정이 내려지면 DM과 이메일을 보내드리겠습니다.';

  @override
  String get iarAlreadyReportedTitle => '이미 신고됨';

  @override
  String get iarAlreadyReportedBody => '이 메시지를 이미 신고했습니다. 안전팀에서 검토 중입니다.';

  @override
  String get iarBackButton => '뒤로';

  @override
  String get iarContinueButton => '계속';

  @override
  String get iarSendReportButton => '신고 보내기';

  @override
  String get iarDoneButton => '완료';

  @override
  String get iarCouldntSendToast => '신고를 보낼 수 없습니다. 다시 시도해 주세요.';

  @override
  String get iarRateLimitedToast => '너무 빠르게 신고하고 있습니다. 잠시 기다렸다가 다시 시도해 주세요.';

  @override
  String get iarReportSentToast => '신고가 접수되었습니다. 안전팀에서 검토할 것입니다.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '$name을(를) 차단하시겠어요? 이 사용자는 나에게 메시지를 보내거나 친구 요청을 보낼 수 없습니다. 나중에 차단을 해제할 수 있습니다.';
  }

  @override
  String get iarBlockUserFailedToast => '이 사용자를 차단할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get iarCloseDmSuccessToast => 'DM이 닫혔습니다.';

  @override
  String get iarCloseDmFailedToast => '이 DM을 닫을 수 없습니다. 다시 시도해 주세요.';

  @override
  String get iarLeaveCommunityFailedToast => '이 채널을 떠날 수 없습니다. 다시 시도해 주세요.';

  @override
  String get chatMessageSuppressEmbeds => '임베드 숨기기';

  @override
  String get chatMessageUnsuppressEmbeds => '임베드 표시';

  @override
  String get chatMessageDelete => '메시지 삭제';

  @override
  String get chatMessageDeleteConfirmTitle => '메시지 삭제';

  @override
  String get chatMessageDeleteConfirmDescription => '이 메시지를 삭제하시겠어요?';

  @override
  String get chatMessageDeleteAttachment => '첨부 파일 삭제';

  @override
  String get chatMessageEditAttachmentAltText => '대체 텍스트 수정';

  @override
  String get chatMessageMore => '더보기';

  @override
  String get chatEditingMessage => '메시지 수정 중';

  @override
  String get chatReplyOriginalDeleted => '원본 메시지가 삭제되었습니다.';

  @override
  String get chatReplyOriginalFailedToLoad => '원본 메시지를 불러오지 못했습니다.';

  @override
  String get chatReplyAttachedMedia => '메시지에 미디어 첨부됨';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '차단된 메시지 $count개',
      one: '차단된 메시지 1개',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 스팸 의심 메시지',
      one: '스팸 의심 메시지 1개',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor => '원작자가 차단되어 답글이 숨겨졌습니다.';

  @override
  String get chatReplyHiddenSpammerAuthor => '원작자가 스팸 발신자로 신고되어 답장이 숨겨졌습니다.';

  @override
  String get devMarkAsSpamLocally => '내 기기에서 스팸으로 표시';

  @override
  String get devIgnoreSpamFlag => '스팸 신고 무시';

  @override
  String get chatMessagesLoadError => '메시지를 불러올 수 없습니다.';

  @override
  String get chatReplyMentionOverrideTitle => '멘션 기본 설정 재정의?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname님은 답장에 @멘션을 선호합니다. 그래도 멘션 없이 보내시겠어요?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname님은 답장에 멘션(@)을 사용하지 않는 것을 선호합니다. 그래도 멘션과 함께 보내시겠어요?';
  }

  @override
  String get chatReplyMentionIgnorePreference => '선호도 무시';

  @override
  String get chatReplyMentionDisableTooltip =>
      '답장하는 사용자에게 핑하는 것을 비활성화하려면 클릭하세요.';

  @override
  String get chatReplyMentionEnableTooltip => '답장하는 사용자에게 핑하는 것을 활성화하려면 클릭하세요.';

  @override
  String get chatReplyMentionAccessibilityLabel => '답장한 사용자 멘션';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => '답장 취소';

  @override
  String get chatEditMessageHint => '메시지 수정';

  @override
  String get chatEditNoChanges => '저장할 변경 사항 없음';

  @override
  String get chatChannelNotReady => '채널을 아직 사용할 수 없습니다. 잠시 후 다시 시도하세요.';

  @override
  String get chatMessageEdited => '(수정됨)';

  @override
  String get chatMessageSilent => '이 메시지는 @silent 메시지였습니다.';

  @override
  String chatMessageTimestampToday(String time) {
    return '오늘 $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return '어제 $time';
  }

  @override
  String get mediaViewerImagePreview => '이미지 미리보기';

  @override
  String get mediaViewerClose => '미디어 뷰어 닫기';

  @override
  String get mediaViewerOpenInBrowser => '브라우저에서 열기';

  @override
  String get mediaViewerOptions => '미디어 옵션';

  @override
  String get mediaViewerCopyLink => '링크 복사';

  @override
  String get mediaViewerForward => '전달';

  @override
  String get mediaViewerZoomIn => '확대';

  @override
  String get mediaViewerZoomOut => '축소';

  @override
  String get mediaViewerPreviousAttachment => '이전 첨부 파일';

  @override
  String get mediaViewerNextAttachment => '다음 첨부 파일';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return '첨부 파일 $index';
  }

  @override
  String get mediaViewerDismissBackdrop => '닫기';

  @override
  String get chatAttachmentVideoToggleControls => '동영상 컨트롤 토글';

  @override
  String get chatAttachmentVideoMute => '동영상 음소거';

  @override
  String get chatAttachmentVideoUnmute => '동영상 음소거 해제';

  @override
  String get chatAttachmentVideoPlay => '동영상 재생';

  @override
  String get chatAttachmentVideoPause => '동영상 일시 중지';

  @override
  String get chatAttachmentVideoProgress => '동영상 진행률';

  @override
  String get chatVideoPlaybackFailed => '이 동영상을 재생할 수 없습니다.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      '이 채널을 볼 권한이 있는 이 역할의 사용자에게 알립니다.';

  @override
  String get composerAutocompleteSuggestions => '추천';

  @override
  String get composerAutocompleteCommandsHeading => '명령어';

  @override
  String get composerAutocompleteChoicesHeading => '선택 항목';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => '선택적 인수';

  @override
  String get composerAutocompleteChannelsHeading => '채널';

  @override
  String get composerAutocompleteMembersHeading => '멤버';

  @override
  String get composerAutocompleteUsersHeading => '사용자';

  @override
  String get composerAutocompleteMentionsHeading => '멘션';

  @override
  String get composerAutocompleteRolesHeading => '역할';

  @override
  String get composerAutocompleteMediaHeading => '미디어';

  @override
  String get composerAutocompleteStickersHeading => '스티커';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'GIF를 찾을 수 없습니다';

  @override
  String get composerCommandShrugDescription => '메시지에 ¯\\_(ツ)_/¯를 추가합니다.';

  @override
  String get composerCommandTableflipDescription => '메시지에 (╯°□°)╯︵ ┻━┻를 추가합니다.';

  @override
  String get composerCommandUnflipDescription => '메시지에 ┬─┬ ノ( ゜-゜ノ)를 추가합니다.';

  @override
  String get composerCommandMeDescription => '액션 메시지 보내기 (기울임꼴로 표시).';

  @override
  String get composerCommandSpoilerDescription =>
      '스포일러 메시지 보내기 (스포일러 태그로 감싸집니다.).';

  @override
  String get composerCommandTtsDescription => '음성 메시지를 보냅니다.';

  @override
  String get composerCommandNickDescription => '이 커뮤니티에서 닉네임을 변경하세요.';

  @override
  String get composerCommandKickDescription => '이 커뮤니티에서 멤버 내보내기.';

  @override
  String get composerCommandBanDescription => '이 커뮤니티에서 멤버를 차단합니다.';

  @override
  String get composerCommandMsgDescription => '사용자에게 DM 보내기.';

  @override
  String get composerCommandSavedDescription => '저장된 미디어 항목 보내기.';

  @override
  String get composerCommandStickerDescription => '스티커 보내기.';

  @override
  String get composerCommandGifDescription => 'GIF 검색 및 전송.';

  @override
  String get composerCommandMemberOption => '대상 멤버';

  @override
  String get composerCommandReasonOption => '사유 (선택 사항).';

  @override
  String get composerCommandMessageOption => '보낼 메시지';

  @override
  String get composerCommandQueryOption => '검색할 내용';

  @override
  String get composerCommandNicknameOption => '새로운 닉네임입니다. 비워두면 초기화됩니다.';

  @override
  String get composerCommandDeleteMessagesOption =>
      '멤버의 최근 메시지 기록 중 얼마나 삭제할지 결정합니다.';

  @override
  String get composerCommandDeleteMessagesNone => '모든 메시지 삭제 안 함';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '이전 $count일';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '지난 24시간';

  @override
  String get composerCommandOptionRequired => '이 옵션은 필수입니다. 값을 입력해 주세요.';

  @override
  String get composerCommandClear => '명령 취소';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return '이 커뮤니티에서 닉네임을 **$previousNickname**에서 **$newNickname**(으)로 변경했습니다.';
  }

  @override
  String get composerCommandUnknownUser => '알 수 없는 사용자';

  @override
  String composerCommandMsgFailed(String username) {
    return '**$username**님에게 메시지를 보내지 못했습니다. DM이 비활성화되었거나 차단되었을 수 있습니다.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '$count개 더';
  }

  @override
  String get addGuildModalTitle => '커뮤니티 추가';

  @override
  String get addGuildModalLandingDescription => '새 커뮤니티를 만들거나 기존 커뮤니티에 참여하세요.';

  @override
  String get addGuildCreateCommunity => '커뮤니티 만들기';

  @override
  String get addGuildJoinCommunity => '커뮤니티 참여';

  @override
  String get addGuildImportDiscordTemplate => 'Discord 템플릿 가져오기';

  @override
  String get addGuildJoinTitle => '커뮤니티 참여';

  @override
  String get addGuildJoinDescription => '커뮤니티에 참여하려면 초대 링크를 입력하세요.';

  @override
  String get addGuildInviteLinkLabel => '초대 링크';

  @override
  String get addGuildJoinSubmit => '커뮤니티 참여';

  @override
  String get addGuildInviteInvalid => '이 초대는 유효하지 않거나 만료되었습니다.';

  @override
  String get addGuildJoinFailed => '커뮤니티에 참여할 수 없습니다. 다시 시도하세요.';

  @override
  String get addGuildCreateTitle => '커뮤니티 만들기';

  @override
  String get addGuildCreateDescription => '친구들과 채팅할 커뮤니티를 만드세요.';

  @override
  String get addGuildCreateNameLabel => '커뮤니티 이름';

  @override
  String get addGuildCreateSubmit => '커뮤니티 만들기';

  @override
  String get addGuildCreateFailed => '커뮤니티를 만들 수 없습니다. 다시 시도해 주세요.';

  @override
  String get addGuildCreateClaimTitle => '계정 등록하기';

  @override
  String get addGuildCreateClaimDescription => '커뮤니티를 만들려면 먼저 계정을 등록해야 합니다.';

  @override
  String get addGuildCreateVerifyTitle => '이메일 주소 인증';

  @override
  String get addGuildCreateVerifyDescription =>
      '커뮤니티를 만들려면 먼저 이메일 주소를 인증해야 합니다.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      '새 커뮤니티를 만들 때 애니메이션 아이콘은 지원되지 않습니다. 정지된 이미지를 사용하세요.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      '커뮤니티를 생성하면 다음 사항을 준수하고 지지하는 데 동의합니다. ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName 커뮤니티 가이드라인';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      '이 서버는 커뮤니티가 하나만 존재하므로 추가 커뮤니티를 만들 수 없습니다.';

  @override
  String get addGuildCreateChangeIcon => '아이콘 변경';

  @override
  String get addGuildCreateIconLabel => '커뮤니티 아이콘';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. 최대 10MB. 권장: 512×512px';

  @override
  String get addGuildImportDescription =>
      '새 커뮤니티에 구조를 가져오려면 Discord 템플릿 URL을 붙여넣으세요.';

  @override
  String get addGuildImportUrlLabel => '템플릿 URL';

  @override
  String get addGuildImportUrlInvalid => '유효한 Discord 템플릿 URL 또는 코드를 입력하세요.';

  @override
  String get addGuildImportFetchFailed =>
      '커뮤니티 템플릿을 가져오지 못했습니다. 템플릿이 존재하지 않거나 외부 서비스에 연결할 수 없습니다.';

  @override
  String get addGuildImportInvalidResponse => '이것은 유효한 템플릿 응답이 아닌 것 같습니다.';

  @override
  String get addGuildImportTemplateLabel => '템플릿';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '텍스트 $textChannelCount개, 음성 $voiceChannelCount개, 카테고리 $categoryCount개, 역할 $roleCount개';
  }

  @override
  String get addGuildImportRemoveIcon => '아이콘 삭제';

  @override
  String get addGuildImportTemplateInvalid => '커뮤니티 템플릿 데이터가 유효하지 않거나 잘못되었습니다.';

  @override
  String get addGuildPackInstalled => '팩이 성공적으로 설치되었습니다.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => '모든 반응 삭제';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      '이 메시지의 모든 반응을 삭제하시겠습니까?';

  @override
  String get chatMessageUnpinConfirmTitle => '메시지 고정 해제';

  @override
  String get chatMessageUnpinConfirmDescription => '이 고정을 되돌리시겠습니까?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username님이 이 채널에 $messageLink을(를) 고정했습니다. $allPinsLink을(를) 확인하세요.';
  }

  @override
  String get systemPinMessageMessageLink => '메시지';

  @override
  String get systemPinMessageAllPinsLink => '고정된 모든 메시지';

  @override
  String get channelPinsEmptyTitle => '고정된 메시지가 없습니다';

  @override
  String get channelPinsEmptyDescription => '고정된 메시지가 여기에 표시됩니다.';

  @override
  String get channelDetailsFallbackTitle => '세부정보';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return '그룹 DM · $count명의 멤버';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '$name님과의 대화를 종료하시겠어요?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '$name님, 그룹 나가기?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => '채널 설정';

  @override
  String get channelDetailsGroupSettingsTitle => '그룹 설정';

  @override
  String get channelDetailsDmSettingsTitle => 'DM 설정';

  @override
  String get channelDetailsInvitePeople => '사람 초대';

  @override
  String get channelDetailsCopyLink => '링크 복사';

  @override
  String get channelMenuCopyChannelLink => '채널 링크 복사';

  @override
  String get channelMenuCopyRedirectLink => '리디렉션 링크 복사';

  @override
  String get channelDetailsAddFriendsToGroup => '그룹에 친구 추가';

  @override
  String get channelDetailsGroupInvites => '그룹 초대';

  @override
  String get channelDetailsEditChannel => '채널 수정';

  @override
  String get channelDetailsDeleteChannel => '채널 삭제';

  @override
  String get channelSettingsCategorySettingsTitle => '카테고리 설정';

  @override
  String get channelSettingsEditCategory => '카테고리 편집';

  @override
  String get channelSettingsTabOverview => '개요';

  @override
  String get channelSettingsTabPermissions => '권한';

  @override
  String get channelSettingsTabInvites => '초대';

  @override
  String get channelSettingsTabWebhooks => '웹훅';

  @override
  String get channelSettingsDeleteChannel => '채널 삭제';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return '$channelName을(를) 삭제하시겠어요? 이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return '정말 $categoryName을(를) 삭제하시겠어요? 이 작업은 되돌릴 수 없습니다.';
  }

  @override
  String get channelSettingsDeleteCategory => '카테고리 삭제';

  @override
  String get channelSettingsChannelUpdated => '채널 업데이트됨';

  @override
  String get channelSettingsChannelName => '채널 이름';

  @override
  String get channelSettingsCategoryName => '카테고리 이름';

  @override
  String get channelSettingsMyCategory => '내 카테고리';

  @override
  String get categoryExpandCategory => '카테고리 펼치기';

  @override
  String get categoryCollapseCategory => '카테고리 접기';

  @override
  String get categoryExpandAllCategories => '모든 카테고리 펼치기';

  @override
  String get categoryCollapseAllCategories => '모든 카테고리 접기';

  @override
  String get categoryMuteCategory => '카테고리 알림 끄기';

  @override
  String get categoryUnmuteCategory => '카테고리 음소거 해제';

  @override
  String get categoryCopyCategoryId => '카테고리 ID 복사';

  @override
  String get categoryIdCopied => '카테고리 ID 복사됨';

  @override
  String get channelSettingsChannelNamePlaceholder => '일반';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => '주제';

  @override
  String get channelSettingsTopicPlaceholder => '이 채널에 주제 추가';

  @override
  String get channelSettingsInsertEmoji => '이모티콘 삽입';

  @override
  String get channelSettingsTopicTooLongTitle => '채널 주제가 너무 깁니다.';

  @override
  String get channelSettingsTopicTooLongMessage => '주제를 줄여서 다시 시도해 주세요.';

  @override
  String get channelSettingsSlowmode => '슬로우 모드';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return '메시지 사이에 대기합니다. \"$bypassSlowmodePermissionLabel\" 권한이 있으면 이 제한을 우회할 수 있습니다.';
  }

  @override
  String get channelSettingsSlowmodeOff => '해제';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds초';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes분';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours시간';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute분';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour시간';
  }

  @override
  String get channelSettingsVoiceQuality => '음성 품질';

  @override
  String get channelSettingsVoiceQualityDescription =>
      '더 높은 비트 전송률 = 더 나은 품질 및 더 높은 대역폭 사용량.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '${kilobits}kbps';
  }

  @override
  String get channelSettingsParticipantLimit => '참여 인원 제한';

  @override
  String get channelSettingsParticipantLimitDescription =>
      '한 번에 참여할 수 있는 최대 멤버 수입니다. 0은 무제한을 의미합니다.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '참가자 $count명',
      one: '참가자 1명',
      zero: '무제한',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => '연결 제한';

  @override
  String get channelSettingsConnectionLimitDescription =>
      '이 채널에서 한 명의 멤버가 유지할 수 있는 최대 활성 연결 수입니다.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 연결',
      one: '연결 1개',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => '음성 지역';

  @override
  String get channelSettingsVoiceRegionDescription =>
      '이 채널의 음성 리전을 선택하세요. 자동은 가장 가까운 리전을 사용합니다.';

  @override
  String get channelSettingsVoiceRegionAutomatic => '자동';

  @override
  String get channelSettingsVoiceRegionsLoadFailed => '음성 지역을 불러올 수 없습니다';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      '잠시 후에 다시 시도해 주세요.';

  @override
  String get channelSettingsResetSlider => '슬라이더를 기본값으로 초기화';

  @override
  String get channelSettingsAdvanced => '고급';

  @override
  String get channelSettingsMatureContentOverride => '성인 콘텐츠 재정의';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return '이 채널에 대한 $scopeLevel 수준 설정을 재정의합니다. 미성년자 이용 불가 콘텐츠는 진입 전에 게이트 뒤에 표시됩니다.';
  }

  @override
  String get channelSettingsMatureContentInherit => '상속';

  @override
  String get channelSettingsMatureContentOn => '켜짐';

  @override
  String get channelSettingsMatureContentOff => '해제';

  @override
  String get channelSettingsMatureContentOnDescription =>
      '이 채널을 성인용 콘텐츠로 표시합니다.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      '이 채널의 성인 콘텐츠를 제한하지 않고 허용합니다.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return '$inheritedSourceLabel에서 상속됨: 사용';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return '$inheritedSourceLabel에서 상속됨: 해제';
  }

  @override
  String get channelSettingsMatureContentCategorySource => '카테고리';

  @override
  String get channelSettingsMatureContentCommunitySource => '커뮤니티';

  @override
  String get channelSettingsMatureContentCategoryScope => '카테고리';

  @override
  String get channelSettingsMatureContentCommunityScope => '커뮤니티';

  @override
  String get channelSettingsContentWarningToggle => '이 채널에 콘텐츠 경고 표시';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      '이 채널에 입장하기 전에 동의 프롬프트를 표시합니다.';

  @override
  String get channelSettingsContentWarningText => '맞춤 경고 문구';

  @override
  String get channelSettingsContentWarningDefault => '민감한 콘텐츠가 포함되어 있습니다.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return '이 권한을 수정하려면 \"$manageChannelsPermissionLabel\" 권한이 필요합니다.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return '이 권한을 수정하려면 \"$manageRolesPermissionLabel\" 권한이 있어야 합니다.';
  }

  @override
  String get channelSettingsUnknownRole => '알 수 없는 역할';

  @override
  String get channelSettingsUnknownUser => '알 수 없는 사용자';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => '접근 권한 재정의';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return '$name에 대한 액세스 수정';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => '재정의로 돌아가기';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      '이 채널의 기본 접근 권한 설정';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      '이 역할에 대한 권한 재정의 설정';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      '이 멤버에 대한 권한 재정의 설정';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => '권한 검색…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      '채널 접근 권한 업데이트 완료';

  @override
  String get channelSettingsPermissionsTitle => '접근 제어';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      '이 채널은 상위 카테고리와 동기화됩니다. ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      '이 채널은 상위 카테고리와 동기화되지 않았습니다. ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => '카테고리와 동기화';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      '채널이 상위 카테고리와 동기화되었습니다';

  @override
  String get channelSettingsPermissionsAddOverride => '권한 재정의 추가';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers => '역할 또는 멤버 검색…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => '역할 및 멤버';

  @override
  String get channelSettingsDeleteInvite => '초대 삭제';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      '초대를 삭제할까요? 이 작업은 되돌릴 수 없습니다.';

  @override
  String get channelSettingsCopyInviteCode => '초대 코드 복사';

  @override
  String get channelSettingsCopyInviteUrl => '초대 링크 복사';

  @override
  String get channelSettingsWebhookCreated => '웹훅 생성 완료';

  @override
  String get channelSettingsWebhookCreateFailed => '웹훅 생성 실패';

  @override
  String get channelSettingsCreateWebhook => '웹훅 만들기';

  @override
  String get channelSettingsInvitesDescription => '이 채널에 대한 초대 링크를 관리합니다.';

  @override
  String get channelSettingsInvitesCreate => '초대 링크 만들기';

  @override
  String get channelSettingsInvitesEmpty => '초대 링크 없음';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      '아직 채널 초대 링크가 없습니다. 링크를 만들어 사람들을 채널로 초대해 보세요.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      '이 채널의 초대 링크를 불러오는 중 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get channelSettingsWebhooksDescription =>
      '이 채널에 메시지를 게시할 수 있는 수신 웹훅을 관리합니다.';

  @override
  String get channelSettingsWebhooksEmpty => '웹훅 없음';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      '이 채널에 구성된 웹훅이 없습니다. 외부 앱이 메시지를 게시하도록 웹훅을 생성하세요.';

  @override
  String get channelSettingsWebhooksUnsupported => '이 채널은 웹훅을 지원하지 않습니다.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return '이 채널의 웹훅을 보거나 수정하려면 \"$permission\" 권한이 필요합니다.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => '웹훅을 불러오지 못했습니다';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      '이 채널의 웹훅을 불러오는 중 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return '$creator님이 $date에 생성함';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => '알 수 없는 사용자';

  @override
  String get channelSettingsWebhooksAvatar => '아바타';

  @override
  String get channelSettingsWebhooksUploadImage => '이미지 업로드';

  @override
  String get channelSettingsWebhooksRemove => '제거';

  @override
  String get channelSettingsWebhooksName => '이름';

  @override
  String get channelSettingsWebhooksNamePlaceholder => '웹훅 이름';

  @override
  String get channelSettingsWebhooksChannel => '채널';

  @override
  String get channelSettingsWebhooksUrl => '웹훅 URL';

  @override
  String get channelSettingsWebhooksCopyUrl => '웹훅 URL 복사';

  @override
  String get channelSettingsWebhooksDelete => '웹훅 삭제';

  @override
  String get channelSettingsWebhooksDeleteFailed => '이 웹훅을 삭제할 수 없습니다';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      '이 웹훅을 삭제하시겠어요? 삭제하면 복구할 수 없습니다.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment => '잠시 후에 다시 시도해 주세요.';

  @override
  String get channelMenuOpenChat => '채팅 열기';

  @override
  String get channelMenuDuplicateChannel => '채널 복제';

  @override
  String get channelMenuResetMatureContentAgreeState => '성인 콘텐츠 동의 상태 재설정';

  @override
  String get channelMenuDeleteMyMessagesTitle => '이 채널에서 내 메시지를 삭제할까요?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      '이 채널에서 회원님이 보낸 모든 메시지가 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => '내 메시지 삭제';

  @override
  String get channelMenuDeletedYourMessages => '메시지를 삭제했습니다.';

  @override
  String get channelMenuCouldNotDeleteYourMessages => '메시지를 삭제할 수 없습니다';

  @override
  String get channelDetailsSystemMessage => '시스템 메시지';

  @override
  String get channelDetailsTextChannel => '텍스트 채널';

  @override
  String get channelDetailsVoiceChannel => '음성 채널';

  @override
  String get channelDetailsCategory => '카테고리';

  @override
  String get channelDetailsLinkChannel => '채널 연결';

  @override
  String get channelDetailsGenericChannel => '채널';

  @override
  String get channelDetailsMutedConversation => '대화가 음소거되었습니다.';

  @override
  String get channelDetailsUnmutedConversation => '대화 소리가 켜졌어요';

  @override
  String get channelDetailsMutedChannel => '채널 음소거됨';

  @override
  String get channelDetailsUnmutedChannel => '채널의 음소거를 해제했습니다.';

  @override
  String get channelDetailsNotificationSettingsUpdated => '알림 설정이 업데이트되었습니다.';

  @override
  String get channelDetailsTabMembers => '멤버';

  @override
  String get channelDetailsTabPins => '고정 메시지';

  @override
  String get channelDetailsActionMute => '음소거';

  @override
  String get channelDetailsActionUnmute => '음소거 해제';

  @override
  String get channelDetailsActionSearch => '검색';

  @override
  String get channelDetailsActionMore => '더 보기';

  @override
  String get channelDetailsMembersEmptyTitle => '멤버가 없습니다';

  @override
  String get channelDetailsMembersEmptyBody => '멤버가 여기에 표시됩니다.';

  @override
  String get memberListPermissionDeniedTitle => '멤버를 볼 수 없습니다';

  @override
  String get memberListPermissionDeniedBody => '이 커뮤니티에서는 이 채널의 멤버를 볼 수 없습니다';

  @override
  String get memberListUnavailableTitle => '멤버 목록을 불러올 수 없습니다';

  @override
  String get memberListUnavailableBody => '현재 이 커뮤니티의 멤버 목록을 불러올 수 없습니다';

  @override
  String get channelDetailsPinsLoadFailedTitle => '핀을 불러올 수 없습니다';

  @override
  String get channelDetailsPinsGuildEndHint =>
      '\"메시지 고정\" 권한이 있는 멤버는 모든 사람이 볼 수 있도록 메시지를 고정할 수 있습니다.';

  @override
  String get channelDetailsPinsDmEndHint =>
      '이 대화의 메시지를 고정하여 모든 사람이 볼 수 있도록 할 수 있습니다.';

  @override
  String get channelDetailsPinsEndReached => '더 이상 내용이 없습니다';

  @override
  String get channelHeaderOpenDetails => '채널 세부 정보 열기';

  @override
  String get channelHeaderPinnedMessages => '고정된 메시지';

  @override
  String get channelHeaderPinnedMessagesUnread => '읽지 않은 고정 메시지';

  @override
  String get channelHeaderMemberList => '멤버 목록';

  @override
  String get channelHeaderInbox => '받은 메시지함';

  @override
  String get channelHeaderNotificationSettingsMuted => '알림 설정, 음소거됨';

  @override
  String get channelDetailsSearchTitle => '검색';

  @override
  String get channelDetailsSearchHint => '메시지 검색';

  @override
  String get channelDetailsSearchFilterFrom => '보낸 사람';

  @override
  String get channelDetailsSearchFilterHas => '포함';

  @override
  String get channelDetailsSearchFilterIn => '채널 내';

  @override
  String get channelDetailsSearchFilterMentions => '멘션';

  @override
  String get channelDetailsSearchFilterMore => '더 보기';

  @override
  String get channelDetailsSearchMoreFiltersActive => '활성';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '채널 $count개';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count명의 사용자';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => '사용자';

  @override
  String get channelDetailsSearchAuthorTypeBot => '봇';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => '웹훅';

  @override
  String get channelDetailsSearchFilterByChannel => '채널로 필터링';

  @override
  String get channelDetailsSearchChannelsHint => '채널 검색';

  @override
  String get channelDetailsSearchChannelsEmpty => '채널을 찾을 수 없습니다';

  @override
  String get channelDetailsSearchMoreFiltersPinned => '고정됨';

  @override
  String get channelDetailsSearchPinnedTrue => '고정된 항목만';

  @override
  String get channelDetailsSearchPinnedFalse => '고정 제외';

  @override
  String get channelDetailsSearchClearFilter => '지우기';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => '작성자 유형';

  @override
  String get channelDetailsSearchMoreFiltersDate => '날짜';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => '날짜 모드';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => '날짜 선택';

  @override
  String get channelDetailsSearchMoreFiltersLink => '호스트 이름 링크';

  @override
  String get channelDetailsSearchMoreFiltersFileName => '파일명에 포함';

  @override
  String get channelDetailsSearchMoreFiltersFileType => '파일 확장자';

  @override
  String get channelDetailsSearchContentPoll => '투표';

  @override
  String get channelDetailsSearchContentPollDescription => '투표가 포함된 메시지';

  @override
  String get channelDetailsSearchContentForward => '전달';

  @override
  String get channelDetailsSearchContentForwardDescription => '전달된 메시지';

  @override
  String get channelDetailsSearchFilterSort => '정렬';

  @override
  String get channelHeaderSearchFiltersTitle => '검색 필터';

  @override
  String get channelHeaderSearchRecentTitle => '최근 검색';

  @override
  String get channelHeaderSearchUsersTitle => '사용자';

  @override
  String get channelHeaderSearchChannelsTitle => '채널';

  @override
  String get channelHeaderSearchValuesTitle => '값';

  @override
  String get channelHeaderSearchDatesTitle => '날짜';

  @override
  String get channelHeaderSearchDefaultBadge => '기본';

  @override
  String get channelHeaderSearchClearHistory => '지우기';

  @override
  String get channelHeaderSearchFilterDescFrom => '사용자';

  @override
  String get channelHeaderSearchFilterDescMentions => '사용자';

  @override
  String get channelHeaderSearchFilterDescHas =>
      '링크, 임베드, 이미지, 동영상, 소리, 파일, 스티커 등';

  @override
  String get channelHeaderSearchFilterDescBefore => '날짜 또는 날짜 범위';

  @override
  String get channelHeaderSearchFilterDescOn => '날짜 또는 날짜 범위';

  @override
  String get channelHeaderSearchFilterDescDuring => '날짜 또는 날짜 범위';

  @override
  String get channelHeaderSearchFilterDescAfter => '날짜 또는 날짜 범위';

  @override
  String get channelHeaderSearchFilterDescIn => '채널';

  @override
  String get channelHeaderSearchFilterDescPinned => '참 또는 거짓';

  @override
  String get channelHeaderSearchFilterDescAuthorType => '사용자, 봇 또는 웹훅';

  @override
  String get channelHeaderSearchFilterDescLinkFrom => '예: example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => '첨부 파일 이름의 일부';

  @override
  String get channelHeaderSearchFilterDescFileType => '파일 확장자(예: png)';

  @override
  String get channelHeaderSearchFilterDescSort => '시간 또는 관련성';

  @override
  String get channelHeaderSearchFilterDescOrder => '오름차순 또는 내림차순';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '결과 $countString개',
      one: '결과 1개',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => '사용자 필터링';

  @override
  String get channelDetailsSearchFilterByContent => '콘텐츠로 필터링';

  @override
  String get channelDetailsSearchSortBy => '정렬 기준';

  @override
  String get channelDetailsSearchIn => '채널에서 검색';

  @override
  String get channelDetailsSearchEmptyTitle => '이 대화 검색';

  @override
  String get channelDetailsSearchEmptyBody =>
      '메시지를 찾으려면 텍스트, 작성자 또는 콘텐츠 필터를 입력하세요.';

  @override
  String get channelDetailsSearchIndexingTitle => '메시지 색인 생성 중';

  @override
  String get channelDetailsSearchIndexingBody =>
      '잠시 후 검색이 이 범위를 색인하는 것을 완료하면 다시 시도하세요.';

  @override
  String get channelDetailsSearchNoResultsTitle => '결과 없음';

  @override
  String get channelDetailsSearchNoResultsBody => '다른 검색어 또는 필터를 사용해 보세요.';

  @override
  String get channelDetailsMembersOnline => '온라인';

  @override
  String get channelDetailsMembersOffline => '오프라인';

  @override
  String get channelDetailsMemberYou => '나';

  @override
  String get channelDetailsSearchUsersHint => '사용자 검색';

  @override
  String get channelDetailsSearchUsersTypeToSearch => '멤버를 검색하려면 입력하세요';

  @override
  String get channelDetailsSearchUsersEmpty => '사용자를 찾을 수 없습니다';

  @override
  String get channelDetailsSearchUsersNoAvailable => '사용 가능한 유저 없음';

  @override
  String get channelDetailsDone => '완료';

  @override
  String get channelDetailsHasFilterPrompt => '다음 내용을 포함하는 메시지 표시:';

  @override
  String get channelDetailsRetry => '다시 시도';

  @override
  String get channelDetailsPinnedMessageTitle => '고정된 메시지';

  @override
  String get channelDetailsSearchResultTitle => '검색 결과';

  @override
  String get channelDetailsJumpToMessage => '메시지로 이동';

  @override
  String get channelDetailsUnpinMessage => '메시지 고정 해제';

  @override
  String get channelDetailsCopyMessageLink => '메시지 링크 복사';

  @override
  String get channelDetailsCopyMessageId => '메시지 ID 복사';

  @override
  String get channelDetailsMessageUnpinned => '메시지 고정 해제됨';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => '현재 커뮤니티';

  @override
  String get channelDetailsSearchScopeCurrentDm => '현재 DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => '모든 커뮤니티';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => '모든 DM만';

  @override
  String get channelDetailsSearchScopeAllDms => '모든 DM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'DM만 열기';

  @override
  String get channelDetailsSearchScopeOpenDms => '오픈 DM';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities => '모든 DM + 커뮤니티';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities => 'DM 및 커뮤니티';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      '현재 커뮤니티에서만 검색';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription => '현재 DM에서만 검색';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      '현재 참여 중인 모든 커뮤니티에서';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      '참여했던 모든 DM에서만';

  @override
  String get channelDetailsSearchScopeAllDmsDescription => '참여했던 모든 DM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      '열려 있는 모든 DM에서';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription => '현재 열려 있는 모든 DM에서';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      '지금까지 참여한 모든 DM과 현재 참여 중인 모든 커뮤니티';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      '열려 있는 모든 DM 및 참여 중인 모든 커뮤니티';

  @override
  String get channelDetailsSearchSortNewest => '최신순';

  @override
  String get channelDetailsSearchSortOldest => '오래된 순';

  @override
  String get channelDetailsSearchSortRelevance => '가장 관련성 높은';

  @override
  String get channelDetailsSearchSortNewestDescription => '최신 메시지 먼저 보기';

  @override
  String get channelDetailsSearchSortOldestDescription => '오래된 메시지 먼저 보기';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      '가장 관련성 높은 메시지 먼저 표시';

  @override
  String get channelDetailsSearchContentImage => '이미지 업로드';

  @override
  String get channelDetailsSearchContentVideo => '동영상 업로드';

  @override
  String get channelDetailsSearchContentAudio => '오디오 업로드';

  @override
  String get channelDetailsSearchContentFile => '파일 업로드';

  @override
  String get channelDetailsSearchContentLink => '링크';

  @override
  String get channelDetailsSearchContentEmbed => '링크 미리보기 또는 임베드';

  @override
  String get channelDetailsSearchContentSticker => '스티커';

  @override
  String get channelDetailsSearchContentImageDescription => '업로드된 이미지만';

  @override
  String get channelDetailsSearchContentVideoDescription => '업로드된 동영상 파일만';

  @override
  String get channelDetailsSearchContentAudioDescription => '업로드된 오디오 파일만';

  @override
  String get channelDetailsSearchContentFileDescription => '모든 첨부 파일';

  @override
  String get channelDetailsSearchContentLinkDescription => '메시지 텍스트에 입력된 URL';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      '미리보기 및 리치 임베드 해결됨(업로드 제외)';

  @override
  String get channelDetailsSearchContentStickerDescription => '메시지에 스티커 첨부됨';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count가지 유형';
  }

  @override
  String get personalNotesTitle => '개인 메모';

  @override
  String get personalNotesSubtitle => '생각과 알림을 위한 나만의 공간';

  @override
  String groupDmWelcome(String displayName) {
    return '$displayName에 오신 것을 환영합니다. 친구를 추가하여 그룹을 시작하세요.';
  }

  @override
  String get groupDmWelcomeEditGroup => '그룹 편집';

  @override
  String get groupDmWelcomeAddFriends => '그룹에 친구 추가';

  @override
  String get dmGroupInvites => '초대';

  @override
  String get groupDmEditTitle => '그룹 편집';

  @override
  String get groupDmEditDetailsTooltip => '그룹 정보 수정';

  @override
  String get groupDmGroupName => '그룹 이름';

  @override
  String get groupDmMyGroup => '내 그룹';

  @override
  String get groupDmGroupNameMaxLength => '그룹 이름은 100자를 초과할 수 없습니다';

  @override
  String get groupDmGroupIcon => '그룹 아이콘';

  @override
  String get groupDmUploadIcon => '아이콘 업로드';

  @override
  String get groupDmChangeIcon => '아이콘 변경';

  @override
  String get groupDmRemoveIcon => '아이콘 삭제';

  @override
  String get groupDmUpdated => '그룹이 업데이트되었습니다';

  @override
  String get groupDmUpdateFailed => '그룹을 업데이트할 수 없습니다. 다시 시도하세요.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      '애니메이션 아이콘은 지원되지 않습니다. 정지된 이미지를 사용하세요.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle => '움직이는 아이콘은 지원되지 않습니다';

  @override
  String get groupDmIconFileTooLargeTitle => '아이콘 파일이 너무 큽니다';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return '아이콘 파일이 너무 큽니다. $maxSize보다 작은 파일을 선택하세요.';
  }

  @override
  String get groupDmUnsupportedIconFormat => '지원되지 않는 아이콘 형식';

  @override
  String get groupDmUnsupportedIconFormatBody => '지원되지 않는 파일 유형입니다.';

  @override
  String get groupDmCouldntProcessImage => '이미지를 처리할 수 없습니다';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      '자른 이미지를 처리하지 못했습니다. 다시 시도해 주세요.';

  @override
  String get groupDmInvalidImage => '잘못된 이미지';

  @override
  String get groupDmInvalidImageBody => '이미지가 유효하지 않습니다. 다른 이미지를 시도해 보세요.';

  @override
  String get groupDmAddFriends => '추가';

  @override
  String get groupDmOrSendInvite => '또는 친구에게 초대 보내기:';

  @override
  String get groupDmGenerateInviteLink => '초대 링크 생성';

  @override
  String get groupDmCreateInvite => '만들기';

  @override
  String get groupDmInviteExpires24Hours => '초대 링크는 24시간 후에 만료돼요';

  @override
  String get groupDmAddFriendFailed => '그룹에 친구를 추가할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get groupDmAddFailed => '그룹에 추가할 수 없음';

  @override
  String get groupDmGroupFull => '이 그룹이 가득 찼습니다. 다른 사람을 추가하려면 먼저 그룹에서 내보내세요.';

  @override
  String get groupDmRateLimited => '너무 빠릅니다. 잠시 기다렸다가 다시 시도해 주세요.';

  @override
  String get groupDmCreateInviteFailed => '초대 링크를 만들 수 없습니다';

  @override
  String get groupDmCreateInviteFailedBody => '초대 링크를 생성할 수 없습니다. 다시 시도해 주세요.';

  @override
  String get guildNavbarCreateInviteFailed => '초대 링크를 만들 수 없습니다. 다시 시도해 주세요.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      '이 채널에서 초대장을 만들 권한이 없습니다.';

  @override
  String get guildNavbarCreateInviteMaxInvites => '이 커뮤니티는 초대 제한에 도달했습니다.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      '이 커뮤니티의 초대 생성 기능이 일시적으로 비활성화되었습니다.';

  @override
  String get groupDmCopyInviteFailed => '초대 링크 복사 실패';

  @override
  String get groupDmInvitesOwnerOnly => '그룹 소유자만 초대를 관리할 수 있습니다.';

  @override
  String get groupDmNoInvitesCreated => '생성된 초대 없음';

  @override
  String get groupDmLoadingInvites => '초대 불러오는 중...';

  @override
  String get groupDmInvitesLoadFailed => '초대 로드에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get groupDmInvitesRevokeConfirm => '이 초대를 취소하시겠어요? 되돌릴 수 없어요.';

  @override
  String get groupDmInviteRevoked => '초대 취소됨';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return '$name님이 만들었으며, $time 후에 만료됩니다.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return '$channelName에 오신 것을 환영합니다';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return '처음에는 아무것도 없었습니다. 그러다 $channelName이 생겼습니다. 그리고 그것은 좋았습니다.';
  }

  @override
  String get personalNotesComposerHint => '자신에게 메시지 보내기';

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
  String get composerOpenExpressionPicker => '이모티콘 및 미디어 선택 열기';

  @override
  String get composerShowKeyboard => '키보드 보기';

  @override
  String get composerCloseAttachmentPanel => '첨부 파일 선택 창 닫기';

  @override
  String get chatAttachmentPanelPhotos => '사진';

  @override
  String get chatAttachmentPanelFiles => '파일';

  @override
  String get chatAttachmentLibraryPermissionTitle => '사진 보관함 접근이 필요합니다';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      '최근 사진 및 동영상을 찾아 첨부하려면 사진 보관함 접근을 허용하세요.';

  @override
  String get chatAttachmentLibraryPermissionSettings => '설정 열기';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => '보내는 중';

  @override
  String get messageAccessibilityFailedSuffix => ', 전송 실패';

  @override
  String get messageAccessibilityAttachmentSummary => '첨부 파일';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count개의 첨부 파일';
  }

  @override
  String get messageAccessibilityImageSummary => '이미지';

  @override
  String get messageAccessibilityVideoSummary => '동영상';

  @override
  String get messageAccessibilityAudioSummary => '오디오 파일';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return '스티커 $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return '파일 $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => '스포일러 첨부 파일';

  @override
  String get messageAccessibilityEmbedSummary => '임베드';

  @override
  String get messageAccessibilityEmptySummary => '메시지';

  @override
  String get personalNotesPrivateSpace => '나만의 공간';

  @override
  String get purgePersonalNotes => '개인 메모 삭제';

  @override
  String get purgePersonalNotesConfirmDescription =>
      '개인 메모의 모든 메시지와 첨부 파일이 영구적으로 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get purgePersonalNotesConfirmButton => '삭제';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '개인 메모에서 $count개의 메시지를 삭제했습니다';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => '개인 메모가 이미 비어 있었습니다';

  @override
  String get purgePersonalNotesFailed => '개인 메모를 지울 수 없습니다';

  @override
  String get userSettingsGroupYourAccount => '계정';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => '설정 검색...';

  @override
  String get userSettingsSearchFieldLabel => '설정 검색';

  @override
  String get userSettingsSearchClear => '검색 지우기';

  @override
  String get userSettingsSearchNoResults => '설정 없음';

  @override
  String get userSettingsNavProfile => '프로필';

  @override
  String get userSettingsNavSecurityLogin => '보안 및 로그인';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => '선물';

  @override
  String get giftSettingsClaimAccountTitle => '계정 등록하기';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Plutonium 선물 코드를 사용하거나 관리하려면 계정을 등록하세요.';

  @override
  String get giftSettingsRedeemTitle => '선물 사용하기';

  @override
  String get giftSettingsRedeemDescription =>
      '계정에 Plutonium을 등록하려면 선물 코드를 입력하세요.';

  @override
  String get giftSettingsRedeemPlaceholder => '선물 코드 입력…';

  @override
  String get giftSettingsRedeemButton => '사용하기';

  @override
  String get giftSettingsRedeemSuccess =>
      '선물이 성공적으로 사용되었습니다. Plutonium을 즐겨보세요.';

  @override
  String get giftSettingsPurchasedTitle => '구매한 선물';

  @override
  String get giftSettingsPurchasedDescription =>
      '구매한 Plutonium 선물 코드의 관리. 특별한 사람에게 선물 URL을 공유하거나 직접 사용하세요!';

  @override
  String get giftSettingsEmptyTitle => '아직 선물이 없어요';

  @override
  String get giftSettingsEmptyDescription =>
      'Plutonium 탭에서 Plutonium 선물을 구매하여 친구들과 공유하세요.';

  @override
  String get giftSettingsGoToPlutonium => 'Plutonium으로 이동';

  @override
  String get giftSettingsLoadFailedTitle => '선물 목록을 불러오지 못했습니다';

  @override
  String get giftSettingsLoadFailedDescription => '나중에 다시 시도해 주세요.';

  @override
  String get giftSettingsTryAgain => '다시 시도';

  @override
  String get giftSettingsGiftUrl => '선물 URL';

  @override
  String get giftSettingsCopy => '복사';

  @override
  String get giftSettingsCopied => '복사됨';

  @override
  String get giftSettingsGiftUrlCopied => '선물 URL이 클립보드에 복사되었습니다!';

  @override
  String get giftSettingsGiftUrlCopyFailed => '선물 URL을 복사할 수 없습니다';

  @override
  String giftSettingsPurchasedDate(String date) {
    return '$date에 구매함';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return '$date에 선물함';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return '$name(님이) 사용하셨습니다';
  }

  @override
  String get giftSettingsAlreadyRedeemed => '선물이 사용되었습니다';

  @override
  String get giftSettingsRedeemForYourself => '내 계정으로 사용';

  @override
  String get giftSettingsShareWithFriend => '친구에게 공유하기';

  @override
  String get premiumPlutoniumTagline =>
      '독립적인 커뮤니케이션 플랫폼을 지원하면서 더 높은 한도와 독점적인 기능을 이용해 보세요.';

  @override
  String get premiumPurchaseMode => '구매 모드';

  @override
  String get premiumForMe => '나를 위해';

  @override
  String get premiumAsAGift => '선물하기';

  @override
  String get premiumMonthly => '월간';

  @override
  String get premiumYearly => '연간';

  @override
  String get premiumPerMonth => '/월';

  @override
  String get premiumPerYear => '년';

  @override
  String get premiumOneTimePurchase => '일회성 구매';

  @override
  String get premiumSave17 => '17% 할인';

  @override
  String get premiumUpgradeNow => '지금 업그레이드';

  @override
  String get premiumBuyGift => '선물 구매';

  @override
  String get premiumOneYearGift => '1년 선물';

  @override
  String get premiumOneMonthGift => '1개월 선물';

  @override
  String get premiumMostPopular => '가장 인기 많음';

  @override
  String get premiumScrollPrompt => 'Plutonium의 모든 혜택을 보려면 아래로 스크롤하세요.';

  @override
  String get premiumFreeVsPlutonium => '무료 vs Plutonium';

  @override
  String get premiumFreeColumn => '무료';

  @override
  String get premiumGiftSectionTitle => 'Plutonium 선물하기';

  @override
  String get premiumGiftSectionDescription =>
      '선물 구독을 구매하여 친구들과 Plutonium 경험을 공유하세요.';

  @override
  String get premiumGiftBannerOne => '새 선물 코드가 기다리고 있어요!';

  @override
  String premiumGiftBannerMany(int count) {
    return '새 선물 코드가 $count개 있습니다!';
  }

  @override
  String get premiumViewGifts => '선물 보기';

  @override
  String get premiumReadyToUpgrade => '업그레이드할 준비가 되셨나요?';

  @override
  String get premiumReadyToBuyGift => '선물할 준비가 되셨나요?';

  @override
  String premiumMonthlyPrice(String price) {
    return '월간 $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return '연간 $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1년 $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1개월 $price';
  }

  @override
  String get premiumManageSubscription => '구독 관리';

  @override
  String get premiumRedeemGiftCode => '선물 코드 등록';

  @override
  String get premiumGiftBadge => '선물';

  @override
  String get premiumCancelSubscriptionTitle => '구독을 취소하시겠어요?';

  @override
  String get premiumCancelSubscriptionBody =>
      '다음 갱신일까지 혜택이 유지되며, 3일의 유예 기간 동안 재구독하여 구독 기록을 유지할 수 있습니다.';

  @override
  String get premiumCancelSubscriptionConfirm => '구독 취소';

  @override
  String get premiumKeepSubscription => '구독 유지';

  @override
  String get premiumPurchaseHistoryTitle => '구매 내역';

  @override
  String get premiumPurchaseHistoryDescription =>
      '최근 청구서입니다. 구독 결제 방법을 변경하려면, 결제 포털에서 추가하거나 선택한 후 기본으로 설정하세요.';

  @override
  String get premiumManagePaymentMethods => '결제 수단 관리';

  @override
  String get premiumBillingHistory => '결제 내역';

  @override
  String get premiumSelfServeRefundTitle => '환불 요청';

  @override
  String get premiumSelfServeRefundButton => '최근 구매 환불';

  @override
  String get premiumDisclaimerAgreementPrefix => '구매함으로써 다음 사항에 동의합니다. ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => '구매함으로써 귀하는 당사의 ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' 및 ';

  @override
  String premiumActiveUntil(String date) {
    return '$date까지 활성';
  }

  @override
  String get premiumSubscriptionCanceling => '취소 중';

  @override
  String premiumCancelsOn(String date) {
    return '$date에 취소됩니다. 그때까지 혜택은 유지됩니다.';
  }

  @override
  String get premiumReactivateSubscription => '재활성화';

  @override
  String premiumGiftedUntil(String date) {
    return '$date까지 선물로 제공됩니다. 자동 갱신되지 않습니다.';
  }

  @override
  String get premiumComparisonFeatureColumn => '기능';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return '구매함으로써 $terms 및 $privacy에 동의했습니다.';
  }

  @override
  String get premiumDisclaimerRefund =>
      '결제 후 3일 이내, 30일마다 한 번씩 직접 환불할 수 있습니다. 구독을 환불하면 구독이 취소됩니다. EU/EEA 구매자는 콘텐츠에 즉시 액세스하기 위해 결제 시 14일 철회 권리를 포기합니다. 차지백 대신 앱 내 환불 버튼을 사용하세요. 차지백은 계정을 영구적으로 제한할 수 있습니다. Stripe가 결제를 안전하게 처리하며, Fluxer는 고객님의 전체 카드 번호를 볼 수 없습니다.';

  @override
  String get premiumTermsOfService => '이용약관';

  @override
  String get premiumPrivacyPolicy => '개인정보처리방침';

  @override
  String get premiumCheckoutStartFailedTitle => '결제를 시작할 수 없습니다';

  @override
  String get premiumCheckoutStartFailedBody =>
      '결제를 시작하는 중에 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      '현재 선물 구독 중입니다. 이 구독은 갱신되지 않습니다. 선물 코드를 추가로 사용하여 구독 기간을 연장할 수 있습니다. 선물 구독 기간이 종료된 후에는 정기 구독을 시작할 수 있습니다.';

  @override
  String get premiumPlanUnavailable => '이용할 수 없는 플랜입니다. 지원팀에 문의하세요.';

  @override
  String get premiumCompletePaymentTitle => '결제 완료하기';

  @override
  String get premiumCompletePaymentBody =>
      '결제를 완료하기 위해 Stripe로 이동합니다. 완료 후 Fluxer로 돌아오세요.';

  @override
  String get premiumChoosePaymentMethodTitle => '결제 수단 선택';

  @override
  String get premiumPixPaymentPromptDescription =>
      '자동 Pix 결제로 브라질 은행에서 직접 정기 결제를 승인하세요. 또는 카드 사용을 선택하여 Stripe의 다음 화면에서 신용카드를 입력하세요.';

  @override
  String get premiumUsePix => 'Pix 사용';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'UPI로 결제하여 인도 은행에서 RBI 규정을 준수하는 전자 위임장을 설정하세요. 또는 카드 사용을 선택하여 Stripe의 다음 화면에서 신용카드를 입력하세요.';

  @override
  String get premiumUseUpi => 'UPI 사용';

  @override
  String get premiumUseCard => '카드 사용';

  @override
  String get premiumCustomerPortalOpenFailedTitle => '결제 포털을 열 수 없습니다';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      '결제 포털을 여는 중 문제가 발생했습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get premiumAlreadyVisionaryTitle => '이미 Visionary이시네요';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary는 영구적인 액세스를 포함하므로 반복 구독이 필요하지 않습니다. 다른 사람을 위한 선물을 구매할 수 있습니다.';

  @override
  String get premiumExistingSubscriptionTitle => '이미 구독 중입니다';

  @override
  String get premiumExistingSubscriptionBody =>
      '이 계정에 기존 Fluxer Plutonium 구독이 있습니다. 결제 정보 업데이트 또는 갱신 상태 확인은 보안 결제 포털에서 관리하세요. 방금 결제하셨다면 1분 정도 기다렸다가 이 페이지를 다시 열어주세요.';

  @override
  String get premiumPurchasesDisabledTitle => '구매 불가';

  @override
  String get premiumPurchasesDisabledBody =>
      '이 계정에서는 구매가 비활성화되어 있습니다. 문제가 잘못된 것으로 보이면 support@fluxer.app으로 문의하세요.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Fluxer Plutonium을 구매하려면 계정을 등록하세요.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Fluxer Plutonium을 구매하려면 먼저 이메일을 인증해야 합니다.';

  @override
  String get premiumPerkCustomUsernameTag => '사용자 이름 태그 맞춤 설정';

  @override
  String get premiumPerkPerCommunityProfiles => '커뮤니티별 프로필';

  @override
  String get premiumPerkMessageScheduling => '메시지 예약';

  @override
  String get premiumPerkProfileBadge => '프로필 뱃지';

  @override
  String get premiumPerkCustomVideoBackgrounds => '맞춤 동영상 배경';

  @override
  String get premiumPerkEntranceSounds => '입장 효과음';

  @override
  String get premiumPerkCommunities => '커뮤니티';

  @override
  String get premiumPerkMessageCharacterLimit => '메시지 글자 수 제한';

  @override
  String get premiumPerkBookmarkedMessages => '북마크 메시지';

  @override
  String get premiumPerkFileUploadSize => '파일 업로드 크기';

  @override
  String get premiumPerkEmojiStickerPacks => '이모티콘 및 스티커 팩';

  @override
  String get premiumPerkSavedMedia => '저장된 미디어';

  @override
  String get premiumPerkUseAnimatedEmojis => '움직이는 이모티콘 사용';

  @override
  String get premiumPerkGlobalEmojiStickerAccess => '전 세계 이모티콘 및 스티커 이용';

  @override
  String get premiumPerkVideoQuality => '동영상 화질';

  @override
  String get premiumPerkAnimatedAvatarsBanners => '움직이는 아바타 및 프로필 배너';

  @override
  String get premiumPerkEarlyAccess => '새로운 기능 미리 이용하기';

  @override
  String get premiumPerkCustomThemes => '테마 직접 설정';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '최대 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => '개인정보 대시보드';

  @override
  String get userSettingsNavAuthorizedApps => '승인된 앱';

  @override
  String get userSettingsNavBlockedUsers => '차단된 사용자';

  @override
  String get userSettingsNavLinkedDevices => '연결된 기기';

  @override
  String get userSettingsNavConnections => '연결';

  @override
  String get userSettingsNavLookAndFeel => '모양 및 느낌';

  @override
  String get userSettingsNavAccessibility => '접근성';

  @override
  String get userSettingsNavChat => '메시지 및 미디어';

  @override
  String get userSettingsNavAudioAndVideo => '오디오 및 비디오';

  @override
  String get userSettingsNavShortcuts => '단축키';

  @override
  String get audioAndVideoAudioSectionTitle => '오디오';

  @override
  String get audioAndVideoAudioSectionDescription => '마이크, 스피커 및 음성 처리를 설정하세요.';

  @override
  String get audioAndVideoVideoSectionTitle => '비디오';

  @override
  String get audioAndVideoVideoSectionDescription => '카메라 및 화면 공유 품질을 설정하세요.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => '통화 중 동작';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      '음성 및 영상 통화 중 확인 프롬프트를 제어합니다.';

  @override
  String get audioAndVideoInputDeviceLabel => '입력 장치';

  @override
  String get audioAndVideoOutputDeviceLabel => '출력 장치';

  @override
  String get audioAndVideoDefaultDeviceLabel => '기본';

  @override
  String get audioAndVideoUseSpeakerLabel => '스피커 사용';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      '사용 안 함으로 설정하면 오디오가 수화기 또는 연결된 헤드폰을 통해 재생됩니다.';

  @override
  String get audioAndVideoInputVolumeLabel => '입력 볼륨';

  @override
  String get audioAndVideoOutputVolumeLabel => '출력 볼륨';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => '음성 처리';

  @override
  String get audioAndVideoFocusedVoiceLabel => '음성 포커스';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      '권장. 마이크를 정리하여 음성을 선명하게 만듭니다.';

  @override
  String get audioAndVideoDirectInputLabel => '직접 입력';

  @override
  String get audioAndVideoDirectInputDescription =>
      '오디오를 그대로 보냅니다. 외부 오디오 소프트웨어를 사용하는 경우에 가장 적합합니다.';

  @override
  String get audioAndVideoCustomProfileLabel => '사용자 지정';

  @override
  String get audioAndVideoCustomProfileDescription =>
      '노이즈 억제, 에코 제거, 게인 등 각 설정을 직접 조정하세요.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => '노이즈 억제';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => '향상됨';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => '표준';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => '없음';

  @override
  String get audioAndVideoEchoCancellationLabel => '에코 제거';

  @override
  String get audioAndVideoAutomaticGainControlLabel => '자동 게인 제어';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      '마이크 볼륨을 일정하게 유지합니다. 향상된 노이즈 억제 기능이 켜져 있으면 꺼집니다.';

  @override
  String get audioAndVideoMicTestSectionTitle => '마이크 테스트';

  @override
  String get audioAndVideoMicTestStartLabel => '마이크 테스트 시작';

  @override
  String get audioAndVideoMicTestStopLabel => '마이크 테스트 중지';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName에서 마이크 테스트를 하려면 마이크 액세스가 필요합니다.';
  }

  @override
  String get audioAndVideoCameraLabel => '카메라';

  @override
  String get audioAndVideoMirrorCameraLabel => '카메라 좌우 반전';

  @override
  String get audioAndVideoCameraQualitySectionTitle => '카메라 화질';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle => '화면 공유 품질';

  @override
  String get audioAndVideoFrameRateSectionTitle => '프레임률';

  @override
  String get audioAndVideoFrameRate15Label => '초당 15프레임';

  @override
  String get audioAndVideoFrameRate30Label => '초당 30프레임';

  @override
  String get audioAndVideoFrameRate60Label => '초당 60 프레임';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p 및 60 FPS를 사용하려면 $premiumProductName이(가) 필요합니다.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      '이 인스턴스에서는 현재 최대 720p, 30 FPS로 화면 공유가 가능합니다.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName에서 기기 목록을 보려면 마이크 접근 권한이 필요합니다.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName에서 기기 목록을 보려면 카메라 접근 권한이 필요합니다.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel => '카메라를 숨길 때 다시 묻지 않기';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      '내 화면 공유 숨길 때 묻지 않기';

  @override
  String get userSettingsNavNotifications => '알림';

  @override
  String get notificationsGeneralSectionTitle => '일반';

  @override
  String get notificationsEnableNotificationsLabel => '알림 켜기';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return '메시지를 받으면 알림을 받습니다. 기기 설정에서 $productName 알림을 허용해야 할 수도 있습니다. 채널/커뮤니티별 제어는 커뮤니티 메뉴에서 알림 설정을 여세요.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel => '데스크톱 알림 켜기';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'OS 알림 센터를 사용합니다. 채널/커뮤니티별 설정은 커뮤니티 아이콘을 마우스 오른쪽 버튼으로 클릭하여 알림 설정을 여세요.';

  @override
  String get notificationsEnableBrowserNotificationsLabel => '브라우저 알림 켜기';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      '메시지를 받으면 알림을 받습니다. 브라우저 설정에서 알림을 허용해야 할 수도 있습니다. 채널/커뮤니티별 설정은 커뮤니티 아이콘을 마우스 오른쪽 버튼으로 클릭하고 알림 설정을 여세요.';

  @override
  String get notificationsPushInactiveTimeoutLabel => '푸시 알림 비활성 시간 제한';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName은 사용자가 컴퓨터를 사용하는 동안에는 모바일 기기로 푸시 알림을 보내지 않도록 합니다. 데스크톱에서 푸시 알림을 받기 전에 얼마나 오랫동안 비활성 상태를 유지해야 하는지 선택하세요.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute분';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes분';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => '멘션 환경설정';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel => '답장 멘션 환경설정';

  @override
  String get notificationsMentionNoPreferenceName => '설정 안 함';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      '보낸 사람의 의도를 존중하여 @멘션 토글 시 경고 없음';

  @override
  String get notificationsMentionPreferMentionName => '@멘션 선호';

  @override
  String get notificationsMentionPreferMentionDescription =>
      '기본적으로 나를 @멘션할 수 있으며, 멘션 기능을 끄면 발신자에게 알림';

  @override
  String get notificationsMentionPreferNoMentionName => '@멘션 안 함';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      '기본적으로 @멘션을 생략하고, 발신자가 멘션을 사용하면 경고합니다';

  @override
  String get notificationsTtsSectionTitle => '텍스트 음성 변환 알림';

  @override
  String get notificationsTtsEnableCommandLabel => '/tts 음성 재생 활성화';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '/tts가 내 메시지를 소리 내어 읽도록 허용합니다. 이 설정을 비활성화하면 해당 명령은 일반 텍스트로 유지됩니다.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix => '재생 속도 조정 ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => '접근성';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => '메시지 자동 읽어주기';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      '/tts 명령어로 보냈는지 여부와 관계없이 수신된 콘텐츠를 음성으로 변환합니다.';

  @override
  String get notificationsTtsModeAllChannelsName => '모든 채널';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      '어떤 채널이 열려 있든 모든 수신 메시지를 소리 내어 읽습니다.';

  @override
  String get notificationsTtsModeCurrentChannelName => '활성 채널에서만';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      '현재 보고 있는 채널만 읽어줍니다. 채널을 이동해도 계속 읽어줍니다.';

  @override
  String get notificationsTtsModeNeverName => '자동으로 안 함';

  @override
  String get notificationsTtsModeNeverDescription =>
      '누군가 /tts를 직접 실행하지 않는 한 무음으로 유지됩니다.';

  @override
  String get notificationsTtsModeAriaLabel => '모든 메시지 소리 내어 읽기';

  @override
  String get notificationsSoundsSectionTitle => '소리';

  @override
  String get notificationsMasterVolumeLabel => '마스터 볼륨';

  @override
  String get notificationsMasterVolumeDescription =>
      '모든 효과음의 볼륨을 설정합니다. 개별 효과음 설정은 이 설정을 무시합니다.';

  @override
  String get notificationsResetToDefaultVolume => '기본 볼륨으로 재설정';

  @override
  String get notificationsDisableAllSoundsLabel => '모든 알림 소리 끄기';

  @override
  String get notificationsDisableAllSoundsDescription => '기존 알림음 설정은 유지됩니다.';

  @override
  String get notificationsShowMoreSoundEffects => '더 많은 사운드 효과 표시';

  @override
  String get notificationsShowFewerSoundEffects => '덜 일반적인 사운드 효과 숨기기';

  @override
  String get notificationsPreviewSound => '사운드 미리 듣기';

  @override
  String get notificationsPerSoundVolumeTitle => '사운드별 볼륨';

  @override
  String get notificationsPerSoundVolumeDescription =>
      '개별 사운드에 대한 맞춤 볼륨을 설정합니다. 재정의되지 않은 사운드는 마스터 볼륨을 따릅니다.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return '활성화된 사용자 지정 사운드 볼륨 설정: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return '마스터 설정 따름 • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '$label을(를) 마스터 볼륨으로 재설정';
  }

  @override
  String get notificationsResetAllOverrides => '모든 알림음 재설정';

  @override
  String notificationsMuteSound(String label) {
    return '$label 음소거';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '$label 음소거 해제';
  }

  @override
  String get notificationsSoundMessage => '커뮤니티 메시지 알림';

  @override
  String get notificationsSoundDirectMessage => 'DM 알림';

  @override
  String get notificationsSoundSameChannelMessage => '현재 채널 메시지 알림';

  @override
  String get notificationsSoundMute => '음성 끄기';

  @override
  String get notificationsSoundUnmute => '음성 음소거 해제';

  @override
  String get notificationsSoundDeaf => '음성 듣기 중지';

  @override
  String get notificationsSoundUndeaf => '음소거 해제됨';

  @override
  String get notificationsSoundUserJoin => '채널에 사용자 참여';

  @override
  String get notificationsSoundUserLeave => '채널에서 나감';

  @override
  String get notificationsSoundUserMove => '채널 이동됨';

  @override
  String get notificationsSoundViewerJoin => '시청자 스트림 참여';

  @override
  String get notificationsSoundViewerLeave => '시청자 스트림 떠남';

  @override
  String get notificationsSoundVoiceDisconnect => '음성 연결 끊김';

  @override
  String get notificationsSoundIncomingRing => '수신 전화';

  @override
  String get notificationsSoundCameraOn => '카메라 켜짐';

  @override
  String get notificationsSoundCameraOff => '카메라 끄기';

  @override
  String get notificationsSoundScreenShareStart => '화면 공유 시작';

  @override
  String get notificationsSoundScreenShareStop => '화면 공유 중지';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      '푸시 알림 시간 제한을 업데이트할 수 없습니다. 다시 시도하세요.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      '멘션 설정을 업데이트하지 못했습니다. 다시 시도해 주세요.';

  @override
  String get notificationsPermissionDeniedTitle => '알림 차단됨';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      '알림을 켤 수 없습니다. 계속하려면 알림 권한을 허용해 주세요.';

  @override
  String get userSettingsNavLanguageAndTime => '언어 및 시간';

  @override
  String get languageAndTimeLanguageSectionTitle => '인터페이스 언어';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      '앱 전체에서 사용할 언어를 선택하세요';

  @override
  String get languageAndTimeOpenLanguageSettings => '언어 설정 열기';

  @override
  String get languageAndTimeTimeFormatSectionTitle => '시간 형식';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      '앱 전반에 걸쳐 시간이 표시되는 방식을 선택하세요';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => '시간 형식 선택';

  @override
  String get languageAndTimeTimeFormatAuto => '자동';

  @override
  String get languageAndTimeTimeFormat12Hour => '12시간제';

  @override
  String get languageAndTimeTimeFormat24Hour => '24시간제';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return '앱 언어: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return '시스템 로캘: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat => '시간 형식에 시스템 로캘 사용';

  @override
  String get languageAndTimeTimeFormatSyncFailed => '시간 형식을 업데이트하지 못했습니다.';

  @override
  String get userSettingsNavDefaultApps => '기본 앱';

  @override
  String get defaultAppsWebBrowserSectionTitle => '웹 브라우저';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      '링크를 탭할 때 열리는 브라우저를 선택하세요.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      '앱이 설치된 사이트의 경우, 해당 앱에서 링크가 먼저 열립니다.';

  @override
  String get defaultAppsWebBrowserInApp => '인앱 브라우저';

  @override
  String get defaultAppsWebBrowserExternal => '외부 브라우저';

  @override
  String get userSettingsNavAdvanced => '고급';

  @override
  String get advancedPerformanceReportingTitle => '성능 보고';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return '익명의 충돌 및 성능 데이터를 공유하여 $productName를 개선하세요.';
  }

  @override
  String get advancedPerformanceReportingLabel => '충돌 및 성능 보고서 보내기';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return '보고된 모든 데이터는 익명이며 $productName 자체 모니터링 서비스로만 전송됩니다. 제3자 제공업체는 사용되지 않습니다.';
  }

  @override
  String get advancedSettingsConfigure => '구성';

  @override
  String get advancedSettingsCategoryPrivacy => '개인정보 보호';

  @override
  String get advancedSettingsCategoryAppearance => '모양 및 설정';

  @override
  String get advancedSettingsCategoryAccessibility => '접근성';

  @override
  String get advancedSettingsCategoryChat => '채팅';

  @override
  String get advancedSettingsCategoryMedia => '미디어';

  @override
  String get advancedSettingsCategoryVoice => '음성';

  @override
  String get advancedSettingsCategoryDeveloper => '개발자';

  @override
  String get advancedSettingEnableTextSelectionLabel => '텍스트 선택 활성화';

  @override
  String get advancedSettingEnableTextSelectionDescription => '앱 내 텍스트 선택 허용';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel => '비디오 탐색 미리보기 사용';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      '비디오 스크러빙 중 섬네일 또는 실시간 프레임';

  @override
  String get advancedSettingHapticFeedbackLabel => '햅틱 피드백';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      '탭 및 동작에 대한 진동 피드백입니다. 기기 간에 동기화되지 않습니다.';

  @override
  String get advancedSettingShowNekoLabel => '네코 표시';

  @override
  String get advancedSettingShowNekoDescription => '커서를 따라다니는 네코 고양이';

  @override
  String get advancedSettingShowNekoDescriptionTouch => '채팅 입력창에 네코 표시';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel => '스플래시 줌 애니메이션';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      '스플래시 화면을 나갈 때 로고를 축소합니다';

  @override
  String get advancedSettingKeyboardHintsLabel => '키보드 힌트';

  @override
  String get advancedSettingKeyboardHintsDescription => '도구 설명에 키보드 단축키 힌트 표시';

  @override
  String get advancedSettingEnableFavoritesLabel => '즐겨찾기 사용';

  @override
  String get advancedSettingEnableFavoritesDescription => '앱 전체에서 즐겨찾기 표시';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel => '음성 채널 참여 방식';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      '커뮤니티 음성 채팅 참여 시 확인 또는 더블 클릭';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      '음성 채널 참가 시 두 번 클릭 필요';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel => '음성 채널 참여 전 확인';

  @override
  String get advancedSettingAutoSendGifsLabel => '선택 시 GIF 자동 전송';

  @override
  String get advancedSettingAutoSendGifsDescription => 'GIF 선택기에서 확인 없이 자동 전송';

  @override
  String get advancedSettingSaveGifFavoritesLabel => 'GIF 즐겨찾기를 저장된 미디어로 저장';

  @override
  String get advancedSettingSaveGifFavoritesDescription => '즐겨찾는 GIF 저장 방식 선택';

  @override
  String get advancedSettingMediaButtonsLabel => '미디어 버튼';

  @override
  String get advancedSettingMediaButtonsDescription =>
      '미디어 첨부 파일 및 임베드에 표시되는 버튼과 지시기를 사용자 지정합니다';

  @override
  String get advancedSettingPreuploadAttachmentsLabel => '첨부 파일을 보내기 전에 업로드하세요';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      '메시지 입력란에 첨부 파일이 추가되는 즉시 업로드를 시작합니다';

  @override
  String get advancedSettingStripTrackingLabel => 'URL에서 트래킹 매개변수 제거';

  @override
  String get advancedSettingStripTrackingDescription =>
      '보내는 메시지의 URL에서 추적 매개변수를 자동으로 제거';

  @override
  String get advancedSettingTrustAllLinksLabel => '모든 외부 링크 신뢰하기';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      '모든 도메인에서 외부 링크 경고 건너뛰기';

  @override
  String get advancedSettingSearchEnginesLabel => '검색 엔진';

  @override
  String get advancedSettingSearchEnginesDescription =>
      '선택한 텍스트에서 사용되는 검색 엔진을 구성합니다';

  @override
  String get advancedSettingTranslatorsLabel => '번역가';

  @override
  String get advancedSettingTranslatorsDescription =>
      '선택한 텍스트에서 사용되는 번역 제공업체 구성';

  @override
  String get advancedSettingReverseImageSearchLabel => '이미지 검색';

  @override
  String get advancedSettingReverseImageSearchDescription => '이미지 검색 제공업체';

  @override
  String get advancedSettingMessageActionBarLabel => '메시지 작업 표시줄';

  @override
  String get advancedSettingMessageActionBarDescription =>
      '메시지 위에 마우스를 올렸을 때 나타나는 작업 표시줄을 사용자 지정합니다';

  @override
  String get advancedSettingExpressionAutocompleteLabel => '표현 자동 완성';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      '메시지 입력창에서 콜론(:)을 입력할 때 표시되는 내용을 선택하세요';

  @override
  String get advancedSettingInputButtonsLabel => '메시지 입력 버튼';

  @override
  String get advancedSettingInputButtonsDescription => '메시지 입력란에 표시할 버튼을 선택합니다';

  @override
  String get advancedSettingScrollToBottomOnSendLabel => '메시지 전송 시 가장 아래로 스크롤';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      '메시지를 보낸 후 채팅이 어떻게 이동할지 선택하세요';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel => '\"모두 읽음\" 확인 건너뛰기';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      '읽지 않은 모든 받은 메시지 채널을 확인 요청 없이 즉시 읽음으로 표시';

  @override
  String get advancedSettingHideMutedChannelsLabel => '음소거된 채널 기본 숨기기';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      '뮤트한 채널을 커뮤니티 사이드바에서 숨기기';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'GIF 표시기 보기';

  @override
  String get advancedSettingShowAttachmentExpiryLabel => '첨부파일 만료 표시';

  @override
  String get advancedSettingShowMediaDeleteLabel => '삭제 버튼 표시';

  @override
  String get advancedSettingShowMediaDownloadLabel => '다운로드 버튼 표시';

  @override
  String get advancedSettingShowMediaFavoriteLabel => '즐겨찾기 버튼 표시';

  @override
  String get advancedSettingShowSuppressEmbedsLabel => '임베드 숨기기 버튼 표시';

  @override
  String get advancedSettingShowMessageActionBarLabel => '메시지 작업 표시줄 보기';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => '더보기 버튼만 표시';

  @override
  String get advancedSettingShowQuickReactionsLabel => '빠른 이모티콘 반응 표시';

  @override
  String get advancedSettingEnableShiftToExpandLabel => 'Shift 키를 눌러 확장하기';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      '표현 자동 완성에 기본 이모티콘 표시';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      '표현 자동 완성에 맞춤 이모티콘 표시';

  @override
  String get advancedSettingShowStickersAutocompleteLabel => '표현 자동 완성에 스티커 표시';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      '표현 자동 완성에 저장된 미디어 표시';

  @override
  String get advancedSettingShowGifsButtonLabel => 'GIF 버튼 표시';

  @override
  String get advancedSettingShowMediaButtonLabel => '미디어 버튼 표시';

  @override
  String get advancedSettingShowStickersButtonLabel => '스티커 버튼 표시';

  @override
  String get advancedSettingShowEmojiButtonLabel => '이모티콘 버튼 표시';

  @override
  String get advancedSettingShowSendButtonLabel => '전송 버튼 표시';

  @override
  String get advancedSettingNewDeviceAlertsLabel => '새 기기 알림 표시';

  @override
  String get advancedSettingNewDeviceAlertsDescription => '새 오디오 장치 프롬프트';

  @override
  String get advancedSettingConnectionVolumeControlsLabel => '연결 볼륨 컨트롤';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      '음성 메뉴에서 기기별 참가자 볼륨 슬라이더 표시';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel => '화면 공유 미리보기 동작';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      '미리보기, 팝업 및 스트림 섬네일 동작 설정';

  @override
  String get advancedSettingScreenShareCodecLabel => '화면 공유 코덱';

  @override
  String get advancedSettingScreenShareCodecDescription => '화면 공유용 비디오 코덱';

  @override
  String get advancedSettingScreenShareCodecAuto => '자동 (권장)';

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
      '백그라운드에서 화면 공유 미리보기 일시 중지';

  @override
  String get advancedSettingHideStreamPreviewLabel => '내 스트림 미리보기 썸네일 숨기기';

  @override
  String get advancedSettingDeveloperModeLabel => '개발자 모드 활성화';

  @override
  String get advancedSettingDeveloperModeDescription => '개발자 모드 활성화';

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
  String get advancedSettingTranslatorGoogle => 'Google 번역';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => '기본 검색 엔진';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      '선택한 텍스트를 검색할 때 기본으로 사용할 검색 엔진을 선택하세요.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => '내장 검색 엔진';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      '내장 검색 엔진을 켜거나 끌 수 있습니다. 켜짐으로 설정된 엔진은 텍스트 선택 시 메시지 상황별 메뉴에 표시됩니다.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => '맞춤 검색 엔진';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return '사용자 지정 URL 패턴으로 검색 엔진을 추가하세요. 검색 텍스트의 자리 표시자로 \'$query\'를 사용하세요.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => '검색 엔진 추가';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      '아래에서 검색 엔진을 1개 이상 사용 설정하세요.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => '검색 엔진 삭제';

  @override
  String get advancedSettingDefaultTranslatorLabel => '기본 번역기';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      '선택한 텍스트를 번역할 때 기본으로 사용할 번역기를 선택하세요.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => '내장 번역기';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      '내장 번역기를 켜거나 끌 수 있습니다. 번역기를 켜면 텍스트 선택 시 메시지 컨텍스트 메뉴에 표시됩니다.';

  @override
  String get advancedSettingCustomTranslatorsLabel => '맞춤 번역기';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return '사용자 지정 URL 패턴으로 나만의 번역기를 추가하세요. 번역할 텍스트의 자리 표시자로 \'$query\'를 사용하세요.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => '번역기 추가';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      '아래에서 번역기를 한 개 이상 사용 설정하세요.';

  @override
  String get advancedSettingRemoveTranslatorLabel => '번역기 삭제';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel => '기본 이미지 검색';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      '이미지 검색 시 기본으로 사용할 역 이미지 검색 서비스를 선택하세요.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel => '내장된 이미지 역검색';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      '내장된 이미지 역검색 제공자를 활성화하거나 비활성화합니다. 활성화된 제공자는 이미지, 아바타, 배너, 스티커 및 이모티콘의 상황별 메뉴에 표시됩니다.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel => '맞춤 이미지 역검색';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return '사용자 지정 URL 패턴으로 나만의 이미지 검색 제공업체를 추가하세요. 이미지 URL의 자리 표시자로 \'$url\'을(를) 사용하세요.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel => '이미지 검색 추가';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      '아래에서 역방향 이미지 검색 제공업체를 1개 이상 사용 설정하세요.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel => '이미지 검색 기록 삭제';

  @override
  String get advancedSettingAddSearchEngineTitle => '검색 엔진 추가';

  @override
  String get advancedSettingEditSearchEngineTitle => '검색 엔진 수정';

  @override
  String get advancedSettingAddTranslatorTitle => '번역 서비스 추가';

  @override
  String get advancedSettingEditTranslatorTitle => '번역 제공자 수정';

  @override
  String get advancedSettingAddReverseImageSearchTitle => '역방향 이미지 검색 엔진 추가';

  @override
  String get advancedSettingEditReverseImageSearchTitle => '이미지 검색 엔진 수정';

  @override
  String get advancedSettingSearchProviderNameLabel => '이름';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL 패턴';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder => '내 검색 엔진';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder => '내 번역기';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder => '내 이미지 검색';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return '검색 텍스트를 삽입할 위치에 \'$query\'를 사용하세요.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return '\'$query\'를 입력하여 검색하세요.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return '이미지 URL을 삽입할 위치에 \'$url\'을(를) 사용하세요.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => '이름을 입력해 주세요.';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'URL 패턴은 필수입니다.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL 패턴에는 \'$query\'가 포함되어야 합니다.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL 패턴에는 \'$url\'이(가) 포함되어야 합니다.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL 패턴은 유효한 URL이어야 합니다.';

  @override
  String get advancedSettingAddSearchProviderAction => '추가';

  @override
  String get advancedSettingEditSearchProviderAction => '편집';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => '제거';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return '$engineName을(를) 삭제하시겠어요?';
  }

  @override
  String get userSettingsNavApplications => '애플리케이션';

  @override
  String get userSettingsNavAppLogs => '앱 로그';

  @override
  String get userSettingsNavDeveloperTools => '개발자 도구';

  @override
  String get userSettingsNavLimitsConfig => '제한 구성';

  @override
  String get userSettingsNavFeatureFlags => '기능 플래그';

  @override
  String get userSettingsNavWhatsNew => '새로운 기능';

  @override
  String get userSettingsJoinFluxerLabs => 'Fluxer Labs 가입하기';

  @override
  String get userSettingsNavAppLicenses => '앱 라이선스';

  @override
  String get userSettingsAppLicensesDescription =>
      '이 앱에서 사용되는 오픈소스 소프트웨어입니다. 이 앱은 Flutter로 구축되었습니다.';

  @override
  String get userSettingsAppLicensesLoadError => '앱 라이선스를 불러올 수 없습니다.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '라이선스 $count개',
      one: '라이선스 1개',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => '로그아웃';

  @override
  String get quickSwitcherTabSearch => '검색';

  @override
  String get quickSwitcherTabFriends => '친구';

  @override
  String get quickSwitcherSearchPlaceholder => '채널, 사람 또는 커뮤니티 검색';

  @override
  String get quickSwitcherSearchFriends => '친구 검색';

  @override
  String get quickSwitcherNoMatchesFound => '일치하는 항목 없음';

  @override
  String get quickSwitcherEmptyHint =>
      '다른 이름을 시도하거나 @ / # / ! / * 접두사를 사용하여 결과를 필터링하세요.';

  @override
  String get quickSwitcherSectionPeople => '사람';

  @override
  String get quickSwitcherSectionGroupMessages => '그룹 메시지';

  @override
  String get quickSwitcherSectionTextChannels => '텍스트 채널';

  @override
  String get quickSwitcherSectionVoiceChannels => '음성 채널';

  @override
  String get quickSwitcherSectionCommunities => '커뮤니티';

  @override
  String get quickSwitcherSectionSettings => '설정';

  @override
  String get quickSwitcherHomeLabel => '홈';

  @override
  String get quickSwitcherDirectMessagesLabel => '다이렉트 메시지';

  @override
  String get quickSwitcherFavoritesLabel => '즐겨찾기';

  @override
  String get quickSwitcherUserSettingsLabel => '사용자 설정';

  @override
  String get quickSwitcherNotificationsLabel => '알림';

  @override
  String get quickSwitcherBookmarksLabel => '북마크';

  @override
  String get savedMessagesEmptyTitle => '저장한 메시지 없음';

  @override
  String get savedMessagesEmptyBody => '나중에 다시 보고 싶은 메시지는 북마크에 저장하세요.';

  @override
  String get savedMessagesEndBody => '더 이상 볼 내용이 없습니다.';

  @override
  String get savedMessagesRemoveTooltip => '북마크 삭제';

  @override
  String get quickSwitcherMentionsLabel => '멘션';

  @override
  String get quickSwitcherFriendsEmptyTitle => '아직 친구가 없습니다';

  @override
  String get quickSwitcherFriendsEmptyHint => '친구를 추가하여 시작하세요.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => '검색과 일치하는 친구가 없습니다';

  @override
  String get quickSwitcherFriendsNoMatchHint => '다른 이름을 시도하세요.';

  @override
  String get quickSwitcherSearchAliasUser => '사용자';

  @override
  String get quickSwitcherSearchAliasYou => '나';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM';

  @override
  String get quickSwitcherSearchAliasMessages => '메시지';

  @override
  String get quickSwitcherSearchAliasFav => '즐겨찾기';

  @override
  String get quickSwitcherSearchAliasStarred => '별표 표시';

  @override
  String get quickSwitcherSearchAliasInbox => '받은편지함';

  @override
  String get quickSwitcherSearchAliasSaved => '저장됨';

  @override
  String get uiClose => '닫기';

  @override
  String get chatJumpToBottom => '아래로 이동';

  @override
  String get uiConfirm => '확인';

  @override
  String get uiLoading => '로딩 중';

  @override
  String get uiSearch => '검색';

  @override
  String get uiStartCall => '통화 시작';

  @override
  String get uiStartVideoCall => '영상 통화 시작';

  @override
  String get uiPlay => '재생';

  @override
  String get uiPause => '일시 정지';

  @override
  String get uiDownload => '다운로드';

  @override
  String get uiMoreActions => '더 보기';

  @override
  String get uiUnsavedChanges => '저장되지 않은 변경 사항';

  @override
  String get uiReset => '초기화';

  @override
  String get uiOpenColorPicker => '색상 선택기 열기';

  @override
  String get uiSelectPlaceholder => '선택';

  @override
  String get uiSearchPlaceholder => '검색';

  @override
  String get uiNoOptionsFound => '옵션 없음';

  @override
  String get uiDismissNotification => '알림 닫기';

  @override
  String get uiColorPickerTitle => '색상 선택기';

  @override
  String get mentionConfirmTitle => '모두에게 멘션하시겠어요?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return '$count명의 멤버에게 알림이 전송됩니다. 계속하시겠어요?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return '$count명의 온라인 멤버에게 알림이 전송됩니다. 계속하시겠어요?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return '이 작업은 $roleName 역할을 가진 $count명의 멤버에게 알림을 보냅니다. 계속하시겠어요?';
  }

  @override
  String get mentionConfirmButton => '멘션';

  @override
  String get composerEmojiUnavailable => '이 이모지는 사용할 수 없습니다.';

  @override
  String get instanceUrlLabel => '인스턴스 URL';

  @override
  String get instanceUrlPlaceholder => '인스턴스 URL 입력 (예: fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Fluxer로 재설정';

  @override
  String get instanceConnect => '연결';

  @override
  String get instanceConnecting => '연결 중…';

  @override
  String get instanceConnectFailed => '인스턴스에 연결하지 못했습니다';

  @override
  String get recentInstances => '최근 인스턴스';

  @override
  String removeRecentInstance(String domain) {
    return '$domain을(를) 최근 인스턴스에서 삭제';
  }

  @override
  String get instanceSheetTitle => '인스턴스에 연결';

  @override
  String get connectToDifferentInstance => '다른 인스턴스에 연결';

  @override
  String get changeInstance => '변경';

  @override
  String get instanceConnectionRequired => '로그인하려면 인스턴스에 연결하세요';

  @override
  String get comingSoon => '출시 예정';

  @override
  String get guildNavbarDirectMessages => 'Direct Messages';

  @override
  String get guildNavbarExploreDiscoverableCommunities => '탐색 가능한 커뮤니티 탐색';

  @override
  String get discoveryExplore => '탐색';

  @override
  String get discoveryExplorePublicCommunities => '공개 커뮤니티 탐색';

  @override
  String get discoveryListingSubheading =>
      '커뮤니티를 여기에 등록하고 싶으신가요? 커뮤니티 설정 > 디스커버리에서 요구 사항을 충족하는 경우 신청하세요.';

  @override
  String get discoverySearchCommunities => '커뮤니티 검색';

  @override
  String get discoveryFilterByLanguage => '언어로 필터링';

  @override
  String get discoveryAllLanguages => '모든 언어';

  @override
  String get discoveryAllCategories => '전체';

  @override
  String get discoveryCategoryGaming => '게임';

  @override
  String get discoveryCategoryMusic => '음악';

  @override
  String get discoveryCategoryEntertainment => '엔터테인먼트';

  @override
  String get discoveryCategoryEducation => '교육';

  @override
  String get discoveryCategoryScienceAndTechnology => '과학 및 기술';

  @override
  String get discoveryCategoryContentCreator => '콘텐츠 크리에이터';

  @override
  String get discoveryCategoryAnimeAndManga => '애니메이션 및 만화';

  @override
  String get discoveryCategoryMoviesAndTv => '영화 및 TV';

  @override
  String get discoveryCategoryOther => '기타';

  @override
  String get discoveryNoCommunitiesMatch => '일치하는 커뮤니티가 없습니다.';

  @override
  String get discoveryJoinCommunity => '커뮤니티 가입';

  @override
  String get discoveryJoined => '가입됨';

  @override
  String discoveryOnlineCount(String count) {
    return '$count명 온라인';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 $countString명',
      one: '멤버 1명',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => '설명 없음.';

  @override
  String get discoveryCommunities => '커뮤니티';

  @override
  String get discoveryApps => '앱';

  @override
  String get discoveryJoinErrorGenericTitle => '이 커뮤니티에 가입할 수 없습니다';

  @override
  String get discoveryJoinErrorGenericMessage => '문제가 발생했습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get discoveryJoinErrorFullTitle => '이 커뮤니티는 가득 찼습니다';

  @override
  String get discoveryJoinErrorFullMessage =>
      '이 커뮤니티는 멤버 제한에 도달하여 지금 가입할 수 없습니다.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => '커뮤니티 제한에 도달했습니다';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      '최대 수의 커뮤니티에 참여 중입니다. 하나를 나가고 다시 시도하세요.';

  @override
  String get discoveryJoinErrorBannedTitle => '이 커뮤니티에 가입할 수 없습니다';

  @override
  String get discoveryJoinErrorBannedMessage => '이 커뮤니티에서 차단되었습니다.';

  @override
  String get discoveryJoinErrorNotAvailableTitle => '이 커뮤니티를 더 이상 사용할 수 없습니다';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      '탐색에서 제외되었거나 새 가입이 비활성화되었을 수 있습니다. 페이지를 새로고침하면 더 이상 표시되지 않습니다.';

  @override
  String get discoveryJoinErrorRateLimitTitle => '너무 빠르게 진행 중입니다';

  @override
  String get discoveryJoinErrorRateLimitMessage => '잠시 기다렸다가 다시 시도해 주세요.';

  @override
  String get guildNavbarAddCommunity => '커뮤니티 추가';

  @override
  String get guildNavbarHelp => '도움말';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => '새 메시지';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName 폴더 접기';
  }

  @override
  String get guildNavbarGuildSelected => '선택됨';

  @override
  String get guildNavbarGuildUnread => '읽지 않음';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개의 멘션',
      one: '멘션 1개',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => '음소거됨';

  @override
  String get authShowPassword => '비밀번호 표시';

  @override
  String get authHidePassword => '비밀번호 숨기기';

  @override
  String get chatLoadingMessages => '메시지 불러오는 중';

  @override
  String get friendsMessageFriend => '메시지';

  @override
  String get friendsFriendActions => '친구 작업';

  @override
  String get friendsAcceptRequest => '친구 요청 수락';

  @override
  String get friendsDeclineRequest => '친구 요청 거절';

  @override
  String get friendsCancelRequest => '친구 요청 취소';

  @override
  String get friendsOpenInbox => '받은 메시지함';

  @override
  String get profileRemoveFriend => '친구 삭제';

  @override
  String get profileUnblockUser => '차단 해제';

  @override
  String get profileAcceptFriendRequest => '친구 요청 수락';

  @override
  String get profileCancelFriendRequest => '친구 요청 취소';

  @override
  String get profileSendFriendRequest => '친구 추가';

  @override
  String get accountOverflowMenu => '계정 옵션';

  @override
  String get navHome => '홈';

  @override
  String get navNotifications => '알림';

  @override
  String get navYou => '나';

  @override
  String get guildFolderSettingsTitle => '폴더 설정';

  @override
  String get guildFolderNameLabel => '폴더 이름';

  @override
  String get guildFolderColorLabel => '폴더 색상';

  @override
  String get guildFolderShowIconWhenCollapsed => '접었을 때 아이콘 표시';

  @override
  String get guildFolderIconLabel => '폴더 아이콘';

  @override
  String get guildFolderDelete => '폴더 삭제';

  @override
  String get guildFolderIconFolder => '폴더';

  @override
  String get guildFolderIconStar => '즐겨찾기';

  @override
  String get guildFolderIconHeart => '하트';

  @override
  String get guildFolderIconBookmark => '즐겨찾기';

  @override
  String get guildFolderIconGameController => '게임 컨트롤러';

  @override
  String get guildFolderIconShield => '쉴드';

  @override
  String get guildFolderIconMusicNote => '음표';

  @override
  String get guildFolderMarkAsRead => '폴더를 모두 읽음으로 표시';

  @override
  String get guildBulkMuteCommunities => '커뮤니티 알림 끄기';

  @override
  String get guildBulkUnmuteCommunities => '커뮤니티 음소거 해제';

  @override
  String get guildBulkCommunityNotificationSettings => '커뮤니티 알림 설정';

  @override
  String get guildBulkCommunityPrivacySettings => '커뮤니티 공개 설정';

  @override
  String get guildBulkAllowEveryoneAndHere => '@everyone 및 @here 허용';

  @override
  String get guildBulkAllowRoleMentions => '역할 멘션 허용';

  @override
  String get guildBulkEnableMobilePush => '모바일 푸시 알림 켜기';

  @override
  String get guildBulkDisableMobilePush => '모바일 푸시 알림 끄기';

  @override
  String get guildBulkAllowDirectMessages => '쪽지 허용';

  @override
  String get guildBulkBlockDirectMessages => '쪽지 차단';

  @override
  String get guildBulkAllowBotDirectMessages => '봇 DM 허용';

  @override
  String get guildBulkBlockBotDirectMessages => '봇 DM 차단';

  @override
  String get guildNavbarGroupDm => '그룹 DM';

  @override
  String get guildNavbarCreateChannel => '채널 만들기';

  @override
  String get guildNavbarChannelType => '채널 유형';

  @override
  String get guildNavbarTextChannel => '텍스트 채널';

  @override
  String get guildNavbarTextChannelDescription => '메시지, 이미지, GIF, 이모지 보내기';

  @override
  String get guildNavbarVoiceChannel => '음성 채널';

  @override
  String get guildNavbarVoiceChannelDescription => '음성, 영상, 화면 공유로 함께 대화하기';

  @override
  String get guildNavbarLinkChannel => '링크 채널';

  @override
  String get guildNavbarLinkChannelDescription => '외부 웹사이트 또는 리소스에 빠르게 액세스';

  @override
  String get guildNavbarNameLabel => '이름';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => '채널 유형 선택';

  @override
  String get guildNavbarCreateCategory => '카테고리 만들기';

  @override
  String get guildNavbarNewCategoryHint => '새 카테고리';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return '$communityName에 친구 초대';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return '초대받은 사용자는 #$channelName으로 이동합니다';
  }

  @override
  String get guildNavbarSearchFriends => '친구 검색';

  @override
  String get guildNavbarNoFriendsYet => '아직 친구가 없습니다';

  @override
  String get guildNavbarNoResults => '결과 없음';

  @override
  String get guildNavbarInviteLinkPrompt => '또는 친구에게 초대 링크 보내기:';

  @override
  String get guildNavbarInviteLink => '초대 링크';

  @override
  String get guildNavbarCopy => '복사';

  @override
  String get guildNavbarCopied => '복사됨!';

  @override
  String get guildNavbarInviteExpiresSevenDays => '초대 링크는 7일 후에 만료됩니다.';

  @override
  String get guildNavbarInviteNeverExpires => '이 초대 링크는 만료되지 않습니다.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return '초대 링크가 $duration 후에 만료됩니다.';
  }

  @override
  String get guildNavbarEditInviteLink => '초대 링크 수정';

  @override
  String get guildNavbarInviteLinkSettings => '초대 링크 설정';

  @override
  String get guildNavbarExpireAfter => '만료 시점';

  @override
  String get guildNavbarMaxUses => '최대 사용 횟수';

  @override
  String get guildNavbarGrantTemporaryMembership => '임시 멤버십 부여';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      '역할이 할당되지 않은 경우 멤버가 오프라인이 되면 제거됩니다';

  @override
  String get guildNavbarCreateNewLink => '새 링크 만들기';

  @override
  String get guildNavbarSent => '보냄';

  @override
  String get guildNavbarInvite => '초대';

  @override
  String get guildNavbarLeaveCommunityTitle => '커뮤니티 나가기';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      '이 커뮤니티를 나가시겠습니까? 더 이상 메시지를 볼 수 없습니다.';

  @override
  String get guildNavbarLeaveCommunityConfirm => '커뮤니티 나가기';

  @override
  String get guildNavbarDeleteMyMessagesTitle => '이 커뮤니티의 메시지를 삭제하시겠습니까?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      '모든 채널에 걸쳐 여기에 보낸 모든 메시지를 영구적으로 삭제합니다. 실행 취소할 수 없습니다.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => '내 메시지 삭제';

  @override
  String get guildNavbarDeletedYourMessages => '메시지를 삭제했습니다';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => '메시지를 삭제할 수 없습니다';

  @override
  String get guildNavbarRemoveOverride => '재정의 제거';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '$formattedDate까지 음소거됨';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return '$productName 직원만 액세스할 수 있습니다';
  }

  @override
  String get guildNavbarInvitesPaused => '이 커뮤니티의 초대가 일시 중지되었습니다';

  @override
  String get guildNavbarDurationNever => '안 함';

  @override
  String get guildNavbarDuration30Minutes => '30분';

  @override
  String get guildNavbarDuration1Hour => '1시간';

  @override
  String get guildNavbarDuration6Hours => '6시간';

  @override
  String get guildNavbarDuration12Hours => '12시간';

  @override
  String get guildNavbarDuration1Day => '1일';

  @override
  String get guildNavbarDuration7Days => '7일';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count초';
  }

  @override
  String get guildNavbarNever => '안 함';

  @override
  String get guildNavbarNoLimit => '제한 없음';

  @override
  String get guildNavbarOneUse => '1회 사용';

  @override
  String guildNavbarUses(int count) {
    return '$count회 사용';
  }

  @override
  String get guildMenuMarkAsRead => '읽음으로 표시';

  @override
  String get guildPeekMoreOptions => '더 많은 옵션';

  @override
  String get guildMenuInviteMembers => '멤버 초대';

  @override
  String get guildMenuCommunitySettings => '커뮤니티 설정';

  @override
  String get guildMenuEditCommunityProfile => '커뮤니티 프로필 수정';

  @override
  String get guildMenuUnmuteCommunity => '커뮤니티 음소거 해제';

  @override
  String get guildMenuMuteCommunity => '커뮤니티 음소거';

  @override
  String get guildMenuHideMutedChannels => '음소거된 채널 숨기기';

  @override
  String get guildMenuReportCommunity => '커뮤니티 신고';

  @override
  String get guildMenuDebugCommunity => '커뮤니티 디버그';

  @override
  String get guildMenuCopyCommunityId => '커뮤니티 ID 복사';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '$formattedTime까지';
  }

  @override
  String get guildMenuSettingsGeneral => '일반';

  @override
  String get guildMenuSettingsRoles => '역할 및 권한';

  @override
  String get guildMenuSettingsEmoji => '이모지';

  @override
  String get guildMenuSettingsStickers => '스티커';

  @override
  String get guildMenuSettingsSafetyModeration => '안전 및 관리';

  @override
  String get guildMenuSettingsActivityLog => '활동 로그';

  @override
  String get guildMenuSettingsWebhooks => '웹훅';

  @override
  String get guildMenuSettingsCustomInviteUrl => '커스텀 초대 URL';

  @override
  String get guildMenuSettingsDiscovery => '디스커버리';

  @override
  String get guildMenuSettingsMembers => '멤버';

  @override
  String get guildMenuSettingsInviteLinks => '초대';

  @override
  String get guildMenuSettingsBans => '차단';

  @override
  String get guildMenuSettingsChannels => '채널';

  @override
  String get guildSettingsNoPermission => '이 설정 탭을 볼 권한이 없습니다.';

  @override
  String get guildSettingsOverviewIconTitle => '아이콘';

  @override
  String get guildSettingsUploadImage => '이미지 업로드';

  @override
  String get guildSettingsOverviewBannerTitle => '배너';

  @override
  String get guildSettingsOverviewBannerHint => '서버 배너를 업로드하세요.';

  @override
  String get guildSettingsOverviewNameTitle => '이름';

  @override
  String get guildSettingsOverviewNameHint => '나의 멋진 커뮤니티';

  @override
  String get guildSettingsOverviewStatsTitle => '통계';

  @override
  String get guildSettingsOverviewMembers => '멤버';

  @override
  String get guildSettingsOverviewOnline => '온라인';

  @override
  String get guildSettingsRolesDescription => '역할을 사용하여 멤버를 그룹화하고 권한을 할당하세요.';

  @override
  String get guildSettingsCreateRole => '역할 만들기';

  @override
  String get guildSettingsRolesListTitle => '역할';

  @override
  String get guildSettingsRolesNewRole => '새로운 역할';

  @override
  String get guildSettingsRolesDeleteRole => '역할 삭제';

  @override
  String get guildSettingsRolesBackToRoles => '역할로 돌아가기';

  @override
  String get guildSettingsBackToSettings => '설정으로 돌아가기';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return '\"$name\" 수정';
  }

  @override
  String get guildSettingsRolesEditSubtitle => '역할 설정 및 권한 구성';

  @override
  String get guildSettingsRolesDisplaySection => '표시';

  @override
  String get guildSettingsRolesRoleName => '역할 이름';

  @override
  String get guildSettingsRolesRoleColor => '역할 색상';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      '색상(Hex, RGB, HSL, 이름)을 입력하거나 선택 도구를 사용하세요.';

  @override
  String get guildSettingsRolesShowSeparately => '이 역할을 따로 표시';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      '이 역할을 가진 멤버를 멤버 목록에 별도 섹션으로 표시합니다.';

  @override
  String get guildSettingsRolesAllowMentions => '이 역할에 대한 멘션 허용';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return '\"$permission\" 권한이 있는 멤버는 이 설정을 무시하고 항상 역할을 멘션할 수 있습니다.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      '이 버튼을 사용하여 모든 권한을 빠르게 지울 수 있습니다.';

  @override
  String get guildSettingsRolesClearPermissions => '권한 지우기';

  @override
  String get guildSettingsRolesPermissionsSection => '권한';

  @override
  String get guildSettingsRolesSearchPermissions => '권한 검색';

  @override
  String get guildSettingsRolesDenseLayout => '간결한 레이아웃';

  @override
  String get guildSettingsRolesComfyLayout => '편안한 레이아웃';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => '간결한 레이아웃으로 전환';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => '편안한 레이아웃으로 전환';

  @override
  String get guildSettingsRolesSingleColumn => '한 줄 보기';

  @override
  String get guildSettingsRolesTwoColumns => '2열';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => '한 줄로 보기';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => '2열로 전환';

  @override
  String get guildSettingsRolesNoPermissionsFound => '권한 없음';

  @override
  String get guildSettingsRolesCustomHoistOrder => '호이스팅 순서 직접 지정';

  @override
  String get guildSettingsRolesHoistOrder => '호이스트 순서';

  @override
  String get guildSettingsRolesResetHoistOrder => '기본값으로 재설정';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      '역할 순서를 변경하여 멤버 목록에 표시되는 순서를 사용자 지정할 수 있습니다.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      '표시된 역할이 없습니다. 역할 설정에서 \"역할 구성원 별도 표시\"를 켜면 여기에 표시됩니다.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      '회원님의 최고 역할이거나 회원님보다 높은 역할이므로 이 역할을 수정할 수 없습니다';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return '이 권한을 수정하려면 \"$permission\" 권한이 필요합니다.';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      '회원님의 최고 역할과 같거나 그보다 높은 역할은 수정할 수 없습니다';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      '가지고 있지 않은 권한은 부여할 수 없습니다';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      '본인에게서 권한을 제거하게 되므로 이 권한을 삭제할 수 없습니다';

  @override
  String get guildSettingsRolesUpdatedSuccess => '역할이 성공적으로 업데이트되었습니다';

  @override
  String get guildSettingsRolesCreatedSuccess => '역할이 성공적으로 생성되었습니다';

  @override
  String get guildSettingsRolesDeletedSuccess => '역할이 삭제되었습니다';

  @override
  String get guildSettingsRolesHoistResetSuccess => '호이스트 순서가 기본값으로 재설정되었습니다';

  @override
  String get guildSettingsRolesNameRequiredTitle => '역할 이름은 필수입니다';

  @override
  String get guildSettingsRolesNameRequiredBody => '저장하기 전에 역할 이름을 지정해 주세요.';

  @override
  String get guildSettingsRolesCreateFailedTitle => '역할을 만들 수 없습니다';

  @override
  String get guildSettingsRolesUpdateFailedTitle => '역할을 업데이트할 수 없습니다';

  @override
  String get guildSettingsRolesDeleteFailedTitle => '역할을 삭제할 수 없습니다';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\"을(를) 삭제할 수 없습니다. 다시 시도해 주세요.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle => '호이스트 순서를 재설정할 수 없습니다';

  @override
  String get guildSettingsRolesTryAgainInAMoment => '잠시 후에 다시 시도해 주세요.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '$name 역할을 삭제하시겠어요? 이 역할이 있는 모든 멤버는 더 이상 해당 역할을 갖지 않게 됩니다.';
  }

  @override
  String get permissionCategoryCommunityWide => '커뮤니티 전체';

  @override
  String get permissionCategoryMessagesMedia => '메시지 및 미디어';

  @override
  String get permissionCategoryModeration => '모더레이션';

  @override
  String get permissionCategoryChannelAccess => '채널 접근';

  @override
  String get permissionCategoryChannelManagement => '채널 관리';

  @override
  String get permissionCategoryAudioVideo => '오디오 및 비디오';

  @override
  String get permissionUnknown => '알 수 없는 권한';

  @override
  String get permissionAdministrator => '관리자';

  @override
  String get permissionAdministratorDescription =>
      '모든 권한을 부여하고 채널 제한을 우회합니다. 매우 민감한 권한입니다.';

  @override
  String get permissionViewActivityLog => '활동 로그 보기';

  @override
  String get permissionViewActivityLogDescription =>
      '커뮤니티의 변경 및 관리 활동 기록을 읽습니다.';

  @override
  String get permissionManageCommunity => '커뮤니티 관리';

  @override
  String get permissionManageCommunityDescription =>
      '이름, 설명, 아이콘 등 전체 설정을 수정합니다.';

  @override
  String get permissionManageRoles => '역할 관리';

  @override
  String get permissionManageRolesDescription =>
      '본인 최고 역할보다 낮은 역할 생성, 수정 또는 삭제. 채널 권한 재정의 수정도 허용됩니다.';

  @override
  String get permissionManageChannels => '채널 관리';

  @override
  String get permissionManageChannel => '채널 관리';

  @override
  String get permissionManageChannelDescription => '이 채널의 설정을 편집하고 이름을 변경합니다.';

  @override
  String get permissionManagePermissions => '권한 관리';

  @override
  String get permissionManagePermissionsDescription =>
      '이 채널의 역할 및 멤버 권한을 수정합니다.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      '이 채널의 웹훅을 생성, 수정 또는 삭제합니다.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      '이 채널의 멤버 목록을 확인하세요.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      '이 채널에 대한 초대 링크를 관리합니다.';

  @override
  String get permissionOverwriteDeny => '거부';

  @override
  String get permissionOverwriteInherit => '보통 (상속)';

  @override
  String get permissionOverwriteAllow => '허용';

  @override
  String get permissionOverwriteSetAllHelp =>
      '이 버튼을 사용하여 모든 권한을 빠르게 설정할 수 있습니다.';

  @override
  String get permissionManageChannelsDescription => '채널 및 카테고리 생성, 수정 또는 삭제.';

  @override
  String get permissionKickMembers => '멤버 내보내기';

  @override
  String get permissionBanMembers => '멤버 차단';

  @override
  String get permissionCreateInviteLinks => '초대 링크 만들기';

  @override
  String get permissionChangeOwnNickname => '내 닉네임 변경';

  @override
  String get permissionChangeOwnNicknameDescription => '내 닉네임을 변경합니다.';

  @override
  String get permissionManageNicknames => '닉네임 관리';

  @override
  String get permissionManageNicknamesDescription => '다른 멤버의 닉네임 변경.';

  @override
  String get permissionCreateEmojiStickers => '이모티콘 및 스티커 만들기';

  @override
  String get permissionCreateEmojiStickersDescription =>
      '새로운 이모티콘과 스티커를 업로드하고 직접 만든 콘텐츠를 관리하세요.';

  @override
  String get permissionManageEmojiStickers => '이모티콘 및 스티커 관리';

  @override
  String get permissionManageEmojiStickersDescription =>
      '다른 멤버가 만든 이모티콘 및 스티커를 수정하거나 삭제합니다.';

  @override
  String get permissionManageWebhooks => '웹훅 관리';

  @override
  String get permissionManageWebhooksDescription => '웹훅 생성, 편집 또는 삭제.';

  @override
  String get permissionSendMessages => '메시지 보내기';

  @override
  String get permissionSendTtsMessages => 'TTS 메시지 보내기';

  @override
  String get permissionSendTtsMessagesDescription => '음성으로 메시지 보내기';

  @override
  String get permissionManageMessages => '메시지 관리';

  @override
  String get permissionManageMessagesDescription =>
      '다른 멤버의 메시지를 삭제합니다. 고정 권한은 별도로 관리됩니다.';

  @override
  String get permissionPinMessages => '메시지 고정';

  @override
  String get permissionEmbedLinks => '링크 임베드';

  @override
  String get permissionAttachFiles => '파일 첨부';

  @override
  String get permissionMentionEveryone => '@everyone/@here 및 @역할 사용';

  @override
  String get permissionMentionEveryoneDescription =>
      '모든 사람 또는 역할을 멘션할 수 있습니다(역할 멘션이 허용되지 않은 경우에도).';

  @override
  String get permissionUseExternalEmoji => '외부 이모티콘 사용';

  @override
  String get permissionUseExternalEmojiDescription => '다른 커뮤니티의 이모티콘 사용.';

  @override
  String get permissionUseExternalStickers => '외부 스티커 사용';

  @override
  String get permissionAddReactions => '반응 추가';

  @override
  String get permissionAddReactionsDescription => '메시지에 새로운 이모티콘 반응을 추가합니다.';

  @override
  String get permissionBypassSlowmode => '슬로우 모드 우회';

  @override
  String get permissionBypassSlowmodeDescription => '채널별 메시지 전송 제한 무시.';

  @override
  String get permissionTimeOutMembers => '멤버 타임아웃';

  @override
  String get permissionTimeOutMembersDescription =>
      '멤버가 메시지 전송, 반응, 음성 채팅 참여를 일정 기간 동안 할 수 없도록 차단합니다.';

  @override
  String get permissionViewChannel => '채널 보기';

  @override
  String get permissionViewChannelMembers => '채널 멤버 보기';

  @override
  String get permissionViewChannelMembersDescription =>
      '이 커뮤니티의 채널 멤버 목록을 확인하세요.';

  @override
  String get permissionConnect => '연결';

  @override
  String get permissionSpeak => '말하기';

  @override
  String get permissionStreamVideo => '비디오 스트리밍';

  @override
  String get permissionUseVoiceActivity => '음성 자동 감지 사용';

  @override
  String get permissionUseVoiceActivityDescription =>
      '이 권한 없이는 눌러서 말하기를 사용해야 합니다.';

  @override
  String get permissionPrioritySpeaker => '우선 발언권';

  @override
  String get permissionMuteMembers => '멤버 음소거';

  @override
  String get permissionDeafenMembers => '멤버 소리 끄기';

  @override
  String get permissionMoveMembers => '멤버 이동';

  @override
  String get permissionMoveMembersDescription =>
      '접근 가능한 채널 간에 멤버를 드래그하여 이동하세요.';

  @override
  String get permissionSetVoiceRegion => '음성 지역 설정';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount개 고정, $animatedCount개 애니메이션 이모지 슬롯 사용됨';
  }

  @override
  String get guildSettingsEmojiEmpty => '아직 커스텀 이모지가 없습니다.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count개의 스티커 업로드됨';
  }

  @override
  String get guildSettingsStickersEmpty => '아직 커스텀 스티커가 없습니다.';

  @override
  String get guildSettingsModerationVerificationTitle => '멤버 인증';

  @override
  String get guildSettingsModerationVerificationDescription =>
      '어떤 멤버가 커뮤니티 멤버에게 메시지를 보내거나 DM을 보내기 전에 충족해야 하는 조건을 선택하세요.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      '역할을 가진 멤버는 이러한 확인을 건너뛸 수 있습니다. 공개 공간의 경우 인증을 활성화하는 것이 좋습니다.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Discovery에 나열된 커뮤니티는 확인된 이메일이 최소한 필요합니다. Discovery가 활성화된 동안에는 \'없음\'을 선택할 수 없습니다.';

  @override
  String get guildSettingsModerationMatureTitle => '성인용 콘텐츠 및 콘텐츠 경고';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      '멤버를 위한 성인용 콘텐츠 라벨링 및 선택적 콘텐츠 경고를 구성하세요.';

  @override
  String get guildSettingsModerationMatureToggle => '성인용 콘텐츠';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      '이 커뮤니티에 성인용 콘텐츠가 포함되어 있음을 표시하세요.';

  @override
  String get guildSettingsVerificationNone => '없음';

  @override
  String get guildSettingsVerificationNoneDescription => '별도의 인증이 필요하지 않습니다.';

  @override
  String get guildSettingsVerificationLow => '낮음';

  @override
  String get guildSettingsVerificationLowDescription => '확인된 이메일 주소가 필요합니다.';

  @override
  String get guildSettingsVerificationMedium => '중간';

  @override
  String get guildSettingsVerificationMediumDescription =>
      '확인된 이메일 주소와 계정 생성 후 5분 이상 경과해야 합니다.';

  @override
  String get guildSettingsVerificationHigh => '높음';

  @override
  String get guildSettingsVerificationHighDescription =>
      '중간 수준의 모든 요구 사항과 커뮤니티 가입 후 10분 이상 경과해야 합니다.';

  @override
  String get guildSettingsVerificationHighest => '매우 높음';

  @override
  String get guildSettingsVerificationHighestDescription => '확인된 전화번호가 필요합니다.';

  @override
  String get guildSettingsAuditLogDescription => '커뮤니티 전체의 관리자 활동을 추적하세요.';

  @override
  String get guildSettingsAuditLogEmpty => '아직 로그 없음';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      '관리자 활동 및 커뮤니티 변경 사항이 여기에 표시됩니다.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => '모든 사용자';

  @override
  String get guildSettingsAuditLogFilterAllActions => '모든 작업';

  @override
  String get guildSettingsAuditLogNoReason => '이유가 제공되지 않았습니다.';

  @override
  String get guildSettingsAuditLogUnknownUser => '알 수 없는 사용자';

  @override
  String get guildSettingsAuditLogLoadError => '활동 로그를 불러오는 중 오류가 발생했습니다.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle => '활동 로그를 불러올 수 없습니다';

  @override
  String get guildSettingsAuditLogReason => '이유';

  @override
  String get guildSettingsAuditLogSomeone => '누군가';

  @override
  String get guildSettingsAuditLogSomething => '무언가';

  @override
  String get guildSettingsAuditLogUnknownEntity => '알 수 없는 엔티티';

  @override
  String get guildSettingsAuditLogNothing => '없음';

  @override
  String get guildSettingsAuditLogUnknownTarget => '알 수 없는 대상';

  @override
  String get auditLogActionGuildUpdate => '커뮤니티 업데이트됨';

  @override
  String get auditLogActionChannelCreate => '채널 생성됨';

  @override
  String get auditLogActionChannelUpdate => '채널 업데이트됨';

  @override
  String get auditLogActionChannelDelete => '채널 삭제됨';

  @override
  String get auditLogActionChannelOverwriteCreate => '채널 권한 추가됨';

  @override
  String get auditLogActionChannelOverwriteUpdate => '채널 권한 업데이트됨';

  @override
  String get auditLogActionChannelOverwriteDelete => '채널 권한 삭제됨';

  @override
  String get auditLogActionMemberKick => '멤버 추방됨';

  @override
  String get auditLogActionMemberPrune => '멤버 정리됨';

  @override
  String get auditLogActionMemberBanAdd => '멤버 차단됨';

  @override
  String get auditLogActionMemberBanRemove => '멤버 차단 해제됨';

  @override
  String get auditLogActionMemberUpdate => '멤버 업데이트됨';

  @override
  String get auditLogActionMemberRoleUpdate => '멤버 역할 업데이트됨';

  @override
  String get auditLogActionMemberMove => '멤버 이동됨';

  @override
  String get auditLogActionMemberDisconnect => '멤버 연결 해제됨';

  @override
  String get auditLogActionBotAdd => '봇 추가됨';

  @override
  String get auditLogActionRoleCreate => '역할 생성됨';

  @override
  String get auditLogActionRoleUpdate => '역할 업데이트됨';

  @override
  String get auditLogActionRoleDelete => '역할 삭제됨';

  @override
  String get auditLogActionInviteCreate => '초대 생성됨';

  @override
  String get auditLogActionInviteUpdate => '초대 업데이트됨';

  @override
  String get auditLogActionInviteDelete => '초대 삭제됨';

  @override
  String get auditLogActionWebhookCreate => '웹훅 생성됨';

  @override
  String get auditLogActionWebhookUpdate => '웹훅 업데이트됨';

  @override
  String get auditLogActionWebhookDelete => '웹훅 삭제됨';

  @override
  String get auditLogActionEmojiCreate => '이모지 생성됨';

  @override
  String get auditLogActionEmojiUpdate => '이모지 업데이트됨';

  @override
  String get auditLogActionEmojiDelete => '이모지 삭제됨';

  @override
  String get auditLogActionStickerCreate => '스티커 생성됨';

  @override
  String get auditLogActionStickerUpdate => '스티커 업데이트됨';

  @override
  String get auditLogActionStickerDelete => '스티커 삭제됨';

  @override
  String get auditLogActionMessageDelete => '메시지 삭제됨';

  @override
  String get auditLogActionMessageBulkDelete => '메시지 일괄 삭제됨';

  @override
  String get auditLogActionMessagePin => '메시지 고정됨';

  @override
  String get auditLogActionMessageUnpin => '메시지 고정 해제됨';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor님이 커뮤니티 설정을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor님이 $target 채널을 생성했습니다.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor님이 $target 채널을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor님이 $target 채널을 삭제했습니다.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor님이 $target에 대한 채널 권한을 추가했습니다.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor님이 $channel에서 $target에 대한 채널 권한을 추가했습니다.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor님이 $target에 대한 채널 권한을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor님이 $channel에서 $target에 대한 채널 권한을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor님이 $target에 대한 채널 권한을 삭제했습니다.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor님이 $channel에서 $target에 대한 채널 권한을 삭제했습니다.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor님이 $target님을 추방했습니다.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor님이 $target님을 차단했습니다.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor님이 $target님의 차단을 해제했습니다.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor님이 $target님을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor님이 $target님의 역할을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor님이 비활성 멤버를 정리했습니다.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor님이 $days일 동안 비활성 멤버를 정리했습니다.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor님이 $target님을 다른 음성 채널로 이동했습니다.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor님이 $target님을 $channel로 이동했습니다.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor님이 $target님을 음성에서 연결 해제했습니다.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor님이 $target 봇을 추가했습니다.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor님이 $target 역할을 생성했습니다.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor님이 $target 역할을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor님이 $target 역할을 삭제했습니다.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor님이 $target 초대를 생성했습니다.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor님이 $channel에 대한 $target 초대를 생성했습니다.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor님이 $target 초대를 업데이트했습니다.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor님이 $channel에 대한 $target 초대를 업데이트했습니다.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor님이 $target 초대를 삭제했습니다.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor님이 $channel에 대한 $target 초대를 삭제했습니다.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor님이 $target 웹훅을 생성했습니다.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor님이 $target 웹훅을 업데이트했습니다.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor님이 $target 웹훅을 삭제했습니다.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor님이 이모지 $target을(를) 추가했습니다.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor님이 이모지 $target을(를) 업데이트했습니다.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor님이 이모지 $target을(를) 삭제했습니다.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor님이 스티커 $target을(를) 추가했습니다.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor님이 스티커 $target을(를) 업데이트했습니다.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor님이 스티커 $target을(를) 삭제했습니다.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor님이 메시지를 삭제했습니다.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor님이 $channel에서 메시지를 삭제했습니다.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor님이 여러 메시지를 삭제했습니다.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor님이 $count개의 메시지를 삭제했습니다.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor님이 $channel에서 여러 메시지를 삭제했습니다.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor님이 $channel에서 $count개의 메시지를 삭제했습니다.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor님이 메시지를 고정했습니다.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor님이 $channel에서 메시지를 고정했습니다.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor님이 메시지 고정을 해제했습니다.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor님이 $channel에서 메시지 고정을 해제했습니다.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor님이 $target에 대해 감사 작업을 수행했습니다.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field을(를) $oldValue에서 $newValue(으)로 업데이트했습니다.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field을(를) $newValue(으)로 설정했습니다.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field을(를) 지웠습니다 (이전 값: $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field을(를) 업데이트했습니다.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return '커뮤니티 이름을 $name(으)로 변경했습니다.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => '커뮤니티 아이콘을 업데이트했습니다.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return '채널 이름을 $name(으)로 변경했습니다.';
  }

  @override
  String get auditLogChangeClearedTopic => '주제를 지웠습니다.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return '주제를 $topic(으)로 업데이트했습니다.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => '성인 콘텐츠를 활성화했습니다.';

  @override
  String get auditLogChangeDisabledMatureContent => '성인 콘텐츠를 비활성화했습니다.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return '닉네임을 $nickname(으)로 설정했습니다.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return '$nickname 닉네임을 삭제했습니다.';
  }

  @override
  String get auditLogChangeMutedMember => '멤버를 음소거했습니다.';

  @override
  String get auditLogChangeUnmutedMember => '멤버 음소거를 해제했습니다.';

  @override
  String get auditLogChangeDeafenedMember => '멤버의 소리를 차단했습니다.';

  @override
  String get auditLogChangeUndeafenedMember => '멤버의 소리 차단을 해제했습니다.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles을(를) 추가했습니다.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles을(를) 삭제했습니다.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return '채널: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return '메시지: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return '$value님이 초대했습니다.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '메시지 #개를 삭제했습니다.',
      one: '메시지 1개를 삭제했습니다.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '멤버 #명을 추방했습니다.',
      one: '멤버 1명을 추방했습니다.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => '이 초대는 만료되지 않습니다.';

  @override
  String get auditLogOptionTemporaryMembership => '임시 멤버십을 부여합니다.';

  @override
  String get auditLogOptionPermanentMembership => '영구 멤버십을 부여합니다.';

  @override
  String get guildSettingsLoadMore => '더 불러오기';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription => '커뮤니티에 설정된 모든 웹훅을 확인하고 관리합니다.';

  @override
  String get guildSettingsWebhooksEmpty => '웹훅 없음';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return '이 커뮤니티에는 아직 웹훅이 없습니다. 웹훅을 만들려면 $channelSettingsPath로 이동하세요.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return '커뮤니티의 웹훅을 보거나 수정하려면 \"$permission\" 권한이 필요합니다.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => '웹훅을 불러오지 못했습니다';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      '웹훅을 불러오는 중 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get guildSettingsWebhooksUpdated => '웹훅 업데이트됨';

  @override
  String get guildSettingsWebhooksUpdateFailed => '웹훅 업데이트 실패';

  @override
  String get guildSettingsUnknownChannel => '알 수 없는 채널';

  @override
  String get guildSettingsCopyUrl => 'URL 복사';

  @override
  String get guildSettingsCopiedUrl => 'URL이 클립보드에 복사되었습니다.';

  @override
  String get guildSettingsDeleteWebhook => '웹훅 삭제';

  @override
  String get guildSettingsVanityUrlDescription => '서버에 맞춤 초대 링크를 설정하세요.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => '저장';

  @override
  String get guildSettingsVanityUrlUsageTitle => '사용량';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count회 사용';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      '다른 사람들이 찾아서 참여할 수 있도록 커뮤니티를 디스커버리에 등록하세요.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => '멤버 부족';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return '커뮤니티가 디스커버리에 등록되려면 최소 $count명의 멤버가 필요합니다.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => '상태:';

  @override
  String get guildSettingsDiscoveryStatusPending => '대기 중';

  @override
  String get guildSettingsDiscoveryStatusApproved => '승인됨';

  @override
  String get guildSettingsDiscoveryStatusRejected => '거부됨';

  @override
  String get guildSettingsDiscoveryStatusRemoved => '삭제됨';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return '사유: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      '회원님의 커뮤니티가 디스커버리에 등록되었습니다. 아래에서 등록 정보를 업데이트하거나 등록을 철회할 수 있습니다.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      '신청서가 검토 대기 중입니다. 목록 세부 정보를 업데이트하거나 신청을 철회할 수 있습니다.';

  @override
  String get guildSettingsDiscoveryCategory => '카테고리';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      '커뮤니티를 가장 잘 나타내는 카테고리를 선택하세요. 언제든지 변경할 수 있습니다.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => '기본 언어';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      '대부분의 커뮤니티 구성원이 사용하는 언어입니다. 둘러보기 결과 필터링에 사용됩니다.';

  @override
  String get guildSettingsDiscoveryDescriptionField => '설명';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder => '커뮤니티에 대해 설명해 주세요';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => '설명이 필요합니다.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return '설명은 최소 $minLength자여야 합니다.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return '설명은 최대 $maxLength자까지 가능합니다.';
  }

  @override
  String get guildSettingsDiscoveryTags => '맞춤 태그';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return '최대 $maxTags개의 태그로 커뮤니티를 더 쉽게 찾을 수 있도록 도와주세요. 디스커버리 검색에 표시됩니다.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => '태그를 추가하고 Enter를 누르세요';

  @override
  String get guildSettingsDiscoveryAddTag => '추가';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return '태그 $tag 삭제';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => '태그를 추가할 수 없습니다';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return '태그는 2자에서 $maxLength자 사이의 영숫자여야 합니다.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return '태그는 최대 $maxTags개까지 추가할 수 있습니다.';
  }

  @override
  String get guildSettingsDiscoveryApply => '적용';

  @override
  String get guildSettingsDiscoverySave => '저장';

  @override
  String get guildSettingsDiscoveryWithdraw => '철회';

  @override
  String get guildSettingsDiscoveryApplicationSent => '디스커버리 신청 완료';

  @override
  String get guildSettingsDiscoveryListingUpdated => '새로운 서버를 찾았어요';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn => '디스커버리 신청 철회됨';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => '신청을 철회할 수 없습니다';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      '잠시 후에 다시 시도해 주세요.';

  @override
  String get guildSettingsMembersDescription => '서버 멤버를 검색하고 관리하세요.';

  @override
  String get guildSettingsMembersSearchHint => '사용자 이름 또는 ID로 검색';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count명의 멤버';
  }

  @override
  String get guildMembersRecentTitle => '최근 멤버';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '총 $totalCount명 중 $displayedCount명 표시';
  }

  @override
  String get guildMembersSort => '정렬';

  @override
  String get guildSettingsMembersSortNewest => '최신순';

  @override
  String get guildMembersSortOldest => '오래된 항목 먼저';

  @override
  String get guildMembersColumnName => '이름';

  @override
  String get guildMembersColumnMemberSince => '멤버 가입일';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '$productName 가입일';
  }

  @override
  String get guildMembersColumnJoinMethod => '참여 방법';

  @override
  String get guildMembersColumnRoles => '역할';

  @override
  String get guildMembersColumnActions => '작업';

  @override
  String get guildMembersFilterMemberSince => '멤버 가입일로 필터링';

  @override
  String get guildMembersFilterJoinedProduct => '계정 생성일로 필터링';

  @override
  String get guildMembersFilterJoinMethod => '가입 방식별 필터링';

  @override
  String get guildMembersFilterRoles => '역할로 필터링';

  @override
  String get guildMembersFilterAll => '전체';

  @override
  String get guildMembersFilterPast1Hour => '지난 1시간';

  @override
  String get guildMembersFilterPast24Hours => '지난 24시간';

  @override
  String get guildMembersFilterPast7Days => '지난 7일';

  @override
  String get guildMembersFilterPast2Weeks => '지난 2주';

  @override
  String get guildMembersFilterPast3Weeks => '지난 3주';

  @override
  String get guildMembersFilterPast4Weeks => '지난 4주';

  @override
  String get guildMembersFilterPast3Months => '지난 3개월';

  @override
  String get guildMembersFilterCustomRange => '범위 지정...';

  @override
  String get guildMembersDateRangeTitle => '날짜 범위 직접 지정';

  @override
  String get guildMembersDateAfter => '날짜 이후';

  @override
  String get guildMembersDateBefore => '이전 날짜';

  @override
  String get guildMembersClearAll => '모두 지우기';

  @override
  String get guildMembersRowsPerPage => '페이지당 행 수';

  @override
  String get guildMembersEmptySearch => '일치하는 검색 결과가 없습니다.';

  @override
  String get guildMembersLoadError => '멤버를 불러오는 중 문제가 발생했습니다. 나중에 다시 시도해 주세요.';

  @override
  String get guildMembersIndexing => '멤버 색인 중…';

  @override
  String get guildMembersGoToPage => '페이지로 이동';

  @override
  String guildMembersGoToPageItem(int page) {
    return '$page페이지로 이동';
  }

  @override
  String get guildMembersJumpToPage => '페이지로 이동';

  @override
  String get guildMembersJoinSourceCreator => '커뮤니티 개설자';

  @override
  String get guildMembersJoinSourceInvite => '초대하기';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return '초대 ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return '$name님이 초대했습니다.';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => '맞춤 URL';

  @override
  String get guildMembersJoinSourceBotInvite => '봇 초대';

  @override
  String get guildMembersJoinSourcePlatformAdmin => '플랫폼 관리자';

  @override
  String get guildMembersJoinSourceDiscovery => '탐색';

  @override
  String get guildMembersJoinMethodUnknown => '알 수 없음';

  @override
  String get guildMembersCommunityOwner => '커뮤니티 소유자';

  @override
  String get guildMembersViewAllRoles => '모든 역할 보기';

  @override
  String get guildMembersJoinedJustNow => '방금';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count분 전',
      one: '1분 전',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count시간 전',
      one: '1시간 전',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count일 전',
      one: '1일 전',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => '멤버';

  @override
  String get guildMembersChannelListSelected => '멤버 선택됨';

  @override
  String get guildSettingsInvitesTitle => '초대';

  @override
  String get guildSettingsInvitesDescription =>
      '이 커뮤니티의 모든 초대를 확인하세요. 새 초대를 만들려면 채널로 이동하여 초대 버튼을 사용하세요.';

  @override
  String get guildSettingsInvitesEmpty => '초대 링크 없음';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      '이 커뮤니티에는 아직 초대 링크가 없습니다. 채널로 이동하여 사람들을 초대할 초대 링크를 만드세요.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => '초대 불러오기 실패';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      '초대 로드 중 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get guildSettingsInvitesTryAgain => '다시 시도';

  @override
  String get guildSettingsInvitesShowCreatedDate => '만료일 대신 생성일 표시';

  @override
  String get guildSettingsInvitesPauseInvites => '초대 일시 중지';

  @override
  String get guildSettingsInvitesEnableInvites => '초대 활성화';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle => '이 커뮤니티의 초대 일시 중지';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle => '이 커뮤니티의 초대 활성화';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      '초대 일시 중지? 다시 사용 설정할 때까지 새 사용자는 초대 링크를 통해 참여할 수 없습니다. 기존 멤버에게는 영향을 미치지 않습니다.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      '초대 기능을 다시 사용하시겠어요? 다른 사용자가 초대 링크를 통해 이 커뮤니티에 다시 참여할 수 있습니다.';

  @override
  String get guildSettingsInvitesPause => '일시 정지';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      '이 커뮤니티의 초대 기능이 일시 중지되었습니다.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '$productName에서 잠재적인 레이드를 감지하여 초대 기능이 일시 중지되었습니다. 지금은 새 사용자가 참여할 수 없습니다.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => '초대한 사람:';

  @override
  String get guildSettingsInvitesLabelChannel => '채널:';

  @override
  String get guildSettingsInvitesLabelCode => '코드:';

  @override
  String get guildSettingsInvitesLabelUses => '사용:';

  @override
  String get guildSettingsInvitesLabelCreated => '생성됨:';

  @override
  String get guildSettingsInvitesLabelExpires => '만료:';

  @override
  String get guildSettingsInvitesUnknown => '알 수 없음';

  @override
  String get guildSettingsInvitesNoCategory => '카테고리 없음';

  @override
  String get guildSettingsInvitesExpired => '만료됨';

  @override
  String get guildSettingsInvitesNever => '안 함';

  @override
  String get guildSettingsInvitesCopyLink => '초대 링크 복사';

  @override
  String get guildSettingsInvitesRevoke => '초대 취소';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => '초대 취소 실패';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      '링크가 여전히 유효할 수 있습니다. 잠시 후에 다시 시도해 주세요.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses회 사용';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return '$date 만료';
  }

  @override
  String get guildSettingsBansDescription => '차단된 사용자를 확인하고 관리하세요.';

  @override
  String get guildSettingsBansSearchHint => '차단 검색';

  @override
  String get guildSettingsBansEmpty => '차단된 사용자가 없습니다.';

  @override
  String get guildSettingsBanPermanent => '영구 차단';

  @override
  String guildSettingsBanExpires(String date) {
    return '$date 만료';
  }

  @override
  String get guildSettingsBanExpiresLabel => '만료';

  @override
  String get guildSettingsUnban => '차단 해제';

  @override
  String get guildSettingsBansLoading => '차단된 사용자 로딩 중';

  @override
  String get guildSettingsBansNoSearchResults => '검색 결과와 일치하는 차단 기록이 없습니다.';

  @override
  String get guildSettingsBanDetailsTitle => '차단 상세 정보';

  @override
  String get guildSettingsBanViewDetails => '상세 정보 보기';

  @override
  String get guildSettingsBannedOn => '차단 일시';

  @override
  String get guildSettingsBannedBy => '차단한 관리자';

  @override
  String get guildSettingsRevokeBanTitle => '차단 해제';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return '$displayName님의 차단을 해제하시겠습니까? 커뮤니티에 다시 참여할 수 있게 됩니다.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '$displayName님의 차단을 해제했습니다.';
  }

  @override
  String get guildSettingsBansLoadError => '차단 목록을 불러올 수 없습니다. 다시 시도하세요.';

  @override
  String get guildSettingsRevokeBanError => '차단을 해제할 수 없습니다. 다시 시도하세요.';

  @override
  String get guildSettingsCommunitySettings => '커뮤니티 설정';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewDescription => '커뮤니티 프로필, 채널 및 기본 설정을 관리하세요.';

  @override
  String get guildSettingsOverviewBrandingTitle => '브랜딩';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      '아이콘, 이름, 배너 및 초대 배경 업데이트';

  @override
  String get guildSettingsOverviewBannerUpload => '배너 업로드';

  @override
  String get guildSettingsOverviewIdleTitle => '자리 비움 설정';

  @override
  String get guildSettingsOverviewIdleDescription => 'AFK 채널 및 시간 초과 구성';

  @override
  String get guildSettingsOverviewSystemTitle => '시스템 및 환영 메시지';

  @override
  String get guildSettingsOverviewSystemDescription => '시스템 및 환영 메시지 대상 선택';

  @override
  String get guildSettingsOverviewNotificationsTitle => '기본 알림';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      '멤버 250명 이상의 커뮤니티는 \"멘션만\" 설정으로 강제됩니다. 원래 설정은 보존되며 커뮤니티 멤버 수가 250명 미만으로 떨어지면 복원됩니다.';

  @override
  String get guildSettingsOverviewAdvancedTitle => '고급';

  @override
  String get guildSettingsOverviewFlexibleNames => '유연한 텍스트 채널 이름 허용';

  @override
  String get guildSettingsOverviewHideOwnerCrown => '커뮤니티 소유자 왕관 숨기기';

  @override
  String get guildSettingsOverviewDetachedBanner => '분리된 배너';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      '커뮤니티 헤더 아래 자체 섹션에 배너를 표시합니다.';

  @override
  String get guildSettingsOverviewUploadIcon => '아이콘 업로드';

  @override
  String get guildSettingsOverviewRemoveImage => '삭제';

  @override
  String get guildSettingsOverviewSplashTitle => '초대 배경';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => '채팅 임베드 배경';

  @override
  String get guildSettingsOverviewEmbedSplashHint => '채팅의 초대 임베드에 표시됩니다.';

  @override
  String get guildSettingsOverviewUploadBackground => '배경 업로드';

  @override
  String get guildSettingsOverviewNoCommunityBanner => '커뮤니티 배너 없음';

  @override
  String get guildSettingsOverviewNoInviteBackground => '초대 배경 없음';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => '미리보기';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      '방문자에게 내 초대가 어떻게 보이는지 확인하세요.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => '텍스트 채널 이름';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => '커뮤니티 소유자 왕관';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      '커뮤니티 소유자 옆에 왕관 아이콘이 표시되는지 여부를 구성합니다.';

  @override
  String get guildSettingsSplashCardAlignment => '카드 정렬';

  @override
  String get guildSettingsSplashAlignmentCenter => '가운데';

  @override
  String get guildSettingsSplashAlignmentLeft => '왼쪽';

  @override
  String get guildSettingsSplashAlignmentRight => '오른쪽';

  @override
  String get guildSettingsSplashAlignmentHint => '넓은 화면에만 적용됩니다.';

  @override
  String get permissionReadMessageHistory => '메시지 기록 읽기';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return '\"$permission\" 권한이 없는 사용자가 볼 수 있는 내용 변경';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return '$permission 권한이 없는 멤버의 경우 메시지 기록 임계값 날짜를 설정하려면 전용 모달을 사용하세요.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen => '메시지 기록 임계값 열기';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => '메시지 기록 임계값';

  @override
  String get guildSettingsMessageHistoryThresholdEnable => '메시지 기록 임계값 사용';

  @override
  String get guildSettingsMessageHistoryThresholdDate => '임계값 날짜';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      '메시지 기록 읽기 권한이 없는 멤버는 이 날짜 이후에 보낸 메시지를 볼 수 있습니다.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated => '메시지 기록 임계값 업데이트됨';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      '텍스트 채널 이름에 대문자와 공백을 허용합니다. 해제하면 이름이 소문자와 하이픈, 밑줄로 제한됩니다.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      '모든 표면에서 커뮤니티 소유자 옆의 왕관 아이콘을 숨깁니다.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      '애니메이션 아이콘에는 애니메이션 아이콘 커뮤니티 기능이 필요합니다.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      '애니메이션 배너에는 애니메이션 배너 커뮤니티 기능이 필요합니다.';

  @override
  String get guildSettingsAfkChannel => 'AFK / 유휴 채널';

  @override
  String get guildSettingsAfkChannelHint => 'AFK 상태일 때 멤버를 이 채널로 이동합니다.';

  @override
  String get guildSettingsNoAfkChannel => 'AFK 채널 없음';

  @override
  String get guildSettingsAfkTimeout => 'AFK 시간 초과';

  @override
  String get guildSettingsAfkTimeout1Min => '1분';

  @override
  String get guildSettingsAfkTimeout5Min => '5분';

  @override
  String get guildSettingsAfkTimeout15Min => '15분';

  @override
  String get guildSettingsAfkTimeout30Min => '30분';

  @override
  String get guildSettingsAfkTimeout1Hour => '1시간';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds초';
  }

  @override
  String get guildSettingsSystemChannel => '대상 채널';

  @override
  String get guildSettingsSystemChannelHint => '환영 및 시스템 메시지가 여기에 표시됩니다.';

  @override
  String get guildSettingsNoSystemChannel => '시스템 채널 없음';

  @override
  String get guildSettingsHideJoinMessages => '가입 메시지 숨기기';

  @override
  String get guildSettingsHideJoinMessagesHint => '가입 메시지를 대상 채널에서 숨깁니다.';

  @override
  String get guildSettingsDefaultNotifications => '기본 알림 설정';

  @override
  String get guildSettingsNotificationsAll => '모든 메시지';

  @override
  String get guildSettingsNotificationsAllDescription => '모든 메시지에 대해 알림 받기';

  @override
  String get guildSettingsNotificationsMentions => '멘션만';

  @override
  String get guildSettingsNotificationsMentionsDescription => '멘션에 대해서만 알림 받기';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. 최대 10MB. 최소: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. 최대 10MB. 최소: 960×540px (16:9). 채팅의 초대 임베드에 표시됩니다.';

  @override
  String get guildSettingsModerationDescription =>
      '인증, 콘텐츠 필터링 및 성인 콘텐츠 설정을 구성합니다.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Discovery에 등록된 커뮤니티는 제한된 관리 옵션을 제공합니다.';

  @override
  String get guildSettingsModerationContentFilterTitle => '콘텐츠 필터링';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      '성인 콘텐츠용으로 표시되지 않은 채널의 메시지를 자동으로 검사합니다.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Discovery에 등록된 커뮤니티는 모든 멤버를 스캔해야 합니다. Discovery가 활성화된 동안에는 이 설정을 변경할 수 없습니다.';

  @override
  String get guildSettingsContentFilterOff => '사용 안 함';

  @override
  String get guildSettingsContentFilterOffDescription => '커뮤니티가 자체적으로 관리하도록 허용';

  @override
  String get guildSettingsContentFilterNoRole => '역할이 없는 멤버 필터링';

  @override
  String get guildSettingsContentFilterNoRoleDescription => '대부분의 커뮤니티에 권장됨';

  @override
  String get guildSettingsContentFilterAll => '모든 멤버 필터링';

  @override
  String get guildSettingsContentFilterAllDescription => '가족 친화적인 공간을 위한 최대 보호';

  @override
  String get guildSettingsModerationMatureOff => '사용 안 함';

  @override
  String get guildSettingsModerationMatureOn => '사용 함';

  @override
  String get guildSettingsContentWarningToggle => '콘텐츠 경고 표시';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      '모든 채널에 들어가기 전에 동의 프롬프트를 전환합니다.';

  @override
  String get guildSettingsContentWarningText => '맞춤 경고 텍스트';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      '이 콘텐츠는 민감한 내용을 포함하고 있습니다.';

  @override
  String get guildSettingsModeration2faTitle => '2단계 인증 요구 사항';

  @override
  String get guildSettingsModeration2faDescription =>
      '밴, 추방, 타임아웃 또는 메시지 삭제 전에 관리자에게 2단계 인증을 요구합니다.';

  @override
  String get guildSettingsModeration2faSwitchLabel => '관리 작업에 2단계 인증 요구';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      '커뮤니티 소유자만 이 설정을 변경할 수 있습니다.';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      '이 설정을 변경하려면 계정에서 2단계 인증을 활성화하세요.';

  @override
  String get guildSettingsEmojiSearchHint => '이모지 검색';

  @override
  String get guildSettingsEmojiUploadTitle => '이모티콘 업로드';

  @override
  String get guildSettingsEmojiSlotsTitle => '이모티콘 슬롯';

  @override
  String get guildSettingsEmojiDropZone => '이모티콘 파일을 여기로 드래그 앤 드롭하세요';

  @override
  String get guildSettingsEmojiLoadFailed =>
      '이모티콘을 불러오지 못했습니다. 나중에 다시 시도해 주세요.';

  @override
  String get guildSettingsEmojiSearchEmpty => '검색 결과와 일치하는 이모티콘이 없습니다.';

  @override
  String get guildSettingsEmojiNoSlots => '사용 가능한 이모티콘 슬롯 없음';

  @override
  String get guildSettingsEmojiSlotsFull =>
      '이모티콘 최대 개수에 도달했습니다. 공간을 확보하려면 기존 이모티콘을 일부 삭제하세요.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return '이모티콘 이름은 최소 2자 이상이어야 하며 문자, 숫자 및 밑줄을 사용할 수 있습니다. 이모티콘 크기는 $maxSize 이하여야 합니다. 정지된 이미지는 자동으로 128x128픽셀로 조정되고 압축됩니다. 애니메이션 이모티콘과 SVG는 제한 내에 있어야 합니다.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => '이모티콘 업로드 중';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '#개의 이모지를 업로드 중입니다',
      one: '#개의 이모지를 업로드 중입니다',
    );
    return '$_temp0. 시간이 조금 걸릴 수 있습니다.';
  }

  @override
  String get guildSettingsEmojiUploadFailed => '이모티콘 업로드에 실패했습니다. 다시 시도해 주세요.';

  @override
  String get guildSettingsEmojiSomeFailedTitle => '일부 이모티콘을 추가할 수 없습니다';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      '이 파일을 검토하고 더 작거나 간단한 이미지로 다시 시도해 주세요.';

  @override
  String get guildSettingsEmojiRenameTitle => '이모티콘 이름 변경';

  @override
  String get guildSettingsEmojiRenameHint => '2~32자, 문자, 숫자, 밑줄.';

  @override
  String get guildSettingsEmojiColumnEmoji => '이모지';

  @override
  String get guildSettingsEmojiColumnName => '이름';

  @override
  String get guildSettingsEmojiColumnUploader => '업로드한 사람';

  @override
  String get guildSettingsEmojiUnknownUploader => '알 수 없음';

  @override
  String get guildSettingsEmojiDeleteTitle => '이모티콘 삭제';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return ':$name: 삭제하시겠어요? 실행 취소할 수 없습니다.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel => '저장소 및 CDN에서 이모티콘 삭제';

  @override
  String get guildSettingsEmojiNameTooShort => '이모티콘 이름은 2자 이상이어야 합니다';

  @override
  String get guildSettingsEmojiNameTooLong => '이모티콘 이름은 32자 이하여야 합니다';

  @override
  String get guildSettingsEmojiInvalidNameTitle => '이모티콘 이름이 유효하지 않습니다';

  @override
  String get guildSettingsEmojiRenameFailedTitle => '이 이모티콘의 이름을 변경할 수 없습니다';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      '이름이 이전으로 되돌려졌습니다. 잠시 후에 다시 시도해 주세요.';

  @override
  String get guildSettingsEmojiGoneTitle => '이 이모티콘은 더 이상 존재하지 않습니다';

  @override
  String get guildSettingsEmojiGoneBody => '삭제되었을 수 있습니다. 이름이 이전 상태로 되돌려졌습니다.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      '이 이모티콘의 이름을 변경할 수 없습니다';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      '이 이모티콘의 이름을 변경할 권한이 없습니다. 이름이 이전으로 되돌려졌습니다.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => '너무 빠르시네요';

  @override
  String get guildSettingsEmojiRateLimitedBody => '잠시 후 다시 이름을 변경해 주세요.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => '이 이모티콘을 삭제할 수 없습니다';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle => '이 이모티콘을 삭제할 수 없습니다';

  @override
  String get guildSettingsCloneEmojiTitle => '다른 사람이 내 이모티콘을 복제하도록 허용';

  @override
  String get guildSettingsCloneEmojiDescription =>
      '활성화하면 다른 커뮤니티 멤버가 인앱 원클릭 \"복제\" 단축키를 사용하여 내 맞춤 이모티콘을 복제할 수 있습니다. 이 기능은 다른 멤버가 이미지를 저장하여 직접 업로드하는 것을 막지는 않습니다.';

  @override
  String get guildSettingsCloneStickerTitle => '다른 사람이 내 스티커를 복제하도록 허용';

  @override
  String get guildSettingsCloneStickerDescription =>
      '활성화하면 다른 커뮤니티 회원들이 인앱 원클릭 \"복제\" 단축키를 사용하여 회원님의 맞춤 스티커를 복제할 수 있습니다. 이는 다른 회원들이 이미지를 저장하여 직접 업로드하는 것을 막지는 않습니다.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return '이 설정은 \"$permission\" 권한이 있는 멤버만 변경할 수 있습니다.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed => '이모티콘 복제 업데이트 실패';

  @override
  String get guildSettingsCloneStickerUpdateFailed => '스티커 복제 업데이트 실패';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return '일반 이모지 ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return '움직이는 이모지 ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => '스티커 검색';

  @override
  String get guildSettingsStickerSlotsTitle => '스티커 슬롯';

  @override
  String get guildSettingsStickerUploadTitle => '스티커 업로드';

  @override
  String get guildSettingsStickerDropZone => '스티커 파일을 여기로 끌어다 놓으세요 (한 번에 하나씩)';

  @override
  String get guildSettingsStickerDensity => '스티커 밀도';

  @override
  String get guildSettingsStickerDensityCozy => '아늑한';

  @override
  String get guildSettingsStickerDensityCompact => '간략히 보기';

  @override
  String get guildSettingsStickersLoadFailedTitle => '스티커 불러오기 실패';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      '스티커를 불러오는 중 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get guildSettingsStickersSearchEmpty => '검색 결과와 일치하는 스티커가 없습니다.';

  @override
  String get guildSettingsStickersEmptySearch => '스티커를 찾을 수 없습니다';

  @override
  String get guildSettingsStickerNoSlots => '사용 가능한 스티커 슬롯 없음';

  @override
  String get guildSettingsStickerSlotsFull =>
      '스티커 최대 개수에 도달했습니다. 공간을 확보하려면 기존 스티커를 일부 삭제하세요.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return '스티커는 320x320픽셀로 저장되며 $maxSize 이하여야 합니다. 정지된 이미지는 자동으로 크기가 조정되고 압축됩니다. 애니메이션 스티커와 SVG는 제한 내에 있어야 합니다.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => '지원되지 않는 스티커 파일';

  @override
  String get guildSettingsStickerAddTitle => '스티커 추가';

  @override
  String get guildSettingsStickerEditTitle => '스티커 편집';

  @override
  String get guildSettingsStickerNameLabel => '이름';

  @override
  String get guildSettingsStickerNameHint => '내 멋진 스티커';

  @override
  String get guildSettingsStickerDescriptionLabel => '설명';

  @override
  String get guildSettingsStickerDescriptionHint => '스티커 설명';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return '태그 ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => '태그 추가';

  @override
  String get guildSettingsStickerTagAdd => '추가';

  @override
  String get guildSettingsStickerNameRequired => '이름을 입력해 주세요';

  @override
  String get guildSettingsStickerNameTooShort => '이름은 2자 이상이어야 합니다';

  @override
  String get guildSettingsStickerNameTooLong => '이름은 30자 이하여야 합니다';

  @override
  String get guildSettingsStickerDescriptionTooLong => '설명은 500자 이하여야 합니다';

  @override
  String get guildSettingsStickerCreateFailedTitle => '스티커를 만들 수 없습니다';

  @override
  String get guildSettingsStickerTooLargeTitle => '스티커 파일이 너무 큽니다';

  @override
  String get guildSettingsStickerCompressFailedTitle => '스티커를 충분히 압축할 수 없습니다';

  @override
  String get guildSettingsStickerDeleteTitle => '스티커 삭제';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '\"$name\"을(를) 삭제하시겠어요? 실행 취소할 수 없습니다.';
  }

  @override
  String get guildSettingsStickerPurgeLabel => '이 스티커를 저장소 및 CDN에서 삭제';

  @override
  String get guildSettingsStickerDeleteFailedTitle => '이 스티커를 삭제할 수 없습니다';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle => '이 스티커를 삭제할 수 없습니다';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return '웹훅을 만들려면 $channelSettingsPath을(를) 여세요. 여기에 있는 모든 기존 웹훅을 편집하고 정리할 수 있습니다.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      '최소한 하나의 채널이 모든 사용자에게 공개되지 않으면 맞춤 URL이 작동하지 않습니다.';

  @override
  String get guildSettingsVanityUrlRemove => '삭제';

  @override
  String get guildSettingsBannedUsersTitle => '차단된 사용자';

  @override
  String get guildSettingsInvitesTableInviter => '초대한 사람';

  @override
  String get guildSettingsInvitesTableChannel => '채널';

  @override
  String get guildSettingsInvitesTableCode => '코드';

  @override
  String get guildSettingsInvitesTableUses => '사용 횟수';

  @override
  String get guildSettingsInvitesTableCreated => '생성일';

  @override
  String get guildSettingsInvitesTableExpires => '만료';

  @override
  String get guildSettingsAuditLogFilterUser => '사용자별 필터링';

  @override
  String get guildSettingsAuditLogFilterAction => '작업별 필터링';

  @override
  String get createDm => 'DM 만들기';

  @override
  String get createGroupDm => '그룹 DM 만들기';

  @override
  String get createDmNewMessage => '새 메시지';

  @override
  String get createDmSelectFriends => '친구 선택';

  @override
  String get createDmChooseFriendsSubtitle => '메시지를 보낼 친구를 선택하세요.';

  @override
  String get createDmSearchFriends => '친구 검색';

  @override
  String get createDmNoFriendsFound => '친구가 없습니다';

  @override
  String get createDmNoFriendsYet => '아직 친구가 없습니다';

  @override
  String get createDmClaimToStartDms => 'DM을 시작하려면 계정을 등록하세요.';

  @override
  String get createDmVerifyToStartDms => 'DM을 시작하려면 이메일을 인증하세요.';

  @override
  String get createDmVerifyYourEmail => '이메일 주소 인증';

  @override
  String get createDmNewGroup => '새로운 그룹';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return '$userName님과 새 그룹 만들기';
  }

  @override
  String get createDmConfirmNewGroup => '새 그룹 확인';

  @override
  String get createDmCreateNewGroup => '새 그룹 만들기';

  @override
  String createDmRemoveFriend(String displayName) {
    return '$displayName 계정 삭제';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      '이 멤버들로 구성된 그룹이 이미 있습니다. 새 그룹을 만드시겠어요? 그래도 괜찮아요!';

  @override
  String get createDmNoActivityYet => '아직 활동이 없습니다';

  @override
  String get createDmSomeUsersCantBeAdded => '일부 사용자는 추가할 수 없습니다';

  @override
  String get createDmCreateWithoutThem => '이대로 만들기';

  @override
  String get createDmUnaddableIntro => '다음 사용자는 그룹 DM에 추가할 수 없습니다:';

  @override
  String createDmUnaddableProceed(int count) {
    return '남은 $count명의 수신자와 그룹 DM을 만들고 나머지는 건너뛸까요?';
  }

  @override
  String get createDmUnaddableNoneRemaining => '그룹 DM을 만들 수 있는 수신자가 없습니다.';

  @override
  String get createDmUnaddableUserNotFound => '사용자를 찾을 수 없습니다';

  @override
  String get createDmUnaddableBlocked => '이 사용자에게 메시지를 보낼 수 없습니다';

  @override
  String get createDmUnaddableNotFriends => '친구 목록에 없음';

  @override
  String get createDmUnaddableGroupDisabled => '그룹 DM에 추가될 수 없음';

  @override
  String get createDmFailed => '대화를 만들 수 없습니다. 다시 시도해 주세요.';

  @override
  String get dmListMessagesTitle => '메시지';

  @override
  String get dmListDirectMessagesTitle => 'Direct Messages';

  @override
  String get keybindsSearchShortcuts => '단축키 검색';

  @override
  String get keybindSectionDefaults => '기본값';

  @override
  String get keybindSectionMessages => '메시지';

  @override
  String get keybindSectionNavigation => '탐색';

  @override
  String get keybindSectionDragAndDrop => '드래그 앤 드롭';

  @override
  String get keybindSectionChat => '채팅';

  @override
  String get keybindSectionVoiceAndVideo => '음성 및 영상';

  @override
  String get keybindSectionMisc => '기타';

  @override
  String get keybindActionShowShortcutsList => '키보드 단축키 목록 보기';

  @override
  String get keybindActionCopyText => '텍스트 복사';

  @override
  String get keybindActionMarkUnread => '안 읽음으로 표시';

  @override
  String get keybindActionFocusTextarea => '텍스트 입력창으로 이동';

  @override
  String get keybindActionSwitchCommunities => '커뮤니티 전환';

  @override
  String get keybindActionSwitchChannels => '채널 전환';

  @override
  String get keybindActionHistoryBack => '이전 채널 방문 기록으로 이동';

  @override
  String get keybindActionHistoryForward => '채널 방문 기록 앞으로 이동';

  @override
  String get keybindActionJumpUnreadChannels => '읽지 않은 채널로 이동';

  @override
  String get keybindActionJumpMentionChannels => '멘션이 있는 읽지 않은 채널로 이동';

  @override
  String get keybindActionJumpCurrentCall => '현재 통화로 이동';

  @override
  String get keybindActionToggleLastGuildDms => '마지막 커뮤니티와 DM 간 전환';

  @override
  String get keybindActionPreviousCommunityOrDms => '이전 커뮤니티 또는 DM으로 전환';

  @override
  String get keybindActionNextCommunityOrDms => '다음 커뮤니티 또는 DM으로 전환';

  @override
  String get keybindActionGoToDms => 'DM으로 이동';

  @override
  String get keybindActionGoToFirstCommunity => '첫 번째 커뮤니티로 이동';

  @override
  String get keybindActionGoToSecondCommunity => '두 번째 커뮤니티로 이동';

  @override
  String get keybindActionGoToThirdCommunity => '세 번째 커뮤니티로 이동';

  @override
  String get keybindActionGoToFourthCommunity => '네 번째 커뮤니티로 이동';

  @override
  String get keybindActionGoToFifthCommunity => '5번째 커뮤니티로 이동';

  @override
  String get keybindActionGoToSixthCommunity => '6번째 커뮤니티로 이동';

  @override
  String get keybindActionGoToSeventhCommunity => '7번째 커뮤니티로 이동';

  @override
  String get keybindActionGoToEighthCommunity => '8번째 커뮤니티로 이동';

  @override
  String get keybindActionToggleQuickSwitcher => '빠른 전환 열기/닫기';

  @override
  String get keybindActionCreateOrJoinCommunity => '커뮤니티 만들기 또는 참여하기';

  @override
  String get keybindActionStartDragAndDrop => '끌어서 놓기 시작';

  @override
  String get keybindActionMove => '이동';

  @override
  String get keybindActionDropItem => '아이템 버리기';

  @override
  String get keybindActionCancel => '취소';

  @override
  String get keybindActionMarkCommunityRead => '커뮤니티를 모두 읽음으로 표시';

  @override
  String get keybindActionMarkChannelRead => '채널을 읽음으로 표시';

  @override
  String get keybindActionStartGroupDm => '그룹 DM 시작하기';

  @override
  String get keybindActionTogglePinnedMessages => '고정 메시지 토글';

  @override
  String get keybindActionToggleInbox => '받은 메시지함 전환';

  @override
  String get keybindActionMarkTopInboxRead => '받은 메시지함의 최상단 채널을 읽음으로 표시';

  @override
  String get keybindActionMarkAllInboxRead => '모든 받은 메시지를 읽음으로 표시';

  @override
  String get keybindActionToggleMemberList => '멤버 목록 또는 음성 채팅 전환';

  @override
  String get keybindActionToggleEmojiPicker => '이모티콘 선택 툴 전환';

  @override
  String get keybindActionToggleGifPicker => 'GIF 선택 툴 전환';

  @override
  String get keybindActionToggleStickerPicker => '스티커 선택창 전환';

  @override
  String get keybindActionScrollChatUp => '채팅 위로 스크롤';

  @override
  String get keybindActionScrollChatDown => '채팅 아래로 스크롤';

  @override
  String get keybindActionJumpOldestUnread => '가장 오래된 읽지 않은 메시지로 이동';

  @override
  String get keybindActionFocusComposer => '텍스트 입력창에 초점 맞추기';

  @override
  String get keybindActionUploadFile => '파일 업로드';

  @override
  String get keybindActionCopyChannelLink => '채널 링크 복사';

  @override
  String get keybindActionToggleSavedMedia => '저장된 미디어 전환';

  @override
  String get keybindActionSendVoiceMessage => '음성 메시지 보내기';

  @override
  String get keybindActionAnswerCall => '걸려오는 전화 받기';

  @override
  String get keybindActionDeclineCall => '수신 전화 거절';

  @override
  String get keybindActionStartDmCall => 'DM 또는 그룹에서 통화 시작';

  @override
  String get keybindActionToggleSoundboard => '사운드보드 켜고 끄기';

  @override
  String get keybindActionToggleCompactCallView => '간략한 통화 보기 확장 또는 축소';

  @override
  String get keybindActionPushToTalkPriority => '눌러서 말하기 (우선순위)';

  @override
  String get keybindActionVoiceActivityPriority => '음성 활동 우선순위';

  @override
  String get keybindActionOpenHelp => '도움말 열기';

  @override
  String get keybindActionSearchMessages => '메시지 검색';

  @override
  String get keybindActionOpenContextMenu => '상황 메뉴 열기';

  @override
  String get keybindActionOpenSettings => '설정 열기';

  @override
  String get keybindActionOpenThemeStudio => '테마 스튜디오 팝업 열기';

  @override
  String get keybindActionZoomIn => '확대';

  @override
  String get keybindActionZoomOut => '축소';

  @override
  String get keybindActionZoomReset => '확대/축소 초기화';

  @override
  String get clipboardPasteFailed =>
      '클립보드를 붙여넣을 수 없습니다. 클립보드가 비어 있거나 이 앱에서 차단되었습니다.';

  @override
  String get homeQuickActionDms => 'DM';
}
