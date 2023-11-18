import 'package:flutter/material.dart';

class createFeedPage extends StatefulWidget {
  const createFeedPage({super.key});

  @override
  State<createFeedPage> createState() => _createFeedPageState();
}

class _createFeedPageState extends State<createFeedPage> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
        body: Container(
      width: _mediaQuery.size.width,
      height: _mediaQuery.size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _appBar(context),

              SizedBox(
                height: 10,
                child: Container(
                  color: Color.fromRGBO(237, 237, 237, 100),
                ),
              ),

              postDetail(),

              //program name
              textField({
                'controller': new TextEditingController(),
                'onChange': (String val) {},
                'label': 'Program Name',
                'hintText': 'Program name',
                'icon': null
              }),
              //program category
              textField({
                'controller': new TextEditingController(),
                'onChange': (String val) {},
                'label': 'Program Category',
                'hintText': 'Program category',
                'icon': Icons.arrow_drop_down_outlined
              }),
              //program location
              textField({
                'controller': new TextEditingController(),
                'onChange': (String val) {},
                'label': 'Program Location',
                'hintText': 'Program location',
                'icon': null
              }),

              //program date
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Program Date',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .3,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //start date
                    SizedBox(
                      height: 35,
                      width: 170,
                      child: TextField(
                        controller: TextEditingController(),
                        //onChanged: (){},
                        decoration: InputDecoration(
                          hintText: 'Start Date',
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(147, 151, 160, 100)),
                          contentPadding: EdgeInsets.only(left: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide.none),
                          fillColor: Color.fromRGBO(237, 237, 237, 100),
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Icon(
                              Icons.calendar_today_rounded,
                              size: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //end date
                    SizedBox(
                      height: 35,
                      width: 170,
                      child: TextField(
                        controller: TextEditingController(),
                        //onChanged: (){},
                        decoration: InputDecoration(
                          hintText: 'End Date',
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Color.fromRGBO(147, 151, 160, 100)),
                          contentPadding: EdgeInsets.only(left: 20),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide.none),
                          fillColor: Color.fromRGBO(237, 237, 237, 100),
                          filled: true,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Icon(
                              Icons.calendar_today_rounded,
                              size: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //program fee
              textField({
                'controller': new TextEditingController(),
                'onChange': (String val) {},
                'label': 'Program Fee',
                'hintText': 'Program fee (RM)',
                'icon': null
              }),
              //program end date registration
              textField({
                'controller': new TextEditingController(),
                'onChange': (String val) {},
                'label': 'Program End Date Registration',
                'hintText': 'Program end date of registration',
                'icon': Icons.calendar_today_rounded
              }),

              //program description
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  'Program Description',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .3,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: SizedBox(
                  height: 100,
                  width: 360,
                  child: TextField(
                    controller: TextEditingController(),
                    //onChanged: (){}
                    decoration: InputDecoration(
                      hintText: 'Program description',
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromRGBO(147, 151, 160, 100)),
                      contentPadding: EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: BorderSide.none),
                      fillColor: Color.fromRGBO(237, 237, 237, 100),
                      filled: true,
                    ),
                  ),
                ),
              ),

              //toggle button
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add the program in the acitivity list',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    //toggle button
                    toggleButton(),
                  ],
                ),
              ),

              //post button
              postButton(),
            ]),
      ),
    ));
  }
}

Widget _appBar(context) {
  return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.clear),
              color: Color.fromRGBO(46, 48, 132, 100),
              iconSize: 35,
            ),
          ],
        ),
      ));
}

Widget postAuthor(context) {
  return Container(
    height: 50,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/images/pengakap.png',
            width: 36,
            height: 36,
          ),
          SizedBox(width: 12),
          Text(
            'PPM NEGERI JOHOR',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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

class postDetail extends StatefulWidget {
  const postDetail({super.key});

  @override
  State<postDetail> createState() => _postDetailState();
}

class _postDetailState extends State<postDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //header
        postAuthor(context),

        //image upload
        uploadProgramImage(),
      ],
    );
  }
}

Widget textField(Map textItems) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, left: 25),
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
          height: 35,
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
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 17),
                child: textItems['icon'] != null
                    ? Icon(
                        textItems['icon'],
                        color: Color.fromRGBO(147, 151, 160, 100),
                        size: 19,
                      )
                    : null,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class toggleButton extends StatefulWidget {
  const toggleButton({super.key});

  @override
  State<toggleButton> createState() => _toggleButtonState();
}

class _toggleButtonState extends State<toggleButton> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Switch(
        activeColor: Color.fromRGBO(44, 34, 91, 100),
        value: isSwitch,
        onChanged: (newSwitch) {
          setState(() {
            isSwitch = newSwitch;
          });
        },
      ),
    );
  }
}

Widget postButton() {
  return Padding(
    padding: const EdgeInsets.only(top: 30, bottom: 45),
    child: Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text('POST',
            style: TextStyle(
              fontSize: 14,
              letterSpacing: .3,
              fontWeight: FontWeight.bold,
            )),
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(44, 34, 91, 100),
          elevation: 0,
          fixedSize: const Size(355, 50),
        ),
      ),
    ),
  );
}
