// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTasksHash() => r'e052ab353359031a178e899392bbceae1b1cefd4';

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
