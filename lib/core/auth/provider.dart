import 'package:done_stuff/core/auth/oauth/token.provider.dart';
import 'package:done_stuff/utility/logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

enum AuthStateType {
  loggedIn,
  loggedOut,
}

@riverpod
class AuthState extends _$AuthState {
  @override
  Future<AuthStateType> build() async {
    try {
      final oAuthTokenFuture = ref.watch(oAuthTokenProvider.future);
      final results = await Future.wait([
        oAuthTokenFuture,
        Future.delayed(const Duration(seconds: 3)),
      ]);
      final oAuthToken = results[0] as String?;
      if (oAuthToken == null) {
        return AuthStateType.loggedOut;
      }
      // TODO : 자동로그인 구현 - 서버 구현 이후, 로컬에 토큰이 저장되어 있는지 확인 필요
    } catch (e, s) {
      Logger.error(
        title: 'Login Failed',
        exception: e,
        stackTrace: s,
      );
      rethrow;
    }
    return AuthStateType.loggedIn;
  }

  Future<void> login(final OAuthProviderType type) async {
    state = const AsyncLoading();
    try {
      // TODO : Google Play Console 세팅 이후 진행 가능
      // final userCredential =
      //     await ref.read(oAuthTokenProvider.notifier).login(type);
      // final oAuthToken =
      // await userCredential.user!.getIdToken();
      // TODO : 서버 로그인 구현 필요
    } catch (e, s) {
      Logger.error(
        title: 'Login Failed',
        exception: e,
        stackTrace: s,
      );
      state = AsyncError(e, s);
    }
    state = const AsyncData(AuthStateType.loggedIn);
  }

  Future<void> logout() async {
    state = const AsyncData(AuthStateType.loggedOut);
  }

  Future<void> register() async {}

  Future<void> unregister() async {}
}
