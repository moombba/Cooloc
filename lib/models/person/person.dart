import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.g.dart';
part 'person.freezed.dart';

@freezed
class Person with _$Person {
  factory Person({
    required String name,
    required int score,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}