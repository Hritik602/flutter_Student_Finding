
import 'package:flutter/material.dart';
import 'package:newproject/utility/utility.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key,
      required this.validator,
      required this.icon,
      required this.hintText})
      : super(key: key);
  final String? Function(String?)? validator;

  final Icon? icon;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 2.0,
        child: TextFormField(
            validator: validator,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                prefixIcon: icon,
                prefixIconColor: iconColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.w900),
                filled: false,
                fillColor: Colors.black38,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                labelText: hintText,
                constraints: const BoxConstraints(
                    maxHeight: 80,
                    minHeight: 35,
                    maxWidth: 400,
                    minWidth: 200))),
      ),
    );
  }
}