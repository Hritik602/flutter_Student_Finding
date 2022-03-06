import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
   LoginButton({
    Key? key,
    required this.onTap,
    required this.name,
  }) : super(key: key);
  final String name;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          width: 130,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
                colors: [Colors.orange, Colors.deepOrange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const Icon(
                Icons.arrow_forward,
                size: 29.0,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
