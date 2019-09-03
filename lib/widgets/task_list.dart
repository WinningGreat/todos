import 'package:flutter/material.dart';

import 'package:todos/models/task.dart';
import 'package:todos/widgets/task_list_item.dart';


class TaskLists extends StatelessWidget{

  final List<Task> tasks;

  TaskLists({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(children: getChildrenTasks());
      }
    
      List<Widget> getChildrenTasks() {
        return tasks.map((todo)=>TaskListItem(task: todo)).toList();
      }

}