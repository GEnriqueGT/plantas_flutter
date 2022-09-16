import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plantas/src/ui/malls_page.dart';
import 'package:plantas/src/ui/register_page.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsPage extends StatefulWidget {
  final List<Widget> listTiles;

  final String mallName;
  DetailsPage({Key? key, required this.listTiles, required this.mallName})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool qState = true;
  bool phState = true;
  bool sslmState = true;
  bool ssedState = true;
  bool odState = true;
  bool ntState = true;
  bool ptState = true;
  bool dboState = true;
  bool ssState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: appBarLogo(context),
      body: ListView(children: [
        plantaText(context, widget.mallName),
        sectionText("Resumen"),
        Column(children: getTiles(widget.listTiles, context)),
        sectionText("Detalles"),
        detallesCards(),
        sectionRowFilter(context),
        activeFilters(),
        chartList(),
        SizedBox(
          height: 50,
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
                      mallName: widget.mallName,
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

  Widget activeFilter(String text, int index) {
    return Container(
      width: 150,
      height: 35,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9AA121)),
            ),
            IconButton(
                constraints: BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    changeState(index);
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Color(0xff9AA121),
                  size: 20,
                ))
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(39, 214, 221, 88),
          borderRadius: BorderRadius.circular(30)),
    );
  }

  Widget chartList() {
    return Column(
      children: [
        (qState) ? chartQ() : SizedBox(),
      ],
    );
  }

  Widget sectionRowFilter(BuildContext context) {
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
              onPressed: () async {
                await alertOptions(context);

                setState(() {});
              },
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

  Widget activeFilters() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Text(
            "Filtros activos",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff808080),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          height: 40,
          width: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (qState) ? activeFilter("Q EN ENTRADA", 1) : SizedBox()
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void changeState(int index) {
    switch (index) {
      case 1:
        qState = !qState;
        break;
    }
  }

  alertOptions(BuildContext context) {
    bool localQState = qState;
    bool localPhState = phState;
    bool localSslmState = sslmState;
    bool localSsedState = ssedState;
    bool localOdState = odState;
    bool localNtState = ntState;
    bool localPtState = ptState;
    bool localDboState = dboState;
    bool localSsState = ssState;

    void changeOptionState(int index, bool valor) {
      switch (index) {
        case 1:
          localQState = valor;

          break;
        case 2:
          localPhState = valor;
          break;
        case 3:
          localSslmState = valor;

          break;
        case 4:
          localSsedState = valor;
          break;
        case 5:
          localOdState = valor;
          break;
        case 6:
          localNtState = valor;
          break;
        case 7:
          localPtState = valor;
          break;
        case 8:
          localDboState = valor;
          break;
      }
    }

    Widget tileOption(context, letra, int optionIndex) {
      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            dense: true,
            visualDensity: VisualDensity(vertical: -3),
            title: Text(letra,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    fontSize: 15)),
            trailing: Container(
              width: 20,
              child: Checkbox(
                  activeColor: Color(0xff9AA121),
                  value: localQState,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  onChanged: (bool? state) {
                    setState(() {
                      changeOptionState(optionIndex, state!);
                    });
                  }),
            ),
            tileColor: (optionIndex % 2 != 0) ? Color(0xffFBFCEE) : null,
          ),
        );
      });
    }

    List<String> letrasArray = [
      "Q",
      "pH",
      "SSLM",
      "SSED",
      "OD",
      "NT",
      "PT",
      "DBO",
      "SS"
    ];

    List<Widget> arrayTile() {
      List<Widget> array = [];

      for (int i = 0; i < letrasArray.length; i++) {
        array.add(tileOption(context, letrasArray[i], i + 1));
      }

      return array;
    }

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0))),
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return SizedBox(
                    height: height - 150,
                    width: width - 50,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Filtros",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Container(
                            width: width - 100,
                            child: Text('Tablas',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                )),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                              children: arrayTile(),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                qState = localQState;
                                phState = localPhState;
                                sslmState = localSslmState;
                                ssedState = localSsedState;
                                odState = localOdState;
                                ntState = localNtState;
                                ptState = localPtState;
                                dboState = localDboState;
                                ssState = localSsState;
                                Navigator.pop(context);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                primary: const Color(
                                  0xffD6DD58,
                                )),
                            child: Container(
                              width: width - 120,
                              child: Center(
                                child: Text("Aplicar filtros",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        color: const Color(0xff414141))),
                              ),
                            ))
                      ],
                    ));
              },
            ),
          );
        });
      },
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
  return Container(
    padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0xffD7D7D7)),
      ),
    ),
    child: Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: Color.fromARGB(0, 158, 158, 158)),
      child: ExpansionTile(
        iconColor: Color(0xff9F9F9F),
        title: Text(
          "C.C. $mallName",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 21,
              fontFamily: 'Poppins',
              color: Colors.black),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text("Planta de Tratamiento 1",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: Color(0xff757575))),
        ),
      ),
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

chartsectionText(String texto, Color color) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 0, 50),
    child: Text("$texto",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            fontFamily: 'Poppins',
            color: color)),
  );
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff727272),
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0.24,
    child: Text(meta.formattedValue, style: style),
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff727272),
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(meta.formattedValue, style: style),
  );
}

Widget chart(Color lineColor, Color dotColor) {
  return Container(
    padding: const EdgeInsets.only(right: 10),
    width: double.infinity,
    height: 150,
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
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets)),
          leftTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true,
                  interval: 50,
                  reservedSize: 30,
                  getTitlesWidget: leftTitleWidgets)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        lineBarsData: [
          LineChartBarData(
              color: lineColor,
              dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                        radius: 4, color: dotColor, strokeWidth: 0);
                  }),
              isCurved: true,
              barWidth: 2,
              belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        lineColor.withAlpha(65),
                        Color.fromARGB(0, 255, 255, 255)
                      ])),
              spots: [
                FlSpot(0, 250),
                FlSpot(3, 200),
                FlSpot(5, 150),
                FlSpot(10, 245),
                FlSpot(12, 170),
                FlSpot(13, 200),
                FlSpot(15.5, 250),
                FlSpot(18, 150)
              ]),
        ],
      ),
    ),
  );
}

Widget chartNt() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("NT EN SALIDA", Color(0xff247FB2)),
      chart(Color(0xff58ADDD), Color(0xff247FB2)),
    ],
  );
}

Widget chartQ() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("Caudal entrada Q", Color(0xffA6AE23)),
      chart(Color(0xffD6DD58), Color(0xffA6AE23)),
    ],
  );
}

Widget chartsSS() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("SS EN SALIDA", Color(0xff6B24B2)),
      chart(Color(0xffB584E6), Color(0xff6B24B2)),
    ],
  );
}

Widget chartsDBO() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("DBO EN SALIDA", Color(0xff23AEA6)),
      chart(Color(0xff62DFD8), Color(0xff23AEA6)),
    ],
  );
}
