// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grocery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Grocery _$GroceryFromJson(Map<String, dynamic> json) {
  return _Grocery.fromJson(json);
}

/// @nodoc
mixin _$Grocery {
  String get name => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroceryCopyWith<Grocery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceryCopyWith<$Res> {
  factory $GroceryCopyWith(Grocery value, $Res Function(Grocery) then) =
      _$GroceryCopyWithImpl<$Res, Grocery>;
  @useResult
  $Res call({String name, int quantity, String unit});
}

/// @nodoc
class _$GroceryCopyWithImpl<$Res, $Val extends Grocery>
    implements $GroceryCopyWith<$Res> {
  _$GroceryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroceryImplCopyWith<$Res> implements $GroceryCopyWith<$Res> {
  factory _$$GroceryImplCopyWith(
          _$GroceryImpl value, $Res Function(_$GroceryImpl) then) =
      __$$GroceryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int quantity, String unit});
}

/// @nodoc
class __$$GroceryImplCopyWithImpl<$Res>
    extends _$GroceryCopyWithImpl<$Res, _$GroceryImpl>
    implements _$$GroceryImplCopyWith<$Res> {
  __$$GroceryImplCopyWithImpl(
      _$GroceryImpl _value, $Res Function(_$GroceryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
  }) {
    return _then(_$GroceryImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroceryImpl implements _Grocery {
  _$GroceryImpl(
      {required this.name, required this.quantity, required this.unit});

  factory _$GroceryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroceryImplFromJson(json);

  @override
  final String name;
  @override
  final int quantity;
  @override
  final String unit;

  @override
  String toString() {
    return 'Grocery(name: $name, quantity: $quantity, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceryImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, quantity, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceryImplCopyWith<_$GroceryImpl> get copyWith =>
      __$$GroceryImplCopyWithImpl<_$GroceryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroceryImplToJson(
      this,
    );
  }
}

abstract class _Grocery implements Grocery {
  factory _Grocery(
      {required final String name,
      required final int quantity,
      required final String unit}) = _$GroceryImpl;

  factory _Grocery.fromJson(Map<String, dynamic> json) = _$GroceryImpl.fromJson;

  @override
  String get name;
  @override
  int get quantity;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$GroceryImplCopyWith<_$GroceryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
