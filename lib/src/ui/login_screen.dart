import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Logo(screenHeight, screenWidth)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [textIniciar(screenWidth)],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [TextIngresa(screenWidth)],
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Logo(double screenHeight, double screenWidth) {
  return Container(
    height: screenHeight * 0.42,
    width: screenWidth,
    decoration: const BoxDecoration(color: Color.fromARGB(255, 65, 65, 65)),
    child: Center(
      child: Image.asset('assets/images/logo.png', width: screenWidth * 0.60),
    ),
  );
}

Widget textIniciar(double screenWidth) {
  double fontSizeScaled = screenWidth * 0.055;
  return Padding(
    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
    child: Text(
      "Iniciar Sesión",
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSizeScaled,
          fontFamily: 'Poppins'),
    ),
  );
}

Widget TextIngresa(double screenWidth) {
  double fontSizeScaled = screenWidth * 0.04;
  return Padding(
    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 0, 0),
    child: Text(
      "Ingresa tus datos para poder continuar",
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: fontSizeScaled,
          fontFamily: 'Poppins'),
    ),
  );
}
