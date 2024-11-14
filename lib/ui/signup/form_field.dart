import 'package:flutter/material.dart';
import 'package:full_plant_app/constants/constants.dart';

class CustomFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Object? initialvalue;
  final Function(String)? onchange;
  final TextDirection textDirection;
  final String labelname;
  final bool obscure;
  const CustomFormField({
    super.key,
    required this.validator,
    required this.initialvalue,
    required this.onchange,
    required this.textDirection,
    required this.labelname,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        initialValue: initialvalue != null ? initialvalue.toString() : '',
        onChanged: onchange,
        obscureText: obscure,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 20, height: 2),
        cursorColor: Consts.primaryColor,
        textDirection: textDirection,
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          labelText: labelname,
          labelStyle: TextStyle(
              color: Consts.primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
          contentPadding: const EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Consts.primaryColor,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
