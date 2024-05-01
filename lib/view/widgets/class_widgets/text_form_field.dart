import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.validator,
    this.userController,
    this.label,
    this.inputType,
    this.obscureText,
    this.suffixIcon,
  });
  final TextEditingController? userController;
  final String? label;
  final TextInputType? inputType;
  final bool? obscureText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2,color: Colors.green.shade100)
      ),
      
      child: TextFormField(
        controller: userController,
        obscureText: obscureText!,
        keyboardType: inputType,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          label: Text(label!),
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          
          border: InputBorder.none,
        ),
      ),
    );
  }
}
