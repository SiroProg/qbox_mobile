import 'task.dart';

class TaskModel {
  const TaskModel({
    required this.similarTasks,
    required this.joinedTasks,
    required this.task,
  });

  final List? similarTasks;
  final List? joinedTasks;
  final Task? task;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        similarTasks: List.from((json['similar_tasks'])),
        joinedTasks: List.from((json['joined_tasks'])),
        task: Task.fromMap(json['task']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'similar_tasks': similarTasks,
        'joined_tasks': joinedTasks,
        'task': task?.toJson(),
      };

  @override
  String toString() =>
      'TaskModel(similarTasks: $similarTasks, joinedTasks: $joinedTasks, task: $task)';
}


// TODO: objectlarni null able tekshirish 