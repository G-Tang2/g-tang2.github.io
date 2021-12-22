import 'package:flutter/material.dart';

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
          body: Center(
        child: Column(
          children: [
            const Expanded(child: Text('Safe Counting')),
            ElevatedButton(onPressed: () {}, child: const Text('Start'))
          ],
        ),
      ));

  //  void handleClick() {
  //    Navigator.pushNamed(context, SafePage.route);
  //  }

}
