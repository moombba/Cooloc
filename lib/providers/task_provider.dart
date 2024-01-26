import 'package:cooloc/data/connect_to_api.dart';
import 'package:cooloc/models/task/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "task_provider.g.dart";

@riverpod
class TaskListDisplay extends _$TaskListDisplay {
  var networkLayer = NetworkLayer();

  @override
  List<Task> build() => [];

  String _formatTaskName(String name) =>
      "${name[0].toUpperCase()}${name.substring(1)}";


  void addTask({
    required Task task
  }) async {

    networkLayer.setAction(PostAction());
    await networkLayer.doStuff();
    await getTaskList();
  }

  void removeTask(String id) {
    List<Task> newState = [...state];

    state = newState;
  }

  void endTask(int index) {
    List<Task> newState = [...state];
    newState[index] = newState[index].copyWith(isDone: true);
    state = newState;
  }

  getTaskList() async {
    networkLayer.setAction(GetAction());
    var data = await networkLayer.doStuff();
    state = data;
  }
}

@riverpod
Future<List<Task>> getTasks(ref) async {
  var networkLayer = NetworkLayer();
  networkLayer.setAction(GetAction());
  List<Task> data = await networkLayer.doStuff();
  print("data = $data");
  return data;
}
