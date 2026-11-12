import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const double _kVoiceJoinEmptyIconScale = 0.68;

const Color _kVoiceJoinEmptyMarkGradientStart = Color.fromRGBO(
  118,
  208,
  255,
  0.28,
);
const Color _kVoiceJoinEmptyMarkGradientEnd = Color.fromRGBO(
  130,
  116,
  255,
  0.18,
);

const double _kVoiceJoinEmptyDesktopIconScale = 0.62;
const double _kVoiceJoinEmptyDesktopMarkMin = 48;
const double _kVoiceJoinEmptyDesktopMarkMax = 68;
const Color _kVoiceJoinEmptyDesktopBackground = Color(0xFF000000);
const Color _kVoiceJoinEmptyDesktopMarkForeground = Color.fromRGBO(
  248,
  250,
  255,
  0.9,
);
const Color _kVoiceJoinEmptyDesktopTitleColor = Color.fromRGBO(
  248,
  250,
  255,
  0.92,
);

Color voiceJoinEmptyMarkForeground(BuildContext context) =>
    usesDesktopPointerUi(context)
    ? _kVoiceJoinEmptyDesktopMarkForeground
    : context.colors.textPrimary;

const Color _kVoiceJoinEmptyDesktopSubtitleColor = Color.fromRGBO(
  248,
  250,
  255,
  0.7,
);

const double _kVoiceJoinEmptyMarkMin = 58;
const double _kVoiceJoinEmptyMarkMax = 78;
const double _kVoiceJoinEmptyCompactMark = 40;

class VoiceJoinEmptyLayout {
  const VoiceJoinEmptyLayout({
    required this.containerHeight,
    this.desktop = false,
  });

  final double containerHeight;
  final bool desktop;

  bool get isCompact => containerHeight < 260;

  double get markSize {
    if (isCompact) {
      return _kVoiceJoinEmptyCompactMark;
    }
    if (desktop) {
      return (containerHeight * 0.11).clamp(
        _kVoiceJoinEmptyDesktopMarkMin,
        _kVoiceJoinEmptyDesktopMarkMax,
      );
    }
    return (containerHeight * 0.11).clamp(
      _kVoiceJoinEmptyMarkMin,
      _kVoiceJoinEmptyMarkMax,
    );
  }

  double get iconSize =>
      markSize *
      (desktop ? _kVoiceJoinEmptyDesktopIconScale : _kVoiceJoinEmptyIconScale);

  double get titleFontSize {
    if (isCompact) {
      return 16;
    }
    return (containerHeight * 0.052).clamp(18.4, 28);
  }
}

class VoiceJoinEmptyState extends StatelessWidget {
  const VoiceJoinEmptyState({required this.childBuilder, super.key});

  final List<Widget> Function(VoiceJoinEmptyLayout layout) childBuilder;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final bool desktop = usesDesktopPointerUi(context);

    return ColoredBox(
      color: desktop
          ? _kVoiceJoinEmptyDesktopBackground
          : colors.chatBackground,
      child: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final VoiceJoinEmptyLayout layout = VoiceJoinEmptyLayout(
              containerHeight: constraints.maxHeight,
              desktop: desktop,
            );
            if (desktop) {
              return _buildDesktop(layout, constraints);
            }
            final double gap = layout.isCompact ? 12 : 16;
            final double verticalPadding = layout.isCompact
                ? 12
                : (layout.containerHeight * 0.05).clamp(20.0, 32.0);

            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: verticalPadding,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 448),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: _interleaveGap(
                        childBuilder(layout),
                        gap,
                        leadingGap: layout.isCompact ? 8 : 10,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDesktop(
    VoiceJoinEmptyLayout layout,
    BoxConstraints constraints,
  ) {
    final double gap = layout.isCompact ? 12 : 16;
    final double padding = layout.isCompact
        ? 12
        : (layout.containerHeight * 0.05).clamp(20.0, 32.0);
    return SizedBox(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: _interleaveGap(childBuilder(layout), gap),
            ),
          ),
        ),
      ),
    );
  }

  static List<Widget> _interleaveGap(
    List<Widget> children,
    double gap, {
    double? leadingGap,
  }) {
    if (children.isEmpty) {
      return children;
    }
    final List<Widget> result = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      if (i > 0) {
        result.add(SizedBox(height: i == 1 ? (leadingGap ?? gap) : gap));
      }
      result.add(children[i]);
    }
    return result;
  }
}

class VoiceJoinEmptyMark extends StatelessWidget {
  const VoiceJoinEmptyMark({
    required this.layout,
    required this.child,
    super.key,
  });

  final VoiceJoinEmptyLayout layout;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = context.colors;
    final double markSize = layout.markSize;
    final double iconSize = layout.iconSize;

    if (layout.desktop) {
      return Container(
        width: markSize,
        height: markSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.32),
              offset: Offset(0, 18),
              blurRadius: 52,
            ),
          ],
        ),
        foregroundDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color.fromRGBO(255, 255, 255, 0.2)),
        ),
        child: ClipOval(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              const ColoredBox(color: Color.fromRGBO(255, 255, 255, 0.06)),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      _kVoiceJoinEmptyMarkGradientStart,
                      _kVoiceJoinEmptyMarkGradientEnd,
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(color: Color.fromRGBO(255, 255, 255, 0.18)),
                ),
              ),
              Center(
                child: SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.32),
                          offset: Offset(0, 6),
                          blurRadius: 18,
                        ),
                      ],
                    ),
                    child: child,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: SizedBox(
        width: markSize,
        height: markSize,
        child: OverflowBox(
          alignment: Alignment.topCenter,
          maxHeight: markSize + 40,
          child: SizedBox(
            width: markSize,
            height: markSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colors.borderColor),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: colors.guildBannerGradient,
                    offset: const Offset(0, 18),
                    blurRadius: 52,
                  ),
                ],
              ),
              child: ClipOval(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    ColoredBox(color: colors.backgroundModifierHover),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            _kVoiceJoinEmptyMarkGradientStart,
                            _kVoiceJoinEmptyMarkGradientEnd,
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: colors.panelControlHighlight,
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: iconSize,
                        height: iconSize,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: colors.guildBannerGradient,
                                offset: const Offset(0, 6),
                                blurRadius: 18,
                              ),
                            ],
                          ),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VoiceJoinEmptyTitle extends StatelessWidget {
  const VoiceJoinEmptyTitle({required this.title, this.layout, super.key});

  final String title;
  final VoiceJoinEmptyLayout? layout;

  @override
  Widget build(BuildContext context) {
    if (title.isEmpty) {
      return const SizedBox.shrink();
    }
    final VoiceJoinEmptyLayout resolvedLayout =
        layout ??
        VoiceJoinEmptyLayout(
          containerHeight: MediaQuery.sizeOf(context).height,
        );
    return Text(
      title,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textStyles.heading.copyWith(
        fontSize: resolvedLayout.titleFontSize,
        fontWeight: FontWeight.w700,
        height: 1.18,
        color: resolvedLayout.desktop
            ? _kVoiceJoinEmptyDesktopTitleColor
            : context.colors.textPrimary,
      ),
    );
  }
}

class VoiceJoinEmptySubtitle extends StatelessWidget {
  const VoiceJoinEmptySubtitle({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textStyles.bodyMedium.copyWith(
        color: usesDesktopPointerUi(context)
            ? _kVoiceJoinEmptyDesktopSubtitleColor
            : context.colors.textPrimaryMuted,
      ),
    );
  }
}

class VoiceJoinErrorBanner extends StatelessWidget {
  const VoiceJoinErrorBanner({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String resolved = resolveVoiceSessionErrorMessage(message, l10n);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: context.colors.statusDanger.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: context.colors.statusDanger.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PhosphorIcon(
            PhosphorIconsFill.warningCircle,
            size: 18,
            color: context.colors.statusDanger,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              resolved,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimary,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
