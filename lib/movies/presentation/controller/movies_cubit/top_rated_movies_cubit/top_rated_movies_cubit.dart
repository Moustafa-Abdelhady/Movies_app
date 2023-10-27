import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/use_case/get_top_rated_movies_usecase.dart';

import '../../../../../core/use_case/base_use_case.dart';
import '../../../../domain/entities/movies.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  TopRatedMoviesCubit(this.getTopRatedMoviesUseCase)
      : super(TopRatedMoviesInitial());

  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  Future<Either<Failure, List<Movies>>> fetchTopRatedMovies() async {
    emit(TopRatedMoviesLoading());

    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
      (failure) {
        emit(
          TopRatedMoviesFailure(failure.errMessage),
        );
      },
      (topRatedMovies) {
        emit(
          TopRatedMoviesSuccess(topRatedMovies),
        );
      },
    );
    return result;
  }
}
