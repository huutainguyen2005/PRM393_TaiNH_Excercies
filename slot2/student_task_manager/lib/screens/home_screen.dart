import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. Khai báo danh sách Task rỗng
  final List<Task> _tasks = [];

  // 2. Controller để lấy dữ liệu từ ô nhập
  final TextEditingController _controller = TextEditingController();

  // 3. Hàm thêm Task mới
  void _addTask() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: text));
        _controller.clear(); // Xóa chữ sau khi thêm
      });
      FocusScope.of(context).unfocus(); // Ẩn bàn phím
    }
  }

  // Hàm xóa tất cả ---
  void _clearAllTasks() {
    setState(() {
      _tasks.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Đã xóa toàn bộ danh sách công việc!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tính toán số task hoàn thành cho Bước 8
    int completedCount = _tasks.where((t) => t.isDone).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Task Manager"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        // Thêm nút "Xóa tất cả" ở góc màn hình
        actions: [
          if (_tasks.isNotEmpty) // Chỉ hiển thị nút xóa khi danh sách có phần tử
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: "Xóa tất cả",
              onPressed: _clearAllTasks,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Thống kê nhanh
            Text("Hoàn thành: $completedCount / ${_tasks.length}"),
            const SizedBox(height: 10),

            // Ô nhập liệu (TextField)
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Nhập tên công việc...",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Danh sách hiển thị (ListView)
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(child: Text("Chưa có công việc nào!"))
                  : ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return _buildTaskItem(_tasks[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(Task task, int index) {
    return Card(
      elevation: 2,
      //  Đổi màu nền của Card thành màu xanh nhạt khi task đã hoàn thành
      color: task.isDone ? Colors.lightBlue.shade50 : Colors.white,
      child: ListTile(
        leading: Checkbox(
          value: task.isDone,
          onChanged: (bool? value) {
            setState(() {
              task.isDone = value!;
            });
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
            color: task.isDone ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () {
            // Lưu lại tên task trước khi xóa để đưa vào thông báo
            String deletedTaskTitle = _tasks[index].title;

            setState(() {
              _tasks.removeAt(index);
            });

            // Hiển thị thông báo (SnackBar) khi xóa
            ScaffoldMessenger.of(context).clearSnackBars(); // Tránh bị dồn cục khi xóa liên tục
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Đã xóa: $deletedTaskTitle'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}