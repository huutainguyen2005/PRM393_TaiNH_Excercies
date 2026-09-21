import '../models/student.dart';

class StudentService {
  List<Student> students = [
    Student("An", 3.6),
    Student("Binh", 3.8),
    Student("Dung", 3.4),
    Student.newStudent("Hoa"),
  ];

  List<Student> filterStudentsByGpa(double minGpa) {
    return students.where((s) => s.gpa >= minGpa).toList();
  }

  List<String> getDisplayTexts({double minGpa = 3.5}) {
    return filterStudentsByGpa(minGpa).map((s) => s.display()).toList();
  }
}
