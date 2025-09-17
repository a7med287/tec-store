import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    required this.hintText,
    required this.iconData,
    required this.textInputType,
    this.isPassword = false,
  });

  final void Function(String?)? onSaved;
  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "this is required";
        }
        return null;
      },
      obscureText: isPassword,
      onSaved: onSaved,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        hintText: hintText,
        border: buildOutlineInputBorder(Colors.grey),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(Colors.blue),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color ?? Colors.grey),
    );
  }
}
