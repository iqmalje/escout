import 'package:flutter/material.dart';

import '../../backend/backend.dart';

class AllFacilityAccess extends StatefulWidget {
  final dynamic facilityItem;
  final DateTime timePicked;
  const AllFacilityAccess(
      {super.key, required this.facilityItem, required this.timePicked});

  @override
  State<AllFacilityAccess> createState() =>
      _AllFacilityAccessState(facilityItem, timePicked);
}

class _AllFacilityAccessState extends State<AllFacilityAccess> {
  dynamic facilityItem;
  DateTime timePicked;
  _AllFacilityAccessState(this.facilityItem, this.timePicked);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2E3B78),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 120,
              decoration: const BoxDecoration(color: Color(0xFF2E3B78)),
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
              child: FutureBuilder(
                  future: SupabaseB()
                      .getAllAccess(facilityItem['facility'], timePicked),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return const CircularProgressIndicator();
                    return Column(
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
                            controller: TextEditingController(),
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 10),
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
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
                          'List of people accessed',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8 *
                                          0.1,
                                      child: const Text(
                                        'No',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8 *
                                          0.65,
                                      child: const Text(
                                        'Name',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8 *
                                          0.25,
                                      child: const Text(
                                        'Time',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 1,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.8 -
                                          10,
                                  color: Colors.black,
                                ),
                                ListView.builder(
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return buildAttendees(
                                          context, index, snapshot.data[index]);
                                    }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        /*InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => attendancePage2(
                                    activity: this.activity,
                                    attendancekey: this.secondkey,
                                  )));
                        },
                        child: Ink(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Color(0xFF3B3F65),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Center(
                            child: Text(
                              'Add participant manually',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ) */
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }

  Row buildAttendees(BuildContext context, int index, dynamic item) {
    DateTime time = DateTime.parse(item['starttime']).add(Duration(hours: 8));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8 * 0.1,
          child: Text(
            (index + 1).toString(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8 * 0.65,
          child: Text(
            item['fullname'],
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8 * 0.25,
          child: Text(
            time.hour > 12
                ? '${time.hour - 12}:${time.minute.toString().padLeft(2, '0')} PM'
                : '${time.hour}:${time.minute.toString().padLeft(2, '0')} AM',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}