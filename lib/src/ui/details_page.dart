import 'package:flutter/material.dart';
import 'package:plantas/src/ui/malls_page.dart';

class DetailsPage extends StatelessWidget {
  final List<Widget> listTiles;
  final String mallName;
  DetailsPage({Key? key, required this.listTiles, required this.mallName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: appBarLogo(context),
      body: ListView(children: [
        plantaText(context, mallName),
        sectionText("Resumen"),
        Column(children: getTiles(listTiles, context)),
        sectionText("Detalles"),
        detallesCards(),
        SizedBox(
          height: 200,
        )
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {},
          child: IconTheme(
              data: IconThemeData(color: Colors.black), child: Icon(Icons.add)),
          backgroundColor: Color(0xffD6DD58),
        ),
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

getTiles(List<Widget> listTiles, BuildContext context) {
  List<Widget> listTilesNew = [];

  for (int i = 0; i < listTiles.length - 1; i++) {
    listTilesNew.add(Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0), child: listTiles[i]));
  }

  return listTilesNew;
}

detallesCards() {
  return Container(
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 340,
          margin: EdgeInsets.only(left: 20),
          child: Card(
            elevation: 16,
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/aeration.png", scale: 1.7),
                Text("AERATION",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    )),
                Text("SS = 250 g/L",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    )),
              ],
            )),
          ),
        ),
        Container(
          width: 340,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Card(
            elevation: 16,
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/influent.png", scale: 1.7),
                Text("INFLUENT",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Q = 90 L/min",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        )),
                    Text("pH = 7",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        )),
                    Text("NT = 45",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                        ))
                  ],
                ),
              ],
            )),
          ),
        )
      ],
    ),
  );
}

plantaText(BuildContext context, String mallName) {
  return Theme(
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
  );
}

sectionText(String texto) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 0, 15),
    child: Text("$texto",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          fontFamily: 'Poppins',
        )),
  );
}
