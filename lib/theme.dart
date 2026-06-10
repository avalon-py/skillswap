import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  static const terracotta50  = Color(0xFFEDEAE2);
  static const terracotta100 = Color(0xFFE4E0D4); // primary container
  static const terracotta200 = Color(0xFFC9C2AC);
  static const terracotta300 = Color(0xFF8E8675);
  static const terracotta400 = Color(0xFFB0B0A8); // dark-scheme primary
  static const terracotta500 = Color(0xFF3D3833);
  static const terracotta600 = Color(0xFF171614); // anchor — primary
  static const terracotta700 = Color(0xFF2C2925);
  static const terracotta800 = Color(0xFF1F1D1A);
  static const terracotta900 = Color(0xFF0D0C0A);
  static const terracotta950 = Color(0xFF0A0908);

  static const sage50  = Color(0xFFE8EEE7);
  static const sage100 = Color(0xFFD2DECD); // secondary container
  static const sage200 = Color(0xFFA8BFA1);
  static const sage300 = Color(0xFF6E8E78);
  static const sage400 = Color(0xFF4A6E5A); // dark-scheme secondary
  static const sage500 = Color(0xFF1F4133); // anchor — secondary
  static const sage600 = Color(0xFF173329);
  static const sage700 = Color(0xFF11261E);
  static const sage800 = Color(0xFF0B1A14);
  static const sage900 = Color(0xFF071009);
  static const sage950 = Color(0xFF03070A);

  static const linen50  = Color(0xFFF2EFE8); // anchor — surface (paper)
  static const linen100 = Color(0xFFE8E4DA);
  static const linen200 = Color(0xFFDAD3C6); // outline
  static const linen300 = Color(0xFFBAB2A0);
  static const linen400 = Color(0xFF8A8275);
  static const linen500 = Color(0xFF6E665A);
  static const linen600 = Color(0xFF5C544A); // muted text
  static const linen700 = Color(0xFF3A332C);
  static const linen800 = Color(0xFF1A1714); // anchor — text ink
  static const linen900 = Color(0xFF100E0C);
  static const linen950 = Color(0xFF080705);

  // Dark surfaces — true ink, no warm cocoa.
  static const darkBg            = Color(0xFF0B0A09);
  static const darkSurface       = Color(0xFF131210);
  static const darkSurfaceMuted  = Color(0xFF1B1916);
  static const darkOutline       = Color(0xFF2A2622);
  static const darkOutlineFaint  = Color(0xFF1B1815);

  static const amber400 = Color(0xFFFFD24A);
  static const amber500 = Color(0xFFF5B82E);

  static const sunburst100 = Color(0xFFF1FBC9);
  static const sunburst300 = Color(0xFFDCFB66);
  static const sunburst500 = Color(0xFFC6FA4D);
  static const sunburst700 = Color(0xFF7A9F1F);
  static const sunburst900 = Color(0xFF354A0C);

  static const red100 = Color(0xFFFCDED9);
  static const red400 = Color(0xFFF26B5C);
  static const red500 = Color(0xFFE94B33);
  static const red900 = Color(0xFF5C1812);

  static const avatarPalette = <Color>[
    Color(0xFF4F5BD5), // indigo
    Color(0xFF7B49B5), // violet
    Color(0xFFDB4B7C), // rose
    Color(0xFFE07A2E), // sienna
    Color(0xFFD49F1F), // ochre
    Color(0xFF1D7B6D), // teal
    Color(0xFF2E7F3D), // forest
    Color(0xFF2A6FB5), // ocean
  ];
}

class AppRadii {
  AppRadii._();
  static const double xs = 6;
  static const double sm = 8;
  static const double md = 10;
  static const double lg = 12;
  static const double xl = 16;
  static const double xxl = 20;
  static const double full = 999;
}

class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 48;
}

class AppFonts {
  AppFonts._();

  static TextStyle display({
    required double size,
    FontWeight weight = FontWeight.w700,
    double letter = -0.5,
    double height = 1.05,
    Color? color,
    bool italic = false,
  }) {
    return GoogleFonts.fraunces(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letter,
      height: height,
      color: color,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    );
  }

  static TextStyle body({
    required double size,
    FontWeight weight = FontWeight.w400,
    double letter = 0,
    double height = 1.45,
    Color? color,
  }) {
    return GoogleFonts.dmSans(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letter,
      height: height,
      color: color,
    );
  }

  static TextStyle stamp({
    required double size,
    FontWeight weight = FontWeight.w600,
    double letter = 1.6,
    double height = 1.0,
    Color? color,
  }) {
    return GoogleFonts.jetBrainsMono(
      fontSize: size,
      fontWeight: weight,
      letterSpacing: letter,
      height: height,
      color: color,
    );
  }
}

ThemeData buildLightTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.terracotta600,           // ink #171614
    onPrimary: AppColors.linen50,                // paper on ink
    primaryContainer: AppColors.terracotta100,
    onPrimaryContainer: AppColors.terracotta900,
    secondary: AppColors.sage500,                // forest #1F4133
    onSecondary: AppColors.linen50,
    secondaryContainer: AppColors.sage100,
    onSecondaryContainer: AppColors.sage900,
    tertiary: AppColors.amber500,
    onTertiary: AppColors.linen900,
    error: AppColors.red500,
    onError: Colors.white,
    errorContainer: AppColors.red100,
    onErrorContainer: AppColors.red900,
    surface: AppColors.linen50,                  // bone paper
    onSurface: AppColors.linen800,               // text ink
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: AppColors.linen50,
    surfaceContainer: AppColors.linen100,
    surfaceContainerHigh: AppColors.linen100,
    surfaceContainerHighest: AppColors.linen200,
    onSurfaceVariant: AppColors.linen600,
    outline: AppColors.linen200,
    outlineVariant: AppColors.linen100,
    inverseSurface: AppColors.linen800,
    onInverseSurface: AppColors.linen100,
    inversePrimary: AppColors.sunburst500,       // lime glows on dark
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
  );
  return _buildTheme(scheme);
}

ThemeData buildDarkTheme() {
  const scheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.sunburst500,              // lime is the dark-mode hero
    onPrimary: AppColors.sage900,
    primaryContainer: AppColors.sunburst900,
    onPrimaryContainer: AppColors.sunburst100,
    secondary: AppColors.sage400,
    onSecondary: AppColors.sage900,
    secondaryContainer: AppColors.sage800,
    onSecondaryContainer: AppColors.sage100,
    tertiary: AppColors.amber400,
    onTertiary: AppColors.linen900,
    error: AppColors.red400,
    onError: AppColors.linen900,
    errorContainer: AppColors.red900,
    onErrorContainer: AppColors.red100,
    surface: AppColors.darkSurface,
    onSurface: AppColors.linen100,
    surfaceContainerLowest: AppColors.darkBg,
    surfaceContainerLow: AppColors.darkSurface,
    surfaceContainer: AppColors.darkSurfaceMuted,
    surfaceContainerHigh: AppColors.darkSurfaceMuted,
    surfaceContainerHighest: AppColors.darkOutline,
    onSurfaceVariant: AppColors.linen400,
    outline: AppColors.darkOutline,
    outlineVariant: AppColors.darkOutlineFaint,
    inverseSurface: AppColors.linen100,
    onInverseSurface: AppColors.linen900,
    inversePrimary: AppColors.terracotta600,
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
  );
  return _buildTheme(scheme);
}

ThemeData _buildTheme(ColorScheme scheme) {
  final isDark = scheme.brightness == Brightness.dark;
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor:
        isDark ? AppColors.darkBg : AppColors.linen50,
    splashFactory: InkSparkle.splashFactory,
    visualDensity: VisualDensity.standard,
  );

  TextStyle display(double size, FontWeight w,
      {double letter = -0.5, double height = 1.05}) {
    return GoogleFonts.fraunces(
      fontSize: size,
      fontWeight: w,
      letterSpacing: letter,
      height: height,
      color: scheme.onSurface,
    );
  }

  TextStyle body(double size, FontWeight w,
      {double letter = 0, double height = 1.45, Color? color}) {
    return GoogleFonts.dmSans(
      fontSize: size,
      fontWeight: w,
      letterSpacing: letter,
      height: height,
      color: color ?? scheme.onSurface,
    );
  }

  TextStyle mono(double size, FontWeight w,
      {double letter = 1.4, double height = 1.0, Color? color}) {
    return GoogleFonts.jetBrainsMono(
      fontSize: size,
      fontWeight: w,
      letterSpacing: letter,
      height: height,
      color: color ?? scheme.onSurface,
    );
  }

  final textTheme = base.textTheme.copyWith(
    displayLarge:   display(48, FontWeight.w700, letter: -1.4, height: 1.0),
    displayMedium:  display(40, FontWeight.w700, letter: -1.0, height: 1.02),
    displaySmall:   display(32, FontWeight.w700, letter: -0.7, height: 1.05),
    headlineLarge:  display(28, FontWeight.w700, letter: -0.5, height: 1.1),
    headlineMedium: display(24, FontWeight.w600, letter: -0.4, height: 1.15),
    headlineSmall:  display(20, FontWeight.w600, letter: -0.3, height: 1.2),
    titleLarge:     body(18, FontWeight.w600, letter: -0.1, height: 1.3),
    titleMedium:    body(16, FontWeight.w600, height: 1.35),
    titleSmall:     body(14, FontWeight.w600, height: 1.4),
    bodyLarge:      body(16, FontWeight.w400, height: 1.55),
    bodyMedium:     body(14, FontWeight.w400,
                        height: 1.5, color: scheme.onSurfaceVariant),
    bodySmall:      body(13, FontWeight.w400,
                        height: 1.45, color: scheme.onSurfaceVariant),
    labelLarge:     mono(13, FontWeight.w700, letter: 1.2),
    labelMedium:    mono(11, FontWeight.w700, letter: 1.4),
    labelSmall:     mono(10, FontWeight.w700,
                        letter: 1.6, color: scheme.onSurfaceVariant),
  );

  return base.copyWith(
    textTheme: textTheme,
    primaryTextTheme: textTheme,
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: textTheme.titleLarge,
      iconTheme: IconThemeData(color: scheme.onSurface, size: 22),
      systemOverlayStyle: isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
    ),
    cardTheme: CardThemeData(
      color: scheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        side: BorderSide(color: scheme.onSurface, width: 1.5),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        disabledBackgroundColor:
            scheme.onSurface.withValues(alpha: 0.08),
        disabledForegroundColor:
            scheme.onSurface.withValues(alpha: 0.38),
        minimumSize: const Size.fromHeight(54),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        textStyle: GoogleFonts.dmSans(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        minimumSize: const Size.fromHeight(54),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        textStyle: GoogleFonts.dmSans(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.onSurface,
        side: BorderSide(color: scheme.onSurface, width: 1.4),
        minimumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
        ),
        textStyle: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: scheme.primary,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: scheme.onSurfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDark
          ? scheme.surfaceContainer
          : Colors.white,
      isDense: false,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
      ),
      labelStyle: textTheme.bodyMedium?.copyWith(
        color: scheme.onSurfaceVariant,
      ),
      helperStyle: textTheme.bodySmall,
      errorStyle: textTheme.bodySmall?.copyWith(color: scheme.error),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
        borderSide: BorderSide(color: scheme.outline, width: 1.2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
        borderSide: BorderSide(color: scheme.outline, width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
        borderSide: BorderSide(color: scheme.onSurface, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
        borderSide: BorderSide(color: scheme.error, width: 1.4),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
        borderSide: BorderSide(color: scheme.error, width: 1.6),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.transparent,
      selectedColor: scheme.onSurface,
      side: BorderSide(color: scheme.onSurface, width: 1.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.full),
      ),
      labelStyle: GoogleFonts.jetBrainsMono(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: scheme.onSurface,
      ),
      secondaryLabelStyle: GoogleFonts.jetBrainsMono(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: scheme.surface,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      iconTheme: IconThemeData(color: scheme.onSurfaceVariant, size: 14),
    ),
    dividerTheme: DividerThemeData(
      color: scheme.outlineVariant,
      thickness: 1,
      space: 1,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: scheme.inverseSurface,
      contentTextStyle:
          textTheme.bodyMedium?.copyWith(color: scheme.onInverseSurface),
      actionTextColor: AppColors.sunburst500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: scheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      modalElevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadii.xxl)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: scheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.xl),
        side: BorderSide(color: scheme.onSurface, width: 1.5),
      ),
      titleTextStyle: textTheme.headlineSmall,
      contentTextStyle: textTheme.bodyMedium,
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      titleTextStyle: textTheme.titleMedium,
      subtitleTextStyle: textTheme.bodySmall,
      iconColor: scheme.onSurfaceVariant,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: scheme.primary,
      linearTrackColor: scheme.surfaceContainerHigh,
      circularTrackColor: scheme.surfaceContainerHigh,
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: scheme.inverseSurface,
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      textStyle:
          textTheme.bodySmall?.copyWith(color: scheme.onInverseSurface),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: scheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      indicatorColor: scheme.primary,
      indicatorShape: const StadiumBorder(),
      height: 68,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? scheme.onPrimary : scheme.onSurfaceVariant,
          size: 24,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return GoogleFonts.jetBrainsMono(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.4,
          color: selected ? scheme.primary : scheme.onSurfaceVariant,
        );
      }),
    ),
  );
}
