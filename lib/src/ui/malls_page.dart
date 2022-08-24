import 'package:flutter/material.dart';

class MallsPage extends StatelessWidget {
  const MallsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
        toolbarHeight: 80,
        backgroundColor: Color(0xff414141),
        elevation: 0.0,
        leadingWidth: 300,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            "assets/images/logo_appbar.png",
          ),
        ),
      ),
    ));
  }
}