import 'package:app/provider/safe_provider.dart';
import 'package:app/widget/safe_horizontal_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SafePage extends StatefulWidget {
  const SafePage({Key? key}) : super(key: key);

  @override
  _SafePageState createState() => _SafePageState();
}

class _SafePageState extends State<SafePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Safe')),
        body: Column(children: [
          const Text('Enter the number of rolls for each coin denomination.'),
          Expanded(
              child: Scrollbar(
                  child: ListView(children: const [
            SafeHorizontalSpinBox(0, '\$0.05'),
            SafeHorizontalSpinBox(1, '\$0.10'),
            SafeHorizontalSpinBox(2, '\$0.20'),
            SafeHorizontalSpinBox(3, '\$0.50'),
            SafeHorizontalSpinBox(4, '\$1.00'),
            SafeHorizontalSpinBox(5, '\$2.00')
          ]))),
          Text(
              'Total: \$${context.watch<SafeModel>().getTotal.toStringAsFixed(2)}'),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/till');
              },
              child: const Text('Next'))
        ]),
      );

  // @override
  // Widget build(BuildContext context) => Scaffold(
  //     appBar: AppBar(title: const Text('Safe')),
  //     body: Column(children: [
  //       Scrollbar(
  //           child: ListView(children: [
  //         const Text('Enter the number of rolls for each coin denomination.'),
  //         const SafeHorizontalSpinBox(0, '\$0.05'),
  //         const SafeHorizontalSpinBox(1, '\$0.10'),
  //         const SafeHorizontalSpinBox(2, '\$0.20'),
  //         const SafeHorizontalSpinBox(3, '\$0.50'),
  //         const SafeHorizontalSpinBox(4, '\$1.00'),
  //         const SafeHorizontalSpinBox(5, '\$2.00')
  //       ])),
  //       Text(
  //           'Total: \$${context.watch<SafeModel>().getTotal.toStringAsFixed(2)}'),
  //       ElevatedButton(
  //           onPressed: () {
  //             Navigator.pushNamed(context, '/till');
  //           },
  //           child: const Text('Next'))
  //     ]));
}
