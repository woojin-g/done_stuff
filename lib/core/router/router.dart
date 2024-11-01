import 'package:done_stuff/core/auth/provider.dart';
import 'package:done_stuff/core/utility.dart';
import 'package:done_stuff/feat/history/ui/page.main.dart';
import 'package:done_stuff/feat/login/ui/page.main.dart';
import 'package:done_stuff/feat/main_shell/ui/page.shell.dart';
import 'package:done_stuff/feat/onboarding/ui/page.main.dart';
import 'package:done_stuff/feat/record/ui/page.main.dart';
import 'package:done_stuff/feat/register/ui/page.main.dart';
import 'package:done_stuff/feat/splash_screen/ui/page.main.dart';
import 'package:done_stuff/feat/stuff_management/ui/main.page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref<GoRouter> ref) {
  final authState = ref.watch(authStateProvider).value;
  return GoRouter(
    navigatorKey: CoreUtility.rootNavigatorKey,
    initialLocation: switch (authState) {
      AuthStateType.loggedIn => '/login/register',
      AuthStateType.loggedOut => '/login',
      null => '/',
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'root',
        redirect: (context, state) {
          if (state.topRoute?.name == 'root') {
            return '/splash';
          }
          return null;
        },
        routes: [
          GoRoute(
            path: 'splash',
            name: 'splash_screen',
            builder: (context, state) => const SplashScreenPage(),
          ),
          GoRoute(
            path: 'login',
            name: 'login',
            routes: [
              GoRoute(
                path: 'register',
                name: 'register',
                builder: (context, state) => const RegisterPage(),
              ),
            ],
            builder: (context, state) => const LoginPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        redirect: (context, state) {
          if (authState! == AuthStateType.loggedIn) {
            return null;
          }
          return '/';
        },
        routes: [
          GoRoute(
            path: '/auth',
            name: 'auth',
            redirect: (context, state) {
              if (authState! == AuthStateType.loggedIn) {
                return null;
              }
              return '/';
            },
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
                        builder: (context, state) =>
                            const StuffManagementPage(),
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
                builder: (context, state, navigationShell) => MainShellPage(
                  navigationShell: navigationShell,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
