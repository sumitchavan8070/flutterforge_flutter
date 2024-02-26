import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// final  dateFormat = DateFormat('dd-MM-yyyy');
typedef DateSelectionCallback = void Function(DateTime selectedDate);

Future<void> cupertinoCalenderDrawer({
  required BuildContext context,
  required DateTime? initialDate,
  required DateSelectionCallback onSave,
  required String title,
  DateTime? startDate,
  DateTime? endDate,
}) async {
  DateTime? selectedDate;
  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16))
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            Flexible(
              child: CupertinoDatePicker(
                initialDateTime: initialDate,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                minimumDate: startDate,
                maximumDate: endDate,
                onDateTimeChanged: (DateTime newDate) {
                  selectedDate = newDate;
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 62),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (selectedDate != null) {
                  onSave(selectedDate!);
                }

                if (selectedDate == null && initialDate != null) {
                  onSave(initialDate);
                }
                Navigator.pop(context);
              },
              child: Text(
                'Select Date',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    },
  );
}
