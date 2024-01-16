part of 'locator.dart';

void _initClients() {
  locator.registerLazySingleton(() => GalleryClient(locator()));
}
