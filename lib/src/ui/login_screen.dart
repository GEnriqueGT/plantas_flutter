import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Logo(screenHeight, screenWidth),
          TextIniciar(screenWidth),
          TextIngresa(screenWidth),
          UserTextField(screenWidth),
          PasswordTextField(screenWidth),
          IniciaButton(screenWidth)
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

Widget TextIniciar(double screenWidth) {
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

// ignore: non_constant_identifier_names
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

// ignore: non_constant_identifier_names
Widget UserTextField(double screenWidth) {
  double fontSizeScaled = screenWidth * 0.03;
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
    padding: const EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(5)),
    child: TextFormField(
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: fontSizeScaled,
          fontFamily: 'Poppins'),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 15.0),
          border: InputBorder.none,
          hintText: 'Usuario',
          prefixIcon: Icon(
            Icons.person_outline,
            color: Color(0xff414141),
          )),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget PasswordTextField(double screenWidth) {
  double fontSizeScaled = screenWidth * 0.03;
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    padding: const EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(5)),
    child: TextFormField(
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: fontSizeScaled,
          fontFamily: 'Poppins'),
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(top: 15.0),
          border: InputBorder.none,
          hintText: 'Contraseña',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Color(0xff414141),
          )),
    ),
  );
}

Widget IniciaButton(double screenWidth) {
  double fontSizeScaled = screenWidth * 0.04;
  return Container(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Color(
          0xffD6DD58,
        )),
        child: Text("Iniciar Sesión",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: fontSizeScaled,
                fontFamily: 'Poppins',
                color: Color(0xff414141)))),
  );
}
