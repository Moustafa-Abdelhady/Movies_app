import 'dart:ui';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// part 'localozation_state.dart';

class LocalozationCubit extends Cubit<Locale?> {
  LocalozationCubit() : super(null);

  void changeStartupLang() async {
    SharedPreferences langPrefs = await SharedPreferences.getInstance();

    

    String? langCode = langPrefs.getString('lang');
    print(langCode);

    if (langCode != null) {
      emit(Locale(langCode, ''));
    }
  }

  void changeLang(context, String data) async {
    emit(Locale(data, ''));

    SharedPreferences langPrefs = await SharedPreferences.getInstance();
    // save the language code to local storage
    await langPrefs.setString('lang', data);
  }
}
