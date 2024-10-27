// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:done_stuff/core/utility.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

enum LoadingIndicatorType {
  circular,
  logo,
  ;
}

class ScreenLoadingIndicator {
  const ScreenLoadingIndicator._();

  static FutureOr<T?> show<T>(
    final BuildContext context,
    final FutureOr<T?> Function() func, {
    final bool showIndicator = true,
  }) async {
    if (!context.mounted || context.loaderOverlay.visible) {
      return null;
    }

    T? result;
    try {
      context.loaderOverlay.show(
        showOverlay: false,
        widgetBuilder: (progress) => DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );

      result = await func();
      _hide(context);
    } catch (_) {
      _hide(context);
      rethrow;
    }
    return result;
  }

  static void _hide(final BuildContext context) {
    try {
      if (!context.mounted) {
        throw Exception();
      }
      context.loaderOverlay.hide();
    } catch (_) {
      CoreUtility.rootNavigatorKey.currentContext?.loaderOverlay.hide();
    }
  }
}
