import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

class RoleIcon extends StatefulWidget {
  const RoleIcon({
    required this.role,
    required this.size,
    this.decorative = false,
    super.key,
  });

  final MemberRole role;
  final double size;
  final bool decorative;

  @override
  State<RoleIcon> createState() => _RoleIconState();
}

class _RoleIconState extends State<RoleIcon> {
  bool _imageFailed = false;

  @override
  void didUpdateWidget(covariant RoleIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.role.icon != widget.role.icon ||
        oldWidget.role.unicodeEmoji != widget.role.unicodeEmoji) {
      _imageFailed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.role.hasIcon || _imageFailed) {
      return const SizedBox.shrink();
    }
    final double imageSize = _imageInnerSize(widget.role, widget.size);
    final Widget content = SizedBox(
      width: widget.size,
      height: widget.size,
      child: Center(child: _buildImage(context, imageSize)),
    );
    if (widget.decorative) {
      return ExcludeSemantics(child: content);
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerTooltip(
      message: widget.role.name,
      child: Semantics(
        label: l10n.roleIconAccessibilityLabel(widget.role.name),
        image: true,
        child: content,
      ),
    );
  }

  double _imageInnerSize(MemberRole role, double boxSize) {
    if (role.icon != null && role.icon!.isNotEmpty) {
      return boxSize;
    }
    return boxSize - 2;
  }

  Widget _buildImage(BuildContext context, double imageSize) {
    final String? icon = widget.role.icon;
    if (icon != null && icon.isNotEmpty) {
      final String? url = FluxerMediaUrl.roleIcon(
        roleId: widget.role.id,
        hash: icon,
        cssSize: widget.size,
        devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
      );
      if (url == null) {
        return const SizedBox.shrink();
      }
      return Image.network(
        url,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
        gaplessPlayback: true,
        errorBuilder: (BuildContext _, Object _, StackTrace? _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() => _imageFailed = true);
            }
          });
          return SizedBox(width: imageSize, height: imageSize);
        },
      );
    }
    final String? emoji = widget.role.unicodeEmoji;
    if (emoji != null && emoji.isNotEmpty) {
      return UnicodeEmojiWidget(emoji: emoji, size: imageSize);
    }
    return const SizedBox.shrink();
  }
}
