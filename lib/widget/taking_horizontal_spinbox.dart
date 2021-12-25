import 'package:app/main.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/src/provider.dart';

class TakingHorizontalSpinBox extends StatelessWidget {
  int i;
  String label;
  CashType type;
  double value = 0;

  TakingHorizontalSpinBox(this.i, this.label, this.type, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: SpinBox(
        value: type == CashType.coin
            ? context.watch<TakingModel>().getCoinCount(i)
            : context.watch<TakingModel>().getNoteCount(i),
        decoration: InputDecoration(labelText: label),
        onChanged: (value) => {updateValue(context, value)},
      ),
      padding: const EdgeInsets.all(16),
    );
  }

  void updateValue(BuildContext context, double value) {
    if (type == CashType.coin) {
      context.read<TakingModel>().setCoinCount(i, value);
    } else {
      context.read<TakingModel>().setNoteCount(i, value);
    }
  }
}
