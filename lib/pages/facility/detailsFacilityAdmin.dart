import 'package:escout/backend/backend.dart';
import 'package:escout/pages/facility/addFacility.dart';
import 'package:escout/pages/facility/facilityAccessed.dart';
import 'package:flutter/material.dart';

class detailsFacilityAdmin extends StatefulWidget {
  final dynamic facilityItem;
  const detailsFacilityAdmin({super.key, required this.facilityItem});

  @override
  State<detailsFacilityAdmin> createState() =>
      _detailsFacilityAdminState(facilityItem);
}

class _detailsFacilityAdminState extends State<detailsFacilityAdmin> {
  dynamic facilityItem;
  _detailsFacilityAdminState(this.facilityItem);

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Container(
      width: _mediaQuery.size.width,
      height: _mediaQuery.size.height,
      color: Colors.white,
      child: Column(children: <Widget>[
        _appBar(context),
        facilityImage(SupabaseB().getFacilityImage(facilityItem['facility'])),
        facilityInfo(),
        const SizedBox(height: 13),
        const Text(
          'October 2023',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: .3,
          ),
        ),
        selectDate(),
      ]),
    ));
  }

  facilityImage(String url) => Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromRGBO(237, 237, 237, 100),
              child: Image.network(url),
            ),
          );
        },
      );

  facilityInfo() => Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(top: 15, right: 25, left: 25),
            child: Container(
              height: 230,
              width: 375,
              //decoration: BoxDecoration(color: Colors.red),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                EditButton(),
                const SizedBox(height: 7),
                Container(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width * 0.8,
                      minHeight: 190),
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
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //facility name
                          Text(
                            facilityItem['name'],
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 13),

                          //facility address
                          Row(
                            children: [
                              const Icon(
                                Icons.navigation_rounded,
                                color: Color(0xFF2C225B),
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${facilityItem['address1']}, ${facilityItem['address2']}, ${facilityItem['postcode']} ${facilityItem['city']}, ${facilityItem['state']}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: .3,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 7),

                          //facility phone
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Color(0xFF2C225B),
                                size: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                facilityItem['pic'] ??= 'None',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: .3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),

                          //facility admin
                          const Row(
                            children: [
                              Icon(
                                Icons.account_circle_rounded,
                                color: Color(0xFF2C225B),
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'PPM DAERAH BATU PAHAT',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: .3,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),
                        ]),
                  ),
                )
              ]),
            ),
          );
        },
      );
  Widget selectDate() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 13, 25, 0),
      child: TextField(
        //controller:
        //onChanged:
        decoration: InputDecoration(
          hintText: 'Select date of facility access',
          hintStyle: const TextStyle(
              fontSize: 14.0, color: Color.fromRGBO(147, 151, 160, 100)),
          contentPadding: const EdgeInsets.only(left: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
              borderSide: BorderSide.none),
          fillColor: const Color.fromRGBO(251, 251, 251, 100),
          filled: true,
          suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 17),
              child: IconButton(
                icon: const Icon(
                  Icons.calendar_today_rounded,
                  color: Color.fromRGBO(147, 151, 160, 100),
                  size: 19,
                ),
                onPressed: () async {
                  DateTime? datePicked = await showDatePicker(
                      context: context,
                      firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                      lastDate: DateTime.now().add(const Duration(days: 365)));

                  if (datePicked != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return facilityAccessed(
                        facilityItem: facilityItem,
                        timePicked: datePicked,
                      );
                    }));
                  }
                },
              )),
        ),
      ),
    );
  }

  Widget EditButton() {
    return SizedBox(
      width: 90.0,
      height: 25.0,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return addFacilityPage(
              isEditMode: true,
              facilityItem: facilityItem,
            );
          }));
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF2C225B),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.edit,
              size: 12.0,
              color: Colors.white,
            ),
            SizedBox(width: 8.0),
            Text(
              'Edit',
              style: TextStyle(
                fontSize: 12.0,
                decoration: TextDecoration.underline,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _appBar(context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    height: 90,
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
          'Details Facility',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            //fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ],
    ),
  );
}

Widget _backButton(context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, left: 25),
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: const Color.fromRGBO(59, 63, 101, 100),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ),
  );
}
