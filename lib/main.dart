import 'package:done_stuff/core/router/router.dart';
import 'package:done_stuff/ui/define/theme.dart';
import 'package:flutter/material.dart';
import 'package:done_stuff/core/firebase/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await FirebaseManager.initialize();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();

    // // TODO : 실제 초기화 완료시점으로 옮겨야 함
    // FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.buildThemeData(),
      routerConfig: ref.watch(routerProvider),
    );
  }
}
