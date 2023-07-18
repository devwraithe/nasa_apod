import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const mockImageEntity = ImageEntity(
    title: 'Image 1',
    date: '2023-07-15',
    explanation: 'This is image 1',
    imgUrl: 'https://example.com/image1.jpg',
  );

  test('ImageEntity should correctly implement Equatable', () {
    expect(mockImageEntity.props.length, 4);
    expect(
      mockImageEntity.props,
      containsAll([
        'Image 1',
        '2023-07-15',
        'This is image 1',
        'https://example.com/image1.jpg'
      ]),
    );
  });
}
