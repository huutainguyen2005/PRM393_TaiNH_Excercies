import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'services/counter_stream_service.dart';

void main() {
  final service = CounterStreamService();

  service.start();

  runApp(MyApp(service: service));
}

class MyApp extends StatelessWidget {
  final CounterStreamService service;

  const MyApp({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(service: service),
    );
  }
}
