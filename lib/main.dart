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
      body: BodyPage(_counter),
      drawer: MyDrawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        splashColor: Colors.amber,
        child: Icon(Icons.add),
      ),
    );
  }
}

class BodyPage extends StatelessWidget {
  BodyPage(this._counter) : super();
  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

class MyDrawer extends StatelessWidget {
  MyDrawer(this.context) : super();
  final BuildContext context;
  final double radial = 80;
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
            // decoration: CircleDecor("https://9mobi.vn/cf/images/2015/03/nkk/anh-dep-1.jpg").build(),
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: CircleImage("", radial: 80,),
          ),
          ListTile(
            title: Text("Bills"),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            title: CaptionText(
              "Hover text example",
              fontsize: 30,
            ),
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
  CaptionText(this.data,
      {this.fontsize,
      this.color,
      this.bold,
      this.paddingBox = 0,
      this.alignText = TextAlign.center})
      : super();
  final String data;
  final double fontsize;
  final double paddingBox;
  final Color color;
  final TextAlign alignText;
  final FontWeight bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(this.paddingBox),
      child: Text(
        data,
        style: TextStyle(
            fontSize: this.fontsize, color: this.color, fontWeight: this.bold),
        textAlign: this.alignText,
      ),
    );
  }
}
class CircleDecor {
  CircleDecor(this.url, {this.color}) : super();
  final String url;
  final Color color;

  @override
  Decoration build() {
    return ShapeDecoration.fromBoxDecoration(BoxDecoration(
            shape: BoxShape.circle,
            color: this.color,
            image: DecorationImage(image: NetworkImage(this.url))));
  }
}

class CircleImage extends StatelessWidget{
  CircleImage(this.data, {this.radial,this.color, this.url=""}):super();
  final String data;
  final String url;
  final double radial;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircleAvatar(
          child: CaptionText(
            this.data,
            fontsize: 20,
            color: Colors.amber,
          ),
          radius: this.radial,
          backgroundColor: this.color,
          backgroundImage: NetworkImage(this.url),
        ));
  }
}
