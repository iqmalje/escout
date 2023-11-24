import 'package:flutter/material.dart';

class RecordAttendance extends StatefulWidget {
  const RecordAttendance({super.key});

  @override
  State<RecordAttendance> createState() => _RecordAttendanceState();
}

class _RecordAttendanceState extends State<RecordAttendance> {
  TextEditingController search = TextEditingController(),
      attendance = TextEditingController();
  FocusNode fn = FocusNode();
  @override
  Widget build(BuildContext context) {
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
                'Participants',
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 35,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: TextField(
                  controller: search,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(
                        color: Color(0xFF9397A0),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      hintText: "Search participant's name"),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'List of participants',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 35,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 228, 228, 228),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: TextField(
                  focusNode: fn,
                  controller: attendance,
                  autofocus: true,
                  onSubmitted: (value) {
                    //do logic

                    attendance.clear();
                    fn.requestFocus();
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      prefixIcon: Icon(Icons.account_circle),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(
                        color: Color(0xFF9397A0),
                        fontSize: 13,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      hintText: "Click here to add participants"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 500,
                decoration: ShapeDecoration(
                  color: const Color(0xFFF8F8F8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 500,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.8 * 0.1,
                            child: const Text(
                              'No',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQuery.sizeOf(context).width * 0.8 * 0.65,
                            child: const Text(
                              'Name',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQuery.sizeOf(context).width * 0.8 * 0.25,
                            child: const Text(
                              'Time',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.sizeOf(context).width * 0.8 - 10,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 100,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.8 *
                                        0.1,
                                    child: Text(
                                      (index + 1).toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.8 *
                                        0.65,
                                    child: const Text(
                                      'IQMAL AIZAT  FARISHA NABIHA',
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.8 *
                                        0.25,
                                    child: const Text(
                                      '08:12 AM',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
