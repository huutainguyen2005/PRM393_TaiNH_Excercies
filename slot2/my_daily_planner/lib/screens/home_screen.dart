import 'package:flutter/material.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<String> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter is Awesome!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho các task
            children: tasks.map((task) {
              return TaskItem(title: task); // Sử dụng Widget đã tách
            }).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tasks.add('Công việc số ${tasks.length + 1}');
          });
        },
        tooltip: 'Thêm công việc',
        child: const Icon(Icons.add),
      ),
    );
  }
}