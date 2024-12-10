import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 248, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                SvgPicture.asset(
                  "assets/Mask group.svg",
                  height: 110,
                  width: 110,
                ),
                SvgPicture.asset(
                  "assets/Rectangle1.svg",
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Find your",
                        style: GoogleFonts.poppins(
                            fontSize: 26, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "favorite plants",
                        style: GoogleFonts.poppins(
                            fontSize: 26, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                SvgPicture.asset("assets/Group 5316.svg"),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 20),
                          width: 385,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(204, 231, 185, 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "30% OFF",
                                    style: GoogleFonts.poppins(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "02-23 April",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 55,
                          child: Image.asset(
                            "assets/plant3.png",
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.0, top: 30),
              child: Text(
                "Indoor",
                style: GoogleFonts.poppins(
                    fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 7),
                        height: 188,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/homePlant.jpg"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Snake Plants",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset("assets/₹350.svg"),
                                SvgPicture.asset("assets/Group 5460.svg")
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.0),
              child: Text(
                "Outdoor",
                style: GoogleFonts.poppins(
                    fontSize: 21, fontWeight: FontWeight.w500),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 7),
                        height: 188,
                        width: 145,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(9)),
                        child: Column(
                          children: [
                            Image.asset("assets/homePlant.jpg"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Snake Plants",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset("assets/₹350.svg"),
                                SvgPicture.asset("assets/Group 5460.svg")
                              ],
                            )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SvgPicture.asset(
              "assets/Rectangle2.svg",
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
