import 'package:flutter/material.dart';
import 'package:plantas/src/models/planta_model.dart';

class DetailsPage extends StatelessWidget {
  final List<Widget> listTiles;
  final String mallName;
  DetailsPage({Key? key, required this.listTiles, required this.mallName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarLogo(),
        body: ListView(children: getTiles(listTiles, mallName, context)));
  }
}

appBarLogo() {
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

getTiles(List<Widget> listTiles, String mallName, BuildContext context) {
  List<Widget> listTilesNew = [
    Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.grey),
      child: ExpansionTile(
        title: Text(
          "C.C. $mallName",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 21,
            fontFamily: 'Poppins',
          ),
        ),
        subtitle: Text("Planta de Tratamiento 1",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Poppins',
            )),
      ),
    ),
    SizedBox(
      height: 10,
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
      child: Text("Resumen",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 21,
            fontFamily: 'Poppins',
          )),
    )
  ];

  for (int i = 0; i < listTiles.length - 1; i++) {
    listTilesNew.add(Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0), child: listTiles[i]));
  }

  return listTilesNew;
}
