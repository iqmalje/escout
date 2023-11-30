import 'dart:io';

import 'package:escout/backend/backend.dart';
import 'package:escout/pages/activity/activitypage.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({super.key});

  @override
  State<CreateActivityPage> createState() => _CreateActivityPage();
}

class _CreateActivityPage extends State<CreateActivityPage> {
  TextEditingController name = TextEditingController(),
      category = TextEditingController(),
      location = TextEditingController();

  String dropdownValue = 'Camping';
  List<String> list = <String>['Meeting', 'Camping'];
  DateTime startdate = DateTime.now(),
      enddate = DateTime.now().add(const Duration(days: 1));
  final ImagePicker picker = ImagePicker();
  XFile? imagePicked;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2E3B78),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height),
            child: SingleChildScrollView(
              child: Column(
                //blue bow column
                children: [
                  Container(
                    //blue box container
                    width: MediaQuery.sizeOf(context).width,
                    height: 90,
                    decoration: const BoxDecoration(color: Color(0xFF2E3B78)),

                    child: Row(
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(100),
                          onTap: () {},
                          child: Ink(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 35,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Create Activity',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (image == null) return;
                      setState(() {
                        imagePicked = image;
                      });
                    },
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.sizeOf(context).width,
                        maxHeight: 200,
                      ),
                      child: Ink(
                        decoration:
                            const BoxDecoration(color: Color(0xFFECECEC)),
                        child: Builder(builder: (context) {
                          if (imagePicked == null) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    child: Image.asset(
                                        'assets/images/upload.png')),
                                const Text(
                                  'Upload an image',
                                  style: TextStyle(
                                    color: Color(0xFFD9D9D9),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return FittedBox(
                                fit: BoxFit.fill,
                                child: Image.file(File(imagePicked!.path)));
                          }
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.1),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 318,
                          child: Text(
                            'Program Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFECECEC),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: TextField(
                                    controller: name,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Program Name',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9397A0),
                                        fontSize: 11,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: 318,
                          child: Text(
                            'Program Category',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFECECEC),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 0,
                                ),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: 317,
                          child: Text(
                            'Program Location',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFECECEC),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: TextField(
                                    controller: location,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 11,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Program Location',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF9397A0),
                                        fontSize: 11,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          width: 317,
                          child: Text(
                            'Program Date',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: startdate
                                        .add(const Duration(days: 365)));

                                if (pickedDate == null) return;

                                //check if end date is later or equal to start date

                                if (startdate.millisecondsSinceEpoch >=
                                    enddate.millisecondsSinceEpoch) {
                                } else {
                                  setState(() {
                                    startdate = pickedDate;
                                  });
                                }
                              },
                              child: Container(
                                width: 160,
                                height: 40,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFECECEC),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        DateFormat('dd/MM/yyyy')
                                            .format(startdate),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: startdate
                                        .add(const Duration(days: 365)));

                                if (pickedDate == null) return;

                                //check if end date is less or equal to start date

                                if (startdate.millisecondsSinceEpoch >=
                                    enddate.millisecondsSinceEpoch) {
                                } else {
                                  setState(() {
                                    enddate = pickedDate;
                                  });
                                }
                              },
                              child: Container(
                                width: 160,
                                height: 40,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFECECEC),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        DateFormat('dd/MM/yyyy')
                                            .format(enddate),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            onTap: () async {
                              if (name.text.isEmpty ||
                                  category.text.isEmpty ||
                                  location.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please fill in all the fields!')));
                                return;
                              }

                              if (imagePicked == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Please pick an image first!')));
                                return;
                              }

                              await SupabaseB().addEvent({
                                'name': name.text,
                                'category': dropdownValue,
                                'location': location.text,
                                'startdate':
                                    DateFormat('yyyy-MM-dd').format(startdate),
                                'enddate':
                                    DateFormat('yyyy-MM-dd').format(enddate),
                                'file': File(imagePicked!.path)
                              });

                              Navigator.of(context).pop();
                            },
                            child: Ink(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              height: 50,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF3B4367),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              child: const Center(
                                child: Text(
                                  'CREATE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
