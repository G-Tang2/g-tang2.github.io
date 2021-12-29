import 'package:app/provider/float_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class FinalisingTabletPage extends StatefulWidget {
  const FinalisingTabletPage({Key? key}) : super(key: key);

  @override
  _FinalisingTabletPageState createState() => _FinalisingTabletPageState();
}

class _FinalisingTabletPageState extends State<FinalisingTabletPage> {
  int _index = 0;
  final DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Step> stepList = <Step>[
      Step(
          isActive: _index >= 0,
          title: const Text('Safe Float'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Enter safe float as \$${context.read<FloatModel>().getOpeningFloat.toStringAsFixed(2)}'))),
      Step(
          isActive: _index >= 1,
          title: const Text('Till (w/ Opening Float)'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Text(
                'Enter till count with opening float as \$${(context.read<TakingModel>().getTotal + context.read<FloatModel>().getOpeningFloat).toStringAsFixed(2)}'),
          )),
      Step(
          isActive: _index >= 2,
          title: const Text('Petty Cash'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
                'Enter any petty cash if applicable. Petty cash are small business expenses and receipts can be found in the cash registers.'),
          )),
      Step(
          isActive: _index >= 3,
          title: const Text('Confirmation'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Confirm everything is completed.'),
          ))
    ];

    return Scaffold(
        appBar: AppBar(title: const Text('Finalising (Tablet)')),
        body: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < stepList.length - 1) {
              setState(() {
                _index += 1;
              });
            } else {
              const snackBar = SnackBar(content: Text('Counting finished. :)'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.popUntil(context, ModalRoute.withName('/'));
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: stepList,
        ));
  }
}
