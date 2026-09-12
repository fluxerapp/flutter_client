import 'dart:convert';
import 'dart:io' show File;

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/material_ui.dart';

enum ChatWallpaperKind {
  defaultTheme,
  custom,
  color,
  gradient,
  preset,
  starfield,
}

@immutable
class ChatWallpaperState {
  const ChatWallpaperState({
    this.kind = ChatWallpaperKind.defaultTheme,
    this.id,
    this.dim = defaultDim,
  });

  static const double defaultDim = 0.2;

  final ChatWallpaperKind kind;
  final String? id;
  final double dim;

  bool get isThemeBackground => kind == ChatWallpaperKind.defaultTheme;

  ChatWallpaperState copyWith({
    ChatWallpaperKind? kind,
    String? id,
    bool clearId = false,
    double? dim,
  }) {
    return ChatWallpaperState(
      kind: kind ?? this.kind,
      id: clearId ? null : (id ?? this.id),
      dim: dim ?? this.dim,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatWallpaperState &&
        other.kind == kind &&
        other.id == id &&
        other.dim == dim;
  }

  @override
  int get hashCode => Object.hash(kind, id, dim);
}

class ChatWallpaperColorPreset {
  const ChatWallpaperColorPreset({required this.id, required this.color});

  final String id;
  final Color color;
}

class ChatWallpaperGradientPreset {
  const ChatWallpaperGradientPreset({
    required this.id,
    required this.colors,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
  });

  final String id;
  final List<Color> colors;
  final Alignment begin;
  final Alignment end;
}

class ChatWallpaperImagePreset {
  const ChatWallpaperImagePreset({required this.id, required this.assetPath});

  final String id;
  final String assetPath;
}

// Named catalog for wallpaper fills. Instance state is not needed.
// ignore: avoid_classes_with_only_static_members
abstract final class ChatWallpaperCatalog {
  static const List<ChatWallpaperColorPreset> colors =
      <ChatWallpaperColorPreset>[
        ChatWallpaperColorPreset(id: 'slate', color: Color(0xFF2B303B)),
        ChatWallpaperColorPreset(id: 'navy', color: Color(0xFF1B2A4A)),
        ChatWallpaperColorPreset(id: 'forest', color: Color(0xFF1A3A32)),
        ChatWallpaperColorPreset(id: 'burgundy', color: Color(0xFF3A1D28)),
        ChatWallpaperColorPreset(id: 'plum', color: Color(0xFF2E1F3D)),
        ChatWallpaperColorPreset(id: 'teal', color: Color(0xFF163A40)),
        ChatWallpaperColorPreset(id: 'charcoal', color: Color(0xFF1A1C20)),
        ChatWallpaperColorPreset(id: 'indigo', color: Color(0xFF222448)),
      ];

  static const List<ChatWallpaperGradientPreset> gradients =
      <ChatWallpaperGradientPreset>[
        ChatWallpaperGradientPreset(
          id: 'dusk',
          colors: <Color>[Color(0xFF1A1333), Color(0xFF3D1F4A)],
        ),
        ChatWallpaperGradientPreset(
          id: 'ocean',
          colors: <Color>[Color(0xFF0B1F33), Color(0xFF164E63)],
        ),
        ChatWallpaperGradientPreset(
          id: 'ember',
          colors: <Color>[Color(0xFF2A1210), Color(0xFF7A2E12)],
        ),
        ChatWallpaperGradientPreset(
          id: 'aurora',
          colors: <Color>[Color(0xFF0F2A28), Color(0xFF1A4D6E)],
        ),
        ChatWallpaperGradientPreset(
          id: 'midnight',
          colors: <Color>[Color(0xFF0A0B14), Color(0xFF1E293B)],
        ),
        ChatWallpaperGradientPreset(
          id: 'grape',
          colors: <Color>[Color(0xFF1C1033), Color(0xFF4C1D95)],
        ),
      ];

  static const List<ChatWallpaperImagePreset> bundledImages =
      <ChatWallpaperImagePreset>[];

  static ChatWallpaperColorPreset? colorById(String? id) =>
      _byId(colors, id, (ChatWallpaperColorPreset preset) => preset.id);

  static ChatWallpaperGradientPreset? gradientById(String? id) =>
      _byId(gradients, id, (ChatWallpaperGradientPreset preset) => preset.id);

  static ChatWallpaperImagePreset? bundledImageById(String? id) =>
      _byId(bundledImages, id, (ChatWallpaperImagePreset preset) => preset.id);

  static T? _byId<T>(List<T> items, String? id, String Function(T item) idOf) {
    if (id == null) {
      return null;
    }
    return items.where((T item) => idOf(item) == id).firstOrNull;
  }
}

@immutable
class ChatWallpaperSnapshot {
  const ChatWallpaperSnapshot({
    this.selection = const ChatWallpaperState(),
    this.customImagePath,
    this.customImageBytes,
    this.isProcessingCustom = false,
  });

  final ChatWallpaperState selection;
  final String? customImagePath;
  final Uint8List? customImageBytes;
  final bool isProcessingCustom;

  bool get hasCustomImage {
    final Uint8List? bytes = customImageBytes;
    if (bytes != null && bytes.isNotEmpty) {
      return true;
    }
    final String? path = customImagePath;
    return path != null && path.isNotEmpty;
  }

  ChatWallpaperState get resolved {
    final ChatWallpaperState selected = selection;
    final bool valid = switch (selected.kind) {
      ChatWallpaperKind.defaultTheme => true,
      ChatWallpaperKind.custom => hasCustomImage,
      ChatWallpaperKind.color =>
        ChatWallpaperCatalog.colorById(selected.id) != null,
      ChatWallpaperKind.gradient =>
        ChatWallpaperCatalog.gradientById(selected.id) != null,
      ChatWallpaperKind.preset =>
        ChatWallpaperCatalog.bundledImageById(selected.id) != null,
      ChatWallpaperKind.starfield => true,
    };
    return valid ? selected : ChatWallpaperState(dim: selected.dim);
  }

  ChatWallpaperSnapshot copyWith({
    ChatWallpaperState? selection,
    String? customImagePath,
    Uint8List? customImageBytes,
    bool? isProcessingCustom,
    bool clearCustomImagePath = false,
  }) {
    return ChatWallpaperSnapshot(
      selection: selection ?? this.selection,
      customImagePath: clearCustomImagePath
          ? null
          : (customImagePath ?? this.customImagePath),
      customImageBytes: customImageBytes ?? this.customImageBytes,
      isProcessingCustom: isProcessingCustom ?? this.isProcessingCustom,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatWallpaperSnapshot &&
        other.selection == selection &&
        other.customImagePath == customImagePath &&
        other.isProcessingCustom == isProcessingCustom &&
        identical(other.customImageBytes, customImageBytes);
  }

  @override
  int get hashCode => Object.hash(
    selection,
    customImagePath,
    isProcessingCustom,
    identityHashCode(customImageBytes),
  );
}

double clampChatWallpaperDim(Object? value) {
  if (value is! num) {
    return ChatWallpaperState.defaultDim;
  }
  return value.toDouble().clamp(0.0, 1.0);
}

ChatWallpaperKind? chatWallpaperKindFromJson(String? name) {
  switch (name) {
    case 'default':
      return ChatWallpaperKind.defaultTheme;
    case 'custom':
      return ChatWallpaperKind.custom;
    case 'color':
      return ChatWallpaperKind.color;
    case 'gradient':
      return ChatWallpaperKind.gradient;
    case 'preset':
      return ChatWallpaperKind.preset;
    case 'starfield':
      return ChatWallpaperKind.starfield;
    default:
      return null;
  }
}

String chatWallpaperKindToJson(ChatWallpaperKind kind) {
  switch (kind) {
    case ChatWallpaperKind.defaultTheme:
      return 'default';
    case ChatWallpaperKind.custom:
      return 'custom';
    case ChatWallpaperKind.color:
      return 'color';
    case ChatWallpaperKind.gradient:
      return 'gradient';
    case ChatWallpaperKind.preset:
      return 'preset';
    case ChatWallpaperKind.starfield:
      return 'starfield';
  }
}

ChatWallpaperState chatWallpaperFromJson(String? raw) {
  if (raw == null || raw.trim().isEmpty) {
    return const ChatWallpaperState();
  }
  try {
    final Object? decoded = jsonDecode(raw);
    if (decoded is! Map) {
      return const ChatWallpaperState();
    }
    final Map<Object?, Object?> map = decoded;
    final Object? kindValue = map['kind'];
    final ChatWallpaperKind? kind = kindValue is String
        ? chatWallpaperKindFromJson(kindValue)
        : null;
    if (kind == null) {
      return ChatWallpaperState(dim: clampChatWallpaperDim(map['dim']));
    }
    final Object? idValue = map['id'];
    final String? id = idValue is String && idValue.isNotEmpty ? idValue : null;
    return ChatWallpaperState(
      kind: kind,
      id: id,
      dim: clampChatWallpaperDim(map['dim']),
    );
  } on Object {
    return const ChatWallpaperState();
  }
}

String chatWallpaperToJson(ChatWallpaperState state) {
  return jsonEncode(<String, Object?>{
    'kind': chatWallpaperKindToJson(state.kind),
    if (state.id case final String id when id.isNotEmpty) 'id': id,
    'dim': state.dim,
  });
}

Color chatWallpaperDimColor(double dim) {
  return Colors.black.withValues(alpha: dim);
}

Color chatWallpaperComposerFadeColor({
  required ChatWallpaperPaint paint,
  required ChatWallpaperState resolved,
  required Color themeBackground,
}) {
  if (resolved.isThemeBackground) {
    return themeBackground;
  }
  final LinearGradient? gradient = paint.gradient;
  final Color base = gradient != null && gradient.colors.isNotEmpty
      ? gradient.colors.last
      : paint.fallbackColor;
  return Color.lerp(base, const Color(0xFF000000), resolved.dim)!;
}

class ChatWallpaperPaint {
  const ChatWallpaperPaint({
    required this.fallbackColor,
    this.gradient,
    this.imageProvider,
  });

  final Color fallbackColor;
  final LinearGradient? gradient;
  final ImageProvider? imageProvider;
}

ChatWallpaperPaint resolveChatWallpaperPaint({
  required ChatWallpaperSnapshot snapshot,
  required Color themeBackground,
}) {
  final ChatWallpaperState resolved = snapshot.resolved;
  switch (resolved.kind) {
    case ChatWallpaperKind.defaultTheme:
      return ChatWallpaperPaint(fallbackColor: themeBackground);
    case ChatWallpaperKind.custom:
      return ChatWallpaperPaint(
        fallbackColor: themeBackground,
        imageProvider: chatWallpaperCustomImageProvider(snapshot),
      );
    case ChatWallpaperKind.color:
      final ChatWallpaperColorPreset? preset = ChatWallpaperCatalog.colorById(
        resolved.id,
      );
      return ChatWallpaperPaint(
        fallbackColor: preset?.color ?? themeBackground,
      );
    case ChatWallpaperKind.gradient:
      final ChatWallpaperGradientPreset? preset =
          ChatWallpaperCatalog.gradientById(resolved.id);
      if (preset == null) {
        return ChatWallpaperPaint(fallbackColor: themeBackground);
      }
      return ChatWallpaperPaint(
        fallbackColor: preset.colors.first,
        gradient: LinearGradient(
          begin: preset.begin,
          end: preset.end,
          colors: preset.colors,
        ),
      );
    case ChatWallpaperKind.preset:
      final ChatWallpaperImagePreset? preset =
          ChatWallpaperCatalog.bundledImageById(resolved.id);
      if (preset == null) {
        return ChatWallpaperPaint(fallbackColor: themeBackground);
      }
      return ChatWallpaperPaint(
        fallbackColor: themeBackground,
        imageProvider: AssetImage(preset.assetPath),
      );
    case ChatWallpaperKind.starfield:
      return const ChatWallpaperPaint(fallbackColor: Color(0xFF0D0A1C));
  }
}

ImageProvider? chatWallpaperCustomImageProvider(
  ChatWallpaperSnapshot snapshot,
) {
  final Uint8List? bytes = snapshot.customImageBytes;
  if (bytes != null && bytes.isNotEmpty) {
    return MemoryImage(bytes);
  }
  if (kIsWeb) {
    return null;
  }
  final String? path = snapshot.customImagePath;
  if (path == null || path.isEmpty) {
    return null;
  }
  return FileImage(File(path));
}
