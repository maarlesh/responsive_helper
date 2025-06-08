import 'package:flutter/material.dart';
import 'responsive_helper.dart';

extension ResponsiveValues on BuildContext {
  double w(double val) => ResponsiveHelper.w(val);
  double h(double val) => ResponsiveHelper.h(val);
  double u(double val) => ResponsiveHelper.u(val);
}
