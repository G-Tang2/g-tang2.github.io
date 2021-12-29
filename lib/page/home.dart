import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
        child: Column(
          children: [
            const Expanded(child: Text('Cash Counting')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/safe');
                },
                child: const Text('Start'))
          ],
        ),
      ));
}
