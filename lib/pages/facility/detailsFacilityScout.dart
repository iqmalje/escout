import 'package:facilitypage/facilityAccessed.dart';
import 'package:flutter/material.dart';

class detailsFacilityScout extends StatefulWidget {
  const detailsFacilityScout({super.key});

  @override
  State<detailsFacilityScout> createState() => _detailsFacilityScoutState();
}

class _detailsFacilityScoutState extends State<detailsFacilityScout> {
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
        facilityImage(),
        SizedBox(height: 20),
        facilityInfo(),
        SizedBox(height: 15 ),
        facilityAccessed(),
      ]),
    ));
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

facilityImage() => Builder(
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Color.fromRGBO(237, 237, 237, 100),
          ),
        );
      },
    );

facilityInfo() => Builder(
      builder: (BuildContext context) {
        return Container(
          height: 190,
          width: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              //facility name
              Text(
                'BILIK MESYUARAT DI PEJABAT PERSEKUTUAN\nPENGAKAP MALAYSIA NEGERI JOHOR',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 13),

              //facility address
              Row(
                children: [
                  Icon(
                    Icons.navigation_rounded,
                    color: Color(0xFF2C225B),
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'No. 22-01, Jalan Kolam Air 1, Taman Nong Chik\nHeights, 80100 Johor Bahru, Johor',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .3,
                    ),
                  )
                ],
              ),
              SizedBox(height: 7),

              //facility phone
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Color(0xFF2C225B),
                    size: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '0123456789',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .3,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(En. Alif)',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),

              //facility admin
              Row(
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
              SizedBox(height: 7),
            ]),
          ),
        );
      },
    );

facilityAccessed() => Builder(
      builder: (BuildContext context) {
        return Container(
          height: 100,
          width: 370,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Facility Access Timestamps',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: .3,
                        fontSize: 15),
                  )
                ]),
          ),
        );
      },
    );
