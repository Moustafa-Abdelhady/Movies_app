import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/use_case/get_movies_details_usecase.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/movies_details_recommendation/movies_details_recommendation_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/now_playing_cubit/now_playing_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';

import '../../movies/data/data_source/movies_remote_data_source.dart';
import '../../movies/domain/use_case/get_popular_movies_usecase.dart';
import '../../movies/domain/use_case/get_top_rated_movies_usecase.dart';

final GetIt getIt = GetIt.instance;

class ServicesLocator {

  void initialize() {
    
    //// Cubit
    getIt.registerFactory(
      () => NowPlayingCubit(getIt()),
    );

    getIt.registerFactory(
      () => PopularMoviesCubit(getIt()),
    );

    getIt.registerFactory(
      () => TopRatedMoviesCubit(getIt()),
    );

    getIt.registerFactory(
      () => MoviesDetailsCubit(getIt()),
    );
    
    getIt.registerFactory(
      () => MoviesDetailsRecommendationCubit(getIt()),
    );

    /// - Use Case :-
    getIt.registerLazySingleton(
      () => GetNowPlayingMoviesUseCase(
        getIt(),
      ),
    );

      getIt.registerLazySingleton(
      () => GetPopularMoviesUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton(
      () => GetTopRatedMoviesUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton(
      () => GetMoviesDetailsUseCase(
        getIt(),
      ),
    );

    getIt.registerLazySingleton(
      () => GetMoviesDetailsRecommendationUseCase(
        getIt(),
      ),
    );


    /// - Repository :-
    getIt.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(
        getIt(),
      ),
    );

    /// - Data Source :-
    getIt.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );
  }
}
