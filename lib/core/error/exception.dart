import 'package:movies_app/core/network/error_msg_model.dart';

class ServerException implements Exception {
  final ErrorMsgModel errorMsgModel;

  const ServerException({required this.errorMsgModel});
}

class LocalDataBaseException implements Exception {
  final String errMessage;

    const LocalDataBaseException({required this.errMessage});
}
