import 'package:algoriza_todo/presentation/styles/color_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_manager.dart';
import 'package:algoriza_todo/presentation/styles/font/font_styles.dart';
import 'package:algoriza_todo/presentation/styles/icons_broken.dart';
import 'package:algoriza_todo/shared/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class TextFieldWithTitle extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool isTime;
  final VoidCallback? onTap;
  final bool readOnly;
  final int startTime;
  final int endTime;
  const TextFieldWithTitle(
      {Key? key,
      required this.controller,
      required this.title,
      required this.hint,
      this.isTime = false,
      this.onTap,
      this.readOnly = false,
      this.startTime = 0,
      this.endTime = 0})
      : super(key: key);

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
        DefaultTextFormFiled(
          isTime: isTime,
          startTime: startTime,
          endTime: endTime,
          cursorColor: ColorManager.grey,
          controller: controller,
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
          suffix: isTime
              ? Icon(
                  IconBroken.Time_Circle,
                  size: 16,
                  color: Colors.grey.withOpacity(0.8),
                )
              : null,
          onTap: onTap,
          readOnly: readOnly,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
