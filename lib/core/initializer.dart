import 'package:done_stuff/core/firebase/core.dart';
import 'package:done_stuff/core/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initializeBeforeRunApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await FirebaseManager.initialize();
  }

  static Future<void> initialize(final WidgetRef ref) async {
    CoreUtility.globalRef = ref;
  }
}
