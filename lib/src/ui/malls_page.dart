import 'package:flutter/material.dart';
import 'package:plantas/src/models/planta_model.dart';
import 'package:plantas/src/ui/details_page.dart';
import 'dart:async';
import 'package:plantas/src/ui/notification_page.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

List colors = [const Color(0xffFBFCEE), null];

class MallsPage extends StatefulWidget {
  const MallsPage({Key? key}) : super(key: key);

  @override
  _MallsPageState createState() => _MallsPageState();
}

class _MallsPageState extends State<MallsPage> {
  var plantas = List<Planta>.empty(growable: true);

  _getPlantas() {
    API.getPlantas().then((response) {
      setState(() {
        if (response.statusCode == 200) {
          var responseJson = json.decode(response.body);
          plantas = (responseJson['plantas'] as List)
              .map((p) => Planta.fromJson(p))
              .toList();
        } else {
          throw Exception('Falló la carga de datos');
        }
      });
    });
  }

  @override
  initState() {
    super.initState();
    _getPlantas();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context, plantas),
      body: mallsList(plantas, context),
    );
  }
}

Widget mallsList(List<Planta> plantas, context) {
  if (plantas.isEmpty) {
    return const Center(
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
              child: ListTileTheme(
                contentPadding: const EdgeInsets.all(0),
                child: ExpansionTile(
                  iconColor: const Color(0xff9F9F9F),
                  title: Text(
                    planta.mall,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        color: Color(0xff414141)),
                  ),
                  children: <Widget>[
                    tileMalls(letra: "Q", dato: planta.q.toString(), color: 0),
                    ListTile(
                      title: Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(seconds: 1),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      const begin = Offset(1, 0);
                                      const end = Offset.zero;
                                      const curve = Curves.ease;

                                      final tween =
                                          Tween(begin: begin, end: end);
                                      final curvedAnimation = CurvedAnimation(
                                        parent: animation,
                                        curve: curve,
                                      );

                                      return SlideTransition(
                                        position:
                                            tween.animate(curvedAnimation),
                                        child: child,
                                      );
                                    },
                                    pageBuilder: ((context, animation,
                                        secondaryAnimation) {
                                      return DetailsPage(
                                        listTiles: [
                                          tileMalls(
                                              letra: "Q",
                                              dato: planta.mall,
                                              color: 0),
                                        ],
                                        mallName: planta.mall,
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
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList());
  }
}

appBarLogo(BuildContext context, List<Planta> plantas) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(65),
    child: AppBar(
      actions: <Widget>[
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 27,
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
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
                          pageBuilder:
                              ((context, animation, secondaryAnimation) {
                            return NotificationPage(
                              plantas: plantas,
                            );
                          })),
                    );
                  },
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

class tileMalls extends StatelessWidget {
  final String letra;
  final String dato;
  final int color;
  const tileMalls(
      {Key? key, required this.letra, required this.dato, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: const EdgeInsets.only(left: 20, right: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        dense: true,
        visualDensity: const VisualDensity(vertical: -3),
        title: Text(letra,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 15)),
        trailing: Text(dato,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                color: Color(0xff9AA121),
                fontSize: 15)),
        tileColor: (color % 2 == 0) ? const Color(0xffFBFCEE) : null,
      ),
    );
  }
}

class API {
  static Future getPlantas() {
    var url = "http://192.168.1.9:3000/api/plantas";
    return http.get(Uri.parse(url));
  }
}
