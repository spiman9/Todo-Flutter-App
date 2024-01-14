import 'package:flutter/material.dart';
import 'package:todo_pbg/constants/colors.dart';
import '../model/todo.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final dynamic onTodoChanged;
  final dynamic  onDeleteItem;

  const ToDoItem({
    super.key,
    required this.todo,
    required this.onTodoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          onTap: () {
            // debugPrint("CLicked: ListTile");
            onTodoChanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone == '1' ? Icons.check_box : Icons.check_box_outline_blank,
            color: tdBlue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: todo.isDone == '1'
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: Container(
            padding: EdgeInsets.all(0),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              onPressed: () {
                // debugPrint("CLicked: DeleteButton!!!");
                onDeleteItem(todo.id);
              },
              icon: Icon(Icons.delete),
            ),
          ),
        ));
  }
}
