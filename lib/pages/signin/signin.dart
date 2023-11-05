import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 900,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: MediaQuery.sizeOf(context).width,
              top: MediaQuery.sizeOf(context).height,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, 0.0)
                  ..rotateZ(-3.14),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 539,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF3B3F65),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 47,
              top: 344,
              child: Text(
                'Welcome to eScout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            const Positioned(
              left: 47,
              top: 384,
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Poppins', // Change the font family if needed
                  fontWeight:
                      FontWeight.w100, // Adjust the font weight as needed
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 45,
              top: 698,
              child: SizedBox(
                width: 300,
                height: 50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 3, color: Color(0xFFFFC600)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 123,
                      top: 15,
                      child: Text(
                        'SIGN IN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 45,
              top: 467,
              child: SizedBox(
                width: 300,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      top: 12,
                      child: SizedBox(
                        width: 38,
                        height: 16.80,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 260,
                      top: 12,
                      child: Container(
                        width: 20,
                        height: 16,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/20x16"),
                            fit: BoxFit.contain,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 45,
              top: 527,
              child: SizedBox(
                width: 300,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 20,
                      top: 12,
                      child: SizedBox(
                        width: 68,
                        height: 16.80,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 260,
                      top: 12,
                      child: Container(
                        width: 20,
                        height: 16,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/20x16"),
                            fit: BoxFit.contain,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 238,
              top: 587,
              child: Text(
                'Forgot Password?',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFFFFC600),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 102,
              top: 83,
              child: Container(
                width: 186,
                height: 178,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Escout Logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
