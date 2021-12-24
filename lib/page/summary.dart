import 'package:app/provider/safe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
          child: ListView(children: [
        Text('${context.read<SafeModel>().get(0)}'),
        Text('${context.read<SafeModel>().get(1)}'),
        Text('${context.read<SafeModel>().get(2)}'),
        Text('${context.read<SafeModel>().get(3)}'),
        Text('${context.read<SafeModel>().get(4)}'),
        Text('${context.read<SafeModel>().get(5)}'),
      ])));

  //  void handleClick() {
  //    Navigator.pushNamed(context, SummaryPage.route);
  //  }
}
