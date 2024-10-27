import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoreUtility {
  CoreUtility._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static late WidgetRef globalRef;
}
