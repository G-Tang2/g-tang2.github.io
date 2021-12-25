import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class FloatModel with ChangeNotifier {
  // float is $800.
  double safeFloat = 400;
  double openingFloat = 400;

  // value holds the dollar amount for each coin and note denomination in ascending order.
  // ie. [five cents, ten cents, ..., fifty dollars, one hundred dollar]
  List<double> coinValue = [0.05, 0.10, 0.20, 0.50, 1.00, 2.00];
  List<double> noteValue = [5.00, 10.00, 20.00, 50.00, 100.00];

  // count holds the amount of rolls for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  List<double> coinCount = [0, 0, 0, 0, 0, 0];
  List<double> noteCount = [0, 0, 0, 0, 0];

  List<double> get getValue => coinValue + noteValue;
  List<double> get getCount => coinCount + noteCount;

  double getCoinCount(int i) => coinCount[i];
  double getNoteCount(int i) => noteCount[i];

  double get getTotalFloat => safeFloat + openingFloat;
  double get getSafeFloat => safeFloat;
  double get getOpeningFloat => openingFloat;

  double get getTotal {
    return IterableZip([getValue, getCount])
        .map((value) => value[0] * value[1])
        .reduce((value, element) => value + element);
  }

  List<double> get getAllCoinCount => coinCount;
  List<double> get getAllNoteCount => noteCount;

  double get getTotalCoins => IterableZip([coinValue, coinCount])
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  double get getTotalNotes => IterableZip([noteValue, noteCount])
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  double get getRemainingFloatAmount => (getTotalFloat - getTotal);

  void setCoinCount(int i, double n) {
    coinCount[i] = n;
    notifyListeners();
  }

  void setNoteCount(int i, double n) {
    noteCount[i] = n;
    notifyListeners();
  }

  void addCoinCount(List<double> count) {
    for (int i = 0; i < coinCount.length; i += 1) {
      coinCount[i] = coinCount[i] + count[i];
    }
  }

  void subtractCoinCount(List<double> count) {
    for (int i = 0; i < coinCount.length; i += 1) {
      coinCount[i] = coinCount[i] - count[i];
    }
  }

  void addNoteCount(List<double> count) {
    for (int i = 0; i < noteCount.length; i += 1) {
      noteCount[i] = noteCount[i] + count[i];
    }
  }

  void removeNoteCount(List<double> count) {
    for (int i = 0; i < noteCount.length; i += 1) {
      noteCount[i] = noteCount[i] - count[i];
    }
  }
}
