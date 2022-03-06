// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:newproject/ui_screens/home_screen.dart';

import 'package:newproject/utility/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formKey = GlobalKey<FormState>();
  //controll of useremail and password
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomText(
                    text: "Login",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomText(
                    text: "Please sign in to continue",
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //Input field for email
                  CustomFormField(
                      icon: emailIcon,
                      hintText: emailLabelText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return emailError;
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  //Input field for password
                  CustomFormField(
                      icon: passIcon,
                      hintText: passwordHintText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return passworderror;
                        } else if (value.length < 6) {
                          return "Paasword length must greater than 6";
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  LoginButton(
                    name: userEmail.text,
                    formkey: _formKey,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}

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

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.formkey,
    required this.name,
  }) : super(key: key);
  final String name;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(userName);
        if (formkey.currentState!.validate()) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        userName: name,
                      )));
        }
      },
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
            children: const [
              Text(
                "Login",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Icon(
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

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {Key? key,
      required this.controller,
      this.prefixIcon,
      this.errorText,
      this.validate,
      this.hintText})
      : super(key: key);
  Function? validate;
  final String? hintText;
  final String? errorText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 2.0,
        child: TextFormField(
          validator: validate!(),
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusColor: iconColor,
              prefixIcon: prefixIcon,
              prefixIconColor: iconColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.w900),
              filled: false,
              fillColor: Colors.black38,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              labelText: hintText,
              constraints: const BoxConstraints(
                  maxHeight: 80, minHeight: 35, maxWidth: 400, minWidth: 200)),
        ),
      ),
    );
  }
}
