import 'package:fluxer_dart/export.dart';

class WebhookPendingUpdate {
  const WebhookPendingUpdate({
    required this.id,
    this.name,
    this.avatar,
    this.channelId,
    this.clearAvatar = false,
  });

  final String id;
  final String? name;
  final String? avatar;
  final String? channelId;
  final bool clearAvatar;
}

class GuildWebhookUpdates {
  final Map<String, WebhookPendingUpdate> _updates =
      <String, WebhookPendingUpdate>{};

  bool get hasUnsavedChanges => _updates.isNotEmpty;

  void reset() {
    _updates.clear();
  }

  void applyPatch(
    WebhookResponse original, {
    String? name,
    String? avatar,
    String? channelId,
    bool clearAvatar = false,
  }) {
    final WebhookPendingUpdate existing =
        _updates[original.id] ?? WebhookPendingUpdate(id: original.id);
    final WebhookPendingUpdate merged = WebhookPendingUpdate(
      id: original.id,
      name: name ?? existing.name,
      avatar: clearAvatar ? null : (avatar ?? existing.avatar),
      channelId: channelId ?? existing.channelId,
      clearAvatar: clearAvatar || existing.clearAvatar,
    );
    final bool nameChanged =
        merged.name != null && merged.name != original.name;
    final bool avatarChanged =
        merged.clearAvatar ||
        (merged.avatar != null && merged.avatar != original.avatar);
    final bool channelChanged =
        merged.channelId != null && merged.channelId != original.channelId;
    if (nameChanged || avatarChanged || channelChanged) {
      _updates[original.id] = merged;
    } else {
      _updates.remove(original.id);
    }
  }

  List<WebhookPendingUpdate> channelMoves(List<WebhookResponse> originals) {
    final Map<String, WebhookResponse> originalById = <String, WebhookResponse>{
      for (final WebhookResponse webhook in originals) webhook.id: webhook,
    };
    return _updates.values.where((WebhookPendingUpdate update) {
      final WebhookResponse? original = originalById[update.id];
      return update.channelId != null &&
          original != null &&
          update.channelId != original.channelId;
    }).toList();
  }

  List<WebhookPendingUpdate> basicUpdates(List<WebhookResponse> originals) {
    final Map<String, WebhookResponse> originalById = <String, WebhookResponse>{
      for (final WebhookResponse webhook in originals) webhook.id: webhook,
    };
    return _updates.values.where((WebhookPendingUpdate update) {
      final WebhookResponse? original = originalById[update.id];
      if (original == null) {
        return false;
      }
      final bool nameChanged =
          update.name != null && update.name != original.name;
      final bool avatarChanged =
          update.clearAvatar ||
          (update.avatar != null && update.avatar != original.avatar);
      return nameChanged || avatarChanged;
    }).toList();
  }
}
