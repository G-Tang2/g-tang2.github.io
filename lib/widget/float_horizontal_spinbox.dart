import 'package:app/main.dart';
import 'package:app/provider/float_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/src/provider.dart';

class FloatHorizontalSpinBox extends StatelessWidget {
  final int i;
  final String label;
  final CashType type;

  const FloatHorizontalSpinBox(this.i, this.label, this.type, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: SpinBox(
        value: type == CashType.coin
            ? context.watch<FloatModel>().getCoinCount(i)
            : context.watch<FloatModel>().getNoteCount(i),
        decoration: InputDecoration(labelText: label),
        onChanged: (value) => {updateValue(context, value)},
      ),
      padding: const EdgeInsets.all(16),
    );
  }

  void updateValue(BuildContext context, double value) {
    if (type == CashType.coin) {
      context.read<FloatModel>().setCoinCount(i, value);
    } else {
      context.read<FloatModel>().setNoteCount(i, value);
    }
  }
}
