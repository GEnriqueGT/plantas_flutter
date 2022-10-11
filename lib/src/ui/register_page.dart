import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class RegisterParametersPage extends StatefulWidget {
  final String mallName;
  const RegisterParametersPage({Key? key, required this.mallName}) : super(key: key);

  @override
  RregisterParametersPageState createState() => RregisterParametersPageState();
}

class RregisterParametersPageState extends State<RegisterParametersPage> {
  int pagina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context),
      body: ListView(
        children: [
          titulo(context, widget.mallName),
          Formulario(context),
        ],
      ),
    );
  }

  final List<Widget> _mywidgets = [operativosForm(), CalidadForm(), nitrogenoForm()];

  Widget Formulario(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _mywidgets.elementAt(pagina),
        continueButton(),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: const Color(
                    0xff414141,
                  )),
              child: const Text("Terminar registro",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Colors.white))),
        )
      ],
    );
  }

  continueButton() {
    if (pagina != 2) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                pagina++;
              });
            },
            style: ElevatedButton.styleFrom(
                elevation: 0.0,
                primary: const Color(
                  0xffD6DD58,
                )),
            child: const Text("Continuar",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xff414141)))),
      );
    } else {
      return const SizedBox();
    }
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
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 0, 20),
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
                  color: const Color(0xffF0F0F0), width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Text(
                  "C.C. $mallName",
                  style: const TextStyle(
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
                  style: const TextStyle(
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

Widget operativosForm() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.circle_outlined,
              size: 16,
              color: Color(0xffD6DD58),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
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
              padding: EdgeInsets.only(left: 20.0),
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
              padding: EdgeInsets.only(left: 20.0),
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
      const Campo(
          key: Key("Contador"), description: "Contador", sufix: "Correlativo"),
      const Campo(key: Key("OD"), description: "OD", sufix: "[mg/L]"),
      const Campo(key: Key("TOperativos"), description: "T", sufix: "Grados Celcius"),
      const Campo(key: Key("pHOperativos"), description: "pH"),
      const Campo(key: Key("SSED"), description: "SSED", sufix: "[mg/L]"),
      const Campo(key: Key("Cloro"), description: "Cloro libre", sufix: "[mg/L]")
    ],
  );
}

Widget CalidadForm() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              size: 16,
              color: Color(0xffD6DD58),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Operativos",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xffA1A1A1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.circle_outlined,
                size: 16,
                color: Color(0xffD6DD58),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Calidad",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
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
      const Campo(key: Key("CAUDAL"), description: "CAUDAL", sufix: "[mg/L]"),
      const Campo(key: Key("DBO"), description: "DBO", sufix: "[mg/L]"),
      const Campo(key: Key("DQO"), description: "DQO", sufix: "[mg/L]"),
      const Campo(key: Key("SST"), description: "SST", sufix: "[mg/L]"),
      const Campo(key: Key("pHCalidad"), description: "pH", sufix: "[mg/L]"),
      const Campo(key: Key("TCalidad"), description: "T", sufix: "[mg/L]"),
      const Campo(key: Key("GyA"), description: "GyA", sufix: "[mg/L]"),
      const Campo(key: Key("P"), description: "P", sufix: "[mg/L]"),
    ],
  );
}

Widget nitrogenoForm() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              size: 16,
              color: Color(0xffD6DD58),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Operativos",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    color: Color(0xffA1A1A1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.check_circle,
                size: 16,
                color: Color(0xffD6DD58),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
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
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(
                Icons.circle_outlined,
                size: 16,
                color: Color(0xffD6DD58),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Nitrógeno",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
      const Campo(key: Key("NT"), description: "NT", sufix: "[mg/L]"),
      const Campo(key: Key("NH4"), description: " NH4", sufix: "[mg/L]"),
      const Campo(key: Key("NO3"), description: "NO3", sufix: "[mg/L]"),
      const Campo(key: Key("NO2"), description: "NO2", sufix: "[mg/L]"),
      const Campo(key: Key("NKT"), description: "NKT", sufix: "[mg/L]")
    ],
  );
}

class Campo extends StatelessWidget {
  final String description;
  final String? sufix;
  const Campo({Key? key, required this.description, this.sufix})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(description,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: 'Poppins',
              )),
          SizedBox(
            width: 270,
            height: 40,
            child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                      hintText: "Ej 1,2,3,4",
                      hintStyle: const TextStyle(
                        color: Color(0xff8A888C),
                      ),
                      contentPadding: const EdgeInsets.only(top: 4.5, left: 14),
                      border: InputBorder.none,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 15),
                        child: Text("$sufix",
                            style: const TextStyle(
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
}
