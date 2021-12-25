import 'package:app/provider/float_provider.dart';
import 'package:app/provider/safe_provider.dart';
import 'package:app/provider/taking_provider.dart';
import 'package:app/provider/till_provider.dart';
import 'package:app/widget/float_horizontal_spinbox.dart';
import 'package:app/widget/taking_horizontal_spinbox.dart';
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
          body: Scrollbar(
              child: ListView(children: [
            makeInstructionText(),
            FloatHorizontalSpinBox(6, '5 dollar'),
            FloatHorizontalSpinBox(7, '10 dollar'),
            FloatHorizontalSpinBox(8, '20 dollar'),
            FloatHorizontalSpinBox(9, '50 dollar'),
            FloatHorizontalSpinBox(10, '100 dollar'),
            Text(
                'Total: \$${context.watch<FloatModel>().getTotalNotes.toStringAsFixed(2)}'),
            makeButton()
          ]))));

  Widget makeInstructionText() {
    final double remainingFloatAmount = double.parse(
        (context.read<FloatModel>().float -
                context.read<FloatModel>().getTotalCoins)
            .toStringAsFixed(2));
    return Text(
        'Add \$${remainingFloatAmount.toStringAsFixed(2)} in notes to be in float');
  }

  Widget makeButton() {
    final double remainingFloatAmount = double.parse(
        (context.read<FloatModel>().float -
                context.read<FloatModel>().getTotalCoins)
            .toStringAsFixed(2));
    double floatTotalNotes = context.watch<FloatModel>().getTotalNotes;
    return ElevatedButton(
        onPressed: remainingFloatAmount == floatTotalNotes
            ? () {
                updateNoteTakings;
                Navigator.pushNamed(context, '/takings');
              }
            : null,
        child: const Text('Next'));
  }

  void updateNoteTakings() {
    List<double> notesInFloat = context.read<FloatModel>().getNoteCount;
    context.read<FloatModel>().removeNoteCount(notesInFloat);
  }

  Future<bool> updateCoinFloat() {
    List<double> takings = context.read<TakingModel>().getCoinCount;
    List<double> safeCoins = context.read<SafeModel>().getNumberOfCoins();
    List<double> tillCoins = context.read<TillModel>().getNumberOfCoins();

    List<double> totalFloatCoins = IterableZip([safeCoins, tillCoins, takings])
        .map((value) => value[0] + value[1] - value[2])
        .toList();

    context.read<FloatModel>().subtractCoinCount(totalFloatCoins);

    return Future.value(true);
  }
}
