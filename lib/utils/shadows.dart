import 'package:flutter/material.dart';

List<BoxShadow> _bottomMediumShadow() {
  return [
    const BoxShadow(
      color: Colors.black12,
      offset: Offset(2.0, 5.0), //(x,y)
      blurRadius: 8.0,
    ),
  ];
}

List<BoxShadow> _topMediumShadow() {
  return [
    const BoxShadow(
      color: Colors.black12,
      offset: Offset(-2.0, -5.0), //(x,y)
      blurRadius: 8.0,
    ),
  ];
}

List<BoxShadow> _bottomLightShadow() {
  return [
    const BoxShadow(
      color: Colors.black12,
      offset: Offset(1.0, 3.0), //(x,y)
      blurRadius: 4.0,
    ),
  ];
}

List<BoxShadow> kTopMediumShadow = _topMediumShadow();
List<BoxShadow> kBottomMediumShadow = _bottomMediumShadow();
List<BoxShadow> kBottomLightShadow = _bottomLightShadow();
