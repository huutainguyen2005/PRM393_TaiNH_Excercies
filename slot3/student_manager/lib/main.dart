import 'package:flutter/material.dart';

import 'services/student_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final service = StudentService();
    final data = service.getDisplayTexts(minGpa: 3.5);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Student Manager")),
        body: StudentListWidget(data: data),
      ),
    );
  }
}

class StudentListWidget extends StatelessWidget {
  final List<String> data;

  const StudentListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const Center(child: Text("Không có sinh viên nào đạt yêu cầu"));
    }

    return ListView(
      children: data.map((text) {
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: const Icon(Icons.school, color: Colors.blue),
            title: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList(),
    );
  }
}
