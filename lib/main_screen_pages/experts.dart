import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skismi_astrology_horoscope/main_screen.dart';
import 'package:skismi_astrology_horoscope/webpage.dart';

class Experts extends StatefulWidget {
  const Experts({super.key});

  @override
  State<Experts> createState() => _ExpertsState();
}

class _ExpertsState extends State<Experts> {
  int count = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (builder) => MainScreen()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text("Skismi Horoscopes and Astrology",
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url:
                                      "https://skismi.com/daily-horoscope-resultsxy/",
                                  title: "Daily Horoscope Reading",
                                )));
                  },
                  child: Text("Daily Horoscope Reading"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url:
                                      "https://skismi.com/horoscope-resultsxy/",
                                  title: "Weekly Horoscope Reading",
                                )));
                  },
                  child: Text("Weekly Horoscope Reading"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url:
                                      "https://skismi.com/astrological-compatibility-reportxy/",
                                  title: "Horoscope Compatibility Report",
                                )));
                  },
                  child: Text("Horoscope Compatibility Report"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url:
                                      "https://skismi.com/astrological-careerxy/",
                                  title: "Horoscope Career Report",
                                )));
                  },
                  child: Text("Horoscope Career Report"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url:
                                      "https://skismi.com/astrological-birth-chartxy/",
                                  title: "Horoscope Birth Chart",
                                )));
                  },
                  child: Text("Horoscope Birth Chart"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url: "https://skismi.com/moon-phasexy/",
                                  title: "Horoscope Moon Phase Reading",
                                )));
                  },
                  child: Text("Horoscope Moon Phase Reading"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url: "https://skismi.com/transitxy/",
                                  title: "Transit Astrology Reading",
                                )));
                  },
                  child: Text("Transit Astrology Reading"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url: "https://skismi.com/lovexy/",
                                  title: "Horoscope Love Reading ",
                                )));
                  },
                  child: Text("Horoscope Love Reading "),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url: "https://skismi.com/annualxy/",
                                  title: "Annual Horoscope Reading  ",
                                )));
                  },
                  child: Text("Annual Horoscope Reading"),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 60,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => MyWidget(
                                  url:
                                      "https://skismi.com/chinese-horoscope-resultsxy/",
                                  title: "Chinese Horoscope Reading  ",
                                )));
                  },
                  child: Text("Chinese Horoscope Reading"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
