import 'package:flutter/material.dart';
import 'view/homepage.dart'; // Import home.dart

void main() {
  runApp(const MyApp()); // Root widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), // Use myapp from home.dart as the home screen
    );
  }
}
