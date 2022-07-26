import 'package:algoriza_todo/cubit/app_cubit.dart';
import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/shared/widgets/drop_down_text_field.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class DropDownTextFieldWithTitle extends StatelessWidget {
  final SingleValueDropDownController controller;
  final List<Map<String, dynamic>> list;
  final String title;
  final String hint;
  const DropDownTextFieldWithTitle({
    Key? key,
    required this.controller,
    required this.list,
    required this.title,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4)
              .add(const EdgeInsets.only(bottom: 5)),
          child: Text(
            title,
            style: getBoldStyle(
              fontColor: ColorManager.black,
            ),
          ),
        ),
        DefaultDropDownTextField(
          controller: controller,
          list: list,
          cursorColor: ColorManager.grey,
          textColor: Colors.grey,
          inputType: TextInputType.text,
          hint: hint,
          hintColor: Colors.grey.withOpacity(0.7),
          rounded: 8,
          focusBorder: ColorManager.lightGrey,
          border: ColorManager.lightGrey,
          textSize: FontSize.s14,
          fillColor: ColorManager.lightGrey,
          heightPadding: 2,
          onChanged: (value) {
            DropDownValueModel downValueModel = value;
            AppCubit.get(context)
                .changeReminderDuration(value: downValueModel.value);
          },
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
