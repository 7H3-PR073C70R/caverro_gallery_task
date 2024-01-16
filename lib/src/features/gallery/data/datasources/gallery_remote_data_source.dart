import 'package:canverro_gallery_task/src/features/gallery/data/client/gallery_client.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';

mixin GalleryRemoteDataSource {
  Future<List<ImageModel>> getImages({
    required int page,
  });
}

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  const GalleryRemoteDataSourceImpl(this._client);
  final GalleryClient _client;
  @override
  Future<List<ImageModel>> getImages({required int page}) {
    return _client.getImages(page);
  }
}
