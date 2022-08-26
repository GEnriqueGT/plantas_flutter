import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plantas/src/models/planta_model.dart';

List colors = [Color(0xffFBFCEE), null];

class MallsPage extends StatefulWidget {
  MallsPage({Key? key}) : super(key: key);

  @override
  _MallsPageState createState() => _MallsPageState();
}

class _MallsPageState extends State<MallsPage> {
  List<Planta> plantas = [
    Planta(mall: "Pradera Concepción", contents: [
      Datos(letra: 'Q', dato: 3),
      Datos(letra: 'pH', dato: 7),
      Datos(letra: 'SSLM', dato: 15),
    ]),
    Planta(
        mall: "Pradera Zacapa",
        contents: [Datos(letra: 'Q', dato: 3), Datos(letra: 'pH', dato: 7)]),
    Planta(
        mall: "Pradera Huehuetenango",
        contents: [Datos(letra: 'Q', dato: 3), Datos(letra: 'pH', dato: 7)])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(),
      body: mallsList(plantas, context),
    );
  }
}

Widget mallsList(List<Planta> plantas, context) {
  return ListView(
      padding: EdgeInsets.only(top: 30),
      children: plantas.map((planta) {
        return Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                planta.mall,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    fontFamily: 'Poppins',
                    color: Color(0xff414141)),
              ),
              children: getDatosTiles(planta.contents),
            ),
          ),
        );
      }).toList());
}

getDatosTiles(List<Datos> datos) {
  List<Widget> listTiles = [];

  for (int i = 0; i < datos.length; i++) {
    listTiles.add(Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity(vertical: -3),
        title: Text(datos[i].letra,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 15)),
        trailing: Text(datos[i].dato.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Color(0xff9AA121),
                fontSize: 15)),
        tileColor: (i % 2 == 0) ? const Color(0xffFBFCEE) : null,
      ),
    ));
  }

  listTiles.add(ListTile(
    title: Center(
      child: TextButton(
          onPressed: () {},
          child: Text("Ver detalles",
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Poppins',
                  color: Color(0xff9AA121),
                  fontSize: 15))),
    ),
  ));
  return listTiles;
}

appBarLogo() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(65),
    child: AppBar(
      actions: <Widget>[
        IconButton(
            alignment: const Alignment(4, 0),
            onPressed: () {},
            icon: const Icon(Icons.notifications_none)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))
      ],
      toolbarHeight: 65,
      backgroundColor: const Color(0xff414141),
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Image.asset(
        "assets/images/logo_appbar.png",
        scale: 1.7,
      ),
    ),
  );
}
