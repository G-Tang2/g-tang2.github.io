import 'package:app/page/coin_float.dart';
import 'package:app/page/finalising_tablet.dart';
import 'package:app/page/home.dart';
import 'package:app/page/note_float.dart';
import 'package:app/page/safe.dart';
import 'package:app/page/finalising_terminal.dart';
import 'package:app/page/takings.dart';
import 'package:app/page/till.dart';
import 'package:app/provider/float_provider.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum CashType { coin, note }

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
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26)),
                    padding: const EdgeInsets.fromLTRB(50, 15, 50, 15)))),
        themeMode: ThemeMode.dark,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
          '/safe': (_) => const SafePage(),
          '/till': (_) => const TillPage(),
          '/coin_float': (_) => const CoinFloatPage(),
          '/note_float': (_) => const NoteFloatPage(),
          '/takings': (_) => const TakingsPage(),
          '/finalising': (_) => const FinalisingTerminalPage(),
          '/finalising_tablet': (_) => const FinalisingTabletPage(),
        });
  }
}
