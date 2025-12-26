import 'package:flutter/material.dart';

class AppRadius{
  AppRadius._();

  // App Border radius
  static final BorderRadius radius8   = BorderRadius.circular(8.0);
  static final BorderRadius radius12  = BorderRadius.circular(12.0);
  static final BorderRadius radius14   = BorderRadius.circular(14.0);
  static final BorderRadius radius16  = BorderRadius.circular(16.0);
  static final BorderRadius radius20 = BorderRadius.circular(20.0);
  static final BorderRadius radius24 = BorderRadius.circular(24.0);
  static final BorderRadius radius40    = BorderRadius.circular(40.0);
  static final BorderRadius radiusRounded  = BorderRadius.circular(99.0);
  static BorderRadius radius({required double value}) => BorderRadius.circular(value);

}