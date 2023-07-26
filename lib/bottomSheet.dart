// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, unused_element, non_constant_identifier_names, unused_import, avoid_web_libraries_in_flutter, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist/Model/taskModel.dart';
import 'package:todolist/collections.dart';
import 'package:todolist/provider.dart';

class BottomSheetbox extends StatefulWidget {
  @override
  State<BottomSheetbox> createState() => _BottomSheetboxState();
}

class _BottomSheetboxState extends State<BottomSheetbox> {
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    return Container(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16, horizontal: 156),
              child: Divider(
                height: 4,
                thickness: 4,
                color: Color(0xFFF1F3F3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: textEditingController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black)),
                  labelText: 'Write your task',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 114, 118, 124),
                      fontFamily: 'Plus Jakarta Medium',
                      fontSize: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Colors.amber,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                ChooseDay();
                              });
                            },
                            child: Container(
                              width: 150,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Color(0xffF4F6F6),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ImageIcon(
                                      AssetImage('assets/icons/calendar.png'),
                                      size: 24,
                                      color: Color(0xff7E8491),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      DateFormat('dd-MM-yyy')
                                          .format(selectedDate),
                                      style: TextStyle(
                                          color: Color(0xff7E8491),
                                          fontFamily: 'Plus Jakarta Medium',
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 90,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Color(0xffF4F6F6),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff7E8491)),
                                        borderRadius: BorderRadius.circular(2)),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'No List',
                                    style: TextStyle(
                                        color: Color(0xff7E8491),
                                        fontFamily: 'Plus Jakarta Medium',
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          addTask();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFF00A86B),
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ImageIcon(
                              AssetImage('assets/icons/send.png'),
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void ChooseDay() async {
    var chooseDay = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chooseDay != null) {
      selectedDate = chooseDay;
      setState(() {
        print(selectedDate);
      });
    }
  }

  void addTask() {
    TaskModel task = TaskModel(
      title: textEditingController.text,
      date: selectedDate.millisecondsSinceEpoch,
    );
    addTaskToFireBase(task).timeout(Duration(milliseconds: 500), onTimeout: () {
      Navigator.pop(context);
      //provider.getAllTasks();
      print('task added');      
    });
  }
}
