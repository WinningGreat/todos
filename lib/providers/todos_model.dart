import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:todos/models/task.dart';


class TodosModel extends ChangeNotifier {

  final List<Task> _tasks = [
    Task(title: 'Finish the app',completed: false),
    Task(title: 'Write a blog post',completed: false),
    Task(title: 'Share with community',completed: false),
  ];
  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);

  UnmodifiableListView<Task> get incompleteTasks => UnmodifiableListView(_tasks.where((_task)=> !_task.completed));

  UnmodifiableListView<Task> get completedTasks => UnmodifiableListView(_tasks.where((_task)=> _task.completed));


  void addTodo(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task){
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleComplete();
    notifyListeners();
  }

  void deleteTodo(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  void modifyTodo(Task task, Task newTask){
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex] = newTask;
    notifyListeners();
  }

}