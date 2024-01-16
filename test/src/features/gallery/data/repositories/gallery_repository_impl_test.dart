import 'package:canverro_gallery_task/src/core/error/exceptions.dart';
import 'package:canverro_gallery_task/src/core/error/failure.dart';
import 'package:canverro_gallery_task/src/core/utils/either.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/repositories/gallery_repository_impl.dart';
import 'package:canverro_gallery_task/src/features/gallery/domain/repositories/gallery_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a mock class for GalleryRemoteDataSource
class MockGalleryRemoteDataSource extends Mock
    implements GalleryRemoteDataSource {}

void main() {
  late GalleryRepository repository;
  late MockGalleryRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockGalleryRemoteDataSource();
    repository = GalleryRepositoryImpl(mockRemoteDataSource);
  });

  group('getImages...', () {
    const page = 1;

    test('should return a list of ImageModel from remote data source',
        () async {
      // Arrange
      const images = [ImageModel(id: '1', author: 'John Doe')];
      when(() => mockRemoteDataSource.getImages(page: page))
          .thenAnswer((_) async => images);

      // Act
      final result = await repository.getImages(page: page);

      // Assert
      expect(result, equals(const Right<Failure, List<ImageModel>>(images)));
      verify(() => mockRemoteDataSource.getImages(page: page));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return a Failure from remote data source on error', () async {
      // Arrange
      when(() => mockRemoteDataSource.getImages(page: page))
          .thenAnswer((_) async => throw const ServerException());

      // Act
      final result = await repository.getImages(page: page);

      // Assert
      expect(
        result.isLeft,
        true,
      );
      verify(() => mockRemoteDataSource.getImages(page: page));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
