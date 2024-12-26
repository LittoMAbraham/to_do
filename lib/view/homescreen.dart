
import 'package:flutter/material.dart';
import 'package:to_do/controller/todocontroller.dart';
import 'package:to_do/model/todomodel.dart';
import 'package:to_do/view/todolist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController AddController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    TodoController.initKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow.shade200,
        appBar: AppBar(backgroundColor: Colors.cyan.shade100,
          leading: Icon(Icons.arrow_back),centerTitle: true,
          title: Text("TO DO",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
          color: Colors.grey),),
          actions: [Icon(Icons.search)],
        ),
        body: 
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [Text("TODAY *",style: TextStyle(fontSize: 25
            ,fontWeight: FontWeight.bold),),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ToDoList(
                          todoitem: TodoController.todolistKey[index],
                          onDelete: () async {
                            await TodoController.deleteData(
                                TodoController.todolistKey[index]);
                            setState(() {});
                          },
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: TodoController.todolistKey.length),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 110),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: FloatingActionButton(onPressed: () {
                      AddController.clear();
                      showDialog(context: context, builder: (context) => AlertDialog(title: Text("ADD NEW TASK"),
                      content: Form(key: formKey,child: TextFormField(
                        controller: AddController,
                      )
                      ,),
                      actions: [TextButton(onPressed:() async {
                                        if (formKey.currentState!.validate()) {
                                          await TodoController.addData(
                                              TodoModel(
                                                  taskNmae: AddController.text,
                                                  iscompleted: false));
                                          setState(() {});
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text("Add"))
                                ],
                              ),
                            );
                          }, child: Icon(Icons.add,size: 40,), )
                
                   
                    
                 ) ],
                ),
              )
            ],
          ),
        ));
  }
}