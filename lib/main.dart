import 'package:flutter/material.dart';

import 'package:smart_home/screens/menu_screen.dart';
import 'package:smart_home/screens/list_screen.dart';

void main() => runApp(SmartApartment());

class SmartApartment extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartApartment',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        fontFamily: 'PontanoSans',
        focusColor: Colors.redAccent,
      ),
      initialRoute: MenuScreen.id,
      routes: {
        MenuScreen.id: (context) => MenuScreen(),
        ListScreen.id: (context) => ListScreen()
      },
    );
  }
}
