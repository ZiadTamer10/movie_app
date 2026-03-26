import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.factoryDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServices');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServices');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServices');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Return to ApiServer is Cancelled');

      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not Found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later!');
    } else {
      return ServerFailure('Opps There was an Error, Please try later!');
    }
  }
}
