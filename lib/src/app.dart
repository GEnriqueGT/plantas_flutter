import 'package:flutter/material.dart';
import 'package:plantas/src/ui/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatelessWidget {
  Future<FirebaseApp> _InitializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: _InitializeFirebase(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const LoginPage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
