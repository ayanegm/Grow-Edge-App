import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldOTP extends StatelessWidget {
  TextFieldOTP({
    super.key,
    required this.first,
    required this.last,
    required this.controller,
  });
  bool first;
  bool last;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFDEE2E6), width: 1),
        color: Color(0xFFFFFFFF),
      ),

      // height: 48,
      // width: 343,
      child: TextField(
        controller: controller,
        onChanged: ((value) {
          if (value.isNotEmpty && last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        }),
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
        decoration: InputDecoration(
          border: InputBorder.none,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width / 6,
            maxHeight: MediaQuery.sizeOf(context).height / 6,
          ),
        ),
      ),
    );
  }
}
