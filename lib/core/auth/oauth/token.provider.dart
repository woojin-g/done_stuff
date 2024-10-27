import 'package:done_stuff/core/auth/firebase_auth/token.provider.dart';
import 'package:done_stuff/core/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token.provider.g.dart';

enum OAuthProviderType {
  google,
  // * 다른 로그인 방식이 추가되면 여기에 추가
  ;

  FirebaseAuthPlatformType get toFirebaseAuthProviderType => switch (this) {
        google => FirebaseAuthPlatformType.google,
      };

  bool get isFirebaseAuthProviderType => switch (this) {
        google => true,
      };
}

@riverpod
class OAuthToken extends _$OAuthToken {
  @override
  Future<String?> build() async {
    final token = await ref.watch(firebaseAuthTokenProvider.future);
    return token;
  }

  Future<UserCredential> login(final OAuthProviderType type) async {
    if (type.isFirebaseAuthProviderType) {
      return ref
          .read(firebaseAuthTokenProvider.notifier)
          .login(type.toFirebaseAuthProviderType);
    }
    throw const NotImplemented();
  }
}
