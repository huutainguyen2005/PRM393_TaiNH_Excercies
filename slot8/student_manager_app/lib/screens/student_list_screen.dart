import 'package:flutter/material.dart';

import '../models/student.dart';
import '../models/student_store.dart';
import '../routes/app_routes.dart';
import '../widgets/student_tile.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  Future<void> _openStudentDetail(
    BuildContext context,
    Student student,
  ) async {
    await Navigator.pushNamed(
      context,
      AppRoutes.studentDetail,
      arguments: student,
    );
  }

  Future<void> _addStudent(BuildContext context) async {
    await Navigator.pushNamed(context, AppRoutes.studentForm);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sinh viên'),
      ),
      body: ValueListenableBuilder<List<Student>>(
        valueListenable: StudentStore.instance,
        builder: (context, students, child) {
          if (students.isEmpty) {
            return const Center(
              child: Text('Chưa có sinh viên.'),
            );
          }

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return StudentTile(
                student: student,
                onTap: () => _openStudentDetail(context, student),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addStudent(context),
        icon: const Icon(Icons.add),
        label: const Text('Thêm'),
      ),
    );
  }
}
