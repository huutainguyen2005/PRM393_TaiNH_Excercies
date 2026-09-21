void main() {
  String? email;
  print("Email hiện tại là: $email"); // Kết quả: null

  email = "phuc@gmail.com";
  // Kiểm tra trước khi sử dụng để tránh lỗi
  if (email != null) {
    print("Độ dài email: ${email.length}");
  } else {
    print("Email đang trống, không thể lấy độ dài!");
  }

  // Nếu email null, dùng giá trị mặc định là "Chưa có email"
  String displayEmail = email ?? "Chưa có email";
  print("Thông báo: $displayEmail");

  int? score;
  score = 9;
  if (score != null) {
    print("Điểm của bạn là: $score");
  } else {
    print("Điểm đang trống, không thể lấy điểm!");
  }
}
