import 'package:escout/pages/activity/activitypage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class createactivitypage extends StatefulWidget {
  const createactivitypage({super.key});

  @override
  State<createactivitypage> createState() => _createactivitypage();
}

class _createactivitypage extends State<createactivitypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //blue bow column
        children: [
          Container(
            //blue box container
            width: MediaQuery.sizeOf(context).width,
            height: 90,
            decoration: const BoxDecoration(color: Color(0xFF2E3B78)),

            child: Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: () {},
                  child: Ink(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ActivityPage()),
                        );
                      },
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    'Create Activity',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 200,
            decoration: const BoxDecoration(color: Color(0xFFECECEC)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(child: Image.asset('assets/images/upload.png')),
                const Positioned(
                  left: 142,
                  top: 111,
                  child: Text(
                    'Upload an image',
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  width: 318,
                  child: Text(
                    'Program Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFECECEC),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Program name',
                        style: TextStyle(
                          color: Color(0xFF9397A0),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 318,
                  child: Text(
                    'Program Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFECECEC),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Program Category',
                        style: TextStyle(
                          color: Color(0xFF9397A0),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 317,
                  child: Text(
                    'Program Location',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFECECEC),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Program Location',
                        style: TextStyle(
                          color: Color(0xFF9397A0),
                          fontSize: 11,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 317,
                  child: Text(
                    'Program Date',
                    style: TextStyle(
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
                      width: 160,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFECECEC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      child: const Row(children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Start Date',
                              style: TextStyle(
                                color: Color(0xFF9397A0),
                                fontSize: 11,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    const Spacer(),
                    Container(
                      width: 160,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFECECEC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      child: const Row(children: [
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'End Date',
                              style: TextStyle(
                                color: Color(0xFF9397A0),
                                fontSize: 11,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: 330,
                  height: 50,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3B4367),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Center(
                    child: Text(
                      'CREATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
