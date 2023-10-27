
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details_usecase.dart';

part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit(this.getMoviesDetailsUseCase)
      : super(MoviesDetailsInitial());

  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;

  Future<Either<Failure, MoviesDetails>> fetchMoviesDetails(
       {required int id}) async {
    emit(MoviesDetailsLoading());

    final result = await getMoviesDetailsUseCase(MoviesDetailsParameters(movieId: id));

    result.fold(
      (failure) {
        emit(
          MoviesDetailsFailure(failure.errMessage),
        );
      },
      (movieDetails) {
        emit(
          MoviesDetailsSuccess(movieDetails),
        );
      },
    );
    return result;
  }
}


