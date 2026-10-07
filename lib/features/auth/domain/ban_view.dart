enum BanType {
  permanent,
  temporary;

  factory BanType.fromString(String value) => switch (value) {
    'permanent' => permanent,
    'temporary' => temporary,
    _ => temporary,
  };
}

enum BanAppealStatus {
  pending,
  accepted,
  rejected;

  factory BanAppealStatus.fromString(String value) => switch (value) {
    'pending' => pending,
    'accepted' => accepted,
    'rejected' => rejected,
    _ => pending,
  };
}

class BanViewInfo {
  final String token;
  final BanType banType;

  const BanViewInfo({required this.token, required this.banType});
}

class BanAppeal {
  final BanAppealStatus status;
  final String appealRationale;
  final String? adminRationale;

  const BanAppeal({
    required this.status,
    required this.appealRationale,
    this.adminRationale,
  });

  factory BanAppeal.fromJson(Map<String, dynamic> json) {
    return BanAppeal(
      status: BanAppealStatus.fromString(json['status'] as String),
      appealRationale: json['appeal_rationale'] as String,
      adminRationale: json['admin_rationale'] as String?,
    );
  }
}

class BanStatus {
  final BanType banType;
  final DateTime bannedAt;
  final DateTime? bannedUntil;
  final String? publicReason;
  final DateTime? appealDeadline;
  final DateTime? deletionScheduledAt;
  final BanAppeal? appeal;

  const BanStatus({
    required this.banType,
    required this.bannedAt,
    this.bannedUntil,
    this.publicReason,
    this.appealDeadline,
    this.deletionScheduledAt,
    this.appeal,
  });

  bool get isPermanent => banType == BanType.permanent;

  bool get canSubmitAppeal =>
      appeal == null &&
      (appealDeadline == null || DateTime.now().isBefore(appealDeadline!));

  bool get isAppealAccepted => appeal?.status == BanAppealStatus.accepted;

  factory BanStatus.fromJson(Map<String, dynamic> json) {
    return BanStatus(
      banType: BanType.fromString(json['ban_type'] as String),
      bannedAt: DateTime.parse(json['banned_at'] as String),
      bannedUntil: json['banned_until'] != null
          ? DateTime.parse(json['banned_until'] as String)
          : null,
      publicReason: json['public_reason'] as String?,
      appealDeadline: json['appeal_deadline'] != null
          ? DateTime.parse(json['appeal_deadline'] as String)
          : null,
      deletionScheduledAt: json['deletion_scheduled_at'] != null
          ? DateTime.parse(json['deletion_scheduled_at'] as String)
          : null,
      appeal: json['appeal'] != null
          ? BanAppeal.fromJson(json['appeal'] as Map<String, dynamic>)
          : null,
    );
  }
}
