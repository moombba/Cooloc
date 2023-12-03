import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {

  const Task._();

  factory Task({
    required String id,
    required String name,
    required int weight,
    required Duration recurrence,
    required bool isDone,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json ) => _$TaskFromJson(json);
}