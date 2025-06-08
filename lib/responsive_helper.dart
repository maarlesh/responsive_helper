library responsive_helper;

import 'package:flutter/material.dart';

class ResponsiveHelper {
  static late double _deviceWidth;
  static late double _deviceHeight;
  static const double referenceWidth = 1280.0;
  static const double referenceHeight = 800.0;
  static late double _scaleFactorWidth;
  static late double _scaleFactorHeight;
  static late double _appScaler;

  static Future<void> init(BuildContext context, {Future<String?> Function()? loadScale}) async {
    final Size size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    _deviceWidth = size.width;
    _deviceHeight = size.height - padding.top - padding.bottom;
    _scaleFactorWidth = _deviceWidth / referenceWidth;
    _scaleFactorHeight = _deviceHeight / referenceHeight;

    final scaleStr = await (loadScale?.call() ?? Future.value('1.0'));
    _appScaler = double.tryParse(scaleStr ?? '') ?? 1.0;
  }

  static double w(double value,
      {double min = double.negativeInfinity, double max = double.infinity}) {
    final scaled = value * _scaleFactorWidth * _appScaler;
    return scaled.clamp(min, max);
  }

  static double h(double value,
      {double min = double.negativeInfinity, double max = double.infinity}) {
    final scaled = value * _scaleFactorHeight * _appScaler;
    return scaled.clamp(min, max);
  }

  static double u(double value,
      {double min = double.negativeInfinity, double max = double.infinity}) {
    final scale = (_scaleFactorWidth + _scaleFactorHeight) / 2;
    final scaled = value * scale * _appScaler;
    return scaled.clamp(min, max);
  }

  static Size get deviceSize => Size(_deviceWidth, _deviceHeight);
  static double get appScaler => _appScaler;
}
