import 'package:flutter/material.dart';

class DebugDemo extends StatefulWidget {
  const DebugDemo({super.key});

  @override
  State<DebugDemo> createState() => _DebugDemoState();
}

class _DebugDemoState extends State<DebugDemo> {
  bool isFavorite = false;

  DateTime? selectedDate;

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  // Fix DatePicker context error by calling it
  // inside a valid widget's BuildContext.
  Future<void> selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug & Fix')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Common UI Fixes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Fix state update issue using setState().
              Row(
                children: [
                  const Text('Favorite: '),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: selectDate,
                child: const Text('Select Date'),
              ),

              const SizedBox(height: 8),

              Text(
                selectedDate == null
                    ? 'No date selected'
                    : 'Selected: '
                          '${selectedDate!.day}/'
                          '${selectedDate!.month}/'
                          '${selectedDate!.year}',
              ),

              const SizedBox(height: 16),

              const Text(
                'ListView inside Column:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              // In this example we use SizedBox to give
              // ListView a bounded height.
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(items[index]),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'The whole screen is wrapped in '
                'SingleChildScrollView to prevent overflow '
                'on smaller screens.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
