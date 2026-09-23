import 'package:flutter/material.dart';

class DoubleCounterWidget extends StatelessWidget {
  final Stream<int> stream;

  const DoubleCounterWidget({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stream,
      builder: (context, snapshot) {
        print('DoubleCounterWidget rebuild');

        if (!snapshot.hasData) {
          return const Text('Waiting...', style: TextStyle(fontSize: 25));
        }

        return Text(
          'Double: ${snapshot.data! * 2}',
          style: const TextStyle(fontSize: 28),
        );
      },
    );
  }
}
