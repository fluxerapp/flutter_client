import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/utils/create_dm_api_errors.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:material_ui/material_ui.dart';

class AddFriendsToGroupController extends ChangeNotifier {
  AddFriendsToGroupController({
    required this._container,
    required this.channelId,
    required this.dm,
  }) : selectedUserIds = <String>[];

  final ProviderContainer _container;
  final String channelId;
  final DmConversation dm;

  List<String> selectedUserIds;
  String searchQuery = '';
  String? inviteLink;
  bool isAdding = false;
  bool isGeneratingInvite = false;
  bool isDismissed = false;

  String? _cachedInviteCode;
  DateTime? _cachedInviteExpiresAt;

  @override
  void notifyListeners() {
    if (isDismissed) {
      return;
    }
    super.notifyListeners();
  }

  List<String> get currentMemberIds => dm.remoteRecipientIds;

  int get remainingSlotsCount {
    final int maxRecipients = _container.read(
      instanceLimitProvider(LimitKeys.maxGroupDmRecipients),
    );
    return getGroupDmRemainingSlots(
      memberCount: dm.recipientCount,
      maxGroupDmRecipients: maxRecipients,
    );
  }

  void setSearchQuery(String value) {
    if (searchQuery == value) {
      return;
    }
    searchQuery = value;
    notifyListeners();
  }

  void toggleUser(String userId) {
    if (selectedUserIds.contains(userId)) {
      selectedUserIds = selectedUserIds
          .where((String id) => id != userId)
          .toList();
      notifyListeners();
      return;
    }
    if (selectedUserIds.length >= remainingSlotsCount) {
      return;
    }
    selectedUserIds = <String>[...selectedUserIds, userId];
    notifyListeners();
  }

  Future<void> handleAddFriends(BuildContext context) async {
    if (isAdding || selectedUserIds.isEmpty) {
      return;
    }
    isAdding = true;
    notifyListeners();
    final List<String> snapshot = List<String>.from(selectedUserIds);
    try {
      for (final String userId in snapshot) {
        try {
          await _container
              .read(dmRepositoryProvider)
              .addGroupDmMember(channelId: channelId, userId: userId);
        } on Object catch (error) {
          if (!context.mounted) {
            return;
          }
          _showAddError(context, error);
        }
      }
      selectedUserIds = <String>[];
    } finally {
      isAdding = false;
      notifyListeners();
    }
  }

  Future<bool> handleGenerateOrCopyInvite(BuildContext context) async {
    if (inviteLink != null && inviteLink!.isNotEmpty) {
      return _copyInviteLink(context);
    }
    final String? link = await handleGenerateInvite();
    if (link == null) {
      return false;
    }
    if (!context.mounted) {
      return false;
    }
    return _copyInviteLink(context);
  }

  Future<String?> handleGenerateInvite() async {
    if (isGeneratingInvite) {
      return inviteLink;
    }
    final DateTime now = DateTime.now();
    if (_cachedInviteCode != null &&
        _cachedInviteExpiresAt != null &&
        _cachedInviteExpiresAt!.isAfter(now)) {
      final String base = _container.read(instanceInviteBaseUrlProvider);
      final String link = _buildInviteUrl(base, _cachedInviteCode!);
      inviteLink = link;
      notifyListeners();
      return link;
    }
    isGeneratingInvite = true;
    notifyListeners();
    try {
      final String code = await _container
          .read(dmRepositoryProvider)
          .createGroupDmInvite(channelId: channelId);
      _cachedInviteCode = code;
      _cachedInviteExpiresAt = now.add(const Duration(hours: 24));
      final String base = _container.read(instanceInviteBaseUrlProvider);
      final String link = _buildInviteUrl(base, code);
      inviteLink = link;
      notifyListeners();
      return link;
    } on Object {
      return null;
    } finally {
      isGeneratingInvite = false;
      notifyListeners();
    }
  }

  Future<bool> _copyInviteLink(BuildContext context) async {
    final String? link = inviteLink;
    if (link == null || link.isEmpty) {
      return false;
    }
    try {
      await copyToClipboard(context: context, value: link);
      return true;
    } on Object {
      if (context.mounted) {
        final FluxerLocalizations l10n = FluxerLocalizations.of(context);
        _container
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.groupDmCopyInviteFailed,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
      return false;
    }
  }

  String _buildInviteUrl(String base, String code) {
    final String trimmedBase = base.replaceAll(RegExp(r'/+$'), '');
    return '$trimmedBase/$code';
  }

  void _showAddError(BuildContext context, Object error) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UnaddableRecipientsError? unaddable = parseUnaddableRecipientsError(
      error,
    );
    if (unaddable != null) {
      return;
    }
    String message = l10n.groupDmAddFriendFailed;
    if (error is DioException) {
      final String? code = _readErrorCode(error);
      if (code == 'GROUP_DM_FULL') {
        message = l10n.groupDmGroupFull;
      } else if (code == 'RATE_LIMITED') {
        message = l10n.groupDmRateLimited;
      }
    }
    _container
        .read(toastProvider.notifier)
        .show(
          FluxerToast(message: message, variant: FluxerToastVariant.danger),
        );
  }

  String? _readErrorCode(DioException error) {
    final Object? data = error.response?.data;
    if (data is Map<String, dynamic>) {
      return data['code']?.toString();
    }
    return null;
  }
}
