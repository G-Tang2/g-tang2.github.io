import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class FloatModel with ChangeNotifier {
  // float is $800.
  double float = 800;

  // value holds the dollar amount for each coin and note denomination in ascending order.
  // ie. [five cents, ten cents, ..., fifty dollars, one hundred dollar]
  static List<double> coinValue = [0.05, 0.10, 0.20, 0.50, 1.00, 2.00];
  static List<double> noteValue = [5.00, 10.00, 20.00, 50.00, 100.00];

  // count holds the amount of rolls for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  List<double> coinCount = [0, 0, 0, 0, 0, 0];
  List<double> noteCount = [0, 0, 0, 0, 0];

  List<double> get getValue => coinValue + noteValue;
  List<double> get getCount => coinCount + noteCount;

  double get getTotal {
    return IterableZip([getValue, getCount])
        .map((value) => value[0] * value[1])
        .reduce((value, element) => value + element);
  }

  double get getTotalCoins => IterableZip([getValue, getCount])
      .take(coinCount.length)
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  double get getTotalNotes => IterableZip([getValue, getCount])
      .skip(6)
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  double get getRemainingFloatAmount => (float - getTotal);

  void set(int i, double n) {
    getCount[i] = n;
    notifyListeners();
  }

  void addCoinCount(List<double> additionalCoinCount) {
    for (int i = 0; i < coinCount.length; i += 1) {
      coinCount[i] = coinCount[i] + additionalCoinCount[i];
    }
  }

  void addNoteCount(List<double> additionalNoteCount) {
    for (int i = 0; i < noteCount.length; i += 1) {
      noteCount[i] = noteCount[i] + additionalNoteCount[i];
    }
  }
}
