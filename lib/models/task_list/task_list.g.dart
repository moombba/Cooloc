// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskListImpl _$$TaskListImplFromJson(Map<String, dynamic> json) =>
    _$TaskListImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => Task.fromJson(Map<String, String>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$TaskListImplToJson(_$TaskListImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
