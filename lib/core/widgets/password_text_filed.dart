import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    this.onSaved,
    required this.hintText,
    required this.iconData,
    required this.textInputType,
  });

  final void Function(String?)? onSaved;
  final String hintText;
  final IconData iconData;
  final TextInputType textInputType;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isNotVisible,
      onSaved: widget.onSaved,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.iconData),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isNotVisible = !isNotVisible;
            });
          },
          icon: Icon(
            isNotVisible
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
          ),
        ),
        hintText: widget.hintText,
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
