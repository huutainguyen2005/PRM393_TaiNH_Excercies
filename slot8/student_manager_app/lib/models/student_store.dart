import 'package:flutter/foundation.dart';

import 'student.dart';

class StudentStore extends ValueNotifier<List<Student>> {
  StudentStore._()
      : super(const [
          Student(id: 'S001', name: 'Nguyễn Văn A', age: 20),
          Student(id: 'S002', name: 'Trần Thị B', age: 21),
          Student(id: 'S003', name: 'Lê Văn C', age: 19),
        ]);

  static final StudentStore instance = StudentStore._();

  Student? findById(String id) {
    for (final student in value) {
      if (student.id == id) {
        return student;
      }
    }
    return null;
  }

  void addStudent(Student student) {
    value = [...value, student];
  }

  bool updateStudent(Student updatedStudent) {
    final index = value.indexWhere((student) => student.id == updatedStudent.id);
    if (index == -1) {
      return false;
    }

    final updatedList = [...value];
    updatedList[index] = updatedStudent;
    value = updatedList;
    return true;
  }
}
