import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  final VoidCallback? onTap;

  const StudentTile({
    super.key,
    required this.student,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(student.name),
        subtitle: Text('ID: ${student.id} | Tuổi: ${student.age}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
