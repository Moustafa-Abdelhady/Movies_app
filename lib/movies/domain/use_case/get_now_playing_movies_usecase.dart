import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../entities/movies.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movies> , NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
    ///callable => call() :it's a dart method makes call in cubit without calling method in the class
 Future<Either<Failure, List<Movies>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
