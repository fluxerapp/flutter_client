import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/chat_wallpaper_provider.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/locale_upper_case.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';

const double kUnreadDividerHeight = 16;
const double _kUnreadDateDividerHeight = 20;
const double kDateDividerContentHeight = _kUnreadDateDividerHeight;

class UnreadSeparatorOverlay extends StatelessWidget {
  const UnreadSeparatorOverlay({
    required this.show,
    required this.lineCenter,
    required this.child,
    super.key,
  });

  final bool show;
  final double lineCenter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      clipBehavior: Clip.none,
      children: [
        child,
        if (show)
          Positioned(
            top: math.min(
              lineCenter - kUnreadDividerHeight / 2,
              lineCenter * 2 - kUnreadDividerHeight,
            ),
            left: 0,
            right: 0,
            height: kUnreadDividerHeight,
            child: const IgnorePointer(child: UnreadSeparator()),
          ),
      ],
    );
  }
}

class UnreadSeparator extends StatelessWidget {
  const UnreadSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final Color danger = context.colors.statusDanger;
    return SizedBox(
      height: kUnreadDividerHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(child: _UnreadLine(color: danger)),
            _UnreadBadge(color: danger, height: kUnreadDividerHeight),
          ],
        ),
      ),
    );
  }
}

class UnreadDateSeparator extends StatelessWidget {
  const UnreadDateSeparator({required this.date, super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final Color danger = context.colors.statusDanger;
    final String formatted = formatUserFullDate(
      date.toLocal(),
      Localizations.localeOf(context).toString(),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SizedBox(
        height: _kUnreadDateDividerHeight,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Row(
            children: [
              Expanded(child: _UnreadLine(color: danger)),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: constraints.maxWidth / 2),
                child: _UnreadDateLabel(formatted: formatted, danger: danger),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: _UnreadLine(color: danger)),
                    _UnreadBadge(
                      color: danger,
                      height: _kUnreadDateDividerHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UnreadLine extends StatelessWidget {
  const _UnreadLine({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(height: 2, color: color.withValues(alpha: 0.4));
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.color, required this.height});

  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        localeUpperCase(
          context,
          FluxerLocalizations.of(context).chatUnreadDividerNew,
        ),
        maxLines: 1,
        style: context.textStyles.smallText.copyWith(
          color: Colors.white.withValues(alpha: 0.9),
          fontSize: 10,
          fontWeight: FontWeight.w700,
          height: 1,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _UnreadDateLabel extends ConsumerWidget {
  const _UnreadDateLabel({required this.formatted, required this.danger});

  final String formatted;
  final Color danger;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool onWallpaper = ref.watch(
      chatWallpaperProvider.select(
        (ChatWallpaperSnapshot snapshot) =>
            !snapshot.resolved.isThemeBackground,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        formatted,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyles.smallText.copyWith(
          color: danger,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          height: 1,
          letterSpacing: 0,
          shadows: onWallpaper
              ? const <Shadow>[Shadow(color: Color(0xCC000000), blurRadius: 4)]
              : null,
        ),
      ),
    );
  }
}
