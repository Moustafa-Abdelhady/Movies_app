import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errMessage;

   const Failure(this.errMessage);



  
  @override
  List<Object> get props => [errMessage];
}

class ServerFailure extends Failure{
  const ServerFailure(super.errMessage);



}

class DatabaseFailure extends Failure{
 const DatabaseFailure(super.errMessage);

}


