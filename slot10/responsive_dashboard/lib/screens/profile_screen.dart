import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile - Responsive Refactor')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isNarrow = constraints.maxWidth < 700;
          final double horizontalPadding =
              (constraints.maxWidth * 0.04).clamp(16, 48).toDouble();

          final avatar = CircleAvatar(
            radius: isNarrow ? 40 : 56,
            child: Icon(
              Icons.person,
              size: isNarrow ? 40 : 56,
            ),
          );

          final info = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nguyen Huu Tai',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 6),
              const Text(
                'Flutter Student',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              const Text(
                'This profile demonstrates the responsive refactor exercise.',
              ),
            ],
          );

          final content = Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: isNarrow
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: avatar),
                        const SizedBox(height: 16),
                        info,
                      ],
                    )
                  : Row(
                      children: [
                        avatar,
                        const SizedBox(width: 24),
                        Expanded(child: info),
                      ],
                    ),
            ),
          );

          return SingleChildScrollView(
            padding: EdgeInsets.all(horizontalPadding),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: content,
              ),
            ),
          );
        },
      ),
    );
  }
}
