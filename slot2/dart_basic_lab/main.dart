void main() {
  // 1. Kiểu dữ liệu cơ bản
  String name = "Tai"; // Chuỗi văn bản
  int age = 21; // Số nguyên
  bool isStudent = true; // Đúng/Sai (Boolean)
  // 2. Kiểu danh sách & Tập hợp
  List<String> skills = ["Dart", "Flutter"]; // Danh sách các chuỗi
  Map<String, int> scores = {
    // Cặp Khóa : Giá trị
    "Math": 8,
    "Programming": 9,
  };
  // 3. Phân biệt Khai báo hằng số
  final String school =
      "FPT University"; // final: Giá trị được xác định khi chạy app
  const String country = "Vietnam"; // const: Giá trị cố định ngay khi viết
  // 4. Xuất dữ liệu ra Terminal
  print("--- Thông tin cá nhân ---");
  print(
    "Tên: $name - Tuổi: $age",
  ); // Sử dụng $ để in biến trong chuỗi (String Interpolation)
  print("Sinh viên: ${isStudent ? 'Có' : 'Không'}");
  print("Kỹ năng: ${skills.join(', ')}");
  print("Điểm Programming: ${scores['Programming']}");
  print("Trường: $school, Quốc gia: $country");
}
