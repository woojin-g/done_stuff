import 'dart:async';

import 'package:done_stuff/utility/logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token.provider.g.dart';

enum FirebaseAuthPlatformType {
  google,
}

@riverpod
class FirebaseAuthToken extends _$FirebaseAuthToken {
  StreamSubscription? subscription;
  User? _cachedUser;

  @override
  Future<String?> build() async {
    subscription?.cancel();
    subscription = FirebaseAuth.instance.userChanges().listen(
      (user) {
        if (user == _cachedUser) {
          return;
        }
        _cachedUser = user;
        ref.invalidateSelf();
      },
    );

    return FirebaseAuth.instance.currentUser?.getIdToken();
  }

  Future<UserCredential> login(final FirebaseAuthPlatformType type) =>
      switch (type) {
        FirebaseAuthPlatformType.google => _loginWithGoogle(),
      };

  Future<UserCredential> _loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e, s) {
      Logger.error(exception: e, stackTrace: s);

      // TODO : 예외처리 추가
      rethrow;
    }
  }
}
