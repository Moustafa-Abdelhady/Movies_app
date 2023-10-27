part of 'movies_details_recommendation_cubit.dart';

abstract class MoviesDetailsRecommendationState extends Equatable {
  const MoviesDetailsRecommendationState();

  @override
  List<Object> get props => [];
}

class MoviesDetailsRecommendationInitial extends MoviesDetailsRecommendationState {}

class MoviesDetailsRecommendationLoading extends MoviesDetailsRecommendationState {}

class MoviesDetailsRecommendationSuccess extends MoviesDetailsRecommendationState {
  final List<Recommendation> recommendedMovies;

  const MoviesDetailsRecommendationSuccess(this.recommendedMovies);
}

class MoviesDetailsRecommendationFailure extends MoviesDetailsRecommendationState {
  final String errMessage;

  const MoviesDetailsRecommendationFailure(this.errMessage);
}


