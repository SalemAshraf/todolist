class TaskModel{
  String id;
 // String type;
  String title;
  int date;
  bool isChecked;

  TaskModel({this.id = '', required this.title, required this.date, this.isChecked = false,});

  TaskModel.fromJson(Map<String, dynamic> toJson) : this (
    id : toJson['id'] as String,
    date: toJson['date'] as int,
    title : toJson['title'] as String,
    isChecked : toJson['isChecked'] as bool,

  );

  Map<String, dynamic> toJson (){
    return {
      "id" : id,
      "title" : title,
      "date" : date,
      "isChecked" : isChecked,
    };
  }
}