# Done Stuff

## Firebase 설정

```
flutterfire configure --out="lib/core/firebase/options/dev/default_options.dart" --ios-bundle-id=com.emblueworld.done-stuff.dev --android-package-name=com.emblueworld.done_stuff.dev --ios-target="Runner" --ios-out=ios/Runner/dev/GoogleService-Info.plist --android-out=android/app/src/dev/google-services.json --project="done-stuff-dev" --platforms=ios,android --overwrite-firebase-options -y;
flutterfire configure --out="lib/core/firebase/options/stg/default_options.dart" --ios-bundle-id=com.emblueworld.done-stuff.stg --android-package-name=com.emblueworld.done_stuff.stg --ios-target="Runner" --ios-out=ios/Runner/stg/GoogleService-Info.plist --android-out=android/app/src/stg/google-services.json --project="done-stuff-stg" --platforms=ios,android --overwrite-firebase-options -y;
flutterfire configure --out="lib/core/firebase/options/prd/default_options.dart" --ios-bundle-id=com.emblueworld.done-stuff --android-package-name=com.emblueworld.done_stuff --ios-target="Runner" --ios-out=ios/Runner/prd/GoogleService-Info.plist --android-out=android/app/src/prd/google-services.json --project="done-stuff" --platforms=ios,android --overwrite-firebase-options -y
```