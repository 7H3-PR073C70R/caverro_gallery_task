part of 'locator.dart';

void _initDataSource() {
  locator.registerLazySingleton<GalleryRemoteDataSource>(
    () => GalleryRemoteDataSourceImpl(locator()),
  );
}
