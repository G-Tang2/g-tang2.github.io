import 'package:app/main.dart';
import 'package:app/provider/float_provider.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:app/widget/float_horizontal_spinbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:collection/collection.dart';

class NoteFloatPage extends StatefulWidget {
  const NoteFloatPage({Key? key}) : super(key: key);

  @override
  _NotenFloatPageState createState() => _NotenFloatPageState();
}

class _NotenFloatPageState extends State<NoteFloatPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
      onWillPop: () async {
        return updateCoinFloat();
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('Note Float')),
          body: Column(children: [
            makeInstructionText(),
            Expanded(
                child: Scrollbar(
                    child: ListView(children: const [
              FloatHorizontalSpinBox(0, '\$5.00', CashType.note),
              FloatHorizontalSpinBox(1, '\$10.00', CashType.note),
              FloatHorizontalSpinBox(2, '\$20.00', CashType.note),
              FloatHorizontalSpinBox(3, '\$50.00', CashType.note),
              FloatHorizontalSpinBox(4, '\$100.00', CashType.note),
            ]))),
            Text(
                'Total: \$${context.watch<FloatModel>().getTotalNotes.toStringAsFixed(2)}'),
            makeButton()
          ])));

  Widget makeInstructionText() {
    final double remainingFloatAmount = double.parse(
        (context.read<FloatModel>().getTotalFloat -
                context.read<FloatModel>().getTotalCoins)
            .toStringAsFixed(2));
    return Text(
        'Remove \$${remainingFloatAmount.toStringAsFixed(2)} in notes from the till and add it to the float, the remaining will be for the bank takings.\n\nEnter the amount removed below.');
  }

  Widget makeButton() {
    final double remainingFloatAmount = double.parse(
        (context.read<FloatModel>().getTotalFloat -
                context.read<FloatModel>().getTotalCoins)
            .toStringAsFixed(2));
    double floatTotalNotes = context.watch<FloatModel>().getTotalNotes;
    return ElevatedButton(
        onPressed: remainingFloatAmount == floatTotalNotes
            ? () {
                updateNoteTakings();
                Navigator.pushNamed(context, '/takings');
              }
            : null,
        child: const Text('Next'));
  }

  void updateNoteTakings() {
    List<double> notesInTill = context.read<TillModel>().getAllNoteCount;
    List<double> notesInFloat = context.read<FloatModel>().getAllNoteCount;
    List<double> notesInTakings = IterableZip([notesInTill, notesInFloat])
        .map((value) => value[0] - value[1])
        .toList();
    context.read<TakingModel>().addNoteCount(notesInTakings);
  }

  Future<bool> updateCoinFloat() {
    List<double> takings = context.read<TakingModel>().getAllCoinCount;
    List<double> safeCoins = context.read<SafeModel>().getAllCoinCount;
    List<double> tillCoins = context.read<TillModel>().getAllCoinCount;

    List<double> totalFloatCoins = IterableZip([safeCoins, tillCoins, takings])
        .map((value) => value[0] + value[1] - value[2])
        .toList();

    context.read<FloatModel>().subtractCoinCount(totalFloatCoins);

    return Future.value(true);
  }
}
