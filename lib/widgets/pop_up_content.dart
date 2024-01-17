
import 'package:cooloc/data/connect_to_api.dart';
import 'package:cooloc/models/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:cooloc/providers/task_provider.dart';

class PopUpContent extends HookWidget {
  final List<DropdownMenuItem<int>> items;
  final List<DropdownMenuItem<int>> dayItems;

  const PopUpContent({
    super.key,
    required this.items,
    required this.dayItems,
  });

  @override
  Widget build(BuildContext context) {
    final textFieldController = useState(TextEditingController());
    final monthValue = useState(1);
    final dayValue = useState(1);
    final sliderValue = useState(1.0);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: textFieldController.value,
              decoration: const InputDecoration(
                labelText: 'Nom de la tâche',
              ),
            ),
            Row(
              children: [
                const Text("Poids de la tâche"),
                Slider(
                  value: sliderValue.value,
                  min: 1.0,
                  max: 3.0,
                  divisions: 2,
                  label: "Poids",
                  onChanged: (double value) {
                    sliderValue.value = value;
                  },
                ),
                Text(sliderValue.value.toInt().toString(),
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
                      items: items,
                      onChanged: (value) {
                        monthValue.value = value!;
                      },
                      value: monthValue.value,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Jour"),
                    DropdownButton(
                      items: dayItems,
                      onChanged: (value) {
                        dayValue.value = value!;
                      },
                      value: dayValue.value,
                    ),
                  ],
                ),
              ],
            ),
            Consumer(builder: (context, ref, child) {
              ref.watch(taskListDisplayProvider.notifier);
              return ElevatedButton(
                onPressed: textFieldController.value.text.isNotEmpty &&
                        (monthValue.value != 0 || dayValue.value != 0)
                    ? () {
                        PostAction().doStuf(
                          NetworkLayer().client,
                          Task(
                            name: textFieldController.value.text,
                            weight: sliderValue.value.toInt(),
                            isDone: false,
                            ),
                        );
                        Navigator.of(context).pop();
                        textFieldController.value.text = "";
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
