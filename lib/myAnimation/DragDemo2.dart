import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// draggable not response realtime so replacing by Position with Gesture
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drag app"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  double width = 100.0, height = 100.0;
  Offset position;

  @override
  void initState() {
    super.initState();
    position = Offset(0.0, height - 20);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: position.dx - 20,
          top: position.dy - 150,
          //top: position.dy - height + 20,
          child: GestureDetector(
            onPanDown: (details) {},
            onPanUpdate: (detials) {
              setState(() {
                position = detials.globalPosition;
              });
            },
            onPanEnd: (detail) {},
            child: Container(
              width: width,
              height: height,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Drag",
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
