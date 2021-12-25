import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class TillModel with ChangeNotifier {
  // This is for counting the number of rolls for each coin denomination for the safe.

  // value holds the dollar amount for each coin and note denomination in ascending order.
  // ie. [five cents, ten cents, ..., fifty dollars, one hundred dollar]
  List<double> coinValue = [0.05, 0.10, 0.20, 0.50, 1.00, 2.00];
  List<double> noteValue = [5.00, 10.00, 20.00, 50.00, 100.00];

  // count holds the amount of rolls for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  List<double> coinCount = [0, 0, 0, 0, 0, 0];
  List<double> noteCount = [0, 0, 0, 0, 0];

  double getCoinCount(int i) => coinCount[i];
  double getNoteCount(int i) => noteCount[i];

  List<double> get getAllCoinCount => coinCount.toList();
  List<double> get getAllNoteCount => noteCount.toList();

  double get getTotal =>
      IterableZip([coinValue + noteValue, coinCount + noteCount])
          .map((value) => value[0] * value[1])
          .reduce((value, element) => value + element);

  double get getTotalCoins => IterableZip([coinValue, coinCount])
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  void setCoinCount(int i, double n) {
    coinCount[i] = n;
    notifyListeners();
  }

  void setNoteCount(int i, double n) {
    noteCount[i] = n;
    notifyListeners();
  }
}
