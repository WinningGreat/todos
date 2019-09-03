
import 'package:flutter/material.dart';
import 'package:todos/models/task.dart';
import 'package:todos/providers/todos_model.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTaskScreen extends StatefulWidget{
   Task task;
static const routeName = 'a';
  AddTaskScreen({@required Task task}){
this.task = task;
  }

  
  @override
  State<StatefulWidget> createState() {
    return _AddTaskScreenState(task: task);
      }
    
    }
    
    class _AddTaskScreenState extends State<AddTaskScreen> {
      Task task;
      _AddTaskScreenState({@required Task task}){
        this.task = task;
        print(task);
        todoTitlecontroller.text = task.title;
      }

    TextEditingController todoTitlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(this.task.title==""?"Add Todo":"Edit Todo"),),
          body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
                controller: todoTitlecontroller,
                decoration: new InputDecoration(
                  hasFloatingPlaceholder: true, labelText: "Todo Title"
                )
                ),
                
                
          ],
        )
      ,),
      floatingActionButton: FloatingActionButton(
                  child: Text('+',style: TextStyle(color: Colors.white,fontSize: 18),
                  ),
                  onPressed: (){ 
                    if (todoTitlecontroller.text==""){
                    Fluttertoast.showToast(
        msg: "Make sure the Title is not empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                        
                    }else{Task task = new Task(title: todoTitlecontroller.text,completed: false);
                    if (this.task.title==""){
                      Provider.of<TodosModel>(context, listen:false).addTodo(task);
                    } else {
                      Provider.of<TodosModel>(context, listen:false).modifyTodo(this.task,task);
                    }
                   
                   
                   Navigator.pop(context);
                    }
                  }
                ),
    );
  }

  @override
  void dispose(){
    todoTitlecontroller.dispose();
    super.dispose();
  }
  
}
