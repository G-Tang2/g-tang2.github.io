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
      body: Scrollbar(
          child: ListView(children: [
        const Text('Enter the number coins and notes for each denomination.'),
        TillHorizontalSpinBox(0, '5 cents'),
        TillHorizontalSpinBox(1, '10 cents'),
        TillHorizontalSpinBox(2, '20 cents'),
        TillHorizontalSpinBox(3, '50 cents'),
        TillHorizontalSpinBox(4, '1 dollar'),
        TillHorizontalSpinBox(5, '2 dollar'),
        TillHorizontalSpinBox(6, '5 dollar'),
        TillHorizontalSpinBox(7, '10 dollar'),
        TillHorizontalSpinBox(8, '20 dollar'),
        TillHorizontalSpinBox(9, '50 dollar'),
        TillHorizontalSpinBox(10, '100 dollar'),
        Text(
            'Total: \$${context.watch<TillModel>().getTotal.toStringAsFixed(2)}'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/coin_float');
            },
            child: const Text('Next'))
      ])));

  //  void handleClick() {
  //    Navigator.pushNamed(context, TillPage.route);
  //  }
}
