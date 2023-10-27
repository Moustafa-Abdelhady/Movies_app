part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class AppThemeInitial extends ThemeState {}

class AppLightThemeState extends ThemeState {}
class AppDarkThemeState extends ThemeState {}
