import 'package:canverro_gallery_task/src/core/constants/app_env.dart';
import 'package:canverro_gallery_task/src/core/networking/interceptors/dio_interceptors.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/client/gallery_client.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/repositories/gallery_repository_impl.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/usecases/get_images_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

part 'client_locator.dart';
part 'data_source_locator.dart';
part 'external_locator.dart';
part 'repository_locator.dart';
part 'use_case_locator.dart';

final locator = GetIt.instance;

void initLocator() {
  _initExternal();
  _initClients();
  _initDataSource();
  _initRepositoryLocator();
  _initUseCaseLocator();
}
