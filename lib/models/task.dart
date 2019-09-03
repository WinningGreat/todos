import 'package:flutter/material.dart';

class Task{
  String title;
  bool completed;

  Task({@required this.title, this.completed});

  void toggleComplete(){
    completed = !completed;
  }

}