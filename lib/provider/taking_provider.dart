import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class TakingModel with ChangeNotifier {
  // This is for counting the number of rolls for each coin denomination for the safe.

  // value holds the dollar amount for each coin and note denomination in ascending order.
  // ie. [five cents, ten cents, ..., fifty dollars, one hundred dollar]
  static List<double> value = [
    0.05,
    0.10,
    0.20,
    0.50,
    1.00,
    2.00,
    5.00,
    10.00,
    20.00,
    50.00,
    100.00
  ];

  // count holds the amount of rolls for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  final List<double> _count = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  double get(int i) => _count[i];

  List<double> get getCoinCount => _count.take(6).toList();

  double get getTotal => double.parse(IterableZip([value, _count])
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element)
      .toStringAsFixed(2));

  double get getTotalCoins => double.parse(IterableZip([value, _count])
      .take(6)
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element)
      .toStringAsFixed(2));

  double get getTotalNotes => double.parse(IterableZip([value, _count])
      .skip(6)
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element)
      .toStringAsFixed(2));

  void set(int i, double n) {
    _count[i] = n;
    notifyListeners();
  }
}
