import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';

class CustomInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController textController;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isOk;
  final bool isError;
  final String? Function(String?)? validator;
  final Future<String>? Function(String?)? onchage;
  final Function()? onTap;
  final Function(PointerDownEvent)? onTapOutside;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final TextStyle? style;
  final TextAlign? textAlign;

  const CustomInput(
      {super.key,
      required this.placeholder,
      required this.textController,
      this.textInputType = TextInputType.text,
      this.isPassword = false,
      this.isOk = false,
      this.isError = false,
      this.contentPadding = const EdgeInsets.only(top: 8, left: 15),
      this.validator,
      this.onchage,
      this.onTap,
      this.onTapOutside,
      this.inputFormatters,
      this.suffixIcon,
      this.style,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    final inputTheme = Theme.of(context).inputDecorationTheme;

    return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autocorrect: false,
        showCursor: true,
        controller: textController,
        keyboardType: textInputType,
        obscureText: isPassword,
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlign ?? TextAlign.start,
        validator: validator,
        onChanged: onchage != null
            ? (p0) {
                onchage!(p0);
              }
            : null,
        onTap: onTap,
        onTapOutside: (p0) {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        inputFormatters: inputFormatters,
        style: style ?? rickTextStyle24,
        decoration: InputDecoration(
          enabledBorder: isError
              ? inputTheme.errorBorder
              : !isOk
                  ? inputTheme.enabledBorder
                  : inputTheme.enabledBorder!.copyWith(
                      borderSide: const BorderSide(color: colorBlue, width: 2)),
          focusedBorder: !isOk
              ? inputTheme.enabledBorder
              : inputTheme.enabledBorder!.copyWith(
                  borderSide: const BorderSide(color: colorBlue, width: 2)),
          filled: true,
          fillColor: Colors.white,
          hintText: placeholder,
          suffixIcon: suffixIcon,
          errorStyle: const TextStyle(height: 0),
          contentPadding: contentPadding,
          hintStyle: rickTextStyle24.copyWith(
            color: const Color(0XFFA7A9AC),
          ),
        ));
  }
}
