import 'package:flutter/material.dart';

class ScaffoldThemeDemo extends StatefulWidget {
  const ScaffoldThemeDemo({super.key});

  @override
  State<ScaffoldThemeDemo> createState() => _ScaffoldThemeDemoState();
}

class _ScaffoldThemeDemoState extends State<ScaffoldThemeDemo> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkMode
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Scaffold & Theme'),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                  icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                ),
              ],
            ),

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    size: 80,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    isDarkMode ? 'Dark Mode' : 'Light Mode',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text('This screen uses Scaffold and ThemeData.'),
                ],
              ),
            ),

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('FAB pressed!')));
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
