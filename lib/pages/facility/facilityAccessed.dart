import 'package:flutter/material.dart';

class facilityAccessed extends StatefulWidget {
  const facilityAccessed({super.key});

  @override
  State<facilityAccessed> createState() => _facilityAccessedState();
}

class _facilityAccessedState extends State<facilityAccessed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _appBar(context),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'Facility',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: .3,
            ),
          ),
        ),
        SizedBox(height: 13),
        facilityInfo(),
        SizedBox(height: 20),
        _accessedDate(),
        SizedBox(height: 20),

        //Total of facility’s accessed
        accessedInfo({
          'info': 'Total of facility’s accessed',
          'accessedCount': '3'
        }),
        SizedBox(height: 15),

        //Number of people accessed
        accessedInfo({
          'info': 'Number of people accessed',
          'accessedCount': '3'
        }),

        showAllButton(),
      ]),
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
          'Facility Accessed',
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

facilityInfo() => Builder(
      builder: (BuildContext context) {
        return Padding(
         padding: const EdgeInsets.only(left:25, right: 25),
          child: Container(
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
          ),
        );
      },
    );

Widget _accessedDate() {
  return Padding(
   padding: const EdgeInsets.only(left:45, right: 25),
    child: Row(
      children: [
        Text(
          'Date',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget accessedInfo(Map infoText) {
  return Padding(
    padding: const EdgeInsets.only(left:25, right: 25),
    child: Container(
      height: 43,
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
        padding: const EdgeInsets.only(right:40, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              infoText['info'],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: .3
              ),
            ),
            Text(
              infoText['accessedCount'],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget showAllButton() {
return  Padding(
  padding: const EdgeInsets.only(left:25, right: 25, top: 20),
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.transparent,
      elevation: 0,
      fixedSize: const Size(370, 45),
      side: const BorderSide(
        width: 2,
        color: Color(0xFF2C225B),
        style: BorderStyle.solid,
      ),
    ),
    onPressed: () {},
    child: Text(
      'Show all the people accessed',
      style: TextStyle(
        decoration: TextDecoration.underline,
        color:  Color(0xFF2C225B),
        fontSize: 14,
      ),
    ),
  ),
);
}
