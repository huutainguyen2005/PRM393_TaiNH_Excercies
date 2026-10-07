import 'package:flutter/material.dart';

// This file intentionally contains the fixed-size version from the lesson.
// It is for demonstration/comparison, not the final responsive solution.
class FixedWrongDashboardScreen extends StatelessWidget {
  const FixedWrongDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Dashboard (Version: Fixed UI - Wrong)'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Container(
              width: 350,
              height: 120,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                'Summary (Fixed width 350, height 120)',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 120,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    'Card 1\n160 x 120',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 160,
                  height: 120,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text(
                    'Card 2\n160 x 120',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 400,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                children: List.generate(
                  8,
                  (index) => Container(
                    margin: const EdgeInsets.all(8),
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: Text(
                      'Item $index',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
