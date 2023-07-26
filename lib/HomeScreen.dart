// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, unused_element, non_constant_identifier_names, unused_import, avoid_web_libraries_in_flutter, use_key_in_widget_constructors, must_be_immutable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/collections.dart';
import 'package:todolist/settings.dart';
import 'package:todolist/bottomSheet.dart';
import 'package:todolist/provider.dart';
import 'package:todolist/taskWidget.dart';

import 'Model/taskModel.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomSheetbox bottomSheet = BottomSheetbox();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ListProvider>(context);
    provider.getAllTasks();
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                          radius: 18,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Good morning 👋',
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'Plus Jakarta Sans'),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ImageIcon(
                      AssetImage('assets/icons/Vector.png'),
                      size: 24,
                    ),
                  ],
                )
              ],
            ),
          ),
          // day picker
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Color(0xFF00A86B),
              selectedTextColor: Colors.white,
              daysCount: 90,
              onDateChange: (date) {
                // New date selected
                provider.setNewSelectedDay(date);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.taskList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return TaskWidget(
                  task: provider.taskList[index],
                );
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(SettingsScreen.routeName);
                            },
                            icon: ImageIcon(
                              AssetImage('assets/icons/menu.png'),
                              size: 24,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                              AssetImage('assets/icons/search-normal.png'),
                              size: 24,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color(0xFF00A86B),
                        ),
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16))),
                                isScrollControlled: true,
                                elevation: 10,
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return bottomSheet;
                                });
                          },
                          icon: ImageIcon(
                            AssetImage('assets/icons/add.png'),
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
