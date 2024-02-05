import 'package:flutter/material.dart';

class AppDefaults {
  static const double size = 15.0;
  static const double radius = size;
  static const double margin = size;
  static const double padding = size;

  static const SizedBox gap = SizedBox.square(dimension: size);
  static const SizedBox gapS = SizedBox.square(dimension: size - 4);
  static const SizedBox gapM = SizedBox.square(dimension: size - 7);
  static const SizedBox gapXL = SizedBox.square(dimension: size + 17);

  static BorderRadius borderRadius = BorderRadius.circular(radius);

  static BorderRadius bottomSheetRadius = const BorderRadius.only(
    topLeft: Radius.circular(radius),
    topRight: Radius.circular(radius),
  );

  static BorderRadius topSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(radius),
    bottomRight: Radius.circular(radius),
  );

  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.04),
    ),
  ];

  static Duration duration = const Duration(milliseconds: 300);
}
