import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('End of Day Count'),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text('Begin'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SafeCountPage()));
        },
      )),
    );
  }
}

class SafeCountPage extends StatefulWidget {
  const SafeCountPage({Key? key}) : super(key: key);

  @override
  State<SafeCountPage> createState() => _SafeCountState();
}

class _SafeCountState extends State<SafeCountPage> {
  String dropdownValue = "1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Safe Count")),
        body: Center(
            child: Card(
          child: Row(
            children: <Widget>[
              const Text("50c"),
              DropdownButton<String>(
                value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>["1", "2", "3"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        )));
  }
}
