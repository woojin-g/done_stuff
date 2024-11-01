import 'package:done_stuff/ui/define/size.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData buildThemeData(final BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF5100FF),
    );

    final textTheme = _buildTextTheme(context);

    final filledButtonThemeData = FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: CustomSize.m,
          vertical: CustomSize.s,
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomSize.xs),
        ),
        textStyle: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return ThemeData(
      colorScheme: colorScheme,
      filledButtonTheme: filledButtonThemeData,
    );
  }

  static TextTheme _buildTextTheme(final BuildContext context) {
    final typography = Typography.material2021();
    final isDarkModeEnabled =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    final defaultTextTheme =
        isDarkModeEnabled ? typography.white : typography.black;

    // Material3 기본 폰트 크기 적용
    return defaultTextTheme.copyWith(
      displayLarge: defaultTextTheme.displayLarge!.copyWith(
        fontSize: 57,
        height: 64 / 57,
      ),
      displayMedium: defaultTextTheme.displayMedium!.copyWith(
        fontSize: 45,
        height: 52 / 45,
      ),
      displaySmall: defaultTextTheme.displaySmall!.copyWith(
        fontSize: 36,
        height: 44 / 36,
      ),
      headlineLarge: defaultTextTheme.headlineLarge!.copyWith(
        fontSize: 32,
        height: 40 / 32,
      ),
      headlineMedium: defaultTextTheme.headlineMedium!.copyWith(
        fontSize: 28,
        height: 36 / 28,
      ),
      headlineSmall: defaultTextTheme.headlineSmall!.copyWith(
        fontSize: 24,
        height: 32 / 24,
      ),
      titleLarge: defaultTextTheme.titleLarge!.copyWith(
        fontSize: 22,
        height: 28 / 22,
      ),
      titleMedium: defaultTextTheme.titleMedium!.copyWith(
        fontSize: 16,
        height: 24 / 16,
      ),
      titleSmall: defaultTextTheme.titleSmall!.copyWith(
        fontSize: 14,
        height: 20 / 14,
      ),
      bodyLarge: defaultTextTheme.bodyLarge!.copyWith(
        fontSize: 16,
        height: 24 / 16,
      ),
      bodyMedium: defaultTextTheme.bodyMedium!.copyWith(
        fontSize: 14,
        height: 20 / 14,
      ),
      bodySmall: defaultTextTheme.bodySmall!.copyWith(
        fontSize: 12,
        height: 16 / 12,
      ),
      labelLarge: defaultTextTheme.labelLarge!.copyWith(
        fontSize: 14,
        height: 20 / 14,
      ),
      labelMedium: defaultTextTheme.labelMedium!.copyWith(
        fontSize: 12,
        height: 16 / 12,
      ),
      labelSmall: defaultTextTheme.labelSmall!.copyWith(
        fontSize: 11,
        height: 16 / 11,
      ),
    );
  }
}
