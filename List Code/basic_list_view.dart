import 'package:flutter/material.dart';

class BasicListView extends StatelessWidget {
  BasicListView({super.key});

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
      appBar: AppBar(title: const Text("Basic ListView")),

      body: ListView(
        children: students.map((student) {
          return ListTile(
            title: Text(student),
          );
        }).toList(),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pushNamed(context, '/builder');
        },
      ),
    );
  }
}