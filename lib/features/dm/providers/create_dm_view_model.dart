import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/features/dm/domain/create_dm_labels.dart';
import 'package:fluxer_app/features/dm/domain/create_dm_restriction.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/dm/presentation/modals/duplicate_group_confirm_modal.dart';
import 'package:fluxer_app/features/dm/presentation/modals/unaddable_recipients_confirm_modal.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/utils/create_dm_api_errors.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class CreateDmOptions {
  const CreateDmOptions({
    this.initialSelectedUserIds = const <String>[],
    this.maxSelections,
    this.duplicateExcludeChannelId,
  });

  final List<String> initialSelectedUserIds;
  final int? maxSelections;
  final String? duplicateExcludeChannelId;
}

class CreateDmDuplicateResult {
  const CreateDmDuplicateResult({
    required this.duplicates,
    required this.selectionSnapshot,
  });

  final List<DmConversation> duplicates;
  final List<String> selectionSnapshot;
}

class CreateDmController extends ChangeNotifier {
  CreateDmController({
    required ProviderContainer container,
    required this.options,
    required this.onCreated,
  }) : _container = container,
       selectedUserIds = List<String>.from(options.initialSelectedUserIds);

  final ProviderContainer _container;
  final CreateDmOptions options;
  final Future<void> Function(String channelId) onCreated;

  List<String> selectedUserIds;
  String searchQuery = '';
  bool isCreating = false;
  bool isDismissed = false;

  @override
  void notifyListeners() {
    if (isDismissed) {
      return;
    }
    super.notifyListeners();
  }

  int get maxSelections {
    final int? provided = options.maxSelections;
    if (provided != null) {
      return provided;
    }
    final int limit = _container.read(
      instanceLimitProvider(LimitKeys.maxGroupDmRecipients),
    );
    return getMaxGroupDmOtherRecipients(limit);
  }

  CreateDmRestriction? get restriction {
    final UserSettingsViewState settings = _container.read(
      userSettingsViewModelProvider,
    );
    return getCreateDmRestriction(settings);
  }

  String buttonLabel(FluxerLocalizations l10n) {
    return createDmButtonLabel(l10n, selectedUserIds.length);
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
    if (selectedUserIds.length >= maxSelections) {
      return;
    }
    selectedUserIds = <String>[...selectedUserIds, userId];
    notifyListeners();
  }

  void removeUnaddableUsers(Set<String> userIds) {
    selectedUserIds = selectedUserIds
        .where((String id) => !userIds.contains(id))
        .toList();
    notifyListeners();
  }

  Future<CreateDmDuplicateResult?> handleCreate(BuildContext context) async {
    if (isCreating || restriction != null) {
      return null;
    }
    final List<String> selectionSnapshot = List<String>.from(selectedUserIds);
    if (selectionSnapshot.length > 1) {
      final List<DmConversation> duplicates = await _container
          .read(dmRepositoryProvider)
          .findDuplicateGroupDms(
            selectionSnapshot,
            excludeChannelId: options.duplicateExcludeChannelId,
          );
      if (!context.mounted) {
        return null;
      }
      if (duplicates.isNotEmpty) {
        return CreateDmDuplicateResult(
          duplicates: duplicates,
          selectionSnapshot: selectionSnapshot,
        );
      }
    }
    await createChannel(context, selectionSnapshot);
    return null;
  }

  Future<void> createChannel(BuildContext context, List<String> userIds) async {
    if (isCreating || restriction != null) {
      return;
    }
    isCreating = true;
    notifyListeners();
    var didCreate = false;
    try {
      final String channelId = await _container
          .read(dmRepositoryProvider)
          .createDmFromSelection(userIds);
      if (!context.mounted) {
        return;
      }
      isDismissed = true;
      await onCreated(channelId);
      didCreate = true;
    } on Object catch (error) {
      if (!context.mounted) {
        return;
      }
      final UnaddableRecipientsError? unaddable = parseUnaddableRecipientsError(
        error,
      );
      if (unaddable != null) {
        final Set<String> unaddableIds = unaddable.unaddableRecipients
            .map((UnaddableRecipient entry) => entry.userId)
            .toSet();
        removeUnaddableUsers(unaddableIds);
        await showUnaddableRecipientsConfirmModal(
          context,
          unaddableRecipients: unaddable.unaddableRecipients,
          addableCount: unaddable.addableRecipients.length,
          onConfirm: () => createChannel(context, unaddable.addableRecipients),
        );
        return;
      }
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      _container
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.createDmFailed));
    } finally {
      isCreating = false;
      if (!didCreate) {
        notifyListeners();
      }
    }
  }

  Future<void> handleCreateWithDuplicateCheck(
    BuildContext context,
    WidgetRef widgetRef,
  ) async {
    final CreateDmDuplicateResult? duplicateResult = await handleCreate(
      context,
    );
    if (duplicateResult == null || !context.mounted) {
      return;
    }
    await showDuplicateGroupConfirmModal(
      context,
      widgetRef,
      channels: duplicateResult.duplicates,
      onConfirm: () =>
          createChannel(context, duplicateResult.selectionSnapshot),
    );
  }
}
