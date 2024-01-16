import 'package:canverro_gallery_task/src/core/error/exceptions.dart';
import 'package:canverro_gallery_task/src/core/error/failure.dart';
import 'package:canverro_gallery_task/src/core/utils/either.dart';
import 'package:canverro_gallery_task/src/core/utils/error_message_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

extension RepositoryExtension<T> on Future<T> {
  Future<Either<Failure, T>> makeRequest() async {
    try {
      final data = await this;
      return Right(data);
    } on DioException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      debugPrintStack();
      return Left(
        ServerFailure(
          message: e.errorMessage,
        ),
      );
    } on ServerException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      debugPrintStack();
      return Left(
        ServerFailure(
          message: e.errorMessage,
        ),
      );
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      debugPrintStack();
      return const Left(
        ServerFailure(
          message: 'Something went wrong. Please try again',
        ),
      );
    }
  }
}
