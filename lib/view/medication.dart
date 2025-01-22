// lib/view/medication.dart
import 'package:flutter/material.dart';

class MedicationPage extends StatelessWidget {
  const MedicationPage({super.key}); // Make sure the constructor is there

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Page'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Medication Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
