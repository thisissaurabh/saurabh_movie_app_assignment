import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();

  }

  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TabsScreen()));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            color: Colors.black,
            child: Center(
              child: Image.asset(
               "assets/icons/netflix-1-logo-svgrepo-com.png",
                height: 150,
                width: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}