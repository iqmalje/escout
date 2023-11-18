import 'dart:io';

import 'package:flutter/material.dart';

class listPage extends StatefulWidget {
  const listPage({super.key});

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
          width: _mediaQuery.size.width,
          height: _mediaQuery.size.height,
          color: Color.fromRGBO(237, 237, 237, 100),
          child: Column(
            children: <Widget>[
              //appbar
              _appBar(),

              //page subtitle
              Container(
                height: 60,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text('Latest Update',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                ),
              ),

              //feed
              Expanded(child: feedList()),
            ],
          )),
    );
  }
}

Widget _appBar() {
  return Container(
    height: 150,
    //width: MediaQuery.of(context).,
    color: const Color.fromRGBO(46, 59, 120, 100),
    //child: Image.asset('assets/images/escoutlogo.png')
  );
}

class aPost extends StatefulWidget {
  const aPost({super.key});

  @override
  State<aPost> createState() => _aPostState();
}

class _aPostState extends State<aPost> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(width: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'PPM NEGERI JOHOR',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '7 October 2023, 10:06 PM',
                      style: TextStyle(
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
            height: 200,
            color: Colors.lightBlue,
            child: Stack(children: <Widget>[
              //event image
              Image.asset('assets/images/feedExample.png'),

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
                    SizedBox(width: 7),

                    //event type: colored-circle label
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(48, 46, 132, 100),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    SizedBox(width: 7),

                    //event type: name
                    Text(
                      'Camping',
                      style: TextStyle(
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
            height: 120,
            width: MediaQuery.of(context).size.width,
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
                        'Johor Rovers Vigil 2023 & Serving For The Future',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: .3,
                        ),
                      ),

                      //caption subtitle
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class feedList extends StatefulWidget {
  const feedList({super.key});

  @override
  State<feedList> createState() => _feedListState();
}

class _feedListState extends State<feedList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return aPost();
      },
    );
  }
}
