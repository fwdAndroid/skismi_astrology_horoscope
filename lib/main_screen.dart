import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:skismi_astrology_horoscope/ads/ads_service.dart';
import 'package:skismi_astrology_horoscope/main_screen_pages/experts.dart';
import 'package:skismi_astrology_horoscope/main_screen_pages/settings.dart';
import 'package:skismi_astrology_horoscope/webpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final DocumentReference userRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final List<String> imgList = [
    'assets/blackball.png',
    'assets/gold.png',
    'assets/ww.png',
    'assets/women.png',
    'assets/hs.png',
    'assets/clouds.png',
    'assets/cjs.png',
  ];
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  void initState() {
    _loadBannerAd();
    _createInterstitialAd();
  }

  InterstitialAd? _interstitialAd;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_isBannerAdReady)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 20),
              height: 60,
              child: Text(
                "Welcome to the Skismi: Horoscope and Astrology app. Discover your destiny with Skismi's AI-generated readings.",
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
                child: GestureDetector(
              child: CarouselSlider(
                options: CarouselOptions(autoPlay: true),
                items: choices
                    .map((Choice) => Container(
                          height: MediaQuery.of(context).size.height,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (builder) => ChatScreen(
                              //             name: Choice.content,
                              //             uuid: Choice.content)));
                            },
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    Choice.title,
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 250,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  Choice.content,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )),
            ElevatedButton(
                onPressed: () async {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                          child: Text(
                            'Free Daily Readings',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              TextButton(
                                child: Text("Daily Horoscope Readings"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title: "Horoscope Readings",
                                                url:
                                                    "https://skismi.com/daily-horoscope-resultsxy/",
                                              )));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                child:
                                    Text('Uplifting "Oprah" Horoscope Reading'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    'Uplifting "Oprah" Horoscope Reading',
                                                url:
                                                    "https://skismi.com/oprah-horoscope/",
                                              )));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                child: Text("Sarcastic Horoscope Reading"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    "Sarcastic Horoscope Reading",
                                                url:
                                                    "https://skismi.com/sarcastic-horoscope/",
                                              )));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                child: Text("Wildcard Horoscope Reading"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    "Wildcard Horoscope Reading",
                                                url:
                                                    "https://skismi.com/horoscope-wildcard/",
                                              )));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                child: Text("Past Life Horoscope Reading"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    "Past Life Horoscope Reading",
                                                url:
                                                    "https://skismi.com/horoscope-past/",
                                              )));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                child: Text("Spirit Animal Horoscope Reading"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    "Spirit Animal Horoscope Reading",
                                                url:
                                                    "https://skismi.com/horoscope-spirit/",
                                              )));
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                child: Text("Elemental Horoscope Reading"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MyWidget(
                                                title:
                                                    "Elemental Horoscope Reading",
                                                url:
                                                    "https://skismi.com/horoscope-elemental /",
                                              )));
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"))
                        ],
                      );
                    },
                  );
                  Text(
                    "Free Readings",
                    style: TextStyle(color: Colors.white),
                  );
                },
                child: Text("Free Readings"),
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), fixedSize: Size(200, 60))),
            SizedBox(
              height: 20,
            ),
            // Center(
            //   child: Container(
            //     height: 60,
            //     margin: EdgeInsets.only(right: 10),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: StreamBuilder(
            //           stream: FirebaseFirestore.instance
            //               .collection("users")
            //               .where(
            //                 "uid",
            //                 isEqualTo: FirebaseAuth.instance.currentUser!.uid,
            //               )
            //               .where("paid", isEqualTo: false)
            //               .where("subscriptionTaken", isEqualTo: false)
            //               .snapshots(),
            //           builder: (BuildContext context,
            //               AsyncSnapshot<QuerySnapshot> snapshot) {
            //             if (snapshot.hasError) {
            //               return Text('Something went wrong');
            //             }

            //             if (snapshot.connectionState ==
            //                 ConnectionState.waiting) {
            //               return Text("Loading");
            //             }

            //             return ListView(
            //                 children: snapshot.data!.docs
            //                     .map((DocumentSnapshot document) {
            //               Map<String, dynamic> data =
            //                   document.data()! as Map<String, dynamic>;

            //               return Column(
            //                 children: [
            //                   subscription.activeSubscription
            //                       ? const Text(
            //                           "You have unlimited readings",
            //                           style: TextStyle(color: Colors.white),
            //                         )
            //                       : const Text(
            //                           "Free Readings Left This Week",
            //                           style: TextStyle(color: Colors.white),
            //                         ),
            //                   const SizedBox(
            //                     height: 10,
            //                   ),
            //                   // Center(
            //                   //   child: !subscription.activeSubscription
            //                   //       ? Text(
            //                   //           data['count'].toString(),
            //                   //           style: const TextStyle(
            //                   //               color: Colors.white, fontSize: 12),
            //                   //         )
            //                   //       : null,
            //                   // ),
            //                 ],
            //               );
            //             }).toList());
            //           }),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Rooms
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Experts()));
                    },
                    child: Image.asset(
                      "assets/black.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //Trail

                  //Privacy
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => AppSettings()));
                    },
                    child: Image.asset(
                      "assets/setting.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                  //Chat
                  SizedBox(
                    width: 30,
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => MyWidget(
                                    url: "https://skismi.com/appvideos/",
                                    title: "Video Page",
                                  )));
                    },
                    child: Image.asset(
                      "assets/video.png",
                      height: 60,
                      width: 60,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            // _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            // _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            _createInterstitialAd();
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }
}

//?Coursel Class
class Choice {
  const Choice({required this.title, required this.content});

  final String title;

  final String content;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'assets/Daily Horoscope.png',
      content:
          'Unlock the Wisdom of the Stars \n with Daily Horoscope Insights'),
  const Choice(
      title: 'assets/Weekly horoscope.png',
      content:
          'Stay Ahead of the Cosmic Trends with\n   Weekly Horoscope Predictions'),
  const Choice(
      title: 'assets/Compatibility.png',
      content:
          'Discover Your Cosmic Connection with\n  Horoscope Compatibility Reports'),
  const Choice(
      title: 'assets/career.png',
      content: 'Align Your Path to Success with\n  Horoscope Career Guidance'),
  const Choice(
      title: 'assets/birth chart.png',
      content:
          'Unveil Your True Potential with\n  Personalized Horoscope Birth Charts'),
  const Choice(
      title: 'assets/Moon phase.png',
      content:
          'Harness the Lunar Energies with\n  Horoscope Moon Phase Readings'),
  const Choice(
      title: 'assets/transit astrology.png',
      content:
          "Navigate Life's Transitions with\n  Transit Astrology Insights"),
  const Choice(
      title: "assets/Love Reading.png",
      content: "Find Love's Alignment with\n  Horoscope Love Readings"),
  const Choice(
      title: "assets/Annual Readings.png",
      content: "Embrace the Year Ahead with\n Annual Horoscope Forecasts"),
  const Choice(
      title: "assets/Chinese Horoscope.png",
      content: "Explore Ancient Wisdom with\n  Chinese Horoscope Readings")
];
