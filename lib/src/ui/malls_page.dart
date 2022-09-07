import 'package:flutter/material.dart';
import 'package:plantas/src/models/planta_model.dart';
import 'package:plantas/src/ui/details_page.dart';
import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;

List colors = [Color(0xffFBFCEE), null];

class MallsPage extends StatefulWidget {
  MallsPage({Key? key}) : super(key: key);

  @override
  _MallsPageState createState() => _MallsPageState();
}

class _MallsPageState extends State<MallsPage> {
  var plantas = List<Planta>.empty(growable: true);

  _getPlantas() {
    API.getPlantas().then((response) {
      setState(() {
        if (response.statusCode == 200) {
          Map<String, dynamic> map = jsonDecode(response.body);

          List<dynamic> data = map["plantas"];

          for (int i = 0; i < data.length; i++) {
            List<Datos> contentsMall = [];

            for (int j = 0; j < data[i]["contents"].length; j++) {
              contentsMall.add(Datos(
                  letra: data[i]["contents"][j]["letra"],
                  dato: data[i]["contents"][j]["dato"]));
            }

            plantas.add(Planta(mall: data[i]["mall"], contents: contentsMall));
          }
        } else {
          throw Exception('Falló la carga de datos');
        }
      });
    });
  }

  initState() {
    super.initState();
    _getPlantas();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(),
      body: mallsList(plantas, context),
    );
  }
}

Widget mallsList(List<Planta> plantas, context) {
  if (plantas.isEmpty) {
    return Center(
        child: Text("No cuenta con Plantas",
            style: TextStyle(
                fontFamily: 'poppins',
                color: Color.fromARGB(255, 147, 147, 147))));
  } else {
    return ListView(
        padding: const EdgeInsets.only(top: 30),
        children: plantas.map((planta) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  planta.mall,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Color(0xff414141)),
                ),
                children: getDatosTiles(planta.contents, context, planta.mall),
              ),
            ),
          );
        }).toList());
  }
}

getDatosTiles(List<Datos> datos, BuildContext context, String mallName) {
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
          onPressed: () {
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
                    return DetailsPage(
                      listTiles: listTiles,
                      mallName: mallName,
                    );
                  })),
            );
          },
          child: const Text("Ver detalles",
              style: TextStyle(
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
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 27,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings_outlined,
                    size: 25,
                  )),
            )
          ],
        ),
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

class API {
  static Future getPlantas() {
    var url = "http://192.168.1.9:3000/api/plantas";
    return http.get(Uri.parse(url));
  }
}
