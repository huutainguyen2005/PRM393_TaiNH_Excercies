import 'package:flutter/material.dart';

import '../models/plan.dart';
import '../widgets/primary_button.dart';

class ConfirmScreen extends StatelessWidget {
  final Plan plan;

  const ConfirmScreen({super.key, required this.plan});

  String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');

    final month = date.month.toString().padLeft(2, '0');

    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');

    final minute = time.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Plan')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Center(child: Icon(Icons.event_available, size: 80)),

            const SizedBox(height: 30),

            Text(
              'Please confirm your plan',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text('Title', style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 4),

                    Text(
                      plan.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text('Date', style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 4),

                    Text(
                      _formatDate(plan.date),
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 20),

                    const Text('Time', style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 4),

                    Text(
                      _formatTime(plan.time),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            PrimaryButton(
              text: 'Confirm',
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
