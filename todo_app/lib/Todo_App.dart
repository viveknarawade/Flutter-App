import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/database/database_helper.dart';
import 'package:todo_app/todo_bottomsheet.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  List<Map<String, dynamic>> allNotes = [];
  DatabaseHelper? dbRef;
  @override
  void initState() {
    super.initState();
    dbRef = DatabaseHelper.instance;
    getNotes();
  }

  void getNotes() async {
    allNotes = await dbRef!.fetchTodoListData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 34.0, top: 70),
            child: Text(
              "Good morning",
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 34.0,
              bottom: 30,
            ),
            child: Text(
              "Vivek",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 17.0),
                    child: Text(
                      "CREATE TO DO LIST ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: (allNotes.isNotEmpty)
                          ? Container(
                              decoration: const BoxDecoration(),
                              child: ListView.builder(
                                itemCount: allNotes.length,
                                itemBuilder: (context, index) {
                                  return Slidable(
                                    endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          const SizedBox(
                                            width: 22,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 35,
                                                height: 35,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        89, 57, 241, 1)),
                                                child: IconButton(
                                                  onPressed: () {
                                                    /// call to bottom sheet
                                                    TodoBottomsheet
                                                        .showTodoBottomsheet(
                                                            context,
                                                            getNotes,
                                                            true,
                                                            allNotes: allNotes[
                                                                index]);
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 35,
                                                height: 35,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        89, 57, 241, 1)),
                                                child: IconButton(
                                                  onPressed: () async {
                                                    bool check = await dbRef!
                                                        .deleteTodoListData(
                                                            todoSno: allNotes[
                                                                    index][
                                                                DatabaseHelper
                                                                    .COLUMN_TODO_SNO]);

                                                    if (check) {
                                                      getNotes();
                                                      setState(() {});
                                                      log("note deleted");
                                                    }
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 8,
                                            offset: Offset(0, 8),
                                            blurStyle: BlurStyle.outer,
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            padding: const EdgeInsets.all(9),
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  217, 217, 217, 1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              "assets/logo.png",
                                              color: Colors.white,
                                              height: 45,
                                              width: 45,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  allNotes[index][DatabaseHelper
                                                      .COLUMN_TODO_TITLE],
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  allNotes[index][DatabaseHelper
                                                      .COLUMN_TODO_DESCRIPTION],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  allNotes[index][DatabaseHelper
                                                      .COLUMN_TODO_DATE],
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const Center(
                              child: Text(
                                "No Task Yet",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: IconButton(
          onPressed: () {
            // call to bottomsheet
            TodoBottomsheet.showTodoBottomsheet(context, getNotes, false);
            setState(() {});
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
