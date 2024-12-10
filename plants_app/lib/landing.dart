import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants_app/login.dart';

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LandingState();
}

class _LandingState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 247, 248, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              "assets/Rectangle1.svg",
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/plant1.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0),
              child: Text(
                "Enjoy your",
                style: GoogleFonts.poppins(
                    fontSize: 34, fontWeight: FontWeight.w300),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "life with",
                  style: GoogleFonts.poppins(
                      fontSize: 34, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Plants",
                  style: GoogleFonts.poppins(
                      fontSize: 34, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 370,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(62, 102, 24, 1), // Color 1
                          Color.fromRGBO(124, 180, 70, 1), // Color 2
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      // color: Color.fromRGBO(124, 180, 70, 1),
                      borderRadius: BorderRadius.circular(9)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started ",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 17,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 90,
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
