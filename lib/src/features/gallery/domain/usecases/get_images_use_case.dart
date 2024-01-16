import 'package:canverro_gallery_task/src/core/error/failure.dart';
import 'package:canverro_gallery_task/src/core/utils/either.dart';
import 'package:canverro_gallery_task/src/core/utils/use_case.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/repositories/gallery_repository.dart';

class GetImagesUseCase implements UseCase<List<ImageModel>, int> {
  const GetImagesUseCase(this._repository);
  final GalleryRepository _repository;
  @override
  Future<Either<Failure, List<ImageModel>>> call(int params) {
   return _repository.getImages(page: params);
  }
}
