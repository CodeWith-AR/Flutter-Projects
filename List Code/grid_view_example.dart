import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  GridViewExample({super.key});

  final List<String> students = [
    'Abdur Rehman',
    'Bilal',
    'Ahmad',
    'Faizan',
    'ihsan',
    'Masroor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GridView Example")),

      body: GridView.count(
        crossAxisCount: 2,

        children: students.map((student) {
          return Card(
            margin: const EdgeInsets.all(10),

            child: Center(
              child: Text(
                student,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}