import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing_movies_usecase.dart';
import '../../../../../core/error/failure.dart';
import '../../../../domain/entities/movies.dart';
// import 'now_playing_state.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit(this.getNowPlayingMoviesUseCase) : super(NowPlayingInitial());

  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;

  Future<Either<Failure, List<Movies>>> fetchNowPlayingMovies() async {
    emit(NowPlayingLoading());
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    print("resultCubit =$result");
    result.fold(
      (failure) {
        emit(
          NowPlayingFailure(failure.errMessage),
        );
      },
      (nowPlayingMovies) {
        emit(
          NowPlayingSuccess(nowPlayingMovies),
        );
      },
    );
    return result;
  }
}
