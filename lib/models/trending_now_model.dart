class TrendingNowApi {
  bool? adult;
  int? id;
  String? name;
  String? originalName;
  String? mediaType;
  double? popularity;
  int? gender;
  String? knownForDepartment;
  String? profilePath;
  List<KnownFor>? knownFor;

  TrendingNowApi(
      {this.adult,
        this.id,
        this.name,
        this.originalName,
        this.mediaType,
        this.popularity,
        this.gender,
        this.knownForDepartment,
        this.profilePath,
        this.knownFor});

  TrendingNowApi.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    id = json['id'];
    name = json['name'];
    originalName = json['original_name'];
    mediaType = json['media_type'];
    popularity = json['popularity'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(new KnownFor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['id'] = this.id;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['media_type'] = this.mediaType;
    data['popularity'] = this.popularity;
    data['gender'] = this.gender;
    data['known_for_department'] = this.knownForDepartment;
    data['profile_path'] = this.profilePath;
    if (this.knownFor != null) {
      data['known_for'] = this.knownFor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KnownFor {
  bool? adult;
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;

  KnownFor(
      {this.adult,
        this.backdropPath,
        this.id,
        this.title,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.video,
        this.voteAverage,
        this.voteCount});

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    title = json['title'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['genre_ids'] = this.genreIds;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

//
// class TrendingImageModel {
//   bool? adult;
//   String? backdropPath;
//   int? id;
//   String? title;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   String? posterPath;
//   String? mediaType;
//   List<int>? genreIds;
//   double? popularity;
//   String? releaseDate;
//   bool? video;
//   double? voteAverage;
//   int? voteCount;
//
//   TrendingImageModel(
//       {this.adult,
//         this.backdropPath,
//         this.id,
//         this.title,
//         this.originalLanguage,
//         this.originalTitle,
//         this.overview,
//         this.posterPath,
//         this.mediaType,
//         this.genreIds,
//         this.popularity,
//         this.releaseDate,
//         this.video,
//         this.voteAverage,
//         this.voteCount});
//
//   TrendingImageModel.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     id = json['id'];
//     title = json['title'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     posterPath = json['poster_path'];
//     mediaType = json['media_type'];
//     genreIds = json['genre_ids'];
//     popularity = double.parse(json['popularity']);
//     releaseDate = json['release_date'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['adult'] = this.adult;
//     data['backdrop_path'] = this.backdropPath;
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['original_language'] = this.originalLanguage;
//     data['original_title'] = this.originalTitle;
//     data['overview'] = this.overview;
//     data['poster_path'] = this.posterPath;
//     data['media_type'] = this.mediaType;
//     data['genre_ids'] = this.genreIds;
//     data['popularity'] = this.popularity;
//     data['release_date'] = this.releaseDate;
//     data['video'] = this.video;
//     data['vote_average'] = this.voteAverage;
//     data['vote_count'] = this.voteCount;
//     return data;
//   }
// }
