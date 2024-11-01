import 'package:done_stuff/feat/register/model/agreement_item.dart';
import 'package:done_stuff/ui/define/size.dart';
import 'package:done_stuff/utility/build_context_extension.dart';
import 'package:flutter/material.dart';

class AgreementsController {
  AgreementsController({
    required this.itemModels,
  });

  final allAgreed = ValueNotifier(false);
  final allRequiredItemsAgreed = ValueNotifier(false);

  final List<AgreementItemModel> itemModels;
  late final itemStates = List.generate(
    itemModels.length,
    (_) => ValueNotifier(false),
  );

  void updateItemState(final int index, final bool isChecked) {
    itemStates[index].value = isChecked;
    _validate();
  }

  void updateAllItemStates(final bool isChecked) {
    for (final itemState in itemStates) {
      itemState.value = isChecked;
    }
    _validate();
  }

  void _validate() {
    allAgreed.value = itemStates.every((state) => state.value);

    for (var index = 0; index < itemStates.length; ++index) {
      if (itemModels[index].isRequired && !itemStates[index].value) {
        allRequiredItemsAgreed.value = false;
        return;
      }
    }
    allRequiredItemsAgreed.value = true;
  }
}

class Agreements extends StatelessWidget {
  const Agreements({
    required this.controller,
    super.key,
  });

  final AgreementsController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    return Container(
      padding: const EdgeInsets.only(bottom: CustomSize.xs),
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(CustomSize.xs),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: controller.allAgreed,
                builder: (context, value, child) => Checkbox(
                  value: value,
                  onChanged: (value) => controller.updateAllItemStates(value!),
                ),
              ),
              Expanded(
                child: Text(
                  '약관 전체동의',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: colorScheme.outlineVariant,
            height: 1,
            thickness: 1,
          ),
          for (var index = 0; index < controller.itemModels.length; ++index)
            _AgreementItem(
              index: index,
              controller: controller,
            ),
        ],
      ),
    );
  }
}

class _AgreementItem extends StatelessWidget {
  const _AgreementItem({
    required this.index,
    required this.controller,
  });

  final int index;
  final AgreementsController controller;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    final requiredTextStyle = textTheme.bodyMedium!.copyWith(
      color: controller.itemModels[index].isRequired
          ? colorScheme.primary
          : colorScheme.secondary,
    );
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: controller.itemStates[index],
          builder: (context, value, child) {
            return Checkbox(
              value: value,
              onChanged: (value) => controller.updateItemState(index, value!),
            );
          },
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${controller.itemModels[index].title} ',
                      ),
                      TextSpan(
                        text: controller.itemModels[index].isRequired
                            ? '(필수)'
                            : '(선택)',
                        style: requiredTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  size: CustomSize.l,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
