import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  static const String id = "drawer_screen";

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text("Drawer Header", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text("Item1"),
                onTap: (){
                  print("Item1");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Item2"),
                onTap: (){
                  print("Item2");
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text("Body Content"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.settings, color: Colors.white,),
          backgroundColor: Colors.blueGrey,
          onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          }
          ,
        ),
      ),
    );
  }
}
