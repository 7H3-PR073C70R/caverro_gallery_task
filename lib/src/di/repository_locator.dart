part of 'locator.dart';

Future<void> _initRepositoryLocator() async {
   locator.registerLazySingleton<GalleryRepository>(
    () => GalleryRepositoryImpl(locator()),
  );
}
