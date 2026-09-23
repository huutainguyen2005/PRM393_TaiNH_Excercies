import 'package:flutter/material.dart';

import '../services/counter_stream_service.dart';
import '../widgets/counter_widget.dart';
import '../widgets/double_counter_widget.dart';
import '../widgets/status_widget.dart';

class HomeScreen extends StatelessWidget {
  final CounterStreamService service;

  const HomeScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reactive Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterWidget(stream: service.counterStream),

            const SizedBox(height: 30),

            DoubleCounterWidget(stream: service.counterStream),

            const SizedBox(height: 30),

            StatusWidget(stream: service.statusStream),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: service.pause,
                  child: const Text('Pause'),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: service.resume,
                  child: const Text('Resume'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
