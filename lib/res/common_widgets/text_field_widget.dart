import 'package:flutter/material.dart';
import 'package:untitled1/res/app_colors/app_colors.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  InputBorder? border;
  Widget? suffix;
  Widget? prefix;
  bool enable;
  TextInputType type;
  InputBorder? enableBorder;
  FormFieldValidator? onSubmitted;
  FocusNode? focus;
  InputBorder? focusBorder;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Color? prefixIconColor;
  bool obscure;
  IconData? hideIcon;
  Color? suffixIconColor;
  Color? fillColor;
  Color? textColor;
  FormFieldValidator? onValidate;
  FormFieldValidator? onChanged;
  VoidCallback? onTap;
  VoidCallback? passTap;

  TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.onValidate,
      this.onTap,
      this.passTap,
      this.enable = true,
      this.textColor,
      this.suffix,
      this.prefix,
      this.onChanged,
      this.border,
      this.obscure = false,
      this.enableBorder,
      this.suffixIconColor,
      this.hideIcon,
      this.focusBorder,
      this.type = TextInputType.text,
      this.focus,
      this.onSubmitted,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixIconColor,
      this.fillColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      focusNode: focus,
      validator: onValidate,
      enabled: enable,
      onTap: onTap,
      keyboardType: type,
      style: Theme.of(context).textTheme.headline2!.copyWith(
          fontSize: controller.text.length > 8 ? 14 : 16,
          color: AppColors.black),
      cursorColor: AppColors.black,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
          suffix: suffix,
          prefix: prefix,
          hintText: hintText,
          errorStyle: const TextStyle(
              fontSize: 13,
              height: 0.1,
              textBaseline: TextBaseline.ideographic),
          hintStyle: const TextStyle(
            color: AppColors.grey,
          ),
          border: border,
          suffixIcon: suffixIcon != null
              ? hideIcon != null
                  ? GestureDetector(
                      onTap: passTap,
                      child: Icon(obscure ? suffixIcon : hideIcon))
                  : Icon(suffixIcon)
              : null,
          suffixIconColor: suffixIconColor ?? AppColors.grey,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          fillColor: fillColor ?? AppColors.white,
          filled: true,
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border,
          prefixIconColor: prefixIconColor ?? AppColors.grey),
    );
  }
}
