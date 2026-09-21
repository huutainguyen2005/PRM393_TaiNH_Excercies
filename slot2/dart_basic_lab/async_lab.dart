// 1. Hàm giả lập việc tải dữ liệu từ Server
// Future<String> nghĩa là: Hàm này sẽ trả về một chuỗi String trong tương lai
Future<String> fetchUserData() async {
  print("Đang kết nối với Server...");
  // Giả lập độ trễ mạng 3 giây
  await Future.delayed(Duration(seconds: 3));
  return "Dữ liệu người dùng: Nguyễn Văn A";
}

// 2. Hàm main cũng phải có 'async' để sử dụng được 'await'
void main() async {
  print("--- BẮT ĐẦU TẢI APP ---");
  print("Đang gọi API...");

  // var data = fetchUserData();

  // await: Dừng lại ở đây, đợi khi nào có dữ liệu mới chạy tiếp dòng dưới
  String data = await fetchUserData();
  print("Kết quả: $data");
  print("--- KẾT THÚC ---");
}
