import 'package:flutter/material.dart';

@immutable
class BarcodeResult {
  /// The barcode text.
  final String barcodeText;

  /// Barcode type in string.
  final String barcodeFormatString;

  /// The corresponding localization result.
  final BarcodeLocationResult barcodeLocation;

  BarcodeResult.fromJson(Map<dynamic, dynamic> json)
      : barcodeText = json['barcodeText'],
        barcodeFormatString = json['barcodeFormatString'],
        barcodeLocation = BarcodeLocationResult.fromJson(json['barcodeLocation']);
}

@immutable
class BarcodeLocationResult {
  /// The angle of a barcode. Values range from 0 to 360.
  final int angle;

  /// The coordinates of the quadrilateral points.
  final Quadrilateral location;

  BarcodeLocationResult.fromJson(Map<dynamic, dynamic> json)
      : angle = json['angle'],
        location = Quadrilateral.fromJson(json['location']);
}

class Quadrilateral {
  List<Point> points;

  Quadrilateral.fromJson(Map<dynamic, dynamic> json)
      : points = BarcodeUtilityTool.convertToPointsList(List<Map<dynamic, dynamic>>.from(json['pointsList']));
}

class Point {
  int x;
  int y;

  Point.fromJson(Map<dynamic, dynamic> json)
      : x = json['x'],
        y = json['y'];
}

class BarcodeUtilityTool {
  static List<BarcodeResult> convertToBarcodeResults(List<Map<dynamic, dynamic>> res) {
    return res.map((e) => BarcodeResult.fromJson(e)).toList();
  }

  static List<Point> convertToPointsList(List<Map<dynamic, dynamic>> points) {
    return points.map((e) => Point.fromJson(e)).toList();
  }
}
