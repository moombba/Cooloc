// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      weight: json['weight'] as int,
      recurrence: Duration(microseconds: json['recurrence'] as int),
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'recurrence': instance.recurrence.inMicroseconds,
      'isDone': instance.isDone,
    };
