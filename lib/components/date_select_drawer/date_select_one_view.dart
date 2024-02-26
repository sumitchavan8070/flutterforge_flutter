import 'package:flutter/material.dart';
import 'package:flutterfore_app/components/date_select_drawer/date_select_drawer.dart';

class DateSelectOneView extends StatefulWidget {
  const DateSelectOneView({super.key});

  @override
  State<DateSelectOneView> createState() => _DateSelectOneViewState();
}

class _DateSelectOneViewState extends State<DateSelectOneView> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${dateTime ?? "--/--/-- : -- -- --"}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                cupertinoCalenderDrawer(
                  context: context,
                  title: "Select your DOB",
                  onSave: (selectedDate) {
                    setState(() {

                      dateTime = selectedDate;
                    });
                  },
                  initialDate: DateTime.now(),
                );
              },
              child: const Text("Select Date"),
            )
          ],
        ),
      ),
    );
  }
}
