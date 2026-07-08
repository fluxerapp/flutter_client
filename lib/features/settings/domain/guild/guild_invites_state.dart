import 'package:fluxer_app/features/settings/domain/guild/guild_invite_entry.dart';

enum GuildInvitesLoadStatus { loading, success, error }

class GuildInvitesState {
  const GuildInvitesState({
    required this.loadStatus,
    required this.invites,
    this.revokingCode,
  });

  final GuildInvitesLoadStatus loadStatus;
  final List<GuildInviteEntry> invites;
  final String? revokingCode;

  bool get hasSuccessfulEmptyLoad =>
      loadStatus == GuildInvitesLoadStatus.success && invites.isEmpty;

  GuildInvitesState copyWith({
    GuildInvitesLoadStatus? loadStatus,
    List<GuildInviteEntry>? invites,
    String? revokingCode,
    bool clearRevokingCode = false,
  }) {
    return GuildInvitesState(
      loadStatus: loadStatus ?? this.loadStatus,
      invites: invites ?? this.invites,
      revokingCode: clearRevokingCode
          ? null
          : (revokingCode ?? this.revokingCode),
    );
  }
}
