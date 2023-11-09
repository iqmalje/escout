import 'package:escout/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController fullname = TextEditingController(),
      mobilenumber = TextEditingController(),
      email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: FutureBuilder<dynamic>(
              future: SupabaseB().getProfileInfo(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const CircularProgressIndicator();
                }

                print(snapshot.data);

                fullname =
                    TextEditingController(text: snapshot.data['fullname']);
                email = TextEditingController(text: snapshot.data['email']);
                mobilenumber =
                    TextEditingController(text: snapshot.data['phoneno']);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: 110,
                        decoration:
                            const BoxDecoration(color: Color(0xFF2E3B78)),
                        child: const Center(
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        width: 330,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF2C225B),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            snapshot.data['roles'] == 'ADMIN'
                                ? 'Admin View'
                                : 'Scout View',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w900,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Builder(builder: (context) {
                        if (snapshot.data['roles'] == 'ADMIN') {
                          return Column(
                            children: [
                              const Text(
                                'JOHOR SCOUT DIGITAL ID',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w900,
                                  height: 0,
                                ),
                              ),
                              buildCard(snapshot),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              Image.asset('assets/pengakap_logo_2.png')
                            ],
                          );
                        }
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'ACCOUNT INFORMATION',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: TextField(
                                controller: fullname,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                maxLines: 1,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1, left: 10),
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                    border: InputBorder.none,
                                    labelText: 'Full Name'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: TextField(
                                controller: mobilenumber,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                maxLines: 1,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1, left: 10),
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                    border: InputBorder.none,
                                    labelText: 'Mobile Number'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 50,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: TextField(
                                controller: email,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                                maxLines: 1,
                                decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(top: 1, left: 10),
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 183, 183, 183),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                    border: InputBorder.none,
                                    labelText: 'Email'),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'PASSWORD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 2,
                              offset: Offset(0, 1),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.8 - 20,
                            child: const Text(
                              'Reset Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: () async {
                          await SupabaseB().signout();

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/signin', (context) => true);
                        },
                        child: Ink(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF3B4367),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Center(
                            child: Text(
                              'Log Out',
                              textAlign: TextAlign.center,
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
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFFD9D9D9)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Delete My Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF626262),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Stack buildCard(AsyncSnapshot<dynamic> snapshot) {
    return Stack(
      children: [
        Image.asset('assets/card_profile.png'),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(
                height: 29,
              ),
              Image.asset('assets/icon_pengakap.png'),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'PERSEKUTUAN PENGAKAP MALAYSIA NEGERI JOHOR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text(
                'Scout Association of Malaysia Johor State',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Container(
                width: 140,
                height: 140,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(
                    side: BorderSide(width: 4, color: Color(0xFF00579E)),
                  ),
                ),
                child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/madni3.png')),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${fullname.text} ',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Builder(builder: (context) {
                    if (snapshot.data['is_member']) {
                      return const Icon(
                        Icons.verified,
                        color: Colors.white,
                      );
                    } else {
                      return Container();
                    }
                  })
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'KETUA PESURUHJAYA PENGAKAP NEGERI JOHOR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34.0, top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 76,
                          height: 18,
                          child: Text(
                            'NO AHLI',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 76,
                          height: 18,
                          child: Text(
                            ': ${snapshot.data['no_ahli']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 76,
                          height: 18,
                          child: Text(
                            'NO TAULIAH',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 76,
                          height: 18,
                          child: Text(
                            ': ${snapshot.data['no_tauliah']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 76,
                          height: 18,
                          child: Text(
                            'UNIT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 116,
                          height: 18,
                          child: Text(
                            ': ${snapshot.data['unit']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 76,
                          height: 18,
                          child: Text(
                            'DAERAH',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 76,
                          height: 18,
                          child: Text(
                            ': ${snapshot.data['daerah']}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 190,
                height: 30,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'TAULIAH PENGAKAP JOHOR',
                    style: TextStyle(
                      color: Color(0xFF3B3F65),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
