import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserAppearance extends ConsumerWidget {
  final bool isCompact;
  final VoidCallback onToggleCompact;

  const UserAppearance({
    required this.isCompact,
    required this.onToggleCompact,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePref = ref.watch(themePreferenceProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        40,
        40,
        40,
        kSettingsScrollBottomPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Appearance', style: context.textStyles.heading),
          const SizedBox(height: 32),
          Text(
            'THEME',
            style: TextStyle(
              color: context.colors.textPrimaryMuted,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildThemeCard(
                context,
                ref,
                label: 'Dark',
                icon: PhosphorIconsFill.moon,
                mode: FluxerThemeMode.dark,
                isSelected: themePref.mode == FluxerThemeMode.dark,
              ),
              const SizedBox(width: 12),
              _buildThemeCard(
                context,
                ref,
                label: 'Light',
                icon: PhosphorIconsFill.sun,
                mode: FluxerThemeMode.light,
                isSelected: themePref.mode == FluxerThemeMode.light,
              ),
              const SizedBox(width: 12),
              _buildThemeCard(
                context,
                ref,
                label: 'Coal',
                icon: PhosphorIconsFill.circleHalf,
                mode: FluxerThemeMode.coal,
                isSelected: themePref.mode == FluxerThemeMode.coal,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: context.colors.borderColor),
          const SizedBox(height: 32),
          Text(
            'MESSAGE DISPLAY',
            style: TextStyle(
              color: context.colors.textPrimaryMuted,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              _buildDisplayOption(
                context,
                'Cozy',
                'Discord classic \u2014 with big '
                    'avatars and lots of room',
                !isCompact,
                onToggleCompact,
              ),
              const SizedBox(height: 8),
              _buildDisplayOption(
                context,
                'Compact',
                'Fit more messages on screen '
                    'at once',
                isCompact,
                onToggleCompact,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: context.colors.borderColor),
          const SizedBox(height: 32),
          Text(
            'CHAT FONT SCALING',
            style: TextStyle(
              color: context.colors.textPrimaryMuted,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: context.colors.brandPrimary,
              thumbColor: context.colors.textPrimary,
              inactiveTrackColor: context.colors.backgroundModifierAccent,
              overlayColor: context.colors.brandPrimary.withValues(alpha: 0.2),
            ),
            child: Slider(
              value: themePref.scaleFactor,
              min: 0.8,
              max: 1.4,
              divisions: 6,
              label: '${(themePref.scaleFactor * 100).round()}%',
              onChanged: (value) => ref
                  .read(themePreferenceProvider.notifier)
                  .setScaleFactor(value),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeCard(
    BuildContext context,
    WidgetRef ref, {
    required String label,
    required IconData icon,
    required FluxerThemeMode mode,
    required bool isSelected,
  }) => Expanded(
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => ref.read(themePreferenceProvider.notifier).setTheme(mode),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.backgroundModifierSelected
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? context.colors.brandPrimary
                  : context.colors.interactiveMuted,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              PhosphorIcon(
                icon,
                size: 28,
                color: isSelected
                    ? context.colors.brandPrimary
                    : context.colors.interactiveNormal,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? context.colors.textChat
                      : context.colors.interactiveNormal,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  Widget _buildDisplayOption(
    BuildContext context,
    String label,
    String description,
    bool isSelected,
    VoidCallback onTap,
  ) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.backgroundModifierSelected
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            _buildRadioCircle(context, isSelected),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected
                        ? context.colors.textChat
                        : context.colors.interactiveNormal,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: context.colors.textPrimaryMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildRadioCircle(BuildContext context, bool isSelected) => Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: isSelected
            ? context.colors.brandPrimary
            : context.colors.interactiveMuted,
        width: 2,
      ),
    ),
    child: isSelected
        ? Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.brandPrimary,
              ),
            ),
          )
        : null,
  );
}
