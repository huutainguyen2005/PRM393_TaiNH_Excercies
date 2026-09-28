import 'package:flutter/material.dart';

import '../models/student.dart';

class DetailScreen extends StatelessWidget {
  final Student student;

  const DetailScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Detail')),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  student.name.isNotEmpty ? student.name[0] : '?',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Student Name',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 5),

            Text(
              student.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            const Text(
              'Student ID',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 5),

            Text(student.id, style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 20),

            const Text(
              'Status',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 5),

            Text(
              student.isSelected ? 'Selected' : 'Not selected',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
