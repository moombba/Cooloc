import 'package:afgf_front/models/task/task.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "task_provider.g.dart";

final taskProvider = StateProvider<List<Task>>((ref) =>
    [Task(name: "name", weight: 1, recurrence: Duration.zero, isDone: false)]);

@riverpod
class TaskListDisplay extends _$TaskListDisplay {
  @override
  List<Task> build() =>
      [Task(name: "name", weight: 1, recurrence: Duration.zero, isDone: false)];

  String _formatTaskName(String name) => "${name[0].toUpperCase()}${name.substring(1)}";
  void addTask({
    required String name,
    required int weight,
    required Duration recurrence,
  }) {
    var task = Task(
      name: _formatTaskName(name),
      weight: weight,
      recurrence: recurrence,
      isDone: false,
    );
    state = [...state, task];
  }

  void removeTask(int index) {
    List<Task> newState = [...state];
    newState.removeAt(index);
    state = newState;
  }

  void endTask(int index) {
    List<Task> newState = [...state];
    newState[index] = newState[index].copyWith(isDone: true);
    state = newState;
  }

  List<Task> getTaskList() {
    return state;
  }
}
