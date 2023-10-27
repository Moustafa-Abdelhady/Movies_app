import 'package:equatable/equatable.dart';

class Movies extends Equatable{
  final int id;
  final String title;

  final String backdropPath;
  final List<int> genderIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

 const Movies({required this.releaseDate, 
      required this.id,
     required this.title,
     required this.backdropPath,
     required this.genderIds,
     required this.overview,
     required this.voteAverage});
     
       @override
       
       List<Object?> get props => [];
}
