import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({super.key});

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
      appBar: AppBar(title: const Text("ListView Builder")),

      body: ListView.builder(
        itemCount: students.length,

        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index]),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.pushNamed(context, '/grid');
        },
      ),
    );
  }
}