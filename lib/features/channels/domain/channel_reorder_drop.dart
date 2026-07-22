import 'package:fluxer_app/features/channels/domain/channel.dart';

const String kNullSpaceTargetId = 'null-space';
const String kTrailingSpaceTargetId = 'trailing-space';

enum ChannelReorderDragKind { channel, category }

enum ChannelReorderDropPosition { before, after, inside }

class ChannelReorderDragItem {
  const ChannelReorderDragItem({
    required this.id,
    required this.kind,
    required this.channelType,
    required this.parentId,
    required this.guildId,
  });

  final String id;
  final ChannelReorderDragKind kind;
  final int channelType;
  final String? parentId;
  final String guildId;

  factory ChannelReorderDragItem.fromChannel(Channel channel) {
    return ChannelReorderDragItem(
      id: channel.id,
      kind: channel.isCategory
          ? ChannelReorderDragKind.category
          : ChannelReorderDragKind.channel,
      channelType: channel.type.wireValue,
      parentId: channel.parentId,
      guildId: channel.guildId,
    );
  }
}

class ChannelReorderDropResult {
  const ChannelReorderDropResult({
    required this.targetId,
    required this.position,
    this.targetParentId,
  });

  final String targetId;
  final ChannelReorderDropPosition position;
  final String? targetParentId;
}

class ChannelReorderTarget {
  const ChannelReorderTarget({
    required this.id,
    required this.channelType,
    required this.parentId,
    required this.guildId,
  });

  final String id;
  final int channelType;
  final String? parentId;
  final String guildId;

  factory ChannelReorderTarget.fromChannel(Channel channel) {
    return ChannelReorderTarget(
      id: channel.id,
      channelType: channel.type.wireValue,
      parentId: channel.parentId,
      guildId: channel.guildId,
    );
  }
}

enum ChannelReorderIndicatorPosition { top, bottom }

class ChannelReorderIndicator {
  const ChannelReorderIndicator({
    required this.position,
    required this.isValid,
  });

  final ChannelReorderIndicatorPosition position;
  final bool isValid;
}

class ChannelReorderIntent {
  const ChannelReorderIntent({required this.indicator, required this.result});

  final ChannelReorderIndicator indicator;
  final ChannelReorderDropResult result;
}

bool _isCategoryType(int channelType) {
  return channelType == ChannelType.guildCategory.wireValue;
}

bool _isVoiceType(int channelType) {
  return channelType == ChannelType.guildVoice.wireValue;
}

bool _isTextType(int channelType) {
  return channelType == ChannelType.guildText.wireValue ||
      channelType == ChannelType.guildLink.wireValue;
}

const double kDropZoneBeforeRatio = 0.35;
const double kDropZoneAfterRatio = 0.65;

ChannelReorderIndicatorPosition _resolveDropZonePosition({
  required double localY,
  required double height,
  required ChannelReorderIndicatorPosition? lastPosition,
}) {
  final double offsetY = localY.clamp(0, height);
  final double beforeThreshold = height * kDropZoneBeforeRatio;
  final double afterThreshold = height * kDropZoneAfterRatio;

  if (offsetY < beforeThreshold) {
    return ChannelReorderIndicatorPosition.top;
  }
  if (offsetY > afterThreshold) {
    return ChannelReorderIndicatorPosition.bottom;
  }

  if (lastPosition != null) {
    return lastPosition;
  }

  return offsetY < height / 2
      ? ChannelReorderIndicatorPosition.top
      : ChannelReorderIndicatorPosition.bottom;
}

ChannelReorderIndicator _createIndicator({
  required double localY,
  required double height,
  required bool isValid,
  required ChannelReorderIndicatorPosition? lastPosition,
}) {
  return ChannelReorderIndicator(
    position: _resolveDropZonePosition(
      localY: localY,
      height: height,
      lastPosition: lastPosition,
    ),
    isValid: isValid,
  );
}

bool canChannelDropOnTarget({
  required ChannelReorderDragItem item,
  required ChannelReorderTarget target,
}) {
  if (item.id == target.id) {
    return false;
  }
  if (item.kind == ChannelReorderDragKind.category) {
    return _isCategoryType(target.channelType);
  }
  if (item.kind == ChannelReorderDragKind.channel) {
    if (item.channelType == ChannelType.guildVoice.wireValue) {
      final bool targetIsCategory = _isCategoryType(target.channelType);
      final bool targetIsVoice = _isVoiceType(target.channelType);
      final bool targetIsText = _isTextType(target.channelType);
      if (!targetIsCategory && !targetIsVoice && !targetIsText) {
        return false;
      }
    } else if (_isVoiceType(target.channelType)) {
      return false;
    }
  }
  return true;
}

ChannelReorderIntent? resolveChannelReorderHover({
  required ChannelReorderDragItem item,
  required ChannelReorderTarget target,
  required double localY,
  required double height,
  ChannelReorderIndicatorPosition? lastPosition,
}) {
  if (height <= 0) {
    return null;
  }
  final bool isValid = canChannelDropOnTarget(item: item, target: target);
  final ChannelReorderIndicator indicator = _createIndicator(
    localY: localY,
    height: height,
    isValid: isValid,
    lastPosition: lastPosition,
  );
  if (!isValid) {
    return null;
  }
  final bool before = indicator.position == ChannelReorderIndicatorPosition.top;
  final bool targetIsCategory = _isCategoryType(target.channelType);
  final ChannelReorderDropResult result;
  if (targetIsCategory && item.kind != ChannelReorderDragKind.category) {
    result = ChannelReorderDropResult(
      targetId: target.id,
      position: before
          ? ChannelReorderDropPosition.before
          : ChannelReorderDropPosition.inside,
      targetParentId: before ? target.parentId : target.id,
    );
  } else {
    result = ChannelReorderDropResult(
      targetId: target.id,
      position: before
          ? ChannelReorderDropPosition.before
          : ChannelReorderDropPosition.after,
      targetParentId: target.parentId,
    );
  }
  return ChannelReorderIntent(indicator: indicator, result: result);
}
