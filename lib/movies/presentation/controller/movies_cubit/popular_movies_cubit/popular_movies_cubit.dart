import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/use_case/get_popular_movies_usecase.dart';

import '../../../../../core/use_case/base_use_case.dart';
import '../../../../domain/entities/movies.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  PopularMoviesCubit(this.getPopularMoviesUseCase)
      : super(PopularMoviesInitial());

  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  Future<Either<Failure, List<Movies>>> fetchPopularMovies() async {

    emit(PopularMoviesLoading());

    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
      (failure) {
        emit(
          PopularMoviesFailure(failure.errMessage),
        );
      },
      (popularMovies) {
        emit(
          PopularMoviesSuccess(popularMovies),
        );
      },
    );
    return result;
  }
}
