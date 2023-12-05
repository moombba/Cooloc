
import 'package:afgf_front/models/person/person.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "profile_provider.g.dart";

@riverpod
class UserProfile extends _$UserProfile {
  @override
  Person build() => Person(name: "Quentin", score: 300);
}