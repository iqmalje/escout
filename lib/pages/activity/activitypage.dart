import 'package:escout/backend/backend.dart';
import 'package:escout/pages/activity/createactivitypage.dart';
import 'package:escout/pages/activity/detailsactivity.dart';
import 'package:escout/pages/attendance/attendacePage.dart';
import 'package:escout/pages/attendance/attendancePage2.dart';
import 'package:escout/pages/attendance/attendancePage3.dart';
import 'package:escout/pages/attendance/recordAttendance.dart';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  DateTime selectedDate = DateTime.now();
  List<dynamic> activities = [];

  List<String> monthName = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  int selectedMonth = 1;
  int selectedYear = 2023;

  Future<void> _selectDate(BuildContext context) async {
    selectedMonth = selectedDate.month;
    selectedYear = selectedDate.year;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Month and Year'),
          contentPadding: const EdgeInsets.all(16.0), // Adjust padding for size
          content: Column(
            mainAxisSize: MainAxisSize.min, // Adjust size to content
            children: [
              Row(
                children: [
                  const Text('Month:'),
                  const SizedBox(width: 8),
                  DropdownButton<int>(
                    value: selectedMonth,
                    items: List.generate(12, (index) => index + 1).map(
                      (int month) {
                        return DropdownMenuItem<int>(
                          value: month,
                          child: Text(month.toString()),
                        );
                      },
                    ).toList(),
                    onChanged: (int? value) {
                      setState(() {
                        selectedMonth = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Year:'),
                  const SizedBox(width: 8),
                  DropdownButton<int>(
                    value: selectedYear,
                    items: List.generate(100, (index) => 2022 + index)
                        .map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }).toList(),
                    onChanged: (int? value) {
                      setState(() {
                        selectedYear = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedDate = DateTime(selectedYear, selectedMonth, 1);
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        if (SupabaseB.isAdminToggled) {
          return CircleAvatar(
            maxRadius: 30,
            backgroundColor: const Color(0xFF2C225B),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateActivityPage()));
              },
            ),
          );
        } else {
          return Container();
        }
      }),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          //blue box container
          width: MediaQuery.sizeOf(context).width,
          height: 90,
          decoration: const BoxDecoration(color: Color(0xFF2E3B78)),
          child: const Center(
            child: Text(
              'Activity',
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width,
              maxHeight: double.infinity),
          child: Column(
            //blue bow column
            children: [
              const SizedBox(
                height: 18,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    width: 140,
                    height: 30,
                    decoration: const BoxDecoration(color: Color(0xFFEDEDED)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${monthName[selectedDate.month - 1]} ${selectedDate.year.toString().substring(2)}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                            width:
                                5), // Add some space between the text and the icon
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                  future: SupabaseB.isAdminToggled
                      ? SupabaseB().getActivities(filters: {
                          'year': selectedYear,
                          'month': selectedMonth
                        })
                      : SupabaseB().getAttendedActivities(
                          '$selectedYear-$selectedMonth%'),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    activities = snapshot.data!;

                    return Expanded(
                      child: ListView.builder(
                          itemCount: activities.length,
                          itemBuilder: (context, index) {
                            return buildActivity(activities.elementAt(index));
                          }),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActivity(dynamic item) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsActivity(activity: item)));
        },
        child: Container(
          width: 340,
          height: 58,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 2,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    item['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF302E84)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      item['category'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      DateFormat('dd/MM/yyyy').format(DateTime.parse(
                          item['created_at'].toString().split('+')[0])),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String formatDate(DateTime date, List<String> format) {
  return DateFormat(format.join(' ')).format(date);
}
