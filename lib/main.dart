import 'package:etiqa_assestment/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Etiqa Assessment',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          primaryColor: const Color(0xFFFFBE23),
          textTheme: const TextTheme(
            //Appbar and Button
            titleLarge: TextStyle(),
            //Todo Title in listview
            titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
            //Label in listview
            labelSmall: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                letterSpacing: 0),
            //Todo details in listview
            bodyLarge: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0),
            //Label in Form page
            labelLarge: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF959595)),
            //Hint text in Form page
            bodyMedium: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                color: Color(0xFFDBDBDB)),
          )),
      home: const ToDoList(title: 'To-Do List'),
    );
  }
}
