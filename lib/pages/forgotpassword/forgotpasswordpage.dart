import 'package:email_validator/email_validator.dart';
import 'package:escout/pages/forgotpassword/verifyOTP.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B3F65),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.1),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: const Icon(
                              Icons.arrow_back,
                              size: 35,
                            ),
                          ),
                        ),
                        const Text(
                          'Forgot \nPassword?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const Text(
                          'Please enter your email to reset password! ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextField(
                          controller: email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            hintText: 'Email',
                            filled: true, // Fill the background with color

                            fillColor: Colors
                                .white, // Set the background color to white
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: const Color.fromARGB(255, 123, 90, 255),
                      onTap: () async {
                        if (email.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please fill in your email!')));
                          return;
                        }

                        if (!EmailValidator.validate(email.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please enter an appropriate email!')));
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                VerifyResetPassword(email: email.text)));
                      },
                      child: Ink(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 50,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 3, color: Color(0xFFFFC600)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          'CONFIRM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
