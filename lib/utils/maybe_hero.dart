import 'package:flutter/material.dart';

Widget maybeHero({required Widget child, required String? heroTag}) {
  if (heroTag != null) {
    return Hero(tag: heroTag, child: child);
  } else {
    return child;
  }
}
