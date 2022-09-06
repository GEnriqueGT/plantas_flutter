import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantas/src/ui/details_page.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class RegisterParametersPage extends StatefulWidget {
  RegisterParametersPage({Key? key}) : super(key: key);

  @override
  RregisterParametersPageState createState() => RregisterParametersPageState();
}

class RregisterParametersPageState extends State<RegisterParametersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context),
      body: ListView(
        children: [titulo(context), Formulario()],
      ),
    );
  }
}

appBarLogo(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(65),
    child: AppBar(
      toolbarHeight: 65,
      backgroundColor: const Color(0xff414141),
      elevation: 0.0,
      title: Image.asset(
        "assets/images/logo_appbar.png",
        scale: 1.7,
      ),
    ),
  );
}

Widget titulo(BuildContext context) {
  initializeDateFormatting();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 0, 20),
        child: Text(
          "Registro de Parámetros",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 85,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xffF0F0F0), width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  "C.C. Pradera",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  DateFormat("EEEE dd 'de' MMMM, yyyy", 'es_US').format(
                    DateTime.now(),
                  ),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Color(0xff757575)),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget Formulario() {
  int pagina = 0;
  return Container(
    child: operativosForm(),
  );
}

Widget operativosForm() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.circle_outlined,
                size: 16,
                color: Color(0xffD6DD58),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Operativos",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Calidad",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xffA1A1A1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Nitrógeno",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xffA1A1A1)),
              ),
            )
          ],
        )
      ],
    ),
  );
}
