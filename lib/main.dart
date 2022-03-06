import 'package:flutter/material.dart';
import 'package:newproject/home_screen/home_screen.dart';
import 'package:newproject/login_form/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            textTheme:
                const TextTheme(headline6: TextStyle(color: Colors.black)),
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
        home: const LoginPage());
  }
}
