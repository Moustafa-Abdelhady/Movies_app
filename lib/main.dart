import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utilies/app_constance.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:movies_app/movies/presentation/controller/theme_cubit/theme_cubit/theme_cubit.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/global/theme/theme_data/app_theme_state.dart';
import 'core/global/theme/theme_data/theme_data_dark.dart';
import 'core/global/theme/theme_data/theme_data_light.dart';

import 'movies/presentation/controller/internet_connection_cubit/internet_connection_cubit.dart';
import 'movies/presentation/controller/localization_cubit/localozation_cubit.dart';

//// To Change theme : 1-save Current Theme in sharedPreference
/// 2-when start app get current theme 3-state management

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiConstance.sharedPreferences = await SharedPreferences.getInstance();
  ServicesLocator().initialize();

  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              InternetConnectionCubit()..checkInternetConnection(),
        ),
        BlocProvider(
          create: (context) =>
              ThemeCubit()..changeAppTheme(AppThemeState.Initial),
        ),
        BlocProvider(create: (context) => LocalozationCubit()..changeStartupLang())
      ],
      child: BlocBuilder<LocalozationCubit, Locale?>(
        builder: (context, lang) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              if (state is AppLightThemeState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Movies app',
                  theme: getThemeDataLight(),
                  // darkTheme: ThemeData.dark(),
                  // themeMode: ThemeCubit.get(context),
                   locale: lang,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  home: const MoviesScreen(),
                );
              } else if (state is AppDarkThemeState) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Movies app',
                  theme: getThemeDataDark(),
                  // darkTheme: ThemeData.dark(),
                  // themeMode: ThemeCubit.get(context),
                   locale: lang,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  home: const MoviesScreen(),
                );
              } else {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Movies app',
                  theme: getThemeDataDark(),
                  darkTheme: ThemeData.dark(),
                  // themeMode: ThemeCubit.get(context),
                   locale: lang,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  // supportedLocales: S.delegate.supportedLocales,
                  supportedLocales: const [Locale('en', ''), Locale('ar', '')],
                  home: const MoviesScreen(),
                );
              }
            },
          );
        },
      ),
    );
  }
}
