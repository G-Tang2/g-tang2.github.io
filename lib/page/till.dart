import 'package:app/main.dart';
import 'package:app/provider/till_provider.dart';
import 'package:app/widget/till_horizontal_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class TillPage extends StatefulWidget {
  const TillPage({Key? key}) : super(key: key);

  @override
  _TillPageState createState() => _TillPageState();
}

class _TillPageState extends State<TillPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Till')),
      body: Column(children: [
        const Text('Enter the number coins and notes for each denomination.'),
        Expanded(
            child: Scrollbar(
                child: ListView(children: const [
          TillHorizontalSpinBox(0, '\$0.05', CashType.coin),
          TillHorizontalSpinBox(1, '\$0.10', CashType.coin),
          TillHorizontalSpinBox(2, '\$0.20', CashType.coin),
          TillHorizontalSpinBox(3, '\$0.50', CashType.coin),
          TillHorizontalSpinBox(4, '\$1.00', CashType.coin),
          TillHorizontalSpinBox(5, '\$2.00', CashType.coin),
          TillHorizontalSpinBox(0, '\$5.00', CashType.note),
          TillHorizontalSpinBox(1, '\$10.00', CashType.note),
          TillHorizontalSpinBox(2, '\$20.00', CashType.note),
          TillHorizontalSpinBox(3, '\$50.00', CashType.note),
          TillHorizontalSpinBox(4, '\$100.00', CashType.note)
        ]))),
        Text(
            'Total: \$${context.watch<TillModel>().getTotal.toStringAsFixed(2)}'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/coin_float');
            },
            child: const Text('Next'))
      ]));
}
