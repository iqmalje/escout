import 'dart:ffi';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
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
                  child: Container(
                    width: 110,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 174, 169, 169)),
                    child: Row(
                      children: [
                        Text(
                          formatDate(DateTime.now(), ['dd', 'MMMM']),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
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
