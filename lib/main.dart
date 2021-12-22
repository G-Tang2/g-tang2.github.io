import 'package:app/page/home.dart';
import 'package:app/page/safe.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => SafeModel())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cash Counting',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/safe': (context) => const SafePage(),
        });
  }
}
