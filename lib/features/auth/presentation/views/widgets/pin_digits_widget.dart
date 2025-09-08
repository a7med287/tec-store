import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinDigitsWidget extends StatelessWidget {
  const PinDigitsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        activeColor: Colors.blue,
        selectedColor: Colors.blue,
        inactiveColor: Colors.grey,
      ),
      onChanged: (value) {
        print(value);
      },
      onCompleted: (value) {
        print("Completed: $value");
      },
    );
  }
}
