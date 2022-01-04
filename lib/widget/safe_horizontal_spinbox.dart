import 'package:app/provider/safe_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:provider/src/provider.dart';

class SafeHorizontalSpinBox extends StatelessWidget {
  final int i;
  final String label;

  const SafeHorizontalSpinBox(this.i, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: SpinBox(
        value: context.watch<SafeModel>().get(i),
        decoration: InputDecoration(labelText: label),
        onChanged: (value) => {updateValue(context, value)},
      ),
      padding: const EdgeInsets.all(16),
    );
  }

  void updateValue(BuildContext context, double value) {
    context.read<SafeModel>().set(i, value);
  }
}
