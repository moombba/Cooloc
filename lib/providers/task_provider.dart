import 'package:afgf_front/models/task/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "task_provider.g.dart";

final taskProvider = StateProvider<List<Task>>((ref) => [Task(name: "name", weight: 1, recurrence: Duration.zero, isDone: false)]);



@riverpod
class TaskListDisplay extends _$TaskListDisplay {
  @override
  List<Task> build() => [Task(name: "name", weight: 1, recurrence: Duration.zero, isDone: false)];

  void addTask(Task task) {
    print("add task : list = $state");
    state = [...state, task];
  }

  void removeTask(int index) {
    print (index);
    List<Task> newState = [...state];
    newState.removeAt(index);
    state = newState;
  }

  void endTask(int index) {
    List<Task> newState = [...state];
    newState[index].isDone = true;
    state = newState;
  }

  List<Task> getTaskList() {
    return state;
  }
}