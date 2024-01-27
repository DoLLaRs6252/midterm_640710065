import 'package:flutter/material.dart';
import 'package:midterm_640710065/Test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'midterm',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: const Test_page(),
    );
  }
}

