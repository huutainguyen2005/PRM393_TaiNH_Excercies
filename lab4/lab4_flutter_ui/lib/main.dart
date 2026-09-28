import 'package:flutter/material.dart';

import 'exercise1_core_widgets.dart';
import 'exercise2_input_controls.dart';
import 'exercise3_layout.dart';
import 'exercise4_scaffold_theme.dart';
import 'exercise5_debug.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LabMenu(),
    );
  }
}

class LabMenu extends StatelessWidget {
  const LabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lab 4 - Flutter UI')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildExerciseButton(
            context,
            'Exercise 1 - Core Widgets',
            const CoreWidgetsDemo(),
          ),
          _buildExerciseButton(
            context,
            'Exercise 2 - Input Widgets',
            const InputControlsDemo(),
          ),
          _buildExerciseButton(
            context,
            'Exercise 3 - Layout',
            const LayoutDemo(),
          ),
          _buildExerciseButton(
            context,
            'Exercise 4 - Scaffold & Theme',
            const ScaffoldThemeDemo(),
          ),
          _buildExerciseButton(
            context,
            'Exercise 5 - Debug & Fix',
            const DebugDemo(),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseButton(
    BuildContext context,
    String title,
    Widget screen,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
        child: Padding(padding: const EdgeInsets.all(16), child: Text(title)),
      ),
    );
  }
}
