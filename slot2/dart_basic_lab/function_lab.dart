String getRank(double score) => score >= 5 ? "ĐẠT" : "KHÔNG ĐẠT";

double calculateAverage(double a, double b) {
  return (a + b) / 2;
}

void printInfo({required String name, double? gpa}) {
  print("Sinh viên: $name - GPA: ${gpa ?? 'Chưa có'}");
}

String greet(String name) => "Chào bạn, $name!";

void main() {
  // Tính và in điểm trung bình
  double mathScore = 8.5;
  double progScore = 9.0;
  double avg = calculateAverage(mathScore, progScore);

  print("--- BẢNG ĐIỂM ---");
  print("Điểm trung bình: $avg");
  print("Xếp loại: ${getRank(avg)}");

  print("\n--- THÔNG TIN SINH VIÊN ---");
  printInfo(name: "Phuc", gpa: 8.5);
  printInfo(name: "An");

  print(greet("Phuc"));
}
