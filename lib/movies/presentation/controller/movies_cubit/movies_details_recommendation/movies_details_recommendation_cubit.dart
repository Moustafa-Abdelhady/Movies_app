
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details_recommendation_usecase.dart';

import '../../../../../core/error/failure.dart';

import '../../../../domain/entities/recommendation.dart';


part 'movies_details_recommendation_state.dart';

class MoviesDetailsRecommendationCubit extends Cubit<MoviesDetailsRecommendationState> {
  MoviesDetailsRecommendationCubit(this.getMoviesDetailsRecommendationUseCase) : super(MoviesDetailsRecommendationInitial());

  final GetMoviesDetailsRecommendationUseCase getMoviesDetailsRecommendationUseCase;

  Future<Either<Failure, List<Recommendation>>> fetchMoviesDetailsRecommendation({required int id}) async {
    emit(MoviesDetailsRecommendationLoading());
 
    final result = await getMoviesDetailsRecommendationUseCase(RecommendationParameters(id: id));

    result.fold(
      (failure) {
        emit(
          MoviesDetailsRecommendationFailure(failure.errMessage),
        );
      },
      (recommendedMovies) {
        emit(
          MoviesDetailsRecommendationSuccess(recommendedMovies),
        );
      },
    );
    return result;
  }
}

