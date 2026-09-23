import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final Stream<int> stream;

  const CounterWidget({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        print('CounterWidget rebuild');

        if (!snapshot.hasData) {
          return const Text('Waiting...', style: TextStyle(fontSize: 25));
        }

        return Text(
          'Counter: ${snapshot.data}',
          style: const TextStyle(fontSize: 32),
        );
      },
    );
  }
}
