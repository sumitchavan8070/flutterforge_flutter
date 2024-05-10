import 'package:flutter/material.dart';

class CalendarTemplateOne extends StatefulWidget {
  const CalendarTemplateOne({Key? key}) : super(key: key);

  @override
  CalendarTemplateOneState createState() => CalendarTemplateOneState();
}

class CalendarTemplateOneState extends State<CalendarTemplateOne> {
  DateTime _selectedMonth = DateTime.now();
  DateTime? selectedDate;

  List<DateTime> getDisplayDates(DateTime currentDate) {
    final firstDateOfMonth = DateTime(currentDate.year, currentDate.month, 1);
    final lastDateOfMonth = DateTime(currentDate.year, currentDate.month + 1, 0);

    DateTime firstDisplayDate = firstDateOfMonth;
    DateTime lastDisplayDate = lastDateOfMonth;

    DateTime indexDate = firstDisplayDate;

    while (indexDate.weekday != DateTime.sunday) {
      indexDate = indexDate.subtract(const Duration(days: 1));
    }
    firstDisplayDate = indexDate;

    indexDate = lastDisplayDate;
    while (indexDate.weekday != DateTime.saturday) {
      indexDate = indexDate.add(const Duration(days: 1));
    }
    lastDisplayDate = indexDate.add(const Duration(days: 1));

    List<DateTime> dates = [];

    indexDate = firstDisplayDate;
    while (indexDate.isBefore(lastDisplayDate)) {
      dates.add(indexDate);

      indexDate = indexDate.add(const Duration(days: 1));
    }

    return dates;
  }

  final _toryBlue = const Color(0xFF1A51AA);
  final _paleAqua = const Color(0xFFB6D3EF);

  void changeMonth(int index) {
    setState(() {
      final previousMonth = _selectedMonth;
      _selectedMonth = DateTime(_selectedMonth.year, _selectedMonth.month + index);
      if (index == 0) {
        _selectedMonth = DateTime.now();
        return;
      }
      if (index != 0) {
        if (_selectedMonth.isAfter(previousMonth)) {
        } else if (_selectedMonth.isBefore(previousMonth)) {}
      }
      getDisplayDates(_selectedMonth);
    });
  }

  bool isToday(DateTime date) {
    DateTime now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  String getMonthName(month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Invalid month number";
    }
  }

  Color getDateColor(DateTime date) {
    if (_selectedMonth.month == date.month) {
      if (date.weekday == 7) {
        return Colors.red;
      }

      return Colors.black;
    }

    return Colors.grey;
  }

  Widget _buildCalendarHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${getMonthName(_selectedMonth.month)} - ${_selectedMonth.year}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                changeMonth(-1);
              },
              child: const Icon(Icons.arrow_circle_left_outlined),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                changeMonth(1);
              },
              child: const Icon(Icons.arrow_circle_right_outlined),
            ),
            const SizedBox(width: 14),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: _toryBlue,
                backgroundColor: _toryBlue,
                minimumSize: const Size(60, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )
              ),
              onPressed: () {
                changeMonth(0);
                DateTime now = DateTime.now();
                setState(() {
                  selectedDate = DateTime(now.year, now.month, now.day);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Today",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildWeeks() {
    List<String> weeks = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

    return Row(
      children: List.generate(
        weeks.length,
        (index) {
          final day = weeks[index];
          return Flexible(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: _toryBlue,
              child: Text(
                day,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = getDisplayDates(_selectedMonth);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Calendar Template",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(

          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildCalendarHeader(),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                _buildWeeks(),
                GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisExtent: 74,
                  ),
                  itemCount: daysInMonth.length,
                  itemBuilder: (context, index) {
                    final day = daysInMonth[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedMonth = day;
                        });
                      },
                      child: AnimatedContainer(
                        curve: Curves.easeInOutQuint,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: day.day == _selectedMonth.day && day.month == _selectedMonth.month ? _paleAqua : null,
                        ),
                        duration: const Duration(milliseconds: 400),
                        child: Text(
                          day.day.toString(),
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: getDateColor(day),
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
