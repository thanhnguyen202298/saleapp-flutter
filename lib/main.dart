import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'file:///F:/project_flutter/sale_app/lib/myAnimation/Animation.dart';
import 'myAnimation/DragDemo2.dart';

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
              decoration: RectangleDecor("").build(),
              // decoration: CircleDecor("https://9mobi.vn/cf/images/2015/03/nkk/anh-dep-1.jpg").build(),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child:
                    // Container(decoration: CircleDecor("https://9mobi.vn/cf/images/2015/03/nkk/anh-dep-1.jpg").build(),)

                    CircleImage(
                  "nguyen thanh",
                  radial: 60,
                  color: Color.fromRGBO(30, 100, 255, 1),
                  url: "https://9mobi.vn/cf/images/2015/03/nkk/anh-dep-1.jpg",
                ),
              )),
          ListTile(
            title: Text("Bills"),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            title: CaptionText("Hover text example"),
            onTap: () {
              Scaffold.of(this.context).showSnackBar(snackBar);
            },
          ),
          ListTile(
            title: CaptionText("page 2"),
            onTap: () {
              Navigator.push(context, _createRoute());
            },
          )
        ],
      ),
    );
  }
}

///view custom background, image, avatar
class MenuBuider {
  MenuBuider();
// final List<String>
}

class ImageLoad {
  ImageProvider _checkUrlImage(String data) {
    if (data.contains("http://") || data.contains("https://")) {
      return NetworkImage(data);
    }
    return Image.asset(data).image;
  }
}

class CaptionText extends StatelessWidget {
  CaptionText(this.data,
      {this.fontsize,
      this.color,
      this.bold,
      this.paddingBox = 0,
      this.alignText = TextAlign.start})
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

class CircleDecor with ImageLoad {
  CircleDecor(this.url, {this.color}) : super();
  final String url;
  final Color color;

  @override
  Decoration build() {
    return ShapeDecoration.fromBoxDecoration(BoxDecoration(
        shape: BoxShape.circle,
        color: this.color,
        image: DecorationImage(image: _checkUrlImage(this.url))));
  }
}

class RectangleDecor with ImageLoad {
  RectangleDecor(this.url,
      {this.round = 0, this.color = Colors.lightBlueAccent});

  final String url;
  final Color color;
  final double round;

  @override
  Decoration build() {
    return ShapeDecoration.fromBoxDecoration(BoxDecoration(
        borderRadius: BorderRadius.circular(round),
        shape: BoxShape.rectangle,
        color: this.color,
        image: DecorationImage(image: _checkUrlImage(this.url))));
  }
}

class CircleImage extends StatelessWidget with ImageLoad {
  CircleImage(this.data, {this.radial = 5, this.color, this.url = ""})
      : super();
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
      backgroundImage: _checkUrlImage(this.url),
    ));
  }
}

//navigation & pages

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return MyAnimation().start2EndAnimation(animation, child);
    },
  );
}