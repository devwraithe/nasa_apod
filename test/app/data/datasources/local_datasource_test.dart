import 'package:cloudwalk_assessment/app/data/datasources/local_datasource.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../core/utilities/path_provider_mock.dart';
import '../../core/utilities/test_helper.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockBox mockHiveBox;
  late MockHiveInterface mockHiveInterface;
  late LocalDataSourceImpl dataSource;

  setUpAll(() async {
    PathProviderPlatform.instance = FakePathProviderPlatform();
    await Hive.initFlutter();
    mockHiveBox = MockBox();
    mockHiveInterface = MockHiveInterface();
    dataSource = LocalDataSourceImpl(mockHiveInterface);
  });

  const mockImages = [
    ImageEntity(
      title: 'Image 1',
      date: '01 Jan 2021',
      explanation: 'Explanation 1',
      imgUrl: 'img_url_1',
    ),
    ImageEntity(
      title: 'Image 2',
      date: '02 Jan 2021',
      explanation: 'Explanation 2',
      imgUrl: 'img_url_2',
    ),
  ];

  test('should store images in Hive for offline support', () async {
    when(mockHiveInterface.openBox('images')).thenAnswer(
      (_) async => mockHiveBox,
    );
    when(mockHiveBox.clear()).thenAnswer((_) async => 1);
    dataSource.storeImages(mockImages);
    verify(mockHiveInterface.openBox<ImageEntity>('images'));
  });

  test("should retrieve cached data from Hive", () async {
    when(mockHiveInterface.openBox('images')).thenAnswer(
      (_) async => mockHiveBox,
    );
    when(mockHiveBox.values.toList()).thenReturn(mockImages);
    final result = await dataSource.retrieveImages();
    verify(mockHiveInterface.openBox<ImageEntity>('images'));
    expect(result, equals(mockImages));
    verify(mockHiveBox.close());
  });
}
