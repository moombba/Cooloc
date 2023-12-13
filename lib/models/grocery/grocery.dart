import 'package:freezed_annotation/freezed_annotation.dart';

part 'grocery.g.dart';
part 'grocery.freezed.dart';

@freezed
class Grocery with _$Grocery {
  factory Grocery({
    required String name,
    required int quantity,
    required String unit,

  }) = _Grocery;

  factory Grocery.fromJson(Map<String, dynamic> json) => _$GroceryFromJson(json);
}