import 'package:flutter/material.dart';

class MallsPage extends StatelessWidget {
  const MallsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBarLogo());
  }
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
