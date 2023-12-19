import 'package:auto_size_text/auto_size_text.dart';
import 'package:escout/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FacilityAccessedInformation extends StatefulWidget {
  final dynamic attendeeItem;
  final String facilityID;
  final DateTime timePicked;
  const FacilityAccessedInformation(
      {super.key,
      required this.attendeeItem,
      required this.facilityID,
      required this.timePicked});

  @override
  State<FacilityAccessedInformation> createState() =>
      _FacilityAccessedInformationState(attendeeItem, facilityID, timePicked);
}

class _FacilityAccessedInformationState
    extends State<FacilityAccessedInformation> {
  final dynamic attendeeItem;
  final String facilityID;
  final DateTime timePicked;
  _FacilityAccessedInformationState(
      this.attendeeItem, this.facilityID, this.timePicked);
  @override
  Widget build(BuildContext context) {
    DateTime starttime =
        DateTime.parse(attendeeItem['starttime']).add(const Duration(hours: 8));

    DateTime endtime = DateTime.now();
    print(attendeeItem['endtime']);
    if (attendeeItem['endtime'] != null) {
      endtime =
          DateTime.parse(attendeeItem['endtime']).add(const Duration(hours: 8));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 90,
                decoration: const BoxDecoration(color: Color(0xFF2E3B78)),
                child: const Center(
                  child: Text(
                    'Person Details',
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
              const SizedBox(
                height: 18,
              ),
              const Text(
                'JOHOR SCOUT DIGITAL ID',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
              FutureBuilder(
                  future:
                      SupabaseB().getScoutDetails(attendeeItem['accessed_by']),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Stack(
                      children: [
                        Image.asset('assets/images/card_profile.png'),
                        Positioned.fill(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 29,
                              ),
                              Image.asset('assets/images/icon_pengakap.png'),
                              const SizedBox(
                                height: 12,
                              ),
                              const Text(
                                'PERSEKUTUAN PENGAKAP MALAYSIA NEGERI JOHOR',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'Scout Association of Malaysia Johor State',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(
                                height: 11,
                              ),
                              Container(
                                width: 140,
                                height: 140,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snapshot.data['image_url'])),
                                  color: Colors.white,
                                  shape: OvalBorder(
                                    side: BorderSide(
                                        width: 4, color: Color(0xFF00579E)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: AutoSizeText(
                                          attendeeItem['fullname'],
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Flexible(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  child: AutoSizeText(
                                    snapshot.data['position'],
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 34.0, top: 10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 76,
                                          height: 18,
                                          child: Text(
                                            'NO AHLI',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 76,
                                          height: 18,
                                          child: Text(
                                            ': ${snapshot.data['no_ahli']}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 76,
                                          height: 18,
                                          child: Text(
                                            'NO TAULIAH',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 76,
                                          height: 18,
                                          child: Text(
                                            ': ${snapshot.data['no_tauliah']}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 76,
                                          height: 18,
                                          child: Text(
                                            'UNIT',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ': ${snapshot.data['unit']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 76,
                                          height: 18,
                                          child: Text(
                                            'DAERAH',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ': ${snapshot.data['daerah']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 190,
                                height: 30,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'TAULIAH PENGAKAP JOHOR',
                                    style: TextStyle(
                                      color: Color(0xFF3B3F65),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 530,
                        ),
                      ],
                    );
                  }),
              const Text(
                'Facility Accessed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: SupabaseB().getAttendedDates(facilityID, timePicked),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return enterExit(snapshot.data);
                  })
            ],
          ),
        ),
      ),
    );
  }

  enterExit(dynamic data) => Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //enter exit header
                    const Padding(
                      padding: EdgeInsets.only(left: 100, right: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enter',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Exit',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //divider
                    const Divider(
                      height: 25,
                      color: Colors.black,
                      thickness: 1.5,
                      indent: 60,
                      endIndent: 60,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: data.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          DateTime starttime =
                              DateTime.parse(data[index]['starttime'])
                                  .add(const Duration(hours: 8));

                          DateTime? endtime = DateTime.tryParse(
                              data[index]['endtime'].toString());

                          print('endtime = $endtime');
                          if (endtime != null) {
                            endtime = endtime.add(const Duration(hours: 8));
                          }

                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 90, right: 90, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('hh:mm a').format(starttime),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                Builder(builder: (context) {
                                  if (data[index]['endtime'] == null) {
                                    return const Text(
                                      'None',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      DateFormat('hh:mm a').format(endtime!),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    );
                                  }
                                }),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    //time
                  ]),
            ),
          );
        },
      );
}
