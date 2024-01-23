// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTasksHash() => r'f55c24c19a4d31c5173494d76f8a860d68b98152';

/// See also [getTasks].
@ProviderFor(getTasks)
final getTasksProvider = AutoDisposeFutureProvider<List<Task>>.internal(
  getTasks,
  name: r'getTasksProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTasksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTasksRef = AutoDisposeFutureProviderRef<List<Task>>;
String _$taskListDisplayHash() => r'2c12817f56e1fb1189440465dbde1dc593a7bc2e';

/// See also [TaskListDisplay].
@ProviderFor(TaskListDisplay)
final taskListDisplayProvider =
    AutoDisposeNotifierProvider<TaskListDisplay, List<Task>>.internal(
  TaskListDisplay.new,
  name: r'taskListDisplayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskListDisplayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskListDisplay = AutoDisposeNotifier<List<Task>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
