import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Model/taskModel.dart';
import 'collections.dart';

class ListProvider extends ChangeNotifier {
  DateTime selectedDay = DateTime.now();
  List<TaskModel> taskList = [];
  getAllTasks() async {
    QuerySnapshot<TaskModel> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList = taskList.where((task) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date);
      if (selectedDay.day == dateTime.day &&
          selectedDay.month == dateTime.month &&
          selectedDay.year == dateTime.year) {
        return true;
      }
      return false;
    }).toList();

    taskList.sort((TaskModel task1, TaskModel task2) {
      DateTime date1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime date2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return date1.compareTo(date2);
    });
    notifyListeners();
  }

  void setNewSelectedDay(DateTime newDate) {
    selectedDay = newDate;
    getAllTasks();
  }
}
