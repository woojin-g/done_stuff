import 'package:firebase_core/firebase_core.dart';
import 'package:done_stuff/core/flavor/core.dart';
import 'package:done_stuff/core/firebase/options/dev/default_options.dart'
    as dev;
import 'package:done_stuff/core/firebase/options/stg/default_options.dart'
    as stg;
import 'package:done_stuff/core/firebase/options/prd/default_options.dart'
    as prd;

class FirebaseManager {
  FirebaseManager._();

  static Future<void> initialize() => Firebase.initializeApp(
        name: F.appFlavor.name,
        options: switch (F.appFlavor) {
          Flavor.dev => dev.DefaultFirebaseOptions.currentPlatform,
          Flavor.stg => stg.DefaultFirebaseOptions.currentPlatform,
          Flavor.prd => prd.DefaultFirebaseOptions.currentPlatform,
        },
      );
}
