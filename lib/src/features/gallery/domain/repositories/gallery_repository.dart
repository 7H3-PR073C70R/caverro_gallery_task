import 'package:canverro_gallery_task/src/core/error/failure.dart';
import 'package:canverro_gallery_task/src/core/utils/either.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';

mixin GalleryRepository {
  Future<Either<Failure, List<ImageModel>>> getImages({
    required int page,
  });
}
