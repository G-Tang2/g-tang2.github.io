import 'package:app/page/coin_float.dart';
import 'package:app/page/home.dart';
import 'package:app/page/note_float.dart';
import 'package:app/page/safe.dart';
import 'package:app/page/summary.dart';
import 'package:app/page/till.dart';
import 'package:app/provider/float_provider.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SafeModel()),
    ChangeNotifierProvider(create: (context) => TillModel()),
    ChangeNotifierProvider(create: (context) => TakingModel()),
    ChangeNotifierProvider(create: (context) => FloatModel())
  ], child: const MyApp()));
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
          '/': (_) => const HomePage(),
          '/safe': (_) => const SafePage(),
          '/till': (_) => const TillPage(),
          '/coin_float': (_) => const CoinFloatPage(),
          '/note_float': (_) => const NoteFloatPage(),
          '/summary': (_) => const SummaryPage(),
        });
  }
}
