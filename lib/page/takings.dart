import 'package:app/provider/float_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:collection/collection.dart';

class TakingsPage extends StatefulWidget {
  const TakingsPage({Key? key}) : super(key: key);

  @override
  _TakingsPageState createState() => _TakingsPageState();
}

class _TakingsPageState extends State<TakingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        return updateNoteTakings();
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Takings')),
          body: Scrollbar(
              child: ListView(children: [
            const Text('Confirm you have these amounts for the bank taking.'),
            makeTable(),
            Text(
                'Total: \$${context.read<TakingModel>().getTotal.toStringAsFixed(2)}'),
            makeButton()
          ]))));

  Widget makeButton() {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/finalising');
        },
        child: const Text('Confirm'));
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

  TableRow tableHeader() {
    return const TableRow(
        children: <Widget>[Text('Denomination'), Text('Count')]);
  }

  TableRow tableBody(String col1, String col2) {
    return TableRow(children: <Widget>[Text(col1), Text(col2)]);
  }

  Future<bool> updateNoteTakings() {
    List<double> notesInFloat = context.read<FloatModel>().getAllNoteCount;
    List<double> notesInTill = context.read<TillModel>().getAllNoteCount;
    List<double> notesInTakings = IterableZip([notesInTill, notesInFloat])
        .map((value) => value[0] - value[1])
        .toList();
    context.read<TakingModel>().subtractNoteCount(notesInTakings);
    return Future.value(true);
  }
}
