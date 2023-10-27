import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/movies/presentation/controller/internet_connection_cubit/internet_connection_cubit.dart';

import 'package:movies_app/movies/presentation/controller/movies_cubit/now_playing_cubit/now_playing_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit/top_rated_movies_cubit/top_rated_movies_cubit.dart';
import '../../../core/global/theme/theme_data/app_theme_state.dart';
import '../../../core/services/services_locator.dart';

import '../components/now_playing_widget.dart';
import '../components/popular_widget.dart';
import '../components/top_rated_widget.dart';
import '../controller/localization_cubit/localozation_cubit.dart';
import '../controller/theme_cubit/theme_cubit/theme_cubit.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    (context).read<LocalozationCubit>().changeStartupLang();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              getIt<NowPlayingCubit>()..fetchNowPlayingMovies(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              getIt<PopularMoviesCubit>()..fetchPopularMovies(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              getIt<TopRatedMoviesCubit>()..fetchTopRatedMovies(),
        ),
      ],
      child: BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
        builder: ((context, state) {
          if (state is InternetConnectionFailure) {
            return const Center(
              child: Text(
                'Not Connected',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return Scaffold(
                  // resizeToAvoidBottomInset:true,
                  appBar: AppBar(
                    // elevation: 1,
                    title: Text(
                      S.of(context).appName,
                      style: TextStyle(
                          color: AppBarTheme.of(context).foregroundColor),
                    ),

                    actions: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<ThemeCubit>(context)
                              .changeAppTheme(AppThemeState.Dark);
                        },
                        icon: const Icon(Icons.dark_mode),
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<ThemeCubit>(context)
                              .changeAppTheme(AppThemeState.Light);
                        },
                        icon: const Icon(Icons.light_mode),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // const Spacer(flex: 1,),
                      const LanguagesButton(),
                    ],
                  ),
                  body: SingleChildScrollView(
                    key: const Key('movieScrollView'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const NowPlayingWidget(),
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).popular,
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  ///Navigator To Movie Details
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(S.of(context).seeMore),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const PopularWidget(),
                        Container(
                          margin: const EdgeInsets.fromLTRB(
                            16.0,
                            24.0,
                            16.0,
                            8.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).topRated,
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.15,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  /// TODO : NAVIGATION TO Top Rated Movies Screen
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(S.of(context).seeMore),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const TopRatedWidget(),
                        const SizedBox(height: 50.0),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}

class LanguagesButton extends StatelessWidget {
  const LanguagesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // mainAxisAlignment: MainAxisAlignment.start,
        // textBaseline:TextBaseline.alphabetic,
        // crossAxisAlignment :CrossAxisAlignment.start,
        SizedBox(
      child: Row(children: [
        TextButton(
          child: Text(
            'EN',
            style: TextStyle(color:AppBarTheme().foregroundColor),
          ),
          onPressed: () {
            print('EN');
            (context).read<LocalozationCubit>().changeLang(context, 'en');
            // BlocProvider.of<LocalCubit>(context).toEnglish();
          },
        ),
        TextButton(
          child: Text(
            'AR',
            style: TextStyle(color:AppBarTheme().foregroundColor),
          ),
          onPressed: () {
            print('AR');
            (context).read<LocalozationCubit>().changeLang(context, 'ar');
            // BlocProvider.of<LocalCubit>(context).toArabic();
          },
        )
      ]),
    );
  }
}
