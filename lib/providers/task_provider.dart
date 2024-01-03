import 'package:cooloc/models/task/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "task_provider.g.dart";

@riverpod
class TaskListDisplay extends _$TaskListDisplay {
  @override
  List<Task> build() => [
        Task(
          // id: DateTime.now().toString(),
          name: "name",
          weight: 1,
          // recurrence: Duration.zero,
          isDone: false,
        )
      ];

  String _formatTaskName(String name) =>
      "${name[0].toUpperCase()}${name.substring(1)}";

  void addTask({
    required String name,
    required int weight,
    required Duration recurrence,
  }) {
    var task = Task(
      // id: DateTime.now().toString(),
      name: _formatTaskName(name),
      weight: weight,
      // recurrence: recurrence,
      isDone: false,
    );
    state = [...state, task];
  }

  void removeTask(String id) {
    List<Task> newState = [...state];
    // newState.removeWhere((element) => element.id == id);
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
