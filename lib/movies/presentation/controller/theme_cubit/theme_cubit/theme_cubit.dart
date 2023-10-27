import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/theme/theme_data/app_theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utilies/app_constance.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(AppThemeInitial());

  changeAppTheme(AppThemeState appThemeState) {
    if (appThemeState == AppThemeState.Initial) {
      
      if (ApiConstance.sharedPreferences!.getString('theme') != null) {
        
        if (ApiConstance.sharedPreferences!.getString('theme') == 'L') {
          emit(AppLightThemeState());
        } else {
          emit(AppDarkThemeState());
        }
      }
      emit(AppThemeInitial());
    } else if (appThemeState == AppThemeState.Light) {
      ApiConstance.sharedPreferences!.setString('theme', 'L');
      emit(AppLightThemeState());
    } else if (appThemeState == AppThemeState.Dark) {
      ApiConstance.sharedPreferences!.setString('theme', 'D');
      emit(AppDarkThemeState());
    }
  }

  // static ThemeCubit get(context) => BlocProvider.of(context);

  // bool isLight = false;

  // void changeAppMode() {
  //   isLight = !isLight;
  //   emit(AppChangeModeState());
  // }
}
