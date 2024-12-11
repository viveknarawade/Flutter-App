import 'package:flutter/material.dart';
import 'package:todo_app/Todo_App.dart';
import 'package:todo_app/database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todoapp(),
    );
  }
}
