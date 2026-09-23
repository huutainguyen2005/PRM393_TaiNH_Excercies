import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final Stream<String> stream;

  const StatusWidget({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: stream,
      builder: (context, snapshot) {
        print('StatusWidget rebuild');

        if (!snapshot.hasData) {
          return const Text('Waiting...', style: TextStyle(fontSize: 25));
        }

        return Text(
          'Status: ${snapshot.data}',
          style: const TextStyle(fontSize: 24),
        );
      },
    );
  }
}
