import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

import 'package:movies_app/movies/presentation/controller/movies_cubit/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/movies_details_recommendation/movies_details_recommendation_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_service.dart';
import '../../../core/utilies/app_strings.dart';
import '../components/movies_details_content.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              getIt<MoviesDetailsCubit>()..fetchMoviesDetails(id: id),
          lazy: false,
        ),
        BlocProvider(
          create: (BuildContext context) =>
              getIt<MoviesDetailsRecommendationCubit>()
                ..fetchMoviesDetailsRecommendation(id: id),
          lazy: false,
        ),
      ],
      child: const Scaffold(
        body: MovieDetailContent(),
      ),
    );
  }
}


