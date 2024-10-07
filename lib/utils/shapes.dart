import 'package:flutter/material.dart';

class MyShapes {
  RoundedRectangleBorder get myButtonBordershape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }

  // Rounded rectangle with custom radius
  RoundedRectangleBorder get roundedRectangleShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    );
  }

  // Circular shape
  CircleBorder get circularShape {
    return CircleBorder();
  }

  // Stadium shape (pill shape)
  StadiumBorder get stadiumShape {
    return StadiumBorder();
  }

  // Continuous rectangle with smooth corners
  ContinuousRectangleBorder get continuousRectangleShape {
    return ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    );
  }

  // Beveled rectangle shape (angled corners)
  BeveledRectangleBorder get beveledRectangleShape {
    return BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    );
  }

  // Rounded rectangle with a single corner radius (for asymmetric shapes)
  RoundedRectangleBorder get topLeftRoundedShape {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        bottomRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
        topRight: Radius.circular(25),
      ),
    );
  }

  // Trapezoid shape
  ShapeBorder get trapezoidShape {
    return ContinuousRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
      side: BorderSide(color: Colors.blueAccent, width: 2),
    );
  }

  // Diamond shape
  ShapeBorder get diamondShape {
    return BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30),
      side: BorderSide(color: Colors.deepOrange, width: 2),
    );
  }
}
