import 'package:flutter/material.dart';
import 'package:plantas/src/ui/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
