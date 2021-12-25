import 'package:app/main.dart';
import 'package:app/provider/float_provider.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:app/widget/taking_horizontal_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:collection/collection.dart';

class CoinFloatPage extends StatefulWidget {
  const CoinFloatPage({Key? key}) : super(key: key);

  @override
  _CoinFloatPageState createState() => _CoinFloatPageState();
}

class _CoinFloatPageState extends State<CoinFloatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Coin Float')),
      body: Scrollbar(
          child: ListView(children: [
        Text('Remove \$${excessCoins().toStringAsFixed(2)}'),
        TakingHorizontalSpinBox(0, '5 cents', CashType.coin),
        TakingHorizontalSpinBox(1, '10 cents', CashType.coin),
        TakingHorizontalSpinBox(2, '20 cents', CashType.coin),
        TakingHorizontalSpinBox(3, '50 cents', CashType.coin),
        TakingHorizontalSpinBox(4, '1 dollar', CashType.coin),
        TakingHorizontalSpinBox(5, '2 dollar', CashType.coin),
        Text(
            'Total: \$${context.watch<TakingModel>().getTotalCoins.toStringAsFixed(2)}'),
        makeButton()
      ])));

  Widget makeButton() {
    double coinTakings = context.watch<TakingModel>().getTotalCoins;
    return ElevatedButton(
        onPressed: coinTakings == excessCoins()
            ? () {
                updateCoinFloat();
                Navigator.pushNamed(context, '/note_float');
              }
            : null,
        child: const Text('Next'));
  }

  void updateCoinFloat() {
    List<double> takings = context.read<TakingModel>().getAllCoinCount;
    List<double> safeCoins = context.read<SafeModel>().getAllCoinCount;
    List<double> tillCoins = context.read<TillModel>().getAllCoinCount;

    List<double> totalFloatCoins = IterableZip([safeCoins, tillCoins, takings])
        .map((value) => value[0] + value[1] - value[2])
        .toList();

    context.read<FloatModel>().addCoinCount(totalFloatCoins);
  }

  double excessCoins() {
    double totalCoins = context.read<SafeModel>().getTotal +
        context.read<TillModel>().getTotalCoins;
    return double.parse((totalCoins % 5).toStringAsFixed(2));
  }
}
