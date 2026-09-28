import 'package:flutter/material.dart';

import '../models/student.dart';
import '../widgets/student_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Student> students = [
    Student(id: 'SV01', name: 'Nguyễn Văn A'),
    Student(id: 'SV02', name: 'Trần Thị B'),
    Student(id: 'SV03', name: 'Lê Văn C'),
    Student(id: 'SV04', name: 'Phạm Văn D'),
    Student(id: 'SV05', name: 'Hoàng Thị E'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student List'), centerTitle: true),

      body: ListView.builder(
        itemCount: students.length,

        itemBuilder: (context, index) {
          final student = students[index];

          return StudentCard(
            student: student,

            // Tap Card → Detail
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(student: student);
                  },
                ),
              );
            },

            // Select / Unselect
            onSelect: () {
              setState(() {
                student.isSelected = !student.isSelected;
              });
            },

            // Delete
            onDelete: () {
              setState(() {
                students.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
