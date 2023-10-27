// ignore_for_file: unused_element

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'internet_connection_state.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  StreamSubscription? _subscription;
  InternetConnectionCubit() : super(InternetConnectionInitial());
  void connected() {
    emit(const InternetConnectionSuccess(internetMessage: 'Connected'));
  }

  void notConnected() {
    emit(const InternetConnectionFailure(internetMessage: 'NotConnected'));
  }

  void checkInternetConnection() {
    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        connected();
        print('connected');
      } else {
        notConnected();
        print('not');
      }
    });
  }

  Future<void> closeSubscription() async {
    await _subscription?.cancel();
    return super.close();
  }
}
