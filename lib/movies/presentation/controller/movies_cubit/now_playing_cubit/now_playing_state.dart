part of 'now_playing_cubit.dart';

// import 'package:equatable/equatable.dart';

// import '../../../../domain/entities/movies.dart';

abstract class NowPlayingState extends Equatable {
  const NowPlayingState();

  @override
  List<Object> get props => [];
}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingSuccess extends NowPlayingState {
  final List<Movies> nowPlayingMovies;

  const NowPlayingSuccess(this.nowPlayingMovies);
}

class NowPlayingFailure extends NowPlayingState {
  final String errMessage;

  const NowPlayingFailure(this.errMessage);
}
