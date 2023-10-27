import 'package:equatable/equatable.dart';


class ErrorMsgModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

 const ErrorMsgModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMsgModel.fromJson(Map<String, dynamic> json) {
    return ErrorMsgModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      success: json["success"],
    );
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
