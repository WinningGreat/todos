import 'package:flutter/material.dart';
import 'package:todos/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:todos/providers/todos_model.dart';
import 'package:todos/add_task_screen.dart';
import 'package:todos/models/task.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.

  final Map<String, Widget> routes = <String, Widget>{
    'a': AddTaskScreen(task:Task(title:"",completed:false))
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context)=> TodosModel(),
          child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: (settings){
           if (settings.name == AddTaskScreen.routeName){
             return MaterialPageRoute(builder: (context){
               final Task task = settings.arguments;
               return AddTaskScreen(task:task );
          }); 
           } else {
             return MaterialPageRoute(builder: (context){
            return routes.putIfAbsent(settings.name, ()=> AddTaskScreen(task: Task(title:"",completed:false),));
            });
        }},
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

