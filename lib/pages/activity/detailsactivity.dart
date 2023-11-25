import 'package:escout/pages/attendance/attendancePage3.dart';
import 'package:escout/pages/attendance/recordAttendance.dart';
import 'package:flutter/material.dart';

class DetailsActivity extends StatefulWidget {
  dynamic activity;
  DetailsActivity({super.key, required this.activity});

  @override
  State<DetailsActivity> createState() => _DetailsActivityState(activity);
}

class _DetailsActivityState extends State<DetailsActivity> {
  _DetailsActivityState(this.activity);

  dynamic activity;
  DateTime startdate = DateTime.now(), enddate = DateTime.now();
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

  List<DateTime> daysInvolved = [];
  @override
  Widget build(BuildContext context) {
    startdate = DateTime.parse(activity['startdate']);
    enddate = DateTime.parse(activity['enddate']);

    print(activity);
    daysInvolved.clear();

    var diff = enddate.difference(startdate);
    var tempdate = startdate;
    for (var i = 0; i <= diff.inDays; i++) {
      daysInvolved.add(tempdate);
      tempdate = tempdate.add(const Duration(days: 1));
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: 120,
          decoration: const BoxDecoration(color: Color(0xFF2C225B)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
              const SizedBox(
                width: 30,
              ),
              const Text(
                'Details Activity',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  activity['imageurl'],
                  width: MediaQuery.sizeOf(context).width,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 90,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const ShapeDecoration(
                              color: Colors.black,
                              shape: OvalBorder(),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            activity['category'],
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 0.85,
              height: 120,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFAFA),
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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      activity['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          activity['location'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${startdate.day} - ${enddate.day} ${monthName[enddate.month - 1]} 2023',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(Icons.account_circle),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'PPM NEGERI JOHOR',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Select the date of activity',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: daysInvolved.length,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.15 / 2),
                  itemBuilder: (context, index) {
                    return buildDate(context, index);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Ink(
                    width: 135,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFECECEC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
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
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(10),
                  child: Ink(
                    width: 135,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF3B3F65),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Completed',
                        textAlign: TextAlign.center,
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
                )
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget buildDate(BuildContext context, int index) {
    List<String> monthAbbreviations =
        monthName.map((month) => month.substring(0, 3)).toList();

    DateTime date = daysInvolved.elementAt(index);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => attendancePage3(
                  activity: activity,
                  attendancekey: '${date.day}${date.month}${date.year}')));
        },
        borderRadius: BorderRadius.circular(5),
        child: Ink(
          width: MediaQuery.sizeOf(context).width * 0.85,
          height: 40,
          decoration: ShapeDecoration(
            color: const Color(0xFF2C225B),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Center(
            child: Text(
              '${date.day} ${monthAbbreviations[date.month - 1]} ${date.year}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
