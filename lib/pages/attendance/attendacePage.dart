import 'package:flutter/material.dart';

class attendancePage extends StatefulWidget {
  const attendancePage({super.key});

  @override
  State<attendancePage> createState() => _attendancePageState();
}

class _attendancePageState extends State<attendancePage> {
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
          _instruction(),

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
                'Attendences',
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

Widget _instruction() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Please tap your Scout ID here to\nrecord your attendace',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: .3,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 25),
      Image.asset('assets/images/scanCardAttendance.png'),
      SizedBox(height: 10),
      Text(
        'Or',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          letterSpacing: .3,
        ),
      ),
      SizedBox(height: 30) ,
      addParticpantButton(buttonText: "Add participant manually")

    ],
  );
}

class addParticpantButton extends StatefulWidget {
  final String buttonText;

  addParticpantButton({required this.buttonText});

  @override
  _addParticpantButtonState createState() => _addParticpantButtonState();
}

class _addParticpantButtonState extends State<addParticpantButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      
      },
      child: Text(
        widget.buttonText,
        style: TextStyle(
          fontSize: 14,
          letterSpacing: .3,
        )),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(44, 34, 91, 100),
        elevation: 0,
        fixedSize: const Size(330, 40),
      ),
    );
  }
}