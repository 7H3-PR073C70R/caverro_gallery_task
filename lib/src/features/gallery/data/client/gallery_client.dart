import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'gallery_client.g.dart';

@RestApi()
abstract class GalleryClient {
  factory GalleryClient(Dio dio, {String baseUrl}) = _GalleryClient;

  @GET('/v2/list?limit=100')
  Future<List<ImageModel>> getImages(
    @Query('page') int page,
  );
}
