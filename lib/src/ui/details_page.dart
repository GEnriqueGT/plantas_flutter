import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:plantas/src/ui/malls_page.dart';
import 'package:plantas/src/ui/register_page.dart';
import 'package:fl_chart/fl_chart.dart';

class DetailsPage extends StatefulWidget {
  final List<Widget> listTiles;

  final String mallName;
  const DetailsPage({Key? key, required this.listTiles, required this.mallName})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class TileOption extends StatefulWidget {
  const TileOption({Key? key}) : super(key: key);

  @override
  _TileOptionState createState() => _TileOptionState();
}

class _TileOptionState extends State<TileOption> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
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
        activeFilters(context),
        chartList(),
        const SizedBox(
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
          backgroundColor: const Color(0xffD6DD58),
          child: const IconTheme(
              data: IconThemeData(color: Colors.black), child: Icon(Icons.add)),
        ),
      ),
    );
  }

  Widget activeFilter(String text, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 35,
        decoration: BoxDecoration(
            color: const Color.fromARGB(39, 214, 221, 88),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9AA121)),
                ),
              ),
              IconButton(
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      changeState(index);
                    });
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xff9AA121),
                    size: 20,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget chartList() {
    return Column(
      children: [
        (qState) ? chartQ() : const SizedBox(),
        (phState) ? chartpH() : const SizedBox(),
        (sslmState) ? chartSslm() : const SizedBox(),
        (ssedState) ? chartSsed() : const SizedBox(),
        (odState) ? chartOd() : const SizedBox(),
        (ntState) ? chartNt() : const SizedBox(),
        (ptState) ? chartPt() : const SizedBox(),
        (dboState) ? chartsDBO() : const SizedBox(),
        (ssState) ? chartsSS() : const SizedBox(),
      ],
    );
  }

  Widget sectionRowFilter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
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
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  elevation: 0,
                  primary: const Color(0xffF5F5F5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
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
            ),
          )
        ],
      ),
    );
  }

  Widget activeFilters(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          child: Text(
            "Filtros activos",
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xff808080),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width - 155,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (qState) ? activeFilter("Q EN ENTRADA", 1) : const SizedBox(),
                  (phState) ? activeFilter("pH EN SALIDA", 2) : const SizedBox(),
                  (sslmState) ? activeFilter("SSLM EN SALIDA", 3) : const SizedBox(),
                  (ssedState) ? activeFilter("SSED EN ENTRADA", 4) : const SizedBox(),
                  (odState) ? activeFilter("OD EN SALIDA", 5) : const SizedBox(),
                  (ntState) ? activeFilter("NT EN SALIDA", 6) : const SizedBox(),
                  (ptState) ? activeFilter("PT EN SALIDA", 7) : const SizedBox(),
                  (dboState) ? activeFilter("DBO EN SALIDA", 8) : const SizedBox(),
                  (ssState) ? activeFilter("SS EN SALIDA", 9) : const SizedBox(),
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

      case 2:
        phState = !phState;
        break;

      case 3:
        sslmState = !sslmState;
        break;
      case 4:
        ssedState = !ssedState;
        break;

      case 5:
        odState = !odState;
        break;

      case 6:
        ntState = !ntState;
        break;
      case 7:
        ptState = !ptState;
        break;

      case 8:
        dboState = !dboState;
        break;

      case 9:
        ssState = !ssState;
        break;
    }
  }

  alertOptions(BuildContext context) {
    bool localQstate = qState;
    bool localPhstate = phState;
    bool localSslmstate = sslmState;
    bool localSsedstate = ssedState;
    bool localOdstate = odState;
    bool localNtstate = ntState;
    bool localPtstate = ptState;
    bool localDbostate = dboState;
    bool localSsstate = ssState;

    List<String> letras = [
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

    asignar(String letra, bool value) {
      switch (letra) {
        case "Q":
          localQstate = value;
          break;
        case "pH":
          localPhstate = value;
          break;
        case "SSLM":
          localSslmstate = value;
          break;
        case "SSED":
          localSsedstate = value;
          break;
        case "OD":
          localOdstate = value;
          break;
        case "NT":
          localNtstate = value;
          break;
        case "PT":
          localPtstate = value;
          break;
        case "DBO":
          localDbostate = value;
          break;
        case "SS":
          localSsstate = value;
          break;
      }
    }

    bool obtener(String letra) {
      bool state = false;
      switch (letra) {
        case "Q":
          state = localQstate;
          break;
        case "pH":
          state = localPhstate;
          break;
        case "SSLM":
          state = localSslmstate;
          break;
        case "SSED":
          state = localSsedstate;
          break;
        case "OD":
          state = localOdstate;
          break;
        case "NT":
          state = localNtstate;
          break;
        case "PT":
          state = localPtstate;
          break;
        case "DBO":
          state = localDbostate;
          break;
        case "SS":
          state = localSsstate;
          break;
      }
      return state;
    }

    List<Widget> obtenerTiles() {
      List<Widget> tiles = [];

      for (var i = 0; i < letras.length; i++) {
        tiles.add(OptionTile(
          key: Key(letras[i]),
          onChange: (local) {
            setState(
              () {
                asignar(letras[i], local);
              },
            );
          },
          localState: obtener(letras[i]),
          letra: letras[i],
          colorTile: (i % 2 == 0) ? const Color(0xffFBFCEE) : null,
        ));
      }

      return tiles;
    }

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
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
                    height: height - (height * 0.20),
                    width: width - 50,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("Filtros",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: SizedBox(
                            width: width - 100,
                            child: const Text('Tablas',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                )),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: obtenerTiles(),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: width - 100,
                            child: const Text('Rango de fecha',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  fontFamily: 'Poppins',
                                )),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                fechaInput("Fecha Inicio"),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                ),
                                fechaInput("Fecha fin")
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                log(qState.toString());
                                log(sslmState.toString());
                                qState = localQstate;
                                phState = localPhstate;
                                sslmState = localSslmstate;
                                ssedState = localSsedstate;
                                odState = localOdstate;
                                ntState = localNtstate;
                                ptState = localPtstate;
                                dboState = localDbostate;
                                ssState = localSsstate;
                                Navigator.pop(context);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                primary: const Color(
                                  0xffD6DD58,
                                )),
                            child: SizedBox(
                              width: width - 120,
                              child: const Center(
                                child: Text("Aplicar filtros",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        color: Color(0xff414141))),
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
                    return const MallsPage();
                  })),
            );
          },
          icon: const Icon(Icons.arrow_back)),
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
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0), child: listTiles[i]));
  }

  return listTilesNew;
}

detallesCards() {
  return SizedBox(
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 340,
          margin: const EdgeInsets.only(left: 20),
          child: Card(
            elevation: 16,
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/aeration.png", scale: 1.7),
                const Text("AERATION",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    )),
                const Text("SS = 250 g/L",
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
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Card(
            elevation: 16,
            color: Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/influent.png", scale: 1.7),
                const Text("INFLUENT",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
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
    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color(0xffD7D7D7)),
      ),
    ),
    child: Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: const Color.fromARGB(0, 158, 158, 158)),
      child: ExpansionTile(
        iconColor: const Color(0xff9F9F9F),
        title: Text(
          "C.C. $mallName",
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 21,
              fontFamily: 'Poppins',
              color: Colors.black),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.only(top: 5.0),
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
    child: Text(texto,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          fontFamily: 'Poppins',
        )),
  );
}

chartsectionText(String texto, Color color) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 20, 0, 50),
    child: Text(texto,
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
                        const Color.fromARGB(0, 255, 255, 255)
                      ])),
              spots: [
                const FlSpot(0, 250),
                const FlSpot(3, 200),
                const FlSpot(5, 150),
                const FlSpot(10, 245),
                const FlSpot(12, 170),
                const FlSpot(13, 200),
                const FlSpot(15.5, 250),
                const FlSpot(18, 150)
              ]),
        ],
      ),
    ),
  );
}

Widget fechaInput(String texto) {
  return Container(
    decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(5)),
    width: 120,
    height: 40,
    child: TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20.0, bottom: 5),
          border: InputBorder.none,
          hintText: texto),
      style: const TextStyle(
          fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),
    ),
  );
}

Widget chartQ() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("Caudal entrada Q", const Color(0xffA6AE23)),
      chart(const Color(0xffD6DD58), const Color(0xffA6AE23)),
    ],
  );
}

Widget chartpH() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("pH EN SALIDA", const Color.fromARGB(255, 174, 35, 169)),
      chart(
          const Color.fromARGB(255, 208, 88, 221), const Color.fromARGB(255, 160, 35, 174)),
    ],
  );
}

Widget chartSslm() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("SSLM EN SALIDA", const Color.fromARGB(255, 174, 35, 35)),
      chart(const Color.fromARGB(255, 221, 88, 88), const Color.fromARGB(255, 174, 35, 35)),
    ],
  );
}

Widget chartSsed() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("SSED EN ENTRADA", const Color.fromARGB(255, 40, 174, 35)),
      chart(
          const Color.fromARGB(255, 88, 221, 112), const Color.fromARGB(255, 35, 174, 60)),
    ],
  );
}

Widget chartOd() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("OD EN SALIDA", const Color.fromARGB(255, 174, 81, 35)),
      chart(
          const Color.fromARGB(255, 221, 130, 88), const Color.fromARGB(255, 174, 95, 35)),
    ],
  );
}

Widget chartNt() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("NT EN SALIDA", const Color(0xff247FB2)),
      chart(const Color(0xff58ADDD), const Color(0xff247FB2)),
    ],
  );
}

Widget chartPt() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("PT EN SALIDA", const Color.fromARGB(255, 140, 36, 178)),
      chart(
          const Color.fromARGB(255, 183, 88, 221), const Color.fromARGB(255, 147, 36, 178)),
    ],
  );
}

Widget chartsSS() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("SS EN SALIDA", const Color(0xff6B24B2)),
      chart(const Color(0xffB584E6), const Color(0xff6B24B2)),
    ],
  );
}

Widget chartsDBO() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      chartsectionText("DBO EN SALIDA", const Color(0xff23AEA6)),
      chart(const Color(0xff62DFD8), const Color(0xff23AEA6)),
    ],
  );
}

class OptionTile extends StatefulWidget {
  final Function onChange;
  final String letra;
  final Color? colorTile;
  bool localState;
  OptionTile(
      {Key? key,
      required this.onChange,
      required this.localState,
      required this.letra,
      required this.colorTile})
      : super(key: key);

  @override
  OptionTileState createState() => OptionTileState();
}

class OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        dense: true,
        visualDensity: const VisualDensity(vertical: -3),
        title: Text(widget.letra,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
                fontSize: 15)),
        trailing: SizedBox(
          width: 20,
          child: Checkbox(
              activeColor: const Color(0xff9AA121),
              value: widget.localState,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              onChanged: (bool? state) {
                setState(() {
                  widget.localState = state!;
                  widget.onChange(widget.localState);
                });
              }),
        ),
        tileColor: widget.colorTile,
      ),
    );
  }
}
