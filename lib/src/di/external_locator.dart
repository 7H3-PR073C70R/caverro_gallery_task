part of 'locator.dart';

void _initExternal() {
  locator
    ..registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: AppEnv.apiBaseURL,
          contentType: 'application/json',
          connectTimeout: const Duration(seconds: 20),
        ),
      )..interceptors.addAll(
          [
            LoggingInterceptor(logger: locator()),
          ],
        ),
    )
    ..registerLazySingleton<Logger>(
      Logger.new,
    );
}
