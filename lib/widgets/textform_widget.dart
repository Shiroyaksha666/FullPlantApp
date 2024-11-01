import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_plant_app/constants/constants.dart';

class TextFormWidget extends StatelessWidget {
  final String name;
  final bool obscure;
  final TextDirection? directionhint;
  final TextInputType input;
  const TextFormWidget({
    super.key,
    required this.name,
    required this.input,
    this.directionhint,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        obscureText: obscure,
        keyboardType: input,
        style: const TextStyle(fontSize: 20, height: 2),
        cursorColor: Consts.primaryColor,
        textDirection: directionhint ?? TextDirection.rtl,
        decoration: InputDecoration(
          labelText: name,
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
      ),
    );
  }
}
