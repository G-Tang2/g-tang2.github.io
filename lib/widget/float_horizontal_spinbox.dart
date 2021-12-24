import 'package:app/provider/float_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/src/provider.dart';

class FloatHorizontalSpinBox extends StatelessWidget {
  int i;
  String label;
  double value = 0;

  FloatHorizontalSpinBox(this.i, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: SpinBox(
        value: value,
        decoration: InputDecoration(labelText: label),
        onChanged: (value) => {updateValue(context, value)},
      ),
      padding: const EdgeInsets.all(16),
    );
  }

  void updateValue(BuildContext context, double value) {
    context.read<FloatModel>().set(i, value);
  }
}
