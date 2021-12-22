import 'package:app/provider/safe_provider.dart';
import 'package:app/widget/horizontal_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
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
      appBar: AppBar(),
      body: Scrollbar(
          child: ListView(children: [
        HorizontalSpinBox(0, '5 cents'),
        HorizontalSpinBox(1, '10 cents'),
        HorizontalSpinBox(2, '20 cents'),
        HorizontalSpinBox(3, '50 cents'),
        HorizontalSpinBox(4, '1 dollar'),
        HorizontalSpinBox(5, '2 dollar'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/summary');
            },
            child: const Text('Summary'))
      ])));

  //  void handleClick() {
  //    Navigator.pushNamed(context, SafePage.route);
  //  }
}
