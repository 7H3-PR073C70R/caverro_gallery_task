import 'package:canverro_gallery_task/src/core/error/failure.dart';
import 'package:canverro_gallery_task/src/core/utils/either.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/usecases/get_images_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGalleryRepository extends Mock implements GalleryRepository {}

void main() {
  late GetImagesUseCase getImagesUseCase;
  late MockGalleryRepository mockRepository;

  setUp(() {
    mockRepository = MockGalleryRepository();
    getImagesUseCase = GetImagesUseCase(mockRepository);
  });

  group('GetImagesUseCase', () {
    test('should get a list of ImageModel from the repository', () async {
      // Arrange
      const page = 1;
      final mockImageList = [
        const ImageModel(
          id: '1',
          author: 'John Doe',
          width: 800,
          height: 600,
          url: 'https://example.com/image1.jpg',
          downloadUrl: 'https://example.com/download1.jpg',
        ),
        // Add more sample data as needed
      ];

      when(() => mockRepository.getImages(page: page)).thenAnswer(
        (_) async => Right<Failure, List<ImageModel>>(mockImageList),
      );

      // Act
      final result = await getImagesUseCase(page);

      // Assert
      expect(result, Right<Failure, List<ImageModel>>(mockImageList));
      verify(() => mockRepository.getImages(page: page)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('should return a Failure when repository call fails', () async {
      // Arrange
      const page = 1;
      const mockFailure = ServerFailure(message: 'Test failure message');

      when(() => mockRepository.getImages(page: page))
          .thenAnswer((_) async => const Left(mockFailure));

      // Act
      final result = await getImagesUseCase(page);

      // Assert
      expect(result, const Left<Failure, List<ImageModel>>(mockFailure));
      verify(() => mockRepository.getImages(page: page)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
