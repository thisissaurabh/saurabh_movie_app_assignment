
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saurabh_movie_app_assignment/screens/movie_details_screen.dart';

import 'movie_listing_page.dart';
import 'my_list_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _index = 0;






  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: Colors.transparent,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // extendBodyBehindAppBar:,
          //extendBody: true,
          body: [
            MovieListingPage(),
            MovieListingPage(),
            MyListScreen(),

            // ProfileScreen(),
          ].elementAt(_index),
          bottomNavigationBar: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _index = 0;
                        });
                      },
                      child:SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/homeicon.png',
                              height: 32,
                              width: 32,
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "Home",
                            style: TextStyle(
                                color: _index == 0 ? Colors.white : Colors.grey.withOpacity(0.70),
                              fontSize: 10
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _index = 1;
                        });
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                             'assets/icons/play-button-video-player-svgrepo-com.png',
                              height: 32,
                              width: 32,
                              color: _index ==1 ? Colors.white : Colors.grey.withOpacity(0.70),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "News & Hot",
                              style: TextStyle(
                                  color: _index ==1 ? Colors.white : Colors.grey.withOpacity(0.70),
                                  fontSize: 10
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _index = 2;
                        });
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/netflixiconsmile.png',
                              height: 32,
                              width: 32,
                              // color: _index == 2 ? Colors.white : Colors.grey.withOpacity(0.70),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              "My Netflix",
                              style: TextStyle(
                                  color: _index == 2 ? Colors.white : Colors.grey.withOpacity(0.70),
                                  fontSize: 10
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}