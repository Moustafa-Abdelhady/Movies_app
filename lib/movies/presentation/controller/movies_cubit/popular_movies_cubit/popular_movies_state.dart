part of 'popular_movies_cubit.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();

  @override
  List<Object> get props => [];
}

 class PopularMoviesInitial extends PopularMoviesState {}
 class PopularMoviesLoading extends PopularMoviesState {}
 class PopularMoviesSuccess extends PopularMoviesState {
  final List<Movies> popularMovies;

  const PopularMoviesSuccess(this.popularMovies);
 }
 class PopularMoviesFailure extends PopularMoviesState {
  final String errMessage;

  const PopularMoviesFailure(this.errMessage);
 }
