import 'package:done_stuff/feat/register/model/agreement_item.dart';
import 'package:done_stuff/feat/register/ui/page.main.agreements.dart';
import 'package:done_stuff/ui/define/size.dart';
import 'package:done_stuff/utility/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _textController = TextEditingController();
  final _agreementController = AgreementsController(
    itemModels: agreementItemModelTestData,
  );

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final requiredTextStyle =
        textTheme.bodyMedium!.copyWith(color: colorScheme.primary);

    final filledButtonTheme = FilledButtonTheme.of(context);

    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
          title: const Text('회원가입'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: CustomSize.scaffoldDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: '리뷰 작성에 표시할 별명을 입력해주세요. '),
                        TextSpan(text: '(필수)', style: requiredTextStyle),
                      ],
                    ),
                  ),
                  const Gap(CustomSize.xs),
                  TextField(
                    autofocus: true,
                    controller: _textController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: CustomSize.m),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(CustomSize.xs),
                        ),
                        borderSide: BorderSide(
                          color: colorScheme.outlineVariant,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(CustomSize.xs),
                        ),
                        borderSide: BorderSide(
                          color: colorScheme.primary,
                          width: 1.5,
                        ),
                      ),
                      hintText: '별명 (중복 불가)',
                      hintStyle: textTheme.bodyMedium!.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                    style: textTheme.bodyMedium!.copyWith(),
                  ),
                  const Gap(CustomSize.l),
                  Agreements(
                    controller: _agreementController,
                  ),
                  const Gap(CustomSize.l),
                  ValueListenableBuilder(
                    valueListenable:
                        _agreementController.allRequiredItemsAgreed,
                    builder: (context, allRequiredItemsAgreed, child) {
                      return ValueListenableBuilder(
                        valueListenable: _textController,
                        builder: (context, inputText, child) {
                          final isEnabled = allRequiredItemsAgreed &&
                              inputText.text.isNotEmpty;
                          return FilledButton(
                            style: filledButtonTheme.style!.copyWith(
                              textStyle: WidgetStateTextStyle.resolveWith(
                                (states) => textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onPressed: isEnabled ? () {} : null,
                            child: child,
                          );
                        },
                        child: const Text('회원가입 완료'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
