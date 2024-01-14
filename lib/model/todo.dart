import 'dart:convert';

class ToDo{
  String? id;
  String? todoText;
  String? isDone;


  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = '0'
  });


  static List<ToDo> todoList(){
    return [
      ToDo(id: '01' , todoText: "Sample Todo" , isDone: '0'),
    //   ToDo(id: '02' , todoText: "Buy groceries" , isDone: true),
    //   ToDo(id: '03' , todoText: "Check Emails" ),
    //   ToDo(id: '04' , todoText: "Team Meeting" ),
    //   ToDo(id: '04' , todoText: "Team Meeting" ),
    //   ToDo(id: '04' , todoText: "Team Meeting" ),
    //   ToDo(id: '04' , todoText: "Team Meeting" ),
    //   ToDo(id: '04' , todoText: "Team Meeting" ),
    //   ToDo(id: '05' , todoText: "Work on the mobile apps" ),
    //   ToDo(id: '06' , todoText: "Morning Exercise" ),
    ];
  }



  //defing the storage methods

  factory ToDo.fromJson(String jsonString) {
    Map<String, dynamic> todoMap = jsonDecode(jsonString);
    return ToDo(
      id: todoMap['id'],
      todoText: todoMap['todoText'],
      isDone: todoMap['isDone'],
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      'todoText': todoText,
      'isDone': isDone,
    });
  }

  //ends storage here
}