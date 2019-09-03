import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todos/add_task_screen.dart';

import 'package:todos/models/task.dart';

import 'package:todos/providers/todos_model.dart';


class TaskListItem extends StatelessWidget{

  final Task task;

  TaskListItem({@required this.task});

  


  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.pushNamed(context, AddTaskScreen.routeName,arguments:task);
      },
      leading: Checkbox(
        value:this.task.completed,
        onChanged: (bool checked){
            Provider.of<TodosModel>(context, listen:false).toggleTodo(task);
        },
      ),
      title: Text(this.task.title),
      trailing: IconButton(icon: Icon(Icons.delete,color:Colors.red),
      onPressed: (){
        Provider.of<TodosModel>(context, listen:false).deleteTodo(task);
      },),
    );
  }}