import 'dart:io';

import 'package:escout/backend/backend.dart';
import 'package:escout/pages/homepage/temppage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateFeedPage extends StatefulWidget {
  const CreateFeedPage({super.key});

  @override
  State<CreateFeedPage> createState() => _CreateFeedPageState();
}

class _CreateFeedPageState extends State<CreateFeedPage> {
  ImagePicker imagePicker = ImagePicker();

  XFile? imagePicked;
  bool isFeed = false;

  TextEditingController name = TextEditingController(),
      category = TextEditingController(),
      location = TextEditingController(),
      fee = TextEditingController(),
      description = TextEditingController();
  DateTime startdate = DateTime.now(),
      enddate = DateTime.now().add(const Duration(days: 1)),
      registerenddate = DateTime.now().add(const Duration(days: 10));

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
                  color: const Color.fromRGBO(237, 237, 237, 100),
                ),
              ),
              postAuthor(context),
              buildUploadImage(context),

              //program name
              textField({
                'controller': name,
                'onChange': (String val) {},
                'label': 'Program Name',
                'hintText': 'Program name',
                'icon': null
              }),
              //program category
              textField({
                'controller': category,
                'onChange': (String val) {},
                'label': 'Program Category',
                'hintText': 'Program category',
                'icon': Icons.arrow_drop_down_outlined
              }),
              //program location
              textField({
                'controller': location,
                'onChange': (String val) {},
                'label': 'Program Location',
                'hintText': 'Program location',
                'icon': null
              }),

              //program date
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Program Date',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .3,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //start date
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)));

                        if (pickedDate == null) return;
                        if (pickedDate.millisecondsSinceEpoch >=
                            enddate.millisecondsSinceEpoch) {
                          return;
                        } else {
                          setState(() {
                            startdate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        width: 160,
                        height: 35,
                        decoration: ShapeDecoration(
                          color: const Color.fromRGBO(237, 237, 237, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('dd/MM/yyyy').format(startdate),
                                style: const TextStyle(
                                  color: Color(0xFF9397A0),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const Icon(Icons.calendar_today)
                            ],
                          ),
                        ),
                      ),
                    ),
                    //end date
                    GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)));

                        if (pickedDate == null) return;

                        if (startdate.millisecondsSinceEpoch >=
                            pickedDate.millisecondsSinceEpoch) {
                          return;
                        } else {
                          setState(() {
                            enddate = pickedDate;
                          });
                        }
                      },
                      child: Container(
                        width: 160,
                        height: 35,
                        decoration: ShapeDecoration(
                          color: const Color.fromRGBO(237, 237, 237, 100),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('dd/MM/yyyy').format(enddate),
                                style: const TextStyle(
                                  color: Color(0xFF9397A0),
                                  fontSize: 13,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const Icon(Icons.calendar_today)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //program fee
              textField({
                'controller': fee,
                'onChange': (String val) {},
                'label': 'Program Fee',
                'hintText': 'Program fee (RM)',
                'icon': null
              }),
              //program end date registration
              const Padding(
                padding: EdgeInsets.only(left: 25.0, top: 10),
                child: Text(
                  'Program end date registration',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .3,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 365)));

                    if (pickedDate == null) return;
                    if (startdate.millisecondsSinceEpoch >=
                        registerenddate.millisecondsSinceEpoch) {
                      return;
                    } else {
                      setState(() {
                        registerenddate = pickedDate;
                      });
                    }
                  },
                  child: Container(
                    height: 35,
                    decoration: ShapeDecoration(
                      color: const Color.fromRGBO(237, 237, 237, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy').format(registerenddate),
                            style: const TextStyle(
                              color: Color(0xFF9397A0),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const Icon(Icons.calendar_today)
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //program description
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text(
                  'Program Description',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: .3,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25),
                child: SizedBox(
                  child: TextField(
                    controller: description,
                    //onChanged: (){}
                    decoration: InputDecoration(
                      hintText: 'Program description',
                      hintStyle: const TextStyle(
                          fontSize: 14.0,
                          color: Color.fromRGBO(147, 151, 160, 100)),
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: BorderSide.none),
                      fillColor: const Color.fromRGBO(237, 237, 237, 100),
                      filled: true,
                    ),
                  ),
                ),
              ),

              //toggle button
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add the program in the acitivity list',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    //toggle button
                    switchButton(),
                  ],
                ),
              ),

              //post button
              postButton(),
            ]),
      ),
    ));
  }

  Widget _appBar(context) {
    return Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.clear),
                color: const Color.fromRGBO(46, 48, 132, 100),
                iconSize: 25,
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
            const SizedBox(width: 12),
            const Text(
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

  Padding buildUploadImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () async {
          imagePicked =
              await imagePicker.pickImage(source: ImageSource.gallery);

          setState(() {});
        },
        child: Builder(builder: (context) {
          if (imagePicked == null) {
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromRGBO(237, 237, 237, 100),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.upload_file),
                      color: const Color.fromRGBO(217, 217, 217, 100),
                      iconSize: 35,
                    ),
                    const Text(
                      'Upload an image',
                      style: TextStyle(
                          color: Color.fromRGBO(217, 217, 217, 100),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          letterSpacing: .3),
                    ),
                  ]),
            );
          } else {
            return Image.file(File(imagePicked!.path));
          }
        }),
      ),
    );
  }

  Widget textField(Map textItems) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textItems['label'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: .3,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: TextField(
              controller: textItems['controller'],
              onChanged: textItems['onChange'],
              decoration: InputDecoration(
                hintText: textItems['hintText'],
                hintStyle: const TextStyle(
                    fontSize: 14.0, color: Color.fromRGBO(147, 151, 160, 100)),
                contentPadding: const EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide.none),
                fillColor: const Color.fromRGBO(237, 237, 237, 100),
                filled: true,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: textItems['icon'] != null
                      ? Icon(
                          textItems['icon'],
                          color: const Color.fromRGBO(147, 151, 160, 100),
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

  Switch switchButton() {
    return Switch(
      activeColor: Color.fromARGB(255, 255, 255, 255),
      activeTrackColor: const Color(0xFF2E3B78),
      value: isFeed,
      onChanged: (newSwitch) {
        setState(() {
          isFeed = newSwitch;
        });
      },
    );
  }

  Widget postButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 45),
      child: Center(
        child: ElevatedButton(
          onPressed: () async {
            if (name.text.isEmpty ||
                category.text.isEmpty ||
                location.text.isEmpty ||
                description.text.isEmpty ||
                fee.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please fill in all the fields!')));
              return;
            }

            if (imagePicked == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please pick an image')));
            }

            await SupabaseB().createFeed({
              'name': name.text,
              'category': category.text,
              'location': location.text,
              'startdate':
                  '${startdate.year}-${startdate.month}-${startdate.day}',
              'enddate': '${enddate.year}-${enddate.month}-${enddate.day}',
              'is_feed': isFeed,
              'fee': fee.text,
              'registrationenddate':
                  '${registerenddate.year}-${registerenddate.month}-${registerenddate.day}',
              'description': description.text,
              'file': File(imagePicked!.path)
            });

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => TempPage()),
                (route) => false);
          },
          child: const Text('POST',
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: .3,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF2E3B78),
            elevation: 0,
            fixedSize: const Size(355, 50),
          ),
        ),
      ),
    );
  }
}
