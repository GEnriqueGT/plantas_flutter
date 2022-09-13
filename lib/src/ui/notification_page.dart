import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plantas/src/ui/malls_page.dart';
import 'package:plantas/src/models/planta_model.dart';

class NotificationPage extends StatefulWidget {
  final List<Planta> plantas;
  NotificationPage({Key? key, required this.plantas}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLogo(context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 25),
            child: Text("Configuración",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.settings_outlined,
                    color: Color(0xff858585),
                    size: 23,
                  ),
                ),
                Text("Notificaciones",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        color: Color(0xff858585))),
              ],
            ),
          ),
          mallsList(widget.plantas, context)
        ],
      ),
    );
  }

  alertOptions(String letra) {
    String dropdownvalue = '=';
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return SizedBox(
                    height: height - 300,
                    width: width - 50,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Notificaciones",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(letra,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                fontFamily: 'Poppins',
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          width: width - 100,
                          child: Text(
                            "Tipo",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff828282)),
                          ),
                        ),
                        Container(
                          width: width - 100,
                          height: 40,
                          child: Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    hint: Text("Ej. <, >, =, <>,  ≤ "),
                                    borderRadius: BorderRadius.circular(5),
                                    dropdownColor: Color(0xFFF5F5F5),
                                    icon: Icon(IconData(0xf13d,
                                        fontFamily: 'MaterialIcons')),
                                    items: dropdownItems,
                                    value: dropdownvalue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownvalue = newValue!;
                                        log(dropdownvalue);
                                      });
                                    }),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          width: width - 100,
                          child: Text(
                            "Valor",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xff828282)),
                          ),
                        ),
                        Container(
                          width: width - 100,
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
                                    hintText: "Ej. 10, 20, 100, etc...",
                                    hintStyle: TextStyle(
                                      color: Color(0xff8A888C),
                                    ),
                                    contentPadding:
                                        EdgeInsets.only(top: 4.5, left: 14),
                                    border: InputBorder.none,
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, right: 15),
                                    )),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          width: width - 100,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: const Color(
                                    0xffD6DD58,
                                  )),
                              child: Text("Guardar configuración",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      color: const Color(0xff414141)))),
                        )
                      ],
                    ));
              },
            ),
          );
        });
      },
    );
  }

  getDatosTiles(List<Datos> datos, BuildContext context) {
    List<Widget> listTiles = [];

    for (int i = 0; i < datos.length; i++) {
      listTiles.add(ListTileTheme(
        contentPadding: EdgeInsets.only(left: 20),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          dense: true,
          visualDensity: VisualDensity(vertical: -3),
          title: Text(datos[i].letra,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  fontSize: 15)),
          trailing: Container(
            width: 30,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.center,
              ),
              onPressed: () {
                alertOptions(datos[i].letra);
              },
              child: Text("-",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xff9AA121),
                      fontSize: 15)),
            ),
          ),
          tileColor: (i % 2 == 0) ? const Color(0xffFBFCEE) : null,
        ),
      ));
    }

    return listTiles;
  }

  Widget mallsList(List<Planta> plantas, context) {
    if (plantas.isEmpty) {
      return Center(
          child: Text("No cuenta con Plantas",
              style: TextStyle(
                  fontFamily: 'poppins',
                  color: Color.fromARGB(255, 147, 147, 147))));
    } else {
      return Column(
          children: plantas.map((planta) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ListTileTheme(
              contentPadding: EdgeInsets.all(0),
              child: ExpansionTile(
                title: Text(
                  planta.mall,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: Color(0xff414141)),
                ),
                children: getDatosTiles(planta.contents, context),
              ),
            ),
          ),
        );
      }).toList());
    }
  }
}

appBarLogo(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(65),
    child: AppBar(
      toolbarHeight: 65,
      leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(seconds: 1),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(-1, 0);
                    const end = Offset.zero;
                    const curve = Curves.linearToEaseOut;

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
                    return MallsPage();
                  })),
            );
          },
          icon: Icon(Icons.arrow_back)),
      backgroundColor: const Color(0xff414141),
      elevation: 0.0,
      title: Image.asset(
        "assets/images/logo_appbar.png",
        scale: 1.7,
      ),
    ),
  );
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("<"), value: "<"),
    DropdownMenuItem(child: Text(">"), value: ">"),
    DropdownMenuItem(child: Text("="), value: "="),
    DropdownMenuItem(child: Text("<>"), value: "<>"),
    DropdownMenuItem(child: Text("≤"), value: "≤"),
    DropdownMenuItem(child: Text("≥"), value: "≥"),
  ];
  return menuItems;
}
