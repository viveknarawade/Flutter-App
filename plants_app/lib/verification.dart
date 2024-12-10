import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/home.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(251, 247, 248, 1),
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SvgPicture.asset(
                  "assets/circleRight.svg",
                  height: 150,
                  width: 150,
                ),
                SvgPicture.asset(
                  "assets/Rectangle1.svg",
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  top: 50,
                  right: 360,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verification",
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter the OTP code from the phone we ",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "just sent you.",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; i++)
                        SizedBox(
                          height: 57,
                          width: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(255, 255, 255, 1),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(204, 211, 196, 1),
                                ),
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't recevie OTP code!",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Resend",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Home();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(62, 102, 24, 1), // Color 1
                              Color.fromRGBO(124, 180, 70, 1), // Color 2
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              "assets/Rectangle2.svg",
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ));
  }
}
