import 'package:flutter/material.dart';

import '../models/student.dart';
import 'student_form_screen.dart';

class EditStudentScreen extends StatelessWidget {
  final Student student;

  const EditStudentScreen({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return StudentFormScreen(student: student);
  }
}
