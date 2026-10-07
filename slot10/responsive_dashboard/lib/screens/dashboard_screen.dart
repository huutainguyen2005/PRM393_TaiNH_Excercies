import 'package:flutter/material.dart';

import '../widgets/responsive_grid.dart';
import '../widgets/summary_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double horizontalPadding =
        (screenSize.width * 0.04).clamp(12, 40).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Dashboard'),
        actions: [
          IconButton(
            tooltip: 'Profile',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: const Icon(Icons.person_outline),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isWide = constraints.maxWidth > 1200;

          // Advanced exercise:
          // > 1200px -> summary on the left, grid on the right.
          if (isWide) {
            return Padding(
              padding: EdgeInsets.all(horizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          _Header(),
                          SizedBox(height: 16),
                          _SummarySection(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  const Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: ResponsiveProductGrid(),
                    ),
                  ),
                ],
              ),
            );
          }

          // Mobile/tablet layout.
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Header(),
                const SizedBox(height: 16),
                _SummarySection(),
                const SizedBox(height: 24),
                const ResponsiveProductGrid(),
                const SizedBox(height: 24),
                if (isLandscape)
                  const _LandscapeHint(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double headerFontSize =
        (screenWidth * 0.06).clamp(20, 32).toDouble();

    return Row(
      children: [
        Expanded(
          child: Text(
            'Dashboard',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: headerFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Icon(Icons.dashboard_outlined),
      ],
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection({super.key});

  final List<SummaryCard> cards = const [
    SummaryCard(
      title: 'Revenue',
      value: '\$12,300',
      color: Colors.blue,
    ),
    SummaryCard(
      title: 'Orders',
      value: '320',
      color: Colors.green,
    ),
    SummaryCard(
      title: 'Customers',
      value: '89',
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isNarrow = constraints.maxWidth < 600;

        if (isNarrow) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final card in cards)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: card,
                ),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: cards[0]),
            const SizedBox(width: 12),
            Expanded(child: cards[1]),
            const SizedBox(width: 12),
            Expanded(child: cards[2]),
          ],
        );
      },
    );
  }
}

class _LandscapeHint extends StatelessWidget {
  const _LandscapeHint();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(Icons.screen_rotation_alt),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Landscape mode detected. The dashboard uses the wider layout.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
