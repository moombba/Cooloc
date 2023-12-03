import 'package:afgf_front/models/task/task.dart';
import 'package:afgf_front/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopUpContent extends StatefulWidget {
  PopUpContent({
    super.key,
    required this.items,
    required this.dayItems,
  });

  final TextEditingController _textFieldController = TextEditingController();
  final List<DropdownMenuItem<int>> items;
  final List<DropdownMenuItem<int>> dayItems;

  @override
  State<PopUpContent> createState() => _PopUpContentState();
}

class _PopUpContentState extends State<PopUpContent> {
  int monthValue = 0;
  int dayValue = 0;
  double _sliderValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: widget._textFieldController,
              decoration: const InputDecoration(
                labelText: 'Nom de la tâche',
              ),
            ),
            Row(
              children: [
                const Text("Poids de la tâche"),
                Slider(
                  value: _sliderValue,
                  min: 1.0,
                  max: 3.0,
                  divisions: 2,
                  label: "Poids",
                  onChanged: (double value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                ),
                Text(_sliderValue.toInt().toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recurrence de la tâche"),
                Column(
                  children: [
                    const Text("Mois"),
                    DropdownButton(
                      items: widget.items,
                      onChanged: (value) {
                        setState(() {
                          monthValue = value!;
                        });
                      },
                      value: monthValue,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Jour"),
                    DropdownButton(
                      items: widget.dayItems,
                      onChanged: (value) {
                        setState(() {
                          dayValue = value!;
                        });
                      },
                      value: dayValue,
                    ),
                  ],
                ),
              ],
            ),
            Consumer(builder: (context, ref, child) {
              ref.watch(taskListDisplayProvider.notifier);
              return ElevatedButton(
                onPressed: widget._textFieldController.text.isNotEmpty &&
                        (monthValue != 0 || dayValue != 0)
                    ? () {
                        ref
                            .read(taskListDisplayProvider.notifier)
                            .addTask(name: widget._textFieldController.text,
                            weight: _sliderValue.toInt(),
                            recurrence: Duration.zero,);
                        Navigator.of(context).pop();
                        widget._textFieldController.text = "";
                      }
                    : null,
                child: const Text('Ajouter'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
