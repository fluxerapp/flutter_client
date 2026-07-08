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
  String get reconnectingBody => '서버에 문제가 발생했습니다.\n곧 해결될 거예요!';

  @override
  String get gatewayReconnectingToast => '재연결 중…';

  @override
  String get gatewayConnectedToast => '연결됨';

  @override
  String get sessionExpiredToast =>
      'Your session has expired. Please sign in again.';

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
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

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
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
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
  String get dmDebugCategory => 'Debug Category';

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
  String get addFriendSendFailedGeneric => '친구 요청을 보낼 수 없습니다. 다시 시도하세요.';

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
  String get externalLinkWarningLeaving => 'Fluxer를 벗어나려고 합니다.';

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
  String get changeYourFluxerTag => 'FluxerTag 변경';

  @override
  String get fluxerTagInputLabel => 'FluxerTag';

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
  String get fluxerTagAlreadyTaken => 'FluxerTag가 이미 사용 중입니다.';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return '$username#$discriminator FluxerTag가 이미 사용 중입니다. 계속하면 자동으로 디스커리미네이터가 다시 롤링됩니다.';
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
      '이 FluxerTag를 저장하면 Plutonium 구독이 종료될 때 사용자 지정 4자리 태그가 무작위 숫자로 되돌아갑니다. 구독이 갱신되지 않으면 태그가 변경되기 전에 3일의 유예 기간이 있습니다.';

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
  String get fluxerTagUpdated => 'FluxerTag가 업데이트되었습니다.';

  @override
  String get fluxerTagUpdateFailed => 'FluxerTag 업데이트에 실패했습니다. 다시 시도하세요.';

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
  String get claimAccountToChangeFluxerTag => 'FluxerTag를 변경하려면 계정을 청구하세요.';

  @override
  String get changeFluxerTag => 'FluxerTag 변경';

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
  String get profilePreviewMemberSince => 'Fluxer 가입일';

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
  String get securityLoginEmailSectionDescription =>
      'Fluxer에 로그인하는 데 사용하는 이메일 주소를 관리하세요.';

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
  String get phoneAddFooter => '전화번호를 입력하세요. SMS로 인증 코드를 보내드립니다.';

  @override
  String get phoneAddSendCode => '코드 보내기';

  @override
  String get phoneVerifyTitle => '전화번호 인증';

  @override
  String get phoneVerifyDescription => '전화번호로 전송된 인증 코드를 입력하세요.';

  @override
  String get phoneAddSuccess => '전화번호가 추가되었습니다.';

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
  String get relativeTimeJustNow => '방금 전';

  @override
  String get authorizedAppsTitle => '승인된 애플리케이션';

  @override
  String get authorizedAppsDescription => '다음 애플리케이션에 Fluxer 계정 액세스가 허용되었습니다.';

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
  String get blockedUsersCopyTag => 'Fluxer 태그 복사';

  @override
  String get blockedUsersCopyId => '사용자 ID 복사';

  @override
  String get userProfileLoadError => '프로필을 불러올 수 없습니다';

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
  String get userProfileStaffBadgeTooltip => 'Fluxer 팀';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer 커뮤니티 팀';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer 파트너';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer 버그 헌터';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer 플루토늄';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return '$date부터 Fluxer 플루토늄 구독자';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer 비저너리';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return '$date부터 Fluxer 비저너리';
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
  String get chatAttachmentFileTooLarge => '하나 이상의 파일이 크기 제한을 초과합니다';

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
  String get voiceMessageHoldHint => '길게 눌러 녹음하세요. 위로 드래그하여 고정하거나, 놓아서 보내세요.';

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
  String get chatAttachmentExpiredTooltip => '첨부 파일 만료됨';

  @override
  String get chatAttachmentSourceGallery => '갤러리';

  @override
  String get chatAttachmentSourceCamera => '카메라';

  @override
  String get chatAttachmentSourceBrowse => '파일 찾아보기';

  @override
  String get chatAttachmentPasteTooltip => '클립보드에서 이미지 붙여넣기';

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
  String get connectionsDescription =>
      '외부 계정 및 도메인을 Fluxer 프로필에 연결하세요. 인증된 연결은 프로필에 표시되어 다른 사용자가 볼 수 있습니다.';

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
  String get lookAndFeelChatFontScalingTitle => '채팅 글꼴 크기 조절';

  @override
  String get lookAndFeelChatFontScalingDescription => '채팅 영역의 글꼴 크기를 조절합니다.';

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
  String get lookAndFeelCollapseDMsLabel => 'DM을 폴더로 축소';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      '활성화하면 서버 사이드바의 읽지 않은 DM이 Fluxer 버튼 폴더로 축소됩니다. 폴더를 확장하거나 축소하려면 DM 페이지에서 Fluxer 버튼을 클릭하세요.';

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
  String get messagesMediaDisplayInlineAttachmentLabel => 'Fluxer에 직접 업로드될 때';

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
  String get accessibilitySaturationTitle => 'Saturation';

  @override
  String get accessibilitySaturationDescription =>
      'Adjust how vivid theme colors appear across the app.';

  @override
  String get accessibilityUnreadGroupTitle => '읽지 않음 표시';

  @override
  String get accessibilityUnreadGroupDescription => '읽지 않은 메시지 표시 방식 제어';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsLabel =>
      '음소거된 채널에서 흐리게 표시된 읽지 않음 표시';

  @override
  String get accessibilityShowFadedUnreadOnMutedChannelsDescription =>
      '음소거된 직접 메시지 및 채널 옆에 흐리게 표시된 읽지 않음 표시를 표시하여 활동이 있을 때 한눈에 볼 수 있도록 합니다.';

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
  String systemCallDurationYears(String count) {
    return '$count years';
  }

  @override
  String systemCallDurationMonths(String count) {
    return '$count months';
  }

  @override
  String systemCallDurationWeeks(String count) {
    return '$count weeks';
  }

  @override
  String systemCallDurationDays(String count) {
    return '$count days';
  }

  @override
  String systemCallDurationHours(String count) {
    return '$count hours';
  }

  @override
  String systemCallDurationMinutes(String count) {
    return '$count minutes';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Update $productName to view this message.';
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
  String get voiceChannelEmptyDescription => '음성 채널입니다. 대화를 시작하려면 연결하세요!';

  @override
  String get voiceChannelJoin => '음성 채널 참여';

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
  String get voiceControlFlipCamera => 'Flip camera';

  @override
  String get voiceControlScreenShare => '화면 공유';

  @override
  String get voiceScreenShareNotificationText => '화면을 공유 중입니다.';

  @override
  String get voiceControlMore => '더 보기';

  @override
  String get voiceControlDisconnect => '연결 끊기';

  @override
  String get voiceControlChat => '채팅';

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
  String get iarReasonOtherDescription =>
      'Fluxer 규칙을 명확하게 위반하고 위에 해당하지 않는 경우에만 사용하세요.';

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
  String get chatReplyMentionOn => '켬';

  @override
  String get chatReplyMentionOff => '끔';

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
  String get channelDetailsChannelSettingsTitle => 'Channel Settings';

  @override
  String get channelDetailsGroupSettingsTitle => 'Group Settings';

  @override
  String get channelDetailsDmSettingsTitle => 'DM Settings';

  @override
  String get channelDetailsInvitePeople => 'Invite People';

  @override
  String get channelDetailsCopyLink => 'Copy Link';

  @override
  String get channelDetailsAddFriendsToGroup => 'Add Friends to Group';

  @override
  String get channelDetailsGroupInvites => 'Group Invites';

  @override
  String get channelDetailsEditChannel => 'Edit Channel';

  @override
  String get channelDetailsDeleteChannel => 'Delete Channel';

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
  String get channelDetailsSearchTitle => 'Search';

  @override
  String get channelDetailsSearchHint => 'Search Messages';

  @override
  String get channelDetailsSearchFilterFrom => 'From';

  @override
  String get channelDetailsSearchFilterHas => 'Has';

  @override
  String get channelDetailsSearchFilterSort => 'Sort';

  @override
  String channelDetailsSearchResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Results',
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
  String get personalNotesTitle => '개인 메모';

  @override
  String get personalNotesSubtitle => '생각과 알림을 위한 나만의 공간';

  @override
  String groupDmWelcome(String displayName) {
    return 'Welcome to $displayName. Add friends to get the group going.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Edit group';

  @override
  String get groupDmWelcomeAddFriends => 'Add friends to group';

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
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsNavProfile => '프로필';

  @override
  String get userSettingsNavSecurityLogin => '보안 및 로그인';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => '선물 및 코드';

  @override
  String get userSettingsNavExpressionPacks => '이모티콘 팩';

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
  String get userSettingsNavMessagesAndMedia => '메시지 및 미디어';

  @override
  String get userSettingsNavAudioAndVideo => '오디오 및 비디오';

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
  String get audioAndVideoMicTestSectionDescription =>
      'Listen to how you sound with your current settings.';

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
  String get userSettingsNavSoundsAndAlerts => '소리 및 알림';

  @override
  String get userSettingsNavLanguageAndTime => '언어 및 시간';

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
  String get userSettingsNavAdvanced => '고급';

  @override
  String get advancedPerformanceReportingTitle => '성능 보고';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      '익명의 충돌 및 성능 데이터를 공유하여 Fluxer를 개선하세요.';

  @override
  String get advancedPerformanceReportingLabel => '충돌 및 성능 보고서 보내기';

  @override
  String get advancedPerformanceReportingDescription =>
      '보고된 모든 데이터는 익명이며 Fluxer 자체 모니터링 서비스로만 전송됩니다. 제3자 제공업체는 사용되지 않습니다.';

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
  String get userSettingsNavLogOut => '로그아웃';

  @override
  String get betaWarningTitle => '베타 소프트웨어';

  @override
  String get betaWarningMessage =>
      '이것은 베타 소프트웨어입니다. 아직 모든 것이 완료되거나 추가되지 않았습니다.';

  @override
  String get betaWarningReportIssues =>
      '문제가 발견되면 Fluxer 모바일 커뮤니티에 보고해 주세요(현재 커뮤니티에 가입하려면 Plutonium이 있어야 합니다).';

  @override
  String get betaWarningRepoLink => 'GitHub에서 소스 보기';

  @override
  String get betaWarningGotIt => '알겠습니다';

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
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

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
  String get guildNavbarStaffOnlyAccessible => 'Fluxer 직원만 액세스할 수 있습니다';

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
  String get guildMenuSettingsEmoji => '커스텀 이모지';

  @override
  String get guildMenuSettingsStickers => '커스텀 스티커';

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
  String get guildMenuSettingsInviteLinks => '초대 링크';

  @override
  String get guildMenuSettingsBans => '차단';

  @override
  String get guildMenuSettingsChannels => 'Channels';

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
  String get guildSettingsRolesNewRole => 'New role';

  @override
  String get guildSettingsRolesDeleteRole => 'Delete role';

  @override
  String get guildSettingsRolesBackToRoles => 'Back to roles';

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
  String get guildSettingsWebhooksDescription => '채널에 메시지를 게시하는 웹훅을 관리하세요.';

  @override
  String get guildSettingsWebhooksEmpty => '설정된 웹훅이 없습니다.';

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
  String get guildSettingsDiscoveryDescription => '서버 검색에 등록 신청하세요.';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return '신청하려면 최소 $count명의 멤버가 필요합니다.';
  }

  @override
  String get guildSettingsDiscoveryFormTitle => '신청서';

  @override
  String get guildSettingsDiscoveryStatusTitle => '상태';

  @override
  String get guildSettingsDiscoveryCategory => '카테고리';

  @override
  String get guildSettingsDiscoveryDescriptionField => '설명';

  @override
  String get guildSettingsDiscoveryTags => '태그';

  @override
  String get guildSettingsDiscoveryTagsHint => '게임, 예술, 음악';

  @override
  String get guildSettingsDiscoveryApply => '신청서 제출';

  @override
  String get guildSettingsDiscoveryWithdraw => '철회';

  @override
  String get guildSettingsMembersDescription => '서버 멤버를 검색하고 관리하세요.';

  @override
  String get guildSettingsMembersSearchHint => '멤버 검색';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count명의 멤버';
  }

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription => '활성 초대 링크를 확인하고 취소하세요.';

  @override
  String get guildSettingsInvitesEmpty => '활성 초대가 없습니다.';

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
  String get guildSettingsEmojiUploadTitle => '이모지 업로드';

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
  String get guildSettingsWebhooksInfo => '채널 설정에서 웹훅을 생성합니다. 여기서 편집합니다.';

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
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsMembersSortNewest => '최신순';

  @override
  String get guildSettingsAuditLogFilterUser => '사용자별 필터링';

  @override
  String get guildSettingsAuditLogFilterAction => '작업별 필터링';

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
}
