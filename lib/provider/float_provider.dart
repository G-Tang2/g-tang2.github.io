import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class FloatModel with ChangeNotifier {
  // float is $800.
  double float = 800;
  int numberOfCoinDenominations = 6;

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
  List<double> _count = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  double get(int i) => _count[i];

  double get getTotal => IterableZip([value, _count])
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  double get getTotalCoins => IterableZip([value, _count])
      .take(numberOfCoinDenominations)
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  double get getTotalNotes => IterableZip([value, _count])
      .skip(6)
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  double get getRemainingFloatAmount => (float - getTotal);

  void set(int i, double n) {
    _count[i] = n;
    notifyListeners();
  }

  void addCoinCount(List<double> coinCount) {
    for (int i = 0; i < numberOfCoinDenominations; i += 1) {
      _count[i] = _count[i] + coinCount[i];
    }
  }
}
