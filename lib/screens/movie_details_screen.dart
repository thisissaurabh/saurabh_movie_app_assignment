import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../apis/get_apis.dart';
import '../constant/colors.dart';
import '../models/felt_good_movies_model.dart';
import '../models/videos_model.dart';
import '../widgets/buttons.dart';
import 'movie_listing_page.dart';
import 'my_list_screen.dart';

class MoviesDetailScreen extends StatefulWidget {
  final String movieId;
  final String movieName;
  final String movieOverview;
  const MoviesDetailScreen({super.key, required this.movieId, required this.movieName, required this.movieOverview});

  @override
  State<MoviesDetailScreen> createState() => _MoviesDetailScreenState();
}

class _MoviesDetailScreenState extends State<MoviesDetailScreen> {

  int _index = 0;

  @override
  void initState() {
    getVideos();
    getMyList();
    super.initState();
  }



  bool isLoading = false;

  List<VideoModel> videos = [];

  bool areVideosLoaded = false;


  getVideos() {
    isLoading = true;
    var resp = getVideosApi(movieId: widget.movieId);
    resp.then((value) {
      for (var v in value['results']) {
        videos.add(VideoModel.fromJson(v));
      }
      print(widget.movieId);
      setState(() {
        isLoading = false;
        areVideosLoaded = true;
      });
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child: Center(
                  child: areVideosLoaded
                      ? YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: videos[0].key.toString(),
                      flags: YoutubePlayerFlags(
                        autoPlay: true,
                        mute: false,
                      ),
                    ),
                  )
                      : CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 12,),
              SizedBox(
                width: 300,
                child: Text(
                  widget.movieName.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              SizedBox(height: 6,),
              Row(
                children: [
                  Text("98% match",
                  style: TextStyle(
                    color: Colors.green
                  ),),
                  Text(" 2023",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),),
                  SizedBox(width: 2,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xff4c4b4c),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4),
                      child: Text("U/A 13 +",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),
                  SizedBox(width: 2,),
                  Text("2h 18m",
                  style: TextStyle(
                      color: Colors.white,
                    fontWeight: FontWeight.w500
                  ),),
                ],
              ),
              SizedBox(height: 10,),
              CustomIconButton(
                icon: 'assets/icons/play-svgrepo-com.svg',
                title: 'Play',
                color: Colors.white,
                textColor: Colors.black, iconColor: Colors.black,),
              SizedBox(height: 10,),
              
              CustomIconButton(icon: 'assets/icons/download-svgrepo-com.svg',
                title: 'Download',
                color: Color(0xff4e4a49),
                textColor: Colors.white, iconColor: Colors.white,),
              SizedBox(height: 16,),
              Text(widget.movieOverview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white
              ),
              ),
              SizedBox(height: 10,),
          ReadMoreText(
            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            trimLines: 2,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold,
                color:Color(0xff41403e)
            ),
            colorClickableText: Color(0xff41403e),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
            color:Color(0xff41403e)),
          ),
              Text("Director : Sonal joshi",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                  color:Color(0xff41403e)),
                ),
              Container(
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
                                SvgPicture.asset(
                                  'assets/icons/plus-large-svgrepo-com.svg',
                                  height: 32,
                                  width: 32,
                                  color: _index == 0 ? Colors.white : Colors.grey.withOpacity(0.70),
                                ),
                                Text(
                                  "My List",
                                  style: TextStyle(
                                      color: _index == 0 ? Colors.white : Colors.grey.withOpacity(0.70),
                                      fontSize: 10
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    height: 3,
                                    color:_index  == 0?  Colors.red : Colors.transparent,
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
                                SvgPicture.asset(
                                  'assets/icons/like-right-svgrepo-com (1).svg',
                                  height: 32,
                                  width: 32,
                                  color: _index ==1 ? Colors.white : Colors.grey.withOpacity(0.70),
                                ),
                                Text(
                                  "Rate",
                                  style: TextStyle(
                                      color: _index ==1 ? Colors.white : Colors.grey.withOpacity(0.70),
                                      fontSize: 10
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    height: 3,
                                    color:_index  == 1?  Colors.red : Colors.transparent,
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
                            Share.share('Check out this Movie');
                          },
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/share-1-svgrepo-com.svg',
                                  height: 32,
                                  width: 32,
                                  color: _index == 2 ? Colors.white : Colors.grey.withOpacity(0.70),
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                      color: _index == 2 ? Colors.white : Colors.grey.withOpacity(0.70),
                                      fontSize: 10
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    height: 3,
                                    color:_index  == 2?  Colors.red : Colors.transparent,
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
              SizedBox(
                // height: 150,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Set the number of columns here
                    crossAxisSpacing: 6.0, // Adjust as needed
                    mainAxisSpacing: 6.0,  //
                    childAspectRatio: 0.8,// Adjust as needed
                  ),
                  itemCount: myList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 150,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
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
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
