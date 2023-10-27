part of 'internet_connection_cubit.dart';

abstract class InternetConnectionState extends Equatable {
  const InternetConnectionState();

  @override
  List<Object> get props => [];
}

class InternetConnectionInitial extends InternetConnectionState {}

class InternetConnectionSuccess extends InternetConnectionState {
  final String internetMessage;

  const InternetConnectionSuccess({required this.internetMessage});
}

class InternetConnectionFailure extends InternetConnectionState {
  final String internetMessage;

  const InternetConnectionFailure({required this.internetMessage});
}
