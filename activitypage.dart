import 'package:escout/backend/backend.dart';
import 'package:escout/model/activity.dart';
import 'package:escout/pages/activity/createactivitypage.dart';
import 'package:escout/pages/activity/detailsactivity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  DateTime selectedDate = DateTime.now();
  List<Activity> activities = [];

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

List<String> images = [
  "assets/images/myImage.jpg",
  "assets/images/myimage2.jpg",
  // "assets/images/image4.png"
];

List<String> titles = [
  "Johor Rovers Vigil 2023 & Serving For The Future",
  "WORLD JOTA JOTI 2023 STESEN 9M4CPJ Kelolaan JOSRAC",
  // "WORLD JOTA JOTI 2023 STESEN 9M4CPJ Kelolaan JOSRAC",
];

  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  Future<void> _selectDate(BuildContext context) async {
    selectedMonth = selectedDate.month;
    selectedYear = selectedDate.year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2E3B78),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          floatingActionButton: Builder(builder: (context) {
            if (SupabaseB.isAdminToggled) {
              // Assuming SupabaseB.isAdminToggled is defined in your backend logic
              return CircleAvatar(
                maxRadius: 30,
                backgroundColor: const Color(0xFF2E3B78),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateActivityPage()));
                    setState(() {});
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
              width: MediaQuery.of(context).size.width,
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
                  maxWidth: MediaQuery.of(context).size.width,
                  maxHeight: double.infinity),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Container(
                        width: 140,
                        height: 30,
                        decoration: ShapeDecoration(
                          color: Color.fromARGB(255, 238, 238, 238),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${monthName[selectedDate.month - 1]} ${selectedDate.year.toString().substring(2)}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 5),
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
                  FutureBuilder<List<Activity>>(
                    future: SupabaseB.isAdminToggled
                        ? SupabaseB().getActivities(filters: {
                            'year': selectedYear,
                            'month': selectedMonth
                          })
                        : SupabaseB().getAttendedActivities(
                            '$selectedYear-${selectedMonth.toString().padLeft(2, '0')}-%'),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      activities = snapshot.data!;
                      return Expanded(
                        // child: Column(
                        //   children: [
                        //     buildActivity(activities.elementAt(0),
                        //         const AssetImage("assets/images/myImage.jpg")),
                        //     buildActivity(activities.elementAt(1),
                        //         const AssetImage("assets/images/myimage2.jpg")),
                            

                        //   ],
                        // ),
                        child: ListView.builder(
                          itemCount: activities.length,
                          itemBuilder: (context, index) {
                            return buildActivity(activities.elementAt(index),titles[index], AssetImage(images[index]));
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildActivity(Activity item, String myTitle,  ImageProvider image) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsActivity(activity: item)));
          setState(() {});
        },
        child: Container(
          width: 340,
          height: 250,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    left: MediaQuery.of(context).size.width * 0.58,
                    right: 10),
                child: Row(
                  children: [
                    Text(
                      "Camping",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                        height: 15,
                        child: Image.asset("assets/images/camp_icon.png")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: image,
                          /* const AssetImage("assets/images/myImage.jpg"), */ fit:
                              BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  myTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.6),
                child: Text("20/10/2023",style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  
                ),),
              )
            ],
          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(DateTime date, List<String> format) {
    return DateFormat(format.join(' ')).format(date);
  }
}
