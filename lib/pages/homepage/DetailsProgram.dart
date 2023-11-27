import 'package:flutter/material.dart';

class Detailsprogram extends StatefulWidget {
  const Detailsprogram({super.key});

  @override
  State<Detailsprogram> createState() => _DetailsprogramState();
}

class _DetailsprogramState extends State<Detailsprogram> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2E3B78),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: const BoxDecoration(color: Color(0xFF2E3B78)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 30),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    'Details Activity',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 4),
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
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              '7 October 2023, 10:06 PM ',
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
                  const SizedBox(height: 10),
                  Container(
                    color: Colors.lightBlue,
                    child: Stack(children: <Widget>[
                      //event image
                      Image.network("https://via.placeholder.com/390x200"),

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
                            const Text(
                              'CAMPING',
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
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFAFAFA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Johor Rovers Vigil 2023 & Serving For The Future',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'KEM JUBLI INTAN TANJUNG LABUH BATU PAHAT',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_month),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '30 Oct - 2 Nov 2023',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.paid_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'RM100',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_today_rounded),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Open until 8 September 2023',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFAFAFA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text.rich(
                          TextSpan(
                            text:
                                'Ayuh warga kelana Johor, kita sama-sama memeriahkan lagi Johor Rovers Vigil 2023 dan Serving for The Future yang akan berlangsung tidak lama lagi. Program 2 dalam 1 ini akan berlangsung selama 3 hari 2 malam. \n\nBanyak aktiviti menarik yang akan diadakan sepanjang program ini berlangsung. Oleh itu jangan lepaskan peluang keemasan ini dan rasakan kebangkitan Kelana Johor. Sebarang pertanyaan boleh hubungi Pen. Pesuruhjaya Daerah (Unit Kelana) masing-masing, atau hubungi kami melalui FB page dan Instagram rasmi kami atau Saudara Mohd Saifullah 0103638985Timbalan Pengerusi Sekteriat Pengakap Kelana Johor selaku Pengarah Program Johor Rovers Vigil 2023 & Serving For The Nature.\n\n',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 11,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
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
