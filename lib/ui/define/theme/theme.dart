import 'package:done_stuff/ui/define/size.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData buildThemeData() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 60, 117, 73),
    );

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
      ),
    );

    return ThemeData(
      colorScheme: colorScheme,
      filledButtonTheme: filledButtonThemeData,
    );
  }
}
