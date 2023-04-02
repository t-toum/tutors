import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String? hintText;
  final String? icon;
  final String? Function(String?)? validator;
  final bool obscureText;
  const CustomTextField({
    super.key,
    this.hintText,
    this.icon,
    required this.name,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: name,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        contentPadding: const EdgeInsets.all(20),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 40,
          maxWidth: 40,
          minHeight: 20,
          minWidth: 20,
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Image.asset(
                  icon!,
                  width: 35,
                ),
              )
            : null,
        fillColor: Colors.white,
        hintText: hintText,
        border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
      validator: validator,
    );
  }
}
