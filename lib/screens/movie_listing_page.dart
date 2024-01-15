import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:saurabh_movie_app_assignment/apis/get_apis.dart';
import 'package:saurabh_movie_app_assignment/widgets/loader.dart';
import 'package:shimmer/shimmer.dart';
import '../models/felt_good_movies_model.dart';
import '../models/trending_now_model.dart';
import '../widgets/buttons.dart';
import 'movie_details_screen.dart';

class MovieListingPage extends StatefulWidget {
  const MovieListingPage({super.key});

  @override
  State<MovieListingPage> createState() => _MovieListingPageState();
}

class _MovieListingPageState extends State<MovieListingPage> {


  @override
  void initState() {
    getTrending();
    getFeltGoodmovies();
    getMoviesRealLife();
    super.initState();
  }


  bool isLoading = false;

  List<TrendingNowApi> trending = [];

  getTrending() {
    isLoading = true;
    var resp = getTrendingApi();
    resp.then((value) {
      for(var v in value['results']) {
        trending.add(TrendingNowApi.fromJson(v));
      }
      print(trending.length);
      setState(() {
        isLoading = false;
      });
    }
    );
  }


  List<MovieModel> popular = [];


  getFeltGoodmovies() {
    isLoading = true;
    var resp = getFeltGoodMovieApi();
    resp.then((value) {
      for(var v in value['results']) {
        popular.add(MovieModel.fromJson(v));
      }
      setState(() {
        isLoading = false;
      });
    }
    );
  }


  List<MovieModel> topRated = [];
  getMoviesRealLife() {
    isLoading = true;
    var resp = getMoviesRealLifeApi();
    resp.then((value) {
      for(var v in value['results']) {
        topRated.add(MovieModel.fromJson(v));
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
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
    child: Container(
      padding: EdgeInsets.all(16),
    color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Saurabh",
              style: TextStyle(
                  color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),),
              Image.asset(
                "assets/icons/search-svgrepo-com.png",
              color: Colors.white,
              height: 24,
              width: 24,)

            ],
          ),
        ],
      ),
    ),
    ),
    ),
    ),
      body:
      isLoading ? Loading():
      SingleChildScrollView(
        child:

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           isLoading ?  Center(
              child: LoadingAnimationWidget.bouncingBall(
                size: 40, color: Colors.white,
              ),
            ) :
            ListingPageListView(title: 'Trending Now',
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: trending.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        print(trending[index].id.toString());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MoviesDetailScreen(movieId: trending[index].id.toString(),
                              movieName: trending[index].knownFor![0].title.toString(),
                              movieOverview: trending[index].knownFor![0].overview!.toString(),),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: CachedNetworkImage(
                          imageUrl: 'https://image.tmdb.org/t/p/w200${trending[index].knownFor![0].posterPath}',
                          fit: BoxFit.cover,
                          errorWidget:
                              (context, url, error) =>
                              Icon(
                                Icons.error,
                                size: 40,
                              ),
                          progressIndicatorBuilder:
                              (a, b, c) => Opacity(
                            opacity: 0.3,
                            child: Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor:
                              Colors.white,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                ),
              ),),
            SizedBox(height: 10,),
            isLoading ?  Center(
              child: LoadingAnimationWidget.bouncingBall(
                size: 40, color: Colors.white,
              ),
            ) :
            ListingPageListView(title: 'Popular Movies',
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: popular.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MoviesDetailScreen(movieId: trending[index].id.toString(),
                              movieName: trending[index].knownFor![0].title.toString(),
                              movieOverview: trending[index].knownFor![0].overview!.toString(),),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        // width: 200,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: CachedNetworkImage(
                          imageUrl: 'https://image.tmdb.org/t/p/w200${popular[index].posterPath}',
                          fit: BoxFit.cover,
                          errorWidget:
                              (context, url, error) =>
                              Icon(
                                Icons.error,
                                size: 40,
                              ),
                          progressIndicatorBuilder:
                              (a, b, c) => Opacity(
                            opacity: 0.3,
                            child: Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor:
                              Colors.white,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6)
                                ),
                              ),
                            ),
                          ),
                        ),


                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                ),
              ),),
            SizedBox(height: 10,),
            isLoading ?  Center(
              child: LoadingAnimationWidget.bouncingBall(
                size: 40, color: Colors.white,
              ),
            ) :
            ListingPageListView(title: 'Top Rated Movies',
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: topRated.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MoviesDetailScreen(movieId: trending[index].id.toString(),
                              movieName: trending[index].knownFor![0].title.toString(),
                              movieOverview: trending[index].knownFor![0].overview!.toString(),),
                          ),
                        );
                      },
                      child: Container(
                        height: 200,
                        // width: 200,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: CachedNetworkImage(
                          imageUrl: 'https://image.tmdb.org/t/p/w200${topRated[index].posterPath}',
                          fit: BoxFit.cover,
                          errorWidget:
                              (context, url, error) =>
                              Icon(
                                Icons.error,
                                size: 40,
                              ),
                          progressIndicatorBuilder:
                              (a, b, c) => Opacity(
                            opacity: 0.3,
                            child: Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor:
                              Colors.white,
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                ),
              ),),
            SizedBox(height: 10,),
            isLoading ?  Center(
              child: LoadingAnimationWidget.bouncingBall(
                size: 40, color: Colors.white,
              ),
            ) :
            ListingPageListView(title: 'Continue Watching for Saurabh',
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: trending.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    print("nunfnvf");
                    print('https://image.tmdb.org/t/p/original${trending[index].knownFor![0].posterPath}');
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MoviesDetailScreen(movieId: trending[index].id.toString(),
                              movieName: trending[index].knownFor![0].title.toString(),
                              movieOverview: trending[index].knownFor![0].overview!.toString(),),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            // width: 200,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: CachedNetworkImage(
                              imageUrl: 'https://image.tmdb.org/t/p/original${trending[index].knownFor![0].posterPath}',
                              fit: BoxFit.cover,
                              errorWidget:
                                  (context, url, error) =>
                                  Icon(
                                    Icons.error,
                                    size: 40,
                                  ),
                              progressIndicatorBuilder:
                                  (a, b, c) => Opacity(
                                opacity: 0.3,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.black12,
                                  highlightColor:
                                  Colors.white,
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6)
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            right:10,
                            top:10,
                            bottom:10,

                            child:PlayButton(),
                          )
                        ],
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,),
                ),
              ),),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}


class ListingPageListView extends StatefulWidget {
  final String title;
  final Widget child;
  const ListingPageListView({super.key, required this.title, required this.child});

  @override
  State<ListingPageListView> createState() => _ListingPageListViewState();
}

class _ListingPageListViewState extends State<ListingPageListView> {




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8,),
        Text(widget.title,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        SizedBox(height: 8,),
        SizedBox(
          height: 150,
          child: widget.child,
        ),
      ],
    );
  }
}
