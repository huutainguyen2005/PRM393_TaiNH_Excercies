import 'package:flutter/material.dart';

import '../models/student.dart';

class StudentCard extends StatelessWidget {
  final Student student;
  final VoidCallback onTap;
  final VoidCallback onSelect;
  final VoidCallback onDelete;

  const StudentCard({
    Key? key,
    required this.student,
    required this.onTap,
    required this.onSelect,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

      // Được chọn → màu xanh
      color: student.isSelected ? Colors.green.shade100 : null,

      child: ListTile(
        leading: CircleAvatar(
          child: Text(student.name.isNotEmpty ? student.name[0] : '?'),
        ),

        title: Text(
          student.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),

        subtitle: Text(student.id, style: const TextStyle(color: Colors.grey)),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Select / Unselect
            IconButton(
              icon: Icon(
                student.isSelected ? Icons.check_circle : Icons.circle_outlined,
                color: student.isSelected ? Colors.green : Colors.grey,
              ),
              onPressed: onSelect,
            ),

            // Delete
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),

        // Tap Card → Detail
        onTap: onTap,
      ),
    );
  }
}
