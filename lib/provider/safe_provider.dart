import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class SafeModel with ChangeNotifier {
  // This is for counting the number of rolls for each coin denominator for the safe.

  // value holds the dollar amount for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  static List<int> value = [2, 4, 4, 10, 20, 50];

  // count holds the amount of rolls for each coin denominator in ascending order.
  // ie. [five cents, ten cents, ..., two dollars]
  final List<int> _count = [0, 0, 0, 0, 0, 0];

  int get getFiveCent => _count[0];
  int get getTenCent => _count[1];
  int get getTwentyCent => _count[2];
  int get getFiftyCent => _count[3];
  int get getOneDollar => _count[4];
  int get getTwoDollar => _count[5];

  int get getTotal => IterableZip([value, _count])
      .map((value) => value[0] * value[1])
      .reduce((value, element) => value + element);

  set setFiveCent(int n) => _count[0] = n;
  set setTenCent(int n) => _count[1] = n;
  set setTwentyCent(int n) => _count[2] = n;
  set setFiftyCent(int n) => _count[3] = n;
  set setOneDollar(int n) => _count[4] = n;
  set setTwoDollar(int n) => _count[5] = n;
}
