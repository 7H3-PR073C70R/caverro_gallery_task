import 'package:canverro_gallery_task/src/core/error/exceptions.dart';
import 'package:canverro_gallery_task/src/core/utils/error_message_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorHandler Extension Test', () {
    test('errorMessage should return correct message from DioException', () {
      final dioException = DioException(
        response: Response(
          data: {'message': 'Backend error message'},
          statusCode: 500,
          requestOptions: RequestOptions(),
        ),
        requestOptions: RequestOptions(path: '/api/endpoint'),
      );

      final errorMessage = dioException.errorMessage;

      expect(errorMessage, 'Backend error message');
    });

    test(
        'errorMessage should return DioException message if no'
        ' backend message', () {
      final dioException = DioException(
        requestOptions: RequestOptions(path: '/api/endpoint'),
      );

      final errorMessage = dioException.errorMessage;

      expect(errorMessage, 'something went wrong');
    });

    test('errorMessage should handle failed host lookup message', () {
      final dioException = DioException(
        message: 'Failed host lookup: Domain not found',
        requestOptions: RequestOptions(path: '/api/endpoint'),
      );

      final errorMessage = dioException.errorMessage;

      expect(
        errorMessage,
        'Please check your internet connection and try again',
      );
    });

    test('errorMessage should return null for non-DioException', () {
      const customException = ServerException();

      final errorMessage = customException.errorMessage;

      expect(errorMessage, null);
    });
  });
}
