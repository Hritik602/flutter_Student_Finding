// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:newproject/utility/navigators.dart';

import 'package:newproject/utility/utility.dart';
import 'package:newproject/widget/custom_button.dart';
import 'package:newproject/widget/custom_form_field.dart';
import 'package:newproject/widget/custom_text.dart';

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
  _onPressed() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        moveToHome(context);
      });
    }
  }

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
                  // ElevatedButton(
                  //     onPressed: _onPressed, child: const Text("Login")),
                  LoginButton(name: "Login", onTap: _onPressed),
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
