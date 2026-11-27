import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_style.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceScreenSharePickerState extends StatelessWidget {
  const VoiceScreenSharePickerState({
    this.icon,
    this.leading,
    this.heading,
    this.body,
    this.actions = const <Widget>[],
    super.key,
  });

  final PhosphorIconData? icon;
  final Widget? leading;
  final String? heading;
  final String? body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final PhosphorIconData? stateIcon = icon;
    final String? stateHeading = heading;
    final String? stateBody = body;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(kScreenSharePickerStatePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: kScreenSharePickerStateGap,
                children: <Widget>[
                  ?leading,
                  if (stateIcon != null)
                    PhosphorIcon(
                      stateIcon,
                      size: kScreenSharePickerStateIconSize,
                      color: context.colors.textSecondary,
                    ),
                  if (stateHeading != null)
                    _Constrained(
                      child: Text(
                        stateHeading,
                        textAlign: TextAlign.center,
                        style: context.textStyles.heading.copyWith(
                          color: context.colors.textPrimary,
                          fontSize: kScreenSharePickerStateHeadingFontSize,
                          fontWeight: FontWeight.w700,
                          height: kScreenSharePickerStateHeadingLineHeight,
                        ),
                      ),
                    ),
                  if (stateBody != null)
                    _Constrained(
                      child: Text(
                        stateBody,
                        textAlign: TextAlign.center,
                        style: context.textStyles.bodyMedium.copyWith(
                          color: context.colors.textSecondary,
                          fontSize: kScreenSharePickerStateBodyFontSize,
                          height: kScreenSharePickerStateBodyLineHeight,
                        ),
                      ),
                    ),
                  if (actions.isNotEmpty)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: kScreenSharePickerStateActionsGap,
                      children: actions,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Constrained extends StatelessWidget {
  const _Constrained({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: kScreenSharePickerStateMaxWidth,
      ),
      child: child,
    );
  }
}
