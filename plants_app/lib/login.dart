import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/verification.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 248, 1),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    "assets/circle.svg",
                    height: 160,
                    width: 160,
                  ),
                  SvgPicture.asset(
                    "assets/Rectangle1.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Log in",
                      style: GoogleFonts.poppins(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        prefixIcon: SizedBox(
                          height: 17,
                          width: 13,
                          child: SvgPicture.asset(
                            "assets/phone.svg",
                            color: Color.fromRGBO(164, 164, 164, 1),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 1),
                        hintText: "Mobile Number",
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(164, 164, 164, 1),
                        ),
                        contentPadding: EdgeInsets.all(14),

                        // Border when the TextField is enabled
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(204, 211, 196, 1),
                          ),
                        ),
                        //  Border when the TextField is focused
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(204, 211, 196, 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Verification();
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
                          "Log in",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "assets/plant2.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SvgPicture.asset(
                "assets/Rectangle2.svg",
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
