
import 'package:flutter/material.dart';
import 'package:newproject/ui_screens/home_screen.dart';

moveToHome(BuildContext context) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) =>const  HomeScreen(userName: "")));
}
