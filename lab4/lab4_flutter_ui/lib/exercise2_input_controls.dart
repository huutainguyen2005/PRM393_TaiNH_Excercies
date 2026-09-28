import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double volume = 50;
  bool isNotificationsEnabled = true;
  String selectedGender = 'Male';

  DateTime? selectedDate;

  Future<void> pickDate() async {
    final DateTime? date = await showDatePicker(
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
      appBar: AppBar(title: const Text('Input Controls')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Volume',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Slider(
              value: volume,
              min: 0,
              max: 100,
              divisions: 10,
              label: volume.round().toString(),
              onChanged: (value) {
                setState(() {
                  volume = value;
                });
              },
            ),

            Text('Current volume: ${volume.round()}'),

            const Divider(),

            SwitchListTile(
              title: const Text('Notifications'),
              value: isNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
            ),

            const Divider(),

            const Text(
              'Gender',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Female'),
              value: 'Female',
              groupValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                });
              },
            ),

            const Divider(),

            ElevatedButton.icon(
              onPressed: pickDate,
              icon: const Icon(Icons.calendar_month),
              label: const Text('Select Date'),
            ),

            const SizedBox(height: 12),

            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected date: '
                        '${selectedDate!.day}/'
                        '${selectedDate!.month}/'
                        '${selectedDate!.year}',
            ),
          ],
        ),
      ),
    );
  }
}
