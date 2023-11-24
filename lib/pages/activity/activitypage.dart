import 'dart:ffi';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    int selectedMonth = selectedDate.month;
    int selectedYear = selectedDate.year;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Month and Year'),
          contentPadding: EdgeInsets.all(16.0), // Adjust padding for size
          content: Column(
            mainAxisSize: MainAxisSize.min, // Adjust size to content
            children: [
              Row(
                children: [
                  Text('Month:'),
                  SizedBox(width: 8),
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
                  Text('Year:'),
                  SizedBox(width: 8),
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
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedDate = DateTime(selectedYear, selectedMonth, 1);
                });
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //blue bow column
        children: [
          Container(
            //blue box container
            width: MediaQuery.sizeOf(context).width,
            height: 110,
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
          const SizedBox(
            height: 18,
          ),
          Padding(
            //padding for the edge of column below the blue box
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      width: 110,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 174, 169, 169)),
                      child: Row(
                        children: [
                          Text(
                            "${selectedDate.month}/${selectedDate.year}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                              width:
                                  5), // Add some space between the text and the icon
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: 340,
                  height: 58,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 2,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: const Column(
                    children: [
                      Text(
                        'Johor Rovers Vigil 2023 & Serving For The Future',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Camping',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String formatDate(DateTime date, List<String> format) {
  return DateFormat(format.join(' ')).format(date);
}
