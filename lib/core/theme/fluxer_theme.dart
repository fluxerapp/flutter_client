import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:material_ui/material_ui.dart';

/// Build Fluxer-styled ThemeData from theme extensions.
ThemeData buildFluxerTheme({
  required FluxerColorTheme colorTheme,
  required FluxerTextTheme textTheme,
  required FluxerLayoutTheme layoutTheme,
  Brightness brightness = Brightness.dark,
}) {
  final fontFamily = textTheme.messageText.fontFamily;

  return ThemeData(
    brightness: brightness,
    fontFamily: fontFamily,
    scaffoldBackgroundColor: colorTheme.backgroundPrimary,
    canvasColor: colorTheme.backgroundSecondary,
    cardColor: colorTheme.embedBackground,
    dividerColor: colorTheme.borderColor,
    extensions: [
      colorTheme,
      textTheme,
      layoutTheme,
      const FluxerMotionTheme.standard(),
    ],
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: colorTheme.brandPrimary,
      onPrimary: colorTheme.brandPrimaryFill,
      secondary: colorTheme.brandSecondary,
      onSecondary: colorTheme.brandPrimaryFill,
      error: colorTheme.accentDanger,
      onError: colorTheme.brandPrimaryFill,
      surface: colorTheme.backgroundPrimary,
      onSurface: colorTheme.textPrimary,
      surfaceContainerHighest: colorTheme.backgroundTertiary,
      outline: colorTheme.borderColor,
    ),
    textTheme: TextTheme(
      bodyLarge: textTheme.messageText,
      bodyMedium: textTheme.bodyMedium,
      bodySmall: textTheme.bodySmall,
      titleLarge: textTheme.heading,
      labelSmall: textTheme.smallText,
      labelMedium: textTheme.label,
    ),
    iconTheme: IconThemeData(color: colorTheme.interactiveNormal, size: 20),
    appBarTheme: AppBarTheme(
      backgroundColor: colorTheme.backgroundPrimary,
      foregroundColor: colorTheme.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 1,
      shadowColor: colorTheme.backgroundFloating,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(colorTheme.scrollbarThumbBg),
      trackColor: WidgetStateProperty.all(colorTheme.scrollbarTrackBg),
      radius: const Radius.circular(4),
      thickness: WidgetStateProperty.all<double>(6),
    ),

    // Buttons — web: 44px height, 96px min-width, 600w 14px, 8px radius
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorTheme.brandPrimary,
        foregroundColor: colorTheme.brandPrimaryFill,
        disabledBackgroundColor: colorTheme.brandPrimary.withValues(alpha: 0.5),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        minimumSize: const Size(96, 44),
        textStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 20 / 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorTheme.textLink,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        textStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 20 / 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorTheme.buttonOutlineText,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        minimumSize: const Size(96, 44),
        textStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 20 / 14,
        ),
        side: BorderSide(color: colorTheme.buttonOutlineBorder),
        shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
      ),
    ),

    // Inputs — web: filled (FormSurface bg-tertiary), 8px radius,
    // modifier-accent border, modifier-accent-focus on focus,
    // status-danger on error
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorTheme.backgroundTertiary,
      border: OutlineInputBorder(
        borderRadius: layoutTheme.radiusLg,
        borderSide: BorderSide(color: colorTheme.backgroundModifierAccent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: layoutTheme.radiusLg,
        borderSide: BorderSide(color: colorTheme.backgroundModifierAccent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: layoutTheme.radiusLg,
        borderSide: BorderSide(color: colorTheme.backgroundModifierAccentFocus),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: layoutTheme.radiusLg,
        borderSide: BorderSide(color: colorTheme.statusDanger),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: layoutTheme.radiusLg,
        borderSide: BorderSide(color: colorTheme.statusDanger),
      ),
      hintStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        color: colorTheme.textTertiary,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    ),

    // Tooltips — web: bg-primary, 1px header-secondary border, 8px radius,
    // 600w 14px, padding 8/12
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: colorTheme.backgroundPrimary,
        border: Border.all(color: colorTheme.backgroundHeaderSecondary),
        borderRadius: layoutTheme.radiusLg,
      ),
      textStyle: TextStyle(
        fontFamily: fontFamily,
        color: colorTheme.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 16 / 14,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    // Dialogs — web: bg-secondary, 1px header-secondary border, 8px radius
    dialogTheme: DialogThemeData(
      backgroundColor: colorTheme.backgroundSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: layoutTheme.radiusLg,
        side: BorderSide(color: colorTheme.backgroundHeaderSecondary),
      ),
      elevation: 16,
      shadowColor: Colors.black.withValues(alpha: 0.25),
      titleTextStyle: textTheme.heading,
      contentTextStyle: textTheme.bodyMedium,
    ),

    // Context menus — web: bg-primary, 1px modifier-accent border, 4px radius
    popupMenuTheme: PopupMenuThemeData(
      color: colorTheme.backgroundPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: layoutTheme.radiusSm,
        side: BorderSide(color: colorTheme.backgroundModifierAccent),
      ),
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.35),
      textStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorTheme.textSecondary,
      ),
    ),

    // Dividers — web: modifier-accent, 1px
    dividerTheme: DividerThemeData(
      color: colorTheme.backgroundModifierAccent,
      thickness: 1,
      space: 0,
    ),

    // Checkboxes — web: 24px, 3px radius, header-secondary border,
    // brand-primary when checked
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorTheme.brandPrimary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(Colors.white),
      side: BorderSide(color: colorTheme.backgroundHeaderSecondary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    ),

    // Tabs — web: 500w 14px, muted color, brand-primary-light when selected,
    // 2px underline indicator
    tabBarTheme: TabBarThemeData(
      labelColor: colorTheme.brandPrimaryLight,
      unselectedLabelColor: colorTheme.textPrimaryMuted,
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: colorTheme.brandPrimaryLight, width: 2),
      ),
      dividerColor: colorTheme.backgroundModifierAccent,
    ),

    // Text selection — brand-primary cursor and selection handles
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colorTheme.textPrimary,
      selectionColor: colorTheme.brandPrimary.withValues(alpha: 0.3),
      selectionHandleColor: colorTheme.brandPrimary,
    ),

    // Icon buttons — web: square 44px, hover uses modifier-hover bg
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: colorTheme.interactiveNormal,
        hoverColor: colorTheme.backgroundModifierHover,
        highlightColor: colorTheme.backgroundModifierSelected,
        minimumSize: const Size(44, 44),
        shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
      ),
    ),

    // Sliders — web: 4px bar, 16px grabber, brand-primary active
    sliderTheme: SliderThemeData(
      activeTrackColor: colorTheme.brandPrimary,
      inactiveTrackColor: colorTheme.backgroundModifierAccent,
      thumbColor: colorTheme.brandPrimary,
      overlayColor: colorTheme.brandPrimary.withValues(alpha: 0.12),
      trackHeight: 4,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
    ),

    // Progress indicators — brand-primary
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorTheme.brandPrimary,
      linearTrackColor: colorTheme.backgroundModifierAccent,
      circularTrackColor: colorTheme.backgroundModifierAccent,
    ),

    // Bottom sheets — web mobile modal: bg-secondary, 16px top radius
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: colorTheme.backgroundSecondary,
      modalBackgroundColor: colorTheme.backgroundSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: layoutTheme.radiusXxl.topLeft),
      ),
    ),

    // Switches — web: brand-primary when on, rgb(107,114,128) when off,
    // white thumb in both states.
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(colorTheme.switchThumb),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorTheme.brandPrimary;
        }
        return colorTheme.switchTrackInactive;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    ),

    // Radio buttons — web: 18px, brand-primary when selected,
    // unselected border is color-mix(border-color 70%, #fff 30%).
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorTheme.brandPrimary;
        }
        return Color.lerp(colorTheme.borderColor, Colors.white, 0.3);
      }),
    ),

    // Cards — embed-like: bg-secondary, border, 8px radius
    cardTheme: CardThemeData(
      color: colorTheme.backgroundSecondary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: layoutTheme.radiusLg,
        side: BorderSide(color: colorTheme.borderColor),
      ),
      margin: EdgeInsets.zero,
    ),

    // List tiles — text and icon colors from theme
    listTileTheme: ListTileThemeData(
      textColor: colorTheme.textSecondary,
      iconColor: colorTheme.interactiveNormal,
      selectedColor: colorTheme.textPrimary,
      selectedTileColor: colorTheme.backgroundModifierSelected,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusSm),
      minVerticalPadding: 8,
    ),

    // Navigation bar (mobile bottom nav)
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorTheme.backgroundSecondary,
      indicatorColor: colorTheme.brandPrimary.withValues(alpha: 0.15),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: colorTheme.interactiveActive, size: 24);
        }
        return IconThemeData(color: colorTheme.interactiveNormal, size: 24);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontFamily: fontFamily,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: colorTheme.interactiveActive,
          );
        }
        return TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: colorTheme.interactiveNormal,
        );
      }),
      elevation: 0,
      height: 60,
    ),

    // Drawers — bg-secondary
    drawerTheme: DrawerThemeData(
      backgroundColor: colorTheme.backgroundSecondary,
      elevation: 0,
      shape: const RoundedRectangleBorder(),
    ),

    // Snack bars — floating toast style
    snackBarTheme: SnackBarThemeData(
      backgroundColor: colorTheme.backgroundFloating,
      contentTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colorTheme.textPrimary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: layoutTheme.radiusLg,
        side: BorderSide(color: colorTheme.backgroundHeaderSecondary),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 8,
    ),

    // Chips — pill-shaped, secondary button style
    chipTheme: ChipThemeData(
      backgroundColor: colorTheme.backgroundTertiary,
      selectedColor: colorTheme.brandPrimary.withValues(alpha: 0.2),
      disabledColor: colorTheme.backgroundTertiary.withValues(alpha: 0.5),
      labelStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colorTheme.textSecondary,
      ),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusMd),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    ),

    // FAB — brand-primary
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorTheme.brandPrimary,
      foregroundColor: colorTheme.brandPrimaryFill,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusXl),
    ),

    // Dropdown menus — matches popup menu styling
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        border: OutlineInputBorder(
          borderRadius: layoutTheme.radiusLg,
          borderSide: BorderSide(color: colorTheme.backgroundModifierAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: layoutTheme.radiusLg,
          borderSide: BorderSide(color: colorTheme.backgroundModifierAccent),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
      ),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(colorTheme.backgroundPrimary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: layoutTheme.radiusSm,
            side: BorderSide(color: colorTheme.backgroundModifierAccent),
          ),
        ),
        elevation: WidgetStateProperty.all(8),
      ),
    ),

    // Menu anchors — matches context menu / popup menu
    menuTheme: MenuThemeData(
      style: MenuStyle(
        backgroundColor: WidgetStateProperty.all(colorTheme.backgroundPrimary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: layoutTheme.radiusSm,
            side: BorderSide(color: colorTheme.backgroundModifierAccent),
          ),
        ),
        elevation: WidgetStateProperty.all(8),
        shadowColor: WidgetStateProperty.all(
          Colors.black.withValues(alpha: 0.35),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(8)),
      ),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return colorTheme.textPrimary;
          }
          return colorTheme.textSecondary;
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return colorTheme.backgroundModifierHover;
          }
          return Colors.transparent;
        }),
        textStyle: WidgetStateProperty.all(
          TextStyle(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        minimumSize: WidgetStateProperty.all(const Size(0, 36)),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: layoutTheme.radiusSm),
        ),
      ),
    ),

    // Search bar — input-like styling
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all(colorTheme.backgroundTertiary),
      textStyle: WidgetStateProperty.all(
        TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          color: colorTheme.textPrimary,
        ),
      ),
      hintStyle: WidgetStateProperty.all(
        TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          color: colorTheme.textTertiary,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
      ),
      elevation: WidgetStateProperty.all(0),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 16),
      ),
    ),

    // Segmented buttons — brand-primary selected
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorTheme.brandPrimary;
          }
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorTheme.brandPrimaryFill;
          }
          return colorTheme.textSecondary;
        }),
        side: WidgetStateProperty.all(
          BorderSide(color: colorTheme.backgroundModifierAccent),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
        ),
        textStyle: WidgetStateProperty.all(
          TextStyle(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),

    // Expansion tiles — minimal, themed text/icon colors
    expansionTileTheme: ExpansionTileThemeData(
      textColor: colorTheme.textPrimary,
      collapsedTextColor: colorTheme.textSecondary,
      iconColor: colorTheme.interactiveNormal,
      collapsedIconColor: colorTheme.interactiveNormal,
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      shape: const Border(),
      collapsedShape: const Border(),
    ),

    // Date picker — brand-primary accent
    datePickerTheme: DatePickerThemeData(
      backgroundColor: colorTheme.backgroundSecondary,
      headerBackgroundColor: colorTheme.backgroundTertiary,
      headerForegroundColor: colorTheme.textPrimary,
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorTheme.brandPrimaryFill;
        }
        return colorTheme.textPrimary;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorTheme.brandPrimary;
        }
        return Colors.transparent;
      }),
      todayBorder: BorderSide(color: colorTheme.brandPrimary),
      shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
    ),

    // Time picker — brand-primary accent
    timePickerTheme: TimePickerThemeData(
      backgroundColor: colorTheme.backgroundSecondary,
      dialHandColor: colorTheme.brandPrimary,
      dialBackgroundColor: colorTheme.backgroundTertiary,
      hourMinuteTextColor: colorTheme.textPrimary,
      hourMinuteColor: colorTheme.backgroundTertiary,
      shape: RoundedRectangleBorder(borderRadius: layoutTheme.radiusLg),
    ),

    // Navigation drawer — bg-secondary
    navigationDrawerTheme: NavigationDrawerThemeData(
      backgroundColor: colorTheme.backgroundSecondary,
      elevation: 0,
      indicatorColor: colorTheme.backgroundModifierSelected,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: colorTheme.interactiveActive);
        }
        return IconThemeData(color: colorTheme.interactiveNormal);
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: colorTheme.textPrimary,
          );
        }
        return TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorTheme.textSecondary,
        );
      }),
    ),

    // Badges — status-danger (red) notification badges
    badgeTheme: BadgeThemeData(
      backgroundColor: colorTheme.statusDanger,
      textColor: Colors.white,
      textStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
