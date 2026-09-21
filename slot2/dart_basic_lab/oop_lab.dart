class Student {
  // 1. Các thuộc tính (Fields)
  String name;
  int age;
  double? gpa; // Có thể null

  // 2. Constructor (Cách viết rút gọn của Dart)
  Student(this.name, this.age, {this.gpa});

  // 3. Phương thức (Method) - Hành động của đối tượng
  void showInfo() {
    print("--- Thông tin sinh viên ---");
    print("Họ tên: $name");
    print("Tuổi: $age");
    print("GPA: ${gpa ?? 'Chưa cập nhật'}");
  }

  void updateGPA(double newGpa) {
    gpa = newGpa;
    print(">> Đã cập nhật GPA của $name thành $gpa");
  }
}

class Teacher {
  String name;
  String subject;

  Teacher(this.name, this.subject);

  void showInfo() {
    print("--- Thông tin Giảng viên ---");
    print("Họ tên: $name");
    print("Môn học: $subject");
  }
}

void main() {
  Student s1 = Student("Phuc", 20);

  // Cập nhật tuổi
  s1.age = 21;
  print("Sau khi sinh nhật:");
  s1.showInfo();

  print("\nCập nhật điểm số:");
  s1.updateGPA(9.0);
  s1.showInfo();

  print("\nKhởi tạo thông tin Giảng viên:");
  Teacher t1 = Teacher("Phuc", "Dart Programming");
  t1.showInfo();
}
