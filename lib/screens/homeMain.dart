import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../widgets/todo_item.dart';
import 'package:todo_pbg/constants/colors.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  List<ToDo> todoList = ToDo.todoList();
  List<ToDo> _foundTodo = [];
  final _todoController = TextEditingController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _foundTodo = todoList;
    loadTodos();
  }

  // Adding for the share preferences----

  //here the shared preferences end ---------

  void _runfilter(String enterKeyword) {
    List<ToDo> results = todoList;

    if (enterKeyword.isEmpty == true) {
      results = todoList;
    } else {
      results = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundTodo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        "All ToDos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // items are been rendered here!!!
                    for (ToDo todooo in _foundTodo.reversed)
                      ToDoItem(
                        todo: todooo,
                        onTodoChanged: _handleTodoChange,
                        onDeleteItem: _deleteTodoItem,
                      ),
                    SizedBox(
                      height: 48,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: "Add a new Todo Item",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 16, left: 24, right: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                  onPressed: () {
                    setState(() {
                      _addTodoItem(_todoController.text);
                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void _handleTodoChange(ToDo todo) {
    setState(() {
      if (todo.isDone == '1') {
        todo.isDone = '0';
      } else {
        todo.isDone = '1';
      }
      //added here
      _saveTodos();
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
      _runfilter(_searchController.text);
      //added here as well
      _saveTodos();
    });
  }

  void _addTodoItem(String todo) {
    if (todo.isEmpty) {
      return;
    }
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
          _runfilter(_searchController.text);
      //added here
    });
    _saveTodos();
    _todoController.clear();
  }

  // here we are doing the logic for the storage locally
  Future<void> loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todosList = prefs.getStringList('todos') ?? [];
    setState(() {
      todoList =
          todosList.map((todoString) => ToDo.fromJson(todoString)).toList();
      _foundTodo = todoList;
    });
  }

  Future<void> _saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todosList = todoList.map((todo) => todo.toJson()).toList();
    prefs.setStringList('todos', todosList);
  }

  //end storage here!!!!

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          _runfilter(value);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            color: tdGrey,
          ),
          contentPadding: EdgeInsets.all(0),
        ),
      ),
    );
  }
}
