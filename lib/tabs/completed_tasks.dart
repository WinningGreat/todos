import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todos/providers/todos_model.dart';
import 'package:todos/widgets/task_list.dart';


class CompletedTasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child: Consumer<TodosModel>(builder: (context,todos,child)=>TaskLists(tasks: todos.completedTasks)));
  }

}