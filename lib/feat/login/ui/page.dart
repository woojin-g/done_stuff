import 'package:done_stuff/core/auth/oauth/token.provider.dart';
import 'package:done_stuff/core/auth/provider.dart';
import 'package:done_stuff/ui/define/size.dart';
import 'package:done_stuff/ui/define/svg/svg_image.dart';
import 'package:done_stuff/ui/widget/screen_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSize.m),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(CustomSize.xxl),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  await ScreenLoadingIndicator.show(
                    context,
                    () => ref
                        .read(authStateProvider.notifier)
                        .login(OAuthProviderType.google),
                  );
                  final authState = ref.read(authStateProvider).value;
                  if (authState == AuthStateType.loggedIn && context.mounted) {
                    context.goNamed('register');
                  }
                },
                child: Container(
                  height: CustomSize.xxl,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(CustomSize.xs),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.string(
                        SvgImage.icon.google,
                        width: CustomSize.l,
                      ),
                      const Gap(CustomSize.l),
                      Text(
                        'Google 계정으로 로그인',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
