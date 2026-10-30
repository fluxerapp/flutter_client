import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/presentation/widgets/role_icon.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_icon_field_update.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_sheet.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildRoleIconField extends ConsumerStatefulWidget {
  const GuildRoleIconField({
    required this.guildId,
    required this.role,
    required this.disabled,
    required this.previewDisplayName,
    required this.previewAvatarUrl,
    required this.previewUserId,
    required this.previewAvatarColor,
    required this.onChange,
    super.key,
  });

  final String guildId;
  final MemberRole role;
  final bool disabled;
  final String previewDisplayName;
  final String? previewAvatarUrl;
  final String previewUserId;
  final int? previewAvatarColor;
  final ValueChanged<GuildRoleIconFieldUpdate> onChange;

  @override
  ConsumerState<GuildRoleIconField> createState() => _GuildRoleIconFieldState();
}

class _GuildRoleIconFieldState extends ConsumerState<GuildRoleIconField> {
  String? _errorKey;
  bool _dragging = false;
  int _stageToken = 0;

  static const String _formatsLabel = 'PNG, JPEG, WebP, AVIF';

  bool get _hasIcon => widget.role.hasIcon;

  @override
  void didUpdateWidget(covariant GuildRoleIconField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.role.icon != widget.role.icon ||
        oldWidget.role.unicodeEmoji != widget.role.unicodeEmoji) {
      _errorKey = null;
    }
  }

  String _tileLabel(FluxerLocalizations l10n) {
    if (widget.role.icon != null && widget.role.icon!.isNotEmpty) {
      return l10n.guildSettingsRolesRoleIconCurrentImageAccessibility;
    }
    if (widget.role.unicodeEmoji != null &&
        widget.role.unicodeEmoji!.isNotEmpty) {
      return l10n.guildSettingsRolesRoleIconCurrentEmojiAccessibility(
        widget.role.unicodeEmoji!,
      );
    }
    return l10n.guildSettingsRolesRoleIconUploadAccessibility;
  }

  void _stageImage(String dataUri) {
    _stageToken++;
    setState(() => _errorKey = null);
    widget.onChange(GuildRoleIconFieldUpdate.image(dataUri));
  }

  Future<void> _handleBytes(Uint8List bytes, String name) async {
    _stageToken++;
    setState(() => _errorKey = null);
    if (!ImageUtils.isRoleIconExtensionAllowed(name)) {
      setState(() => _errorKey = 'unsupported');
      return;
    }
    if (ImageUtils.checkAnimated(bytes).isAnimated) {
      setState(() => _errorKey = 'animated');
      return;
    }
    if (!mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Uint8List? cropped = await showImageCropSheet(
      context,
      imageBytes: bytes,
      aspectRatio: 1,
      title: l10n.roleIconCropTitle,
      hintText: l10n.roleIconCropDescription(64, 64),
      saveLabel: l10n.roleIconCropSave,
      skipLabel: l10n.roleIconCropSkip,
      showSkip: !ImageUtils.isOverRoleIconSizeLimit(bytes),
    );
    if (cropped == null || !mounted) {
      return;
    }
    final int token = ++_stageToken;
    try {
      final Uint8List prepared = await ImageUtils.prepareRoleIconUploadBytes(
        cropped,
      );
      if (token == _stageToken && mounted) {
        _stageImage(ImageUtils.toDataUri(prepared));
      }
    } on Object {
      if (token == _stageToken && mounted) {
        setState(() => _errorKey = 'load');
      }
    }
  }

  Future<void> _pickImage() async {
    if (widget.disabled) {
      return;
    }
    final ({Uint8List bytes, String name})? picked =
        await ImageUtils.pickImage();
    if (picked == null || !mounted) {
      return;
    }
    await _handleBytes(picked.bytes, picked.name);
  }

  Future<void> _handleEmoji(FluxerSelectedEmoji emoji) async {
    if (widget.disabled) {
      return;
    }
    final int token = ++_stageToken;
    setState(() => _errorKey = null);
    if (!emoji.isCustom) {
      widget.onChange(GuildRoleIconFieldUpdate.unicodeEmoji(emoji.surrogates));
      return;
    }
    try {
      final String url = FluxerMediaUrl.customEmoji(
        id: emoji.emojiId!,
        size: 128,
      );
      final Response<List<int>> response = await ref
          .read(fluxerDioProvider)
          .get<List<int>>(
            url,
            options: Options(responseType: ResponseType.bytes),
          );
      final Uint8List bytes = Uint8List.fromList(response.data ?? <int>[]);
      final Uint8List squared = await ImageUtils.squareCustomEmojiForRoleIcon(
        bytes,
      );
      if (token == _stageToken && mounted) {
        _stageImage(ImageUtils.toDataUri(squared));
      }
    } on Object {
      if (token == _stageToken && mounted) {
        setState(() => _errorKey = 'load');
      }
    }
  }

  Future<void> _openEmojiPicker() async {
    if (widget.disabled) {
      return;
    }
    await FluxerEmojiPickerSheet.show(
      context,
      visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
      roleIconGuildId: widget.guildId,
      onEmojiSelected: _handleEmoji,
    );
  }

  String? _errorText(FluxerLocalizations l10n) {
    return switch (_errorKey) {
      'animated' => l10n.guildSettingsRolesRoleIconAnimatedError,
      'unsupported' => l10n.guildSettingsRolesRoleIconUnsupportedTypeError(
        _formatsLabel,
      ),
      'load' => l10n.guildSettingsRolesRoleIconLoadError,
      _ => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final String? errorText = _errorText(l10n);
    final String uploadHint = l10n.guildSettingsRolesRoleIconUploadHint(
      _formatsLabel,
      '32×32px',
      formatAttachmentByteSize(kRoleIconMaxBytes) ?? '256 KB',
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.guildSettingsRolesRoleIcon,
          style: context.textStyles.label.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Text(
          l10n.guildSettingsRolesRoleIconHelper,
          style: context.textStyles.bodySmall.copyWith(
            color: colors.textPrimaryMuted,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTile(context, l10n),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      FluxerButton.secondary(
                        onPressed: widget.disabled ? null : _pickImage,
                        label: l10n.guildSettingsRolesRoleIconUploadImage,
                        size: FluxerButtonSize.small,
                      ),
                      FluxerButton.secondary(
                        onPressed: widget.disabled ? null : _openEmojiPicker,
                        label: l10n.guildSettingsRolesRoleIconChooseEmoji,
                        size: FluxerButtonSize.small,
                      ),
                      if (_hasIcon)
                        FluxerButton.secondary(
                          onPressed: widget.disabled
                              ? null
                              : () {
                                  _stageToken++;
                                  setState(() => _errorKey = null);
                                  widget.onChange(
                                    const GuildRoleIconFieldUpdate.clear(),
                                  );
                                },
                          label: l10n.guildSettingsRolesRoleIconRemove,
                          size: FluxerButtonSize.small,
                        ),
                    ],
                  ),
                  if (errorText != null) ...<Widget>[
                    const SizedBox(height: 8),
                    Text(
                      errorText,
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.statusDanger,
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Text(
                    uploadHint,
                    style: context.textStyles.bodySmall.copyWith(
                      color: colors.textPrimaryMuted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _RoleIconUsagePreview(
          role: widget.role,
          displayName: widget.previewDisplayName,
          avatarUrl: widget.previewAvatarUrl,
          userId: widget.previewUserId,
          avatarColor: widget.previewAvatarColor,
        ),
      ],
    );
  }

  Widget _buildTile(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    Widget tile = Material(
      color: colors.backgroundSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: _dragging
              ? colors.borderColorHover
              : _hasIcon
              ? colors.backgroundHeaderSecondary
              : colors.backgroundModifierAccent,
        ),
      ),
      child: InkWell(
        onTap: widget.disabled ? null : _pickImage,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 64,
          height: 64,
          child: Center(
            child: _hasIcon
                ? RoleIcon(role: widget.role, size: 40, decorative: true)
                : PhosphorIcon(
                    PhosphorIconsFill.image,
                    size: 24,
                    color: colors.textPrimaryMuted,
                  ),
          ),
        ),
      ),
    );
    tile = Semantics(
      button: true,
      label: _tileLabel(l10n),
      enabled: !widget.disabled,
      child: tile,
    );
    if (!isMobileLayout(context) && !widget.disabled) {
      tile = DropTarget(
        onDragEntered: (_) => setState(() => _dragging = true),
        onDragExited: (_) => setState(() => _dragging = false),
        onDragDone: (DropDoneDetails details) async {
          setState(() => _dragging = false);
          if (details.files.isEmpty) {
            return;
          }
          final DropItem file = details.files.first;
          await _handleBytes(await file.readAsBytes(), file.name);
        },
        child: tile,
      );
    }
    return Opacity(opacity: widget.disabled ? 0.5 : 1, child: tile);
  }
}

class _RoleIconPreviewThemes {
  _RoleIconPreviewThemes._();

  static final FluxerLayoutTheme _layout = FluxerLayoutTheme.scaled();
  static final FluxerColorTheme _darkColors = buildDarkColorTheme();
  static final FluxerColorTheme _lightColors = buildLightColorTheme();
  static final ThemeData dark = buildFluxerTheme(
    colorTheme: _darkColors,
    textTheme: FluxerTextTheme.fromColors(_darkColors),
    layoutTheme: _layout,
  );
  static final ThemeData light = buildFluxerTheme(
    colorTheme: _lightColors,
    textTheme: FluxerTextTheme.fromColors(_lightColors),
    layoutTheme: _layout,
    brightness: Brightness.light,
  );
}

class _RoleIconUsagePreview extends StatelessWidget {
  const _RoleIconUsagePreview({
    required this.role,
    required this.displayName,
    required this.avatarUrl,
    required this.userId,
    required this.avatarColor,
  });

  final MemberRole role;
  final String displayName;
  final String? avatarUrl;
  final String userId;
  final int? avatarColor;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: _PreviewSurface(
            dark: true,
            child: _PreviewMessage(
              displayName: displayName,
              role: role,
              body: l10n.guildSettingsRolesRoleIconUsagePreviewMessage,
              avatarUrl: avatarUrl,
              userId: userId,
              avatarColor: avatarColor,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _PreviewSurface(
            dark: false,
            child: _PreviewMessage(
              displayName: displayName,
              role: role,
              body: l10n.guildSettingsRolesRoleIconUsagePreviewMessage,
              avatarUrl: avatarUrl,
              userId: userId,
              avatarColor: avatarColor,
            ),
          ),
        ),
      ],
    );
  }
}

class _PreviewSurface extends StatelessWidget {
  const _PreviewSurface({required this.dark, required this.child});

  final bool dark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = dark
        ? _RoleIconPreviewThemes.dark
        : _RoleIconPreviewThemes.light;
    return Theme(
      data: theme,
      child: Builder(
        builder: (BuildContext context) {
          final colors = context.colors;
          return DecoratedBox(
            decoration: BoxDecoration(
              color: colors.backgroundPrimary,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: colors.borderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ExcludeSemantics(child: child),
            ),
          );
        },
      ),
    );
  }
}

class _PreviewMessage extends StatelessWidget {
  const _PreviewMessage({
    required this.displayName,
    required this.role,
    required this.body,
    required this.avatarUrl,
    required this.userId,
    required this.avatarColor,
  });

  final String displayName;
  final MemberRole role;
  final String body;
  final String? avatarUrl;
  final String userId;
  final int? avatarColor;

  Color _displayNameColor(BuildContext context) {
    if (role.color != 0) {
      return Color(guildRoleColorInt(role.color));
    }
    return context.colors.textChat;
  }

  @override
  Widget build(BuildContext context) {
    final Color nameColor = _displayNameColor(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FluxerAvatar.user(
          fallbackText: displayName,
          userId: userId,
          imageUrl: avatarUrl,
          avatarColor: avatarColor,
          showStatus: false,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      displayName,
                      style: context.textStyles.username.copyWith(
                        color: nameColor,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (role.hasIcon) ...<Widget>[
                    const SizedBox(width: 4),
                    RoleIcon(role: role, size: 20, decorative: true),
                  ],
                ],
              ),
              const SizedBox(height: 2),
              Text(body, style: context.textStyles.messageText),
            ],
          ),
        ),
      ],
    );
  }
}
