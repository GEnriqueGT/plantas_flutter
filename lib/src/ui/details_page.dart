import 'package:flutter/material.dart';
import 'package:plantas/src/ui/malls_page.dart';
import 'package:plantas/src/ui/register_page.dart';
import 'package:fl_chart/fl_chart.dart';

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
        sectionRowFilter(),
        chartsectionText("NT EN SALIDA"),
        chart(),
        SizedBox(
          height: 200,
        )
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          elevation: 0,
          onPressed: () {
            Navigator.push(
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
                    return RegisterParametersPage(
                      mallName: mallName,
                    );
                  })),
            );
          },
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

chartsectionText(String texto) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(35, 20, 0, 40),
    child: Text("$texto",
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            fontFamily: 'Poppins',
            color: Color(0xff247FB2))),
  );
}

Widget sectionRowFilter() {
  return Padding(
    padding: EdgeInsets.only(top: 40),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        sectionText("Gráficas"),
        Container(
          width: 130,
          padding: const EdgeInsets.only(right: 20),
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filtrar",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      color: Color(0xff808080)),
                ),
                Icon(
                  Icons.filter_alt_outlined,
                  color: Color(0xff808080),
                )
              ],
            ),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                elevation: 0,
                primary: Color(0xffF5F5F5)),
          ),
        )
      ],
    ),
  );
}

Widget chart() {
  return Container(
    padding: const EdgeInsets.only(right: 30),
    width: double.infinity,
    height: 180,
    child: LineChart(
      LineChartData(
        minX: 0,
        maxX: 18,
        minY: 0,
        maxY: 250,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles:
              AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 1)),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            interval: 50,
            reservedSize: 40,
          )),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
              color: Color(0xff58ADDD),
              dotData: FlDotData(),
              isCurved: true,
              barWidth: 2,
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(61, 88, 172, 221),
                        Color(0x00EEEEF0)
                      ])),
              spots: [
                FlSpot(0, 250),
                FlSpot(3, 200),
                FlSpot(5, 150),
                FlSpot(10, 245),
                FlSpot(12, 170),
                FlSpot(15, 200),
                FlSpot(17, 250),
                FlSpot(18, 150)
              ]),
        ],
      ),
    ),
  );
}
