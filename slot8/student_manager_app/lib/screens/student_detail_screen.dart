import 'package:flutter/material.dart';

import '../models/student.dart';
import '../routes/app_routes.dart';

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({super.key});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  Student? _student;
  bool _invalidArguments = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_student != null || _invalidArguments) {
      return;
    }

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Student) {
      _student = args;
    } else {
      _invalidArguments = true;
    }
  }

  Future<void> _editStudent() async {
    final student = _student;
    if (student == null) {
      return;
    }

    final result = await Navigator.pushNamed(
      context,
      AppRoutes.studentEdit,
      arguments: student,
    );

    if (result is Student && mounted) {
      setState(() {
        _student = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_invalidArguments || _student == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Chi tiết sinh viên')),
        body: const Center(
          child: Text('Không có dữ liệu sinh viên.'),
        ),
      );
    }

    final student = _student!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sinh viên'),
        actions: [
          IconButton(
            onPressed: _editStudent,
            icon: const Icon(Icons.edit),
            tooltip: 'Chỉnh sửa',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  student.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text('ID: ${student.id}'),
                const SizedBox(height: 8),
                Text('Tuổi: ${student.age}'),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Quay lại danh sách'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
