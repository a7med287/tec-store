import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    required this.hintText,
    required this.iconData,
    required this.textInputType,  this.isPassword  = false ,
  });

  final void Function(String?)? onSaved;
  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;
  final bool isPassword ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword ,
      onSaved: onSaved,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        hintText: hintText,
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
