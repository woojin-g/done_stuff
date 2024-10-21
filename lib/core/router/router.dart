import 'package:done_stuff/feat/history/page/main.dart';
import 'package:done_stuff/feat/home/shell_page/main.dart';
import 'package:done_stuff/feat/onboarding/page/main.dart';
import 'package:done_stuff/feat/record/page/main.dart';
import 'package:done_stuff/feat/stuff_management/page/main.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(ProviderRef<GoRouter> ref) {
  return GoRouter(
    initialLocation: 'onboarding',
    routes: [
      GoRoute(
        path: 'onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: 'management',
                name: 'stuff_management',
                builder: (context, state) => const StuffManagementPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: 'record',
                name: 'record',
                builder: (context, state) => const RecordPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: 'history',
                name: 'history',
                builder: (context, state) => const HistoryPage(),
              ),
            ],
          ),
        ],
        builder: (context, state, navigationShell) => HomeShellPage(
          navigationShell: navigationShell,
        ),
      ),
    ],
  );
}
