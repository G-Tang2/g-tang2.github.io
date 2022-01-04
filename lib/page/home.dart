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
        body: Column(
          children: [
            Expanded(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                  Text(
                    'Cash Counting',
                    style: TextStyle(fontSize: 38),
                  ),
                  Text('Made For Sushi Sushi',
                      style: TextStyle(color: Colors.grey))
                ]))),
            Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/safe');
                  },
                  child: const Text('Start', style: TextStyle(fontSize: 18)),
                ),
                margin: const EdgeInsets.all(50))
          ],
        ),
      );
}
