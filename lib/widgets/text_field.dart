import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isMultiline;
  final bool? obSecure;
  final String? Function(String?)? validator;

  const ReusableTextField({
    required this.hintText,
    this.obSecure,
    required this.controller,
    required this.isMultiline,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      controller: controller,
      maxLines: isMultiline ? 4 : 1,
      keyboardType: isMultiline ? TextInputType.multiline : null,
      validator: validator, // Pass the validator function
      obscureText: obSecure??false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
