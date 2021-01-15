import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// // Aligment not response exactly location so replacing by Position with Gesture
class PhysicsCardDragDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableCard(
        child: FlutterLogo(
          size: 128,
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

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  Offset position;

  @override
  void initState() {
    setState(() {
      position = Offset(0, 0);
    });
  }

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: GestureDetector(
          onPanDown: (details) {},
          onPanUpdate: (detials) {
            setState(() {
              position = detials.globalPosition;
            });
          },
          onPanEnd: (detail) {},
          child:  Card(
            child:
            widget.child,
          ),
        ));
  }
}
