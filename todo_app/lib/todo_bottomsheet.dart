import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/database/database_helper.dart';

class TodoBottomsheet {
  static showTodoBottomsheet(BuildContext context, Function getNotes, isEdit,
      {Map<String, dynamic>? allNotes}) {
    log("${isEdit}");
    log("${allNotes}");

    /// controllers
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController dateController = TextEditingController();

    /// check update or insert
    if (isEdit) {
      // fill data to controller
      titleController.text = allNotes![DatabaseHelper.COLUMN_TODO_TITLE];
      descriptionController.text =
          allNotes[DatabaseHelper.COLUMN_TODO_DESCRIPTION];
      dateController.text = allNotes[DatabaseHelper.COLUMN_TODO_DATE];
    }
    // SELECT DATE
    selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 1), // One year ago
        initialDate: DateTime.now(), // Today's date
        lastDate: DateTime(DateTime.now().year + 1), // One year from now
      );

      if (picked != Null) {
        String formattedDate = DateFormat('d MMMM yyyy').format(picked!);
        dateController.text = formattedDate;
      }
    }

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 16,
            left: 16,
            right: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Create To-Do",
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              // Title input
              const Text(
                "Title",
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(89, 57, 241, 1),
                ),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Description input
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(89, 57, 241, 1),
                ),
              ),
              TextField(
                controller: descriptionController,
                maxLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Date input
              const Text(
                "Date",
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(89, 57, 241, 1),
                ),
              ),
              TextField(
                controller: dateController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                      // SELECT DATE
                      await selectDate(context);
                    },
                    icon: const Icon(
                      Icons.calendar_month_outlined,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Submit button
              GestureDetector(
                onTap: () async {
                  if (titleController.text.trim().isNotEmpty ||
                      descriptionController.text.trim().isNotEmpty ||
                      dateController.text.trim().isNotEmpty) {
                    /// check update or insert
                    if (isEdit) {
                      var localDB = DatabaseHelper.instance;

                      bool check = await localDB.updateTodoListData(
                          todoTitle: titleController.text,
                          todoDescription: descriptionController.text,
                          todoDate: dateController.text,
                          todoSno: allNotes![DatabaseHelper.COLUMN_TODO_SNO]);

                      if (check) {
                        getNotes();
                        log("data Updated");
                      }
                    } else {
                      // Insert data into the database
                      var localDB = DatabaseHelper.instance;
                      bool check = await localDB.insertTodoListData(
                          todoTitle: titleController.text,
                          todoDescription: descriptionController.text,
                          todoDate: dateController.text);

                      if (check) {
                        getNotes();
                        log("data inserted");
                      }
                    }

                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 30),
                  width: 320,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(89, 57, 241, 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
