import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

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
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Takings')),
      body: Scrollbar(
          child: ListView(children: [
        Text('Confirm you have these amounts for the bank taking.'),
        makeTable()
      ])));

  Widget makeTable() {
    return Table(border: TableBorder.all(), children: <TableRow>[
      tableHeader(),
      tableBody('5 cents', '${context.read<TakingModel>().get(0)}'),
      tableBody('10 cents', '${context.read<TakingModel>().get(1)}'),
      tableBody('20 cents', '${context.read<TakingModel>().get(2)}'),
      tableBody('50 cents', '${context.read<TakingModel>().get(3)}'),
      tableBody('1 dollar', '${context.read<TakingModel>().get(4)}'),
      tableBody('2 dollar', '${context.read<TakingModel>().get(5)}'),
      tableBody('5 dollar', '${context.read<TakingModel>().get(6)}'),
      tableBody('10 dollar', '${context.read<TakingModel>().get(7)}'),
      tableBody('20 dollar', '${context.read<TakingModel>().get(8)}'),
      tableBody('50 dollar', '${context.read<TakingModel>().get(9)}'),
      tableBody('100 dollar', '${context.read<TakingModel>().get(10)}'),
    ]);
  }

  TableRow tableHeader() {
    return const TableRow(
        children: <Widget>[Text('Denomination'), Text('Count')]);
  }

  TableRow tableBody(String col1, String col2) {
    return TableRow(children: <Widget>[Text(col1), Text(col2)]);
  }

  //  void handleClick() {
  //    Navigator.pushNamed(context, TakingsPage.route);
  //  }
}
