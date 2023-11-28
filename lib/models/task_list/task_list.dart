import 'package:afgf_front/models/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_list.g.dart';
part 'task_list.freezed.dart';

@freezed
class TaskList with _$TaskList {
  factory TaskList({
  required List<Task> list,
  }) = _TaskList;

  factory TaskList.fromJson(Map<String, dynamic> json) => _$TaskListFromJson(json);

  // void addTask() {
  //   list.add(Task(name: "tache", weight: "1", recurrence: Duration(days: 1)));
  // }
}