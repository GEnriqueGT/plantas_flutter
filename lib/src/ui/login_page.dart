import 'package:flutter/material.dart';
import 'package:plantas/src/ui/malls_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        const AlertDialog(
          title: Text("No se ha encontrado un usuario para ese correo"),
        );
      }
    }

    return user;
  }

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  Icon _Icon = const Icon(
    Icons.visibility_off_outlined,
    color: Color(0xff414141),
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          logo(screenHeight, screenWidth),
          textIniciar(screenWidth),
          textIngresa(screenWidth),
          userTextField(screenWidth),
          passwordTextField(screenWidth),
          iniciaButton(context)
        ],
      ),
    );
  }

  Widget passwordTextField(double screenWidth) {
    double fontSizeScaled = screenWidth * 0.03;
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: _passwordController,
        enableSuggestions: false,
        autocorrect: false,
        obscureText: _obscureText,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: fontSizeScaled,
            fontFamily: 'Poppins'),
        decoration: InputDecoration(
            suffixIcon: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;

                    if (_obscureText) {
                      _Icon = const Icon(
                        Icons.visibility_off_outlined,
                        color: Color(0xff414141),
                      );
                    } else {
                      _Icon = const Icon(
                        Icons.visibility_outlined,
                        color: Color(0xff414141),
                      );
                    }
                  });
                },
                icon: _Icon),
            contentPadding: const EdgeInsets.only(top: 15.0),
            border: InputBorder.none,
            hintText: 'Contraseña',
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: Color(0xff414141),
            )),
      ),
    );
  }

  Widget userTextField(double screenWidth) {
    double fontSizeScaled = screenWidth * 0.03;
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: _emailController,
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

  Widget iniciaButton(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSizeScaled = screenWidth * 0.035;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ElevatedButton(
          onPressed: () async {
            User? user = await loginUsingEmailPassword(
                email: _emailController.text,
                password: _passwordController.text,
                context: context);
            print(user);
            if (user != null) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(seconds: 1),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1, 0);
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      final tween = Tween(begin: begin, end: end);
                      final curvedAnimation = CurvedAnimation(
                        parent: animation,
                        curve: curve,
                      );

                      return SlideTransition(
                        position: tween.animate(curvedAnimation),
                        child: child,
                      );
                    },
                    pageBuilder: ((context, animation, secondaryAnimation) {
                      return const MallsPage();
                    })),
              );
            }
          },
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              primary: const Color(
                0xffD6DD58,
              )),
          child: Text("Iniciar Sesión",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: fontSizeScaled,
                  fontFamily: 'Poppins',
                  color: const Color(0xff414141)))),
    );
  }
}

Widget logo(double screenHeight, double screenWidth) {
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

// ignore: non_constant_identifier_names
Widget textIngresa(double screenWidth) {
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
