import 'package:canverro_gallery_task/src/features/gallery/data/client/gallery_client.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/datasources/gallery_remote_data_source.dart';
import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGalleryClient extends Mock implements GalleryClient {}

void main() {
  late GalleryRemoteDataSourceImpl remoteDataSource;
  late MockGalleryClient mockClient;

  setUp(() {
    mockClient = MockGalleryClient();
    remoteDataSource = GalleryRemoteDataSourceImpl(mockClient);
  });

  test('getImages should return a list of ImageModel', () async {
    // Arrange
    const page = 1;
    final expectedImages = [
      const ImageModel(
        id: '1',
        author: 'John Doe',
        width: 800,
        height: 600,
        url: 'sample-url',
        downloadUrl: 'sample-download-url',
      ),
      // Add more ImageModel instances as needed
    ];

    when(() => mockClient.getImages(page))
        .thenAnswer((_) async => expectedImages);

    // Act
    final result = await remoteDataSource.getImages(page: page);

    // Assert
    expect(result, expectedImages);
    verify(() => mockClient.getImages(page));
    verifyNoMoreInteractions(mockClient);
  });
}
