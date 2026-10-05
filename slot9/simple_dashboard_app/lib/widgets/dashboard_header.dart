import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, User 👋',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Welcome back to your dashboard',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications, size: 28),

              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
