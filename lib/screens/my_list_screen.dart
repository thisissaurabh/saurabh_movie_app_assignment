import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';


import '../apis/get_apis.dart';
import '../models/felt_good_movies_model.dart';
import '../models/trailer_watched_model.dart';
import 'movie_details_screen.dart';
import 'movie_listing_page.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {


  @override
  void initState() {
    getMyList();
    getlikeMovies();
    getTrailersWatched();
    super.initState();
  }


  bool isLoading = false;
  List<MovieModel> myList = [];
  getMyList() {
    isLoading = true;
    var resp = getMyListApi();
    resp.then((value) {
      for(var v in value['results']) {
        myList.add(MovieModel.fromJson(v));
      }
      setState(() {
        isLoading = false;
      });
    }
    );
  }


  List<MovieModel> likedMovies = [];
  getlikeMovies() {
    isLoading = true;
    var resp =   getUpcoming();
    resp.then((value) {
      for(var v in value['results']) {
        likedMovies.add(MovieModel.fromJson(v));
      }
      setState(() {
        isLoading = false;
      });
    }
    );
  }

  List<WatchedModel> trailersWatched = [];
  getTrailersWatched() {
    isLoading = true;
    var resp =     getTrailerWatched();
    resp.then((value) {
      for(var v in value['results']) {
        trailersWatched.add(WatchedModel.fromJson(v));
      }
      setState(() {
        isLoading = false;
      });
    }
    );
  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70.0,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/icons/netflixiconsmile.png",
                      height: 24,
                      width: 24,),
                      SizedBox(width: 8,),
                      Text("Saurabh",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20
                        ),),
                      SizedBox(width: 8,),
                      SvgPicture.asset("assets/icons/arrow-down-338-svgrepo-com.svg",
                      height: 10,
                      width:10,
                      color: Colors.white,),
                      Spacer(),
                      SvgPicture.asset("assets/icons/menu-svgrepo-com.svg",
                        height: 24,
                        width: 24,
                        color: Colors.white,),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff446dd0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset("assets/icons/download-svgrepo-com.svg",
                            color: Colors.white,),
                          )),
                      SizedBox(width: 8,),
                      Text("Download",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset("assets/icons/arrow-right-333-svgrepo-com.svg",
                  height: 12,
                  width: 12,
                  color: Colors.white,),

                
                ],
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 150,
                // width: 200,
                child: ListView.separated(
                  itemCount: myList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            width: 200,
                            // width: 200,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4)
                                )
                            ),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w200${myList[index].posterPath}',
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                return Container(
                                  color: Colors.grey, // Placeholder color for the error case
                                  child: Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          // height: 20,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xff161616),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(4),
                                  bottomLeft: Radius.circular(4)
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("U/A 16+ | Episode | 248.5",
                              style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          // color: Colors.redAccent,
                        )
                      ],
                    );
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 6,),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  Text("Tv Shows & Movies You have Liked",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 150,

                    // width: 200,
                    child: ListView.separated(
                      itemCount: likedMovies.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MoviesDetailScreen(movieId: likedMovies[index].id.toString(),
                                        movieName: likedMovies[index].title.toString(), movieOverview: likedMovies[index].overview.toString(),),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 150,
                                  width:100,
                                  // width: 200,
                                  // width: 200,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          topLeft: Radius.circular(4)
                                      )
                                  ),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w200${likedMovies[index].posterPath}',
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                      return Container(
                                        color: Colors.grey, // Placeholder color for the error case
                                        child: Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(height: 6,),
                            GestureDetector(
                              onTap : () {
                                Share.share('Check out this Movie');
                              },
                              child: Container(
                                height: 30,
                                width:100,
                                decoration: BoxDecoration(
                                    color: Color(0xff161616),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4)
                                    )
                                ),

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset("assets/icons/send-01-svgrepo-com.svg",
                                    height: 20,
                                    width: 20,
                                    color: Colors.white,),
                                    SizedBox(width: 5,),
                                    Text("Share",
                                    style: TextStyle(
                                      color: Colors.white
                                    ),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 6,),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8,),
          Row(
            children: [
              Text("My List",
                style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text("See All",
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  SizedBox(width: 5,),
                  SvgPicture.asset("assets/icons/arrow-right-333-svgrepo-com.svg",
                    height: 12,
                    width: 12,
                    color: Colors.white,),

                ],
              )
            ],
          ),
          SizedBox(height: 8,),
          SizedBox(
            height: 150,
            child: ListView.separated(
              itemCount: myList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MoviesDetailScreen(
                          movieId: myList[index].id.toString(),
                          movieName: myList[index].title.toString(),
                          movieOverview: myList[index].overview.toString(),),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    // width: 200,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w200${myList[index].posterPath}',
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return Container(
                          color: Colors.grey, // Placeholder color for the error case
                          child: Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 6,),
            ),
          ),
        ],
      ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  Text("Trailer You've Watched",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20
                    ),
                  ),
                  SizedBox(height: 8,),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      itemCount: likedMovies.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MoviesDetailScreen(
                                  movieId: likedMovies[index].id.toString(),
                                  movieName: likedMovies[index].title.toString(),
                                  movieOverview: likedMovies[index].overview.toString(),),
                              ),
                            );
                          },
                          child: Container(
                            height: 150,
                            // width: 200,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w200${likedMovies[index].posterPath}',
                              fit: BoxFit.cover,
                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                return Container(
                                  color: Colors.grey, // Placeholder color for the error case
                                  child: Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 6,),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
