import 'package:flutter/material.dart';

import '../models/plan.dart';
import '../widgets/primary_button.dart';
import 'confirm_screen.dart';

class CreatePlanScreen extends StatefulWidget {
  const CreatePlanScreen({super.key});

  @override
  State<CreatePlanScreen> createState() => _CreatePlanScreenState();
}

class _CreatePlanScreenState extends State<CreatePlanScreen> {
  final _titleController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  String? _titleError;
  String? _dateError;
  String? _timeError;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();

    final picked = await showDatePicker(
      context: context,

      initialDate: _selectedDate ?? now,

      // Không cho chọn ngày trong quá khứ
      firstDate: DateTime(now.year, now.month, now.day),

      lastDate: DateTime(now.year + 2),

      helpText: 'Select plan date',
    );

    if (picked == null) return;

    setState(() {
      _selectedDate = DateTime(picked.year, picked.month, picked.day);

      _dateError = null;

      // Nếu đổi date thì reset time error
      _timeError = null;
    });
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,

      initialTime: _selectedTime ?? TimeOfDay.now(),

      helpText: 'Select plan time',
    );

    if (picked == null) return;

    setState(() {
      _selectedTime = picked;
      _timeError = null;
    });
  }

  String _dateLabel() {
    if (_selectedDate == null) {
      return 'Choose Date';
    }

    final date = _selectedDate!;

    final year = date.year.toString().padLeft(4, '0');

    final month = date.month.toString().padLeft(2, '0');

    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  String _timeLabel() {
    if (_selectedTime == null) {
      return 'Choose Time';
    }

    final time = _selectedTime!;

    final hour = time.hour.toString().padLeft(2, '0');

    final minute = time.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();

    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isTimeInPast(TimeOfDay time) {
    final now = TimeOfDay.now();

    final selectedMinutes = time.hour * 60 + time.minute;

    final currentMinutes = now.hour * 60 + now.minute;

    return selectedMinutes < currentMinutes;
  }

  bool _validate() {
    bool isValid = true;

    setState(() {
      _titleError = null;
      _dateError = null;
      _timeError = null;

      // Validate title
      if (_titleController.text.trim().isEmpty) {
        _titleError = 'Please enter a plan title';
        isValid = false;
      }

      // Validate date
      if (_selectedDate == null) {
        _dateError = 'Please choose a date';
        isValid = false;
      }

      // Validate time
      if (_selectedTime == null) {
        _timeError = 'Please choose a time';
        isValid = false;
      }

      // Validate thời gian thực tế
      if (_selectedDate != null &&
          _selectedTime != null &&
          _isToday(_selectedDate!) &&
          _isTimeInPast(_selectedTime!)) {
        _timeError = 'Selected time has already passed';
        isValid = false;
      }
    });

    return isValid;
  }

  Future<void> _continue() async {
    if (!_validate()) {
      return;
    }

    final plan = Plan(
      title: _titleController.text.trim(),
      date: _selectedDate!,
      time: _selectedTime!,
    );

    final confirmed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => ConfirmScreen(plan: plan)),
    );

    if (confirmed == true) {
      if (!mounted) return;

      Navigator.pop(context, plan);
    }
  }

  bool get _canContinue {
    return _titleController.text.trim().isNotEmpty &&
        _selectedDate != null &&
        _selectedTime != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Plan')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: _titleController,

              onChanged: (_) {
                setState(() {
                  _titleError = null;
                });
              },

              decoration: InputDecoration(
                labelText: 'Plan Title',
                hintText: 'e.g. Study Flutter',
                errorText: _titleError,
              ),

              textInputAction: TextInputAction.done,
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickDate,
                    icon: const Icon(Icons.calendar_today),
                    label: Text(_dateLabel()),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickTime,
                    icon: const Icon(Icons.access_time),
                    label: Text(_timeLabel()),
                  ),
                ),
              ],
            ),

            if (_dateError != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    _dateError!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),

            if (_timeError != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    _timeError!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 12),

            if (!_canContinue)
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Please enter title, date and time.',
                  style: TextStyle(color: Colors.grey),
                ),
              ),

            const Spacer(),

            PrimaryButton(
              text: 'Continue',
              onPressed: _canContinue ? _continue : null,
            ),
          ],
        ),
      ),
    );
  }
}
