import 'package:cooloc/models/task/task.dart';
import 'package:cooloc/providers/task_provider.dart';
import 'package:cooloc/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 

class TasksPage extends HookConsumerWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var list = ref.watch(taskListDisplayProvider);

    var doneList = list.where((element) => element.isDone).toList();
    var toDoList = list.where((element) => !element.isDone).toList();

    print(list);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    return TaskCard(list: toDoList, index: index, ref: ref);
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: list.where((element) => element.isDone).length,
                  itemBuilder: (context, index) {
                    return TaskCard(list: doneList, index: index, ref: ref);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.list,
    required this.index,
    required this.ref,
  });

  final List<Task> list;
  final int index;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        tileColor: list[index].isDone ? Colors.grey : secondaryColor,
        title: Text(
          list[index].name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration:
                  list[index].isDone ? TextDecoration.lineThrough : null),
        ),
        subtitle: SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < list[index].weight; i++)
                Icon(
                  Icons.adjust_sharp,
                  size: MediaQuery.of(context).size.width * 0.035,
                ),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            (!list[index].isDone
                ? EndTaskButton(ref: ref, index: index)
                : const SizedBox()),
            RemoveTaskButton(ref: ref, list: list, index: index),
          ],
        ),
      ),
    );
  }
}

class RemoveTaskButton extends StatelessWidget {
  const RemoveTaskButton({
    super.key,
    required this.ref,
    required this.list,
    required this.index,
  });

  final WidgetRef ref;
  final List<Task> list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        ref.read(taskListDisplayProvider.notifier).removeTask(list[index].id);
      },
    );
  }
}

class EndTaskButton extends StatelessWidget {
  const EndTaskButton({
    super.key,
    required this.ref,
    required this.index,
  });

  final WidgetRef ref;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.check),
      onPressed: () {
        ref.read(taskListDisplayProvider.notifier).endTask(index);
      },
    );
  }
}
