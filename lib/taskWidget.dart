// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/Model/taskModel.dart';

import 'collections.dart';

class TaskWidget extends StatefulWidget {
  TaskModel task;
  TaskWidget({required this.task}) {}

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isCheckedNow = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Divider(
            color: Color(0xFFF1F3F3),
            thickness: 2,
          ),
          Slidable(
            key: const ValueKey(0),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    deleteTaskFromFireStore(widget.task)
                        .timeout(Duration(microseconds: 500), onTimeout: () {
                      print("task was deleted");
                    });
                  },
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                widget.task.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Plus Jakarta Medium'),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xffF4AF25)),
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Work',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Plus Jakarta Medium'),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
