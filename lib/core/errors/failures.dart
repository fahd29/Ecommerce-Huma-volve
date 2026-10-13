import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Connection timed out. Please try again.");
      case DioExceptionType.badResponse:
        final response = dioException.response;
        if (response != null && response.data != null) {
          if (response.data is Map && response.data['message'] != null) {
            final msg = response.data['message'];
            if (msg is List) {
              return ServerFailure(msg.join(', '));
            }
            return ServerFailure(msg.toString());
          }
        }
        return ServerFailure(
          "Received invalid status code: ${response?.statusCode}",
        );
      case DioExceptionType.cancel:
        return const ServerFailure("Request was cancelled.");
      case DioExceptionType.connectionError:
        return const ServerFailure("No internet connection.");
      default:
        return ServerFailure(dioException.message ?? "Unexpected server error");
    }
  }
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network connection error.']);
}
