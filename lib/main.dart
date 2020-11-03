import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: MyHomePage(title: 'Home page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      drawer: MyDraw(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        splashColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyDraw extends StatelessWidget{
  MyDraw(this.context):super();
  final BuildContext context;
  final double radial = 50;
  final snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.all(2),
            decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
                border: Border(),
                image: DecorationImage(
                  image: Image.network(
                      "https://9mobi.vn/cf/images/2015/03/nkk/anh-dep-1.jpg")
                      .image,
                ))),
            child: Center(
                child: CircleAvatar(
                  radius: radial,
                  backgroundColor: Colors.amber,
                  backgroundImage: NetworkImage(
                      "https://9mobi.vn/cf/images/2015/03/nkk/anh-dep-1.jpg"),
                )),
          ),
          ListTile(
            title: Text("Bills"),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            title: CaptionText("Hover text example"),
            onTap: () {
              Scaffold.of(this.context).showSnackBar(snackBar);
            },
          )
        ],
      ),
    );
  }
}

class CaptionText extends StatelessWidget {
  CaptionText(this.data) : super();
  String data = "TexttureTor";

  @override
  Widget build(BuildContext context) {
    return Text(data, style: TextStyle(fontSize: 20));
  }
}
