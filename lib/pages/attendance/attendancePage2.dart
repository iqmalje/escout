import 'package:flutter/material.dart';

class attendancePage2 extends StatefulWidget {
  const attendancePage2({super.key});

  @override
  State<attendancePage2> createState() => _attendancePage2State();
}

class _attendancePage2State extends State<attendancePage2> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
          body: Container(
        width: _mediaQuery.size.width,
        height: _mediaQuery.size.height,
        color: Color.fromRGBO(237, 237, 237, 100),
        child: Column(children: <Widget>[
          _appBar(context),
          displayActivity(),
          addParticipant(),
          _addButton(),
        ]),
      ));
  }
}

Widget _appBar(context) {
  return Container(
      height: 155,
      width: MediaQuery.of(context).size.width,
      color: Color.fromRGBO(44, 34, 91, 100),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _backButton(context),
            SizedBox(width: 25),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                'Add Participant',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .3),
              ),
            )
          ],
        ),
      ));
}

Widget _backButton(context) {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 25),
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
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 25,
          color: Color.fromRGBO(59, 63, 101, 100),
          onPressed: () {},
        ),
      ),
    ),
  );
}

Widget displayActivity() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      SizedBox(height: 35),
      Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(
          'Activity',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: .3,
          ),
        ),
      ),
      SizedBox(height: 25),
      theActivity(
        activityName: 'Johor Rovers Vigil 2023 & Serving For The Future',
        activityID: '011220',
        activityLocation: 'KEM JUBLI INTAN TANJUNG LABUH BATU PAHAT',
        activityOrgnzr: 'PPM NEGERI JOHOR',
      ),
    ],
  );
}

class theActivity extends StatefulWidget {
  final String activityName;
  final String activityID;
  final String activityLocation;
  //final DateTime activityDate;
  final String activityOrgnzr;

  theActivity(
      {required this.activityName,
      required this.activityID,
      required this.activityLocation,
      required this.activityOrgnzr});

  @override
  State<theActivity> createState() => _theActivityState();
}

class _theActivityState extends State<theActivity> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385,
      height: 173,
      decoration: BoxDecoration(
        color: Color.fromRGBO(251, 251, 251, 100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 18, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //acitivity name
            Text(
              widget.activityName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: .3,
              ),
            ),
            SizedBox(height: 5),

            //acitivity ID
            Text(
              '(Event ID: ' + widget.activityID + ')',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 15),

            //acitivity location, date, organizer)
            icon_activity(widget.activityLocation, Icon(Icons.location_on)),
            icon_activity("date", Icon(Icons.calendar_today)),
            icon_activity(
                widget.activityOrgnzr, Icon(Icons.account_circle_rounded)),
          ],
        ),
      ),
    );
  }
}

Widget icon_activity(String detail, Icon icon) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      children: <Widget>[
        Icon(
          icon.icon,
          color: Color.fromRGBO(44, 34, 91, 100),
        ),
        SizedBox(width: 15),
        Text(
          detail,
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.normal, letterSpacing: .3),
        )
      ],
    ),
  );
}

Widget addParticipant() {
  return Padding(
    padding: const EdgeInsets.only(top: 35),
    child: Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Add participant Scout ID',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: .3,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),

        //input scout ID
        SizedBox(
          height: 55,
          width: 370,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Participant Scout ID',
              hintStyle: TextStyle(
                fontSize: 14.0, 
                color: Color.fromRGBO(147, 151, 160, 100)
              ),
              contentPadding: EdgeInsets.only(left: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide.none
              ),
              fillColor: Colors.white,
              filled: true, 
            ),
          ),
        ),
      ]),
  );
}

Widget _addButton() {
return  Expanded(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(44, 34, 91, 100),
                elevation: 0,
                fixedSize: const Size(355, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {},
              child: Text(
                'ADD PARTICIPANT',
                style: TextStyle(
                  color: Colors.white,
                ),),
            ),
          )));
}