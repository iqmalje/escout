import 'package:flutter/material.dart';

class addFacilityPage extends StatefulWidget {
  const addFacilityPage({super.key});

  @override
  State<addFacilityPage> createState() => _addFacilityPageState();
}

class _addFacilityPageState extends State<addFacilityPage> {
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
        facilityDetails(),
        //create button
        cButton(),
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
          'Add Facility',
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

class uploadProgramImage extends StatefulWidget {
  const uploadProgramImage({super.key});

  @override
  State<uploadProgramImage> createState() => _uploadProgramImageState();
}

class _uploadProgramImageState extends State<uploadProgramImage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(237, 237, 237, 100),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.upload_file),
                color: Color.fromRGBO(217, 217, 217, 100),
                iconSize: 35,
              ),
              Text(
                'Upload an image',
                style: TextStyle(
                    color: Color.fromRGBO(217, 217, 217, 100),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    letterSpacing: .3),
              ),
            ]),
      ),
    );
  }
}

Widget textField(Map textItems) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        Text(
          textItems['label'],
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: .3,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 45,
          width: 360,
          child: TextField(
            controller: textItems['controller'],
            onChanged: textItems['onChange'],
            decoration: InputDecoration(
              hintText: textItems['hintText'],
              hintStyle: TextStyle(
                  fontSize: 14.0, color: Color.fromRGBO(147, 151, 160, 100)),
              contentPadding: EdgeInsets.only(left: 20),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: BorderSide.none),
              fillColor: Color.fromRGBO(237, 237, 237, 100),
              filled: true,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget cButton() {
  return Expanded(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('CREATE',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: .3,
                    fontWeight: FontWeight.bold,
                  )),
              style: ElevatedButton.styleFrom(
                primary:  Color(0xFF2C225B),
                elevation: 0,
                fixedSize: const Size(365, 50),
              ),
            ),
          )));
}

class facilityDetails extends StatefulWidget {
  const facilityDetails({super.key});

  @override
  State<facilityDetails> createState() => _facilityDetailsState();
}

class _facilityDetailsState extends State<facilityDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //image upload
        uploadProgramImage(),

        //facility details
        //facility name
        textField({
          'controller': new TextEditingController(),
          'onChange': (String val) {},
          'label': 'Facility Name',
          'hintText': 'Facility name',
        }),
        //facility address
        textField({
          'controller': new TextEditingController(),
          'onChange': (String val) {},
          'label': 'Facility Address',
          'hintText': 'Facility address',
        }),
        //pic of facility
        textField({
          'controller': new TextEditingController(),
          'onChange': (String val) {},
          'label': 'PIC of Facility',
          'hintText': 'Phone number (name)',
        }),


      ],
      
    );
  }
}
