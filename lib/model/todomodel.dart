

import 'package:hive/hive.dart';
part 'todomodel.g.dart';

@HiveType(typeId: 1)
class TodoModel{
@HiveField(0)
   String? taskNmae;
 @HiveField(1)  
 bool? iscompleted;
 
 
 TodoModel({
   this.taskNmae,
 this.iscompleted= false});
}