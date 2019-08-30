import 'package:flutter/material.dart';
import 'package:smart_home/screens/menu_screen.dart';

class ListScreen extends StatelessWidget {
  static const String id = "list_screen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueGrey),
        home: SafeArea(
          child: Scaffold(
              body: ScrollScreen()
          ),
        ),
    );
  }
}
