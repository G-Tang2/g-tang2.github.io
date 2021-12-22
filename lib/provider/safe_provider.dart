import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class SafeModel with ChangeNotifier {
  // This is for counting the number of rolls for each coin denominator for the safe.

  // value holds the dollar amount for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  static List<double> value = [2, 4, 4, 10, 20, 50];

  // count holds the amount of rolls for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  final List<double> _count = [0, 0, 0, 0, 0, 0];

  double get(int i) => _count[i];

  double get getTotal => IterableZip([value, _count])
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  void set(int i, double n) => _count[i] = n;
}
