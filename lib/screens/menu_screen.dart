import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';

import 'package:smart_home/screens/list_screen.dart';

class MenuScreen extends StatelessWidget {
  static const String id = "menu_screen";

  @override
  Widget build(BuildContext context) {
    return MenuScreenAndroid2();
  }
}


class MenuScreenAndroid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.directions_transit),),
                Tab(icon: Icon(Icons.directions_bike),),
                Tab(icon: Icon(Icons.directions_walk),),
              ],
            ),
            title: Text("Tabs"),
          ),
          body: TabBarView(
            children: <Widget>[
              Tab(icon: Icon(Icons.directions_car),),
              Tab(icon: Icon(Icons.directions_transit),),
              Tab(icon: Icon(Icons.directions_bike),),
              Tab(
                child: PopupMenuButton(
                  onSelected: (result){
                    print(result);
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: "1",
                      child: Text("Item1"),
                    ),
                    PopupMenuItem(
                      value: "2",
                      child: Text("Item2"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class MenuScreenAndroid2 extends StatefulWidget {
  @override
  _MenuScreenAndroid2State createState() => _MenuScreenAndroid2State();
}

class _MenuScreenAndroid2State extends State<MenuScreenAndroid2> {
  int dropDownValue = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton(
            child: Icon(Icons.menu),
            onSelected: (result){
              print(result);
              if(result == "1"){
                print("action1");
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "1",
                child: Text("Item1"),
              ),
              PopupMenuItem(
                value: "2",
                child: Text("Item2"),
              ),
            ],
          ),
          title:Text("Tabs bottom"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                print("Pressed");
              },
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Colors.blueGrey,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.home, color: Colors.blueGrey),),
            Tab(icon: Image.asset("assets/icons/watering-a-plant.png", color: Colors.blueGrey, height: 40.0,)),
            Tab(icon: Image.asset("assets/icons/humidity.png", color: Colors.blueGrey, height: 30.0,)),
            Tab(icon: Icon(Icons.show_chart, color: Colors.blueGrey),),
            Tab(icon: Icon(Icons.settings, color: Colors.blueGrey),),
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            Tab(icon: Icon(Icons.directions_car),),
            Tab(
                child: DropdownButton(
                  value: dropDownValue,
                  onChanged: (value){
                    setState(() {
                      dropDownValue = value;
                    });
                  },
                  items: [
                    DropdownMenuItem(value: 0, child: Text("Item0"),),
                    DropdownMenuItem(value: 1, child: Text("Item1"),),
                    DropdownMenuItem(value: 2, child: Text("Item2"),),
                  ],
                ),
            ),
            Tab(
              child: PopupMenuButton(
                child: Icon(Icons.menu),
                onSelected: (result){
                  print(result);
                  if(result == "1"){
                    print("action1");
                    Navigator.pushNamed(context, ListScreen.id);
                  }

                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: "1",
                    child: Text("Item1"),
                  ),
                  PopupMenuItem(
                    value: "2",
                    child: Text("Item2"),
                  ),
                ],
              ),
            ),
            Tab(
              child: Text("watering"),
            ),
            Tab(
              child: ScrollScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: true,
            pinned: false,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Humidity",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                )),
          ),
        ];
      },
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),
            ListTile(
              title: Text("1"),
            ),

          ],
        ),
      ),
    );
  }
}






class MenuScreenIos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.check_mark),
              title: Text("1"),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              title: Text("2"),
            ),
          ],
        ),
        tabBuilder: (context, index){
          print(index);
          return CupertinoTabView(
            builder: (context){
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text("Tab1"),
                ),
                child: Container(
                  child: Text("Tab"),
                ),
              );
            },
          );
        },
    );
  }
}
