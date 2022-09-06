import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantas/src/ui/details_page.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:plantas/src/ui/malls_page.dart';

class RegisterParametersPage extends StatefulWidget {
  final String mallName;
  RegisterParametersPage({Key? key, required this.mallName}) : super(key: key);

  @override
  RregisterParametersPageState createState() => RregisterParametersPageState();
}

class RregisterParametersPageState extends State<RegisterParametersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context),
      body: ListView(
        children: [titulo(context, widget.mallName), Formulario(context)],
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

Widget titulo(BuildContext context, mallName) {
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
                  "C.C. $mallName",
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

Widget Formulario(BuildContext context) {
  int pagina = 0;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      operativosForm(context),
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: const Color(
                  0xffD6DD58,
                )),
            child: Text("Continuar",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: const Color(0xff414141)))),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: const Color(
                  0xff414141,
                )),
            child: Text("Terminar registro",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Colors.white))),
      )
    ],
  );
}

Widget operativosForm(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.circle_outlined,
              size: 16,
              color: Color(0xffD6DD58),
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
            ),
          ],
        ),
      ),
      campo("Contador", "Correlativo"),
      campo("OD", "[mg/L]"),
      campo("T", "Grados Celcius"),
      campo("pH"),
      campo("SSED", "[mg/L]"),
      campo("Cloro libre", "[mg/L]")
    ],
  );
}

Widget campo(String description, [String sufix = ""]) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$description",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              fontFamily: 'Poppins',
            )),
        Container(
          width: 270,
          height: 40,
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    fontFamily: 'Poppins'),
                decoration: InputDecoration(
                    hintText: "Ej 1,2,3,4",
                    hintStyle: TextStyle(
                      color: Color(0xff8A888C),
                    ),
                    contentPadding: EdgeInsets.only(top: 4.5, left: 14),
                    border: InputBorder.none,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 15),
                      child: Text("$sufix",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          )),
                    )),
              )),
        )
      ],
    ),
  );
}
