import 'package:flutter/material.dart';
import 'package:todos/add_task_screen.dart';

import 'package:todos/tabs/all_tasks.dart';
import 'package:todos/tabs/completed_tasks.dart';
import 'package:todos/tabs/completed_tasks.dart' as prefix0;
import 'package:todos/tabs/uncompleted_tasks.dart';

import 'models/task.dart';


class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
      }
      
    }
    
    class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

      TabController controller;

    @override
    void initState(){
        super.initState();
        controller = TabController(length: 3,vsync: this);
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
      title: Text('Todos'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add),onPressed: (){
          Navigator.pushNamed(context, AddTaskScreen.routeName,arguments:Task(title:"",completed: false));

        },
       )
      ],
      bottom: TabBar(tabs: <Widget>[Tab(text:'All'),Tab(text:'Incomplete'),Tab(text:'Complete')],controller: this.controller,),
    ),body: TabBarView(
      controller: this.controller,
      children: <Widget>[
        AllTasksTab(),
        UncompletedTasks(),
        CompletedTasks()
      ],
    ),);
  }
}