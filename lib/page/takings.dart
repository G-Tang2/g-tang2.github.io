import 'package:app/provider/safe_provider.dart';
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
        Text('${context.read<SafeModel>().get(0)}'),
        Text('${context.read<SafeModel>().get(1)}'),
        Text('${context.read<SafeModel>().get(2)}'),
        Text('${context.read<SafeModel>().get(3)}'),
        Text('${context.read<SafeModel>().get(4)}'),
        Text('${context.read<SafeModel>().get(5)}'),
      ])));

  //  void handleClick() {
  //    Navigator.pushNamed(context, TakingsPage.route);
  //  }
}
