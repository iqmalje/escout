import 'package:escout/pages/homepage/activitypage.dart';
import 'package:escout/pages/homepage/facilitypage.dart';
import 'package:escout/pages/homepage/homepage.dart';
import 'package:escout/pages/homepage/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//This tempage is responsible for hosting multiple pages that user can click through using the navbar
class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  int index = 0; //chosen page

  final List<Widget> _pages = [
    const Homepage(),
    const ActivityPage(),
    const FacilityPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0x28000000),
            blurRadius: 16,
            offset: Offset(0, -3),
            spreadRadius: 0,
          )
        ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Icon(
                        Icons.home,
                        size: 35,
                        color: index == 0
                            ? const Color(0xFF2E3B78)
                            : const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: index == 0
                          ? const Color(0xFF2E3B78)
                          : const Color(0xFFD9D9D9),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Icon(
                        Icons.calendar_month,
                        size: 35,
                        color: index == 1
                            ? const Color(0xFF2E3B78)
                            : const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  Text(
                    'Activity',
                    style: TextStyle(
                      color: index == 1
                          ? const Color(0xFF2E3B78)
                          : const Color(0xFFD9D9D9),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: Icon(
                        Icons.apartment,
                        size: 35,
                        color: index == 2
                            ? const Color(0xFF2E3B78)
                            : const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  Text(
                    'Facility',
                    style: TextStyle(
                      color: index == 2
                          ? const Color(0xFF2E3B78)
                          : const Color(0xFFD9D9D9),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Material(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: Icon(
                        Icons.account_circle,
                        size: 35,
                        color: index == 3
                            ? const Color(0xFF2E3B78)
                            : const Color(0xFFD9D9D9),
                      ),
                    ),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: index == 3
                          ? const Color(0xFF2E3B78)
                          : const Color(0xFFD9D9D9),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
