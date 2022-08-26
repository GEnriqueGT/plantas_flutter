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
      body: mallsList(plantas),
    );
  }
}

Widget mallsList(List<Planta> plantas) {
  return ListView(
      children: plantas.map((planta) {
    return Container(
      child: ExpansionTile(
        title: Text(
          planta.mall,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              color: Color(0xff414141)),
        ),
        children: getDatosTiles(planta.contents),
      ),
    );
  }).toList());
}

getDatosTiles(List<Datos> datos) {
  List<Widget> listTiles = [];

  for (int i = 0; i < datos.length; i++) {
    listTiles.add(Container(
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(5.0))),
      child: ListTile(
        title: Text(datos[i].letra,
            style:
                TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins')),
        trailing: Text(datos[i].dato.toString(),
            style:
                TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins')),
        tileColor: (i % 2 == 0) ? Color(0xffFBFCEE) : null,
      ),
    ));
  }
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
