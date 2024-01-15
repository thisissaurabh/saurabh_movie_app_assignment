
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> getTrendingApi() async {
  var request = http.Request('GET', Uri.parse('https://api.themoviedb.org/3/trending/person/week?api_key=6c74aa44058f4f5223a269bf2eb7f273'));
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}


Future<dynamic> getFeltGoodMovieApi() async {
  var request = http.Request('GET', Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=6c74aa44058f4f5223a269bf2eb7f273&api_key=6c74aa44058f4f5223a269bf2eb7f273'));
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}




Future<dynamic> getMoviesRealLifeApi() async {
  var request = http.Request('GET', Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=6c74aa44058f4f5223a269bf2eb7f273'));  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}

Future<dynamic> getMyListApi() async {
  var request = http.Request('GET', Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=6c74aa44058f4f5223a269bf2eb7f273'));
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}

Future<dynamic> getUpcoming() async {
  var request = http.Request('GET', Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=6c74aa44058f4f5223a269bf2eb7f273'));
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}

Future<dynamic> getTrailerWatched() async {
  var request = http.Request('GET', Uri.parse('https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&language=en-US&page=1&vote_average.gte=5.5&with_genres=27&api_key=6c74aa44058f4f5223a269bf2eb7f273'));
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}

Future<dynamic> getVideosApi({
  required String movieId,
}) async {
  var request = http.Request('GET', Uri.parse('https://api.themoviedb.org/3/movie/$movieId/videos?api_key=6c74aa44058f4f5223a269bf2eb7f273'));
  http.StreamedResponse response = await request.send();
  var resp = jsonDecode(await response.stream.bytesToString());
  if (response.statusCode == 200) {
    print(resp);
    return resp;
  } else {
    print(resp);
    print(response.statusCode);
    print(response.reasonPhrase);
    return resp;
  }
}