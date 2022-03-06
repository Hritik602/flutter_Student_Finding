import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key, required this.text, required this.fontSize, this.fontWeight})
      : super(key: key);
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}