import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String id = "snackbar_screen";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SnackBarPage(),
      ),
    );
  }
}


class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Show Snackbar"),
        onPressed: (){
          print("Pressed!");
          final snackBar = SnackBar(
            content: Text("Yey! A Snackbar!"),
            action: SnackBarAction(
              label: "Undo",
              onPressed: (){
                print("Pressed undo!");
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);

        },
      ),
    );
  }
}
