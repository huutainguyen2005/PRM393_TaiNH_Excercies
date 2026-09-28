import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  final List<String> movies = const [
    'Avengers: Endgame',
    'Spider-Man: No Way Home',
    'Interstellar',
    'Inception',
    'The Dark Knight',
    'Avatar',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Home')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding creates space around the header.
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Popular Movies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Row creates a horizontal layout.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.movie),
                const SizedBox(width: 12),
                const Text('Recommended for you'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Expanded gives ListView the remaining available height.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(movies[index]),
                    subtitle: const Text('Movie'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
