import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) {
    return MoviesDetailsModel(
      backdropPath: json['backdrop_path'] ?? '',
      genres: List<GenresModel>.from(json['genres'].map(
        (json) => GenresModel.fromJson(json),
      ),),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
