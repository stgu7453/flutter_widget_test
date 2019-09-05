import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/physics.dart';
import 'dart:math';

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
              Tab(
                child: DraggableCard(
                  child: FlutterLogo(
                    size: 128,
                  ),
                ),
              ),
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
            Tab(
              child: DraggableCard(
                child: FlutterLogo(
                  size: 128,
                ),
              ),
            ),
            Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton(
                      value: dropDownValue,
                      onChanged: (value){
                        setState(() {
                          dropDownValue = value;
                        });
                        switch(value){
                          case 0:
                            Navigator.pushNamed(context, "drawer_screen");
                            break;
                          case 1:
                            Navigator.pushNamed(context, "snackbar_screen");
                            break;
                          case 2:
                            print("2");
                            break;
                          default:
                            print("default");
                            break;
                        }

                      },
                      items: [
                        DropdownMenuItem(value: 0, child: Text("Drawer"),),
                        DropdownMenuItem(value: 1, child: Text("Snackbar"),),
                        DropdownMenuItem(value: 2, child: Text("Item2"),),
                      ],
                    ),
                    ContainerAnimationExample(),

                  ],
                ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  PopupMenuButton(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: "TextFormField",
                      keyboardType: TextInputType.emailAddress,
                      autovalidate: true,
                      validator: (value){
                        if(value.length < 5){
                          return "Too short!";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Tab(
              child: FadeExample(),
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


class DraggableCard extends StatefulWidget {
  final Widget child;

  DraggableCard({this.child});

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Alignment _dragAlignment = Alignment.center;

  Animation<Alignment> _animation;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.width;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30.0,
      stiffness: 1.0,
      damping: 1.0
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);

  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener((){
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size);
    return GestureDetector(
      onPanDown: (details){
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details){
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}


class FadeExample extends StatefulWidget {
  @override
  _FadeExampleState createState() => _FadeExampleState();
}

class _FadeExampleState extends State<FadeExample> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            height: 200.0,
            width: 200.0,
            color: Colors.blue,
          ),
        ),
        IconButton(
          onPressed: (){
            setState(() {
              _visible = !_visible;
            });
          },
          tooltip: 'Toggle Opacity',
          icon: Icon(Icons.flip),
        ),
      ],
    );
  }
}


class ContainerAnimationExample extends StatefulWidget {
  @override
  _ContainerAnimationExampleState createState() => _ContainerAnimationExampleState();
}

class _ContainerAnimationExampleState extends State<ContainerAnimationExample> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedContainer(
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _borderRadius,
        ),
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      ),
        FlatButton(
          child: Text("Animate"),
          onPressed: (){
            setState(() {
              final random = Random();
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              _color = Color.fromRGBO(
                  random.nextInt(256),
                  random.nextInt(256),
                  random.nextInt(256),
                  1
              );

              _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
        ),
      ],
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
