import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';

class HorizontalSpinBox extends StatelessWidget {
  const HorizontalSpinBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: SpinBox(
        value: 10,
        decoration: const InputDecoration(labelText: 'Basic'),
      ),
      padding: const EdgeInsets.all(16),
    );
  }
}
