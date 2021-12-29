import 'package:app/provider/taking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:intl/intl.dart';

class FinalisingTerminalPage extends StatefulWidget {
  const FinalisingTerminalPage({Key? key}) : super(key: key);

  @override
  _FinalisingTerminalPageState createState() => _FinalisingTerminalPageState();
}

class _FinalisingTerminalPageState extends State<FinalisingTerminalPage> {
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
          title: const Text('Bag Up Bank Taking'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  'Place bank takings into a paper bag, staple it, and write:\n\n• Your name\n• Today\'s date: ${DateFormat('dd/MM/yyyy').format(now)}\n• Total bank takings: \$${context.read<TakingModel>().getTotal.toStringAsFixed(2)}'))),
      Step(
          isActive: _index >= 1,
          title: const Text('Print Z-Read'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: Column(children: [
                const Text('Enter the following to the POS machine Z-Read\n'),
                makeTable(),
                Text(
                    'Total: \$${context.read<TakingModel>().getTotal.toStringAsFixed(2)}')
              ])))
    ];

    return Scaffold(
        appBar: AppBar(title: const Text('Finalising (Z-Read)')),
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
              Navigator.pushNamed(context, '/finalising_tablet');
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

  TableRow tableHeader() {
    return const TableRow(
        children: <Widget>[Text('Denomination'), Text('Count')]);
  }

  TableRow tableBody(String col1, String col2) {
    return TableRow(children: <Widget>[Text(col1), Text(col2)]);
  }

  Widget makeTable() {
    return Table(border: TableBorder.all(), children: <TableRow>[
      tableHeader(),
      tableBody('\$0.05',
          context.read<TakingModel>().getCoinCount(0).toStringAsFixed(0)),
      tableBody('\$0.10',
          context.read<TakingModel>().getCoinCount(1).toStringAsFixed(0)),
      tableBody('\$0.20',
          context.read<TakingModel>().getCoinCount(2).toStringAsFixed(0)),
      tableBody('\$0.50',
          context.read<TakingModel>().getCoinCount(3).toStringAsFixed(0)),
      tableBody('\$1.00',
          context.read<TakingModel>().getCoinCount(4).toStringAsFixed(0)),
      tableBody('\$2.00',
          context.read<TakingModel>().getCoinCount(5).toStringAsFixed(0)),
      tableBody('\$5.00',
          context.read<TakingModel>().getNoteCount(0).toStringAsFixed(0)),
      tableBody('\$10.00',
          context.read<TakingModel>().getNoteCount(1).toStringAsFixed(0)),
      tableBody('\$20.00',
          context.read<TakingModel>().getNoteCount(2).toStringAsFixed(0)),
      tableBody('\$50.00',
          context.read<TakingModel>().getNoteCount(3).toStringAsFixed(0)),
      tableBody('\$100.00',
          context.read<TakingModel>().getNoteCount(4).toStringAsFixed(0)),
    ]);
  }
}
