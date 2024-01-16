import 'package:canverro_gallery_task/src/features/gallery/data/models/image_model/image_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ImageModel...', () {
    test('equality', () {
      const image1 = ImageModel(
        id: '1',
        author: 'John Doe',
        width: 800,
        height: 600,
        url: 'https://example.com/image1.jpg',
        downloadUrl: 'https://example.com/download1.jpg',
      );

      const image2 = ImageModel(
        id: '1',
        author: 'John Doe',
        width: 800,
        height: 600,
        url: 'https://example.com/image1.jpg',
        downloadUrl: 'https://example.com/download1.jpg',
      );

      const differentImage = ImageModel(
        id: '2',
        author: 'Jane Doe',
        width: 1200,
        height: 900,
        url: 'https://example.com/image2.jpg',
        downloadUrl: 'https://example.com/download2.jpg',
      );

      expect(image1, image2);
      expect(image1, isNot(differentImage));
    });

    test('toJson and fromJson', () {
      const image = ImageModel(
        id: '1',
        author: 'John Doe',
        width: 800,
        height: 600,
        url: 'https://example.com/image1.jpg',
        downloadUrl: 'https://example.com/download1.jpg',
      );

      final json = image.toJson();
      final fromJsonImage = ImageModel.fromJson(json);

      expect(fromJsonImage, equals(image));
    });

    test('copyWith', () {
      const originalImage = ImageModel(
        id: '1',
        author: 'John Doe',
        width: 800,
        height: 600,
        url: 'https://example.com/image1.jpg',
        downloadUrl: 'https://example.com/download1.jpg',
      );

      final updatedImage = originalImage.copyWith(
        width: 1200,
        height: 900,
        downloadUrl: 'https://example.com/download_updated.jpg',
      );

      expect(updatedImage.width, 1200);
      expect(updatedImage.height, 900);
      expect(
        updatedImage.downloadUrl,
        'https://example.com/download_updated.jpg',
      );
      expect(updatedImage, isNot(equals(originalImage)));
    });
  });
}
