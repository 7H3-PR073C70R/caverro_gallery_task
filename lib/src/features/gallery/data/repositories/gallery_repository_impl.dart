import 'package:canverro_gallery_task/src/core/error/failure.dart';
import 'package:canverro_gallery_task/src/core/extensions/repository_extension.dart';
import 'package:canverro_gallery_task/src/core/utils/either.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/repositories/gallery_repository.dart';

class GalleryRepositoryImpl implements GalleryRepository {
  const GalleryRepositoryImpl(this._remoteDataSource);
  final GalleryRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, List<ImageModel>>> getImages({required int page}) {
    return _remoteDataSource.getImages(page: page).makeRequest();
  }
}
