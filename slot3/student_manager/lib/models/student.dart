class Student {
  String name;
  double gpa;

  Student(this.name, this.gpa);

  Student.newStudent(this.name) : gpa = 0.0;

  String display() {
    return "$name - GPA: $gpa";
  }
}
