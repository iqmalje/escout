import 'dart:io';

import 'package:escout/backend/backend.dart';
import 'package:escout/pages/feed/createFeedPage.dart';
import 'package:flutter/material.dart';

import '../activity/createactivitypage.dart';

class listPage extends StatefulWidget {
  const listPage({super.key});

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  List<dynamic> feeds = [];

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      floatingActionButton: Builder(builder: (context) {
        if (SupabaseB.isAdminToggled) {
          return CircleAvatar(
            maxRadius: 30,
            backgroundColor: const Color(0xFF2C225B),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(
                Icons.add,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateFeedPage()));
              },
            ),
          );
        } else {
          return Container();
        }
      }),
      body: Container(
          width: _mediaQuery.size.width,
          height: _mediaQuery.size.height,
          color: const Color.fromRGBO(237, 237, 237, 100),
          child: Column(
            children: <Widget>[
              //appbar
              _appBar(context),

              //page subtitle
              Container(
                height: 60,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text('Latest Update',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                ),
              ),

              //feed

              Expanded(
                  child: FutureBuilder<List<dynamic>>(
                      future: SupabaseB().getFeed(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        //parse data
                        feeds = snapshot.data!;

                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: feeds.length,
                            itemBuilder: (context, index) {
                              print(feeds[index]);
                              return buildAPost(context, feeds[index]);
                            });
                      })),
            ],
          )),
    );
  }
}

Widget _appBar(context) {
  return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFF2C225B),
      child: Image.asset('assets/images/escout_logo_panjang.png'));
}

Widget buildAPost(BuildContext context, dynamic item) {
  List<String> monthName = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  DateTime created_at =
      DateTime.parse(item['created_at'].toString().split('+')[0]);
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Column(
      children: <Widget>[
        //feed header
        Container(
          height: 50,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(children: <Widget>[
              Image.asset(
                'assets/images/pengakap.png',
                width: 36,
                height: 36,
              ),
              const SizedBox(width: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'PPM NEGERI JOHOR',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    '${created_at.day} ${monthName[created_at.month - 1]}, ${created_at.hour + 8}:${created_at.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),

        //feed image
        Container(
          color: Colors.lightBlue,
          child: Stack(children: <Widget>[
            //event image
            Image.network(item['imageurl']),

            //event type details
            Positioned(
              top: 8,
              right: 9,
              child: Container(
                width: 90,
                height: 23,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(children: <Widget>[
                  const SizedBox(width: 7),

                  //event type: colored-circle label
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(48, 46, 132, 100),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(width: 7),

                  //event type: name
                  Text(
                    item['category'],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: .3,
                    ),
                  )
                ]),
              ),
            ),
          ]),
        ),

        //feed caption
        Container(
          constraints: BoxConstraints(
              minWidth: MediaQuery.sizeOf(context).width, minHeight: 50),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //caption title
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: .3,
                      ),
                    ),
                    Text(item['description'] ??= 'No description available.')
                    //caption subtitle
                  ]),
            ),
          ),
        )
      ],
    ),
  );
}
