
import 'package:flutter/material.dart';
class MyAnimation {
  SlideTransition getAnimation(animation, child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;

    var tween = Tween(begin: begin, end: end);
    var curve = Curves.ease;
    var curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );

    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }

  SlideTransition start2EndAnimation(animation, child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var tween = Tween(begin: begin, end: end);

    var offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  SlideTransition start2EndAnimationWithCurve(animation, child) {
    var begin = Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.easeInOutCirc;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    var offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}