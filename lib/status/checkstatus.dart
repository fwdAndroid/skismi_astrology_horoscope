import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skismi_astrology_horoscope/database/databasemethods.dart';
import 'package:skismi_astrology_horoscope/status/blockstatus.dart';
import 'package:skismi_astrology_horoscope/user_info.dart';

class CheckStatus extends StatefulWidget {
  const CheckStatus({super.key});

  @override
  State<CheckStatus> createState() => _CheckStatusState();
}

class _CheckStatusState extends State<CheckStatus> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkresult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void checkresult() async {
    //final subscription = Provider.of<SubscriptionProvider>(context, listen: false);
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final bool doesDocExist = doc.exists;
    if (doesDocExist) {
      print("running =>>>> ");
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => UserStatus()));
    } else {
      DatabaseMethods().numberAdd().then((value) {
        print("running =>>>> running ");
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => ProfileInfo()));
      });
    }
  }
}
