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
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 15),
            child: Text("Configuración",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                )),
          ),
          mallsList(widget.plantas, context)
        ],
      ),
    );
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
              children: getDatosTiles(planta.contents),
            ),
          ),
        ),
      );
    }).toList());
  }
}

getDatosTiles(List<Datos> datos) {
  List<Widget> listTiles = [];

  for (int i = 0; i < datos.length; i++) {
    listTiles.add(ListTileTheme(
      contentPadding: EdgeInsets.only(left: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
            onPressed: () {},
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
