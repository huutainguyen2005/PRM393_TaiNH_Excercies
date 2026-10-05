import 'package:flutter/material.dart';

import '../models/student.dart';
import '../models/student_store.dart';

class StudentFormScreen extends StatefulWidget {
  final Student? student;

  const StudentFormScreen({
    super.key,
    this.student,
  });

  bool get isEdit => student != null;

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  bool _dialogShowing = false;

  @override
  void initState() {
    super.initState();

    final student = widget.student;
    if (student != null) {
      _idController.text = student.id;
      _nameController.text = student.name;
      _ageController.text = student.age.toString();
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _saveStudent() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    final id = _idController.text.trim();
    final name = _nameController.text.trim();
    final age = int.parse(_ageController.text.trim());

    final student = Student(
      id: id,
      name: name,
      age: age,
    );

    if (widget.isEdit) {
      StudentStore.instance.updateStudent(student);
    } else {
      StudentStore.instance.addStudent(student);
    }

    // Cho phép pop bằng code mà không hiện confirm dialog.
    Navigator.pop(context, student);
  }

  Future<void> _confirmPop() async {
    if (_dialogShowing || !mounted) {
      return;
    }

    _dialogShowing = true;

    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text('Bạn có chắc muốn rời màn hình này không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Ở lại'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: const Text('Rời đi'),
            ),
          ],
        );
      },
    );

    _dialogShowing = false;

    if (shouldPop == true && mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isEdit ? 'Edit Student' : 'Thêm sinh viên';

    return PopScope<Student>(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _confirmPop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: const InputDecoration(
                    labelText: 'Mã sinh viên',
                    border: OutlineInputBorder(),
                  ),
                  enabled: !widget.isEdit,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập mã sinh viên';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Họ tên',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập họ tên';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Tuổi',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final text = value?.trim() ?? '';
                    final age = int.tryParse(text);
                    if (text.isEmpty) {
                      return 'Vui lòng nhập tuổi';
                    }
                    if (age == null || age <= 0) {
                      return 'Tuổi không hợp lệ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: _saveStudent,
                        child: Text(widget.isEdit ? 'Lưu thay đổi' : 'Lưu'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _confirmPop,
                        child: const Text('Hủy'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
