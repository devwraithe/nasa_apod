import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/images_states.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/utilities/test_helper.mocks.dart';

void main() {
  late ImagesCubit imagesCubit;
  late MockImagesUsecase mockImagesUsecase;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockImagesUsecase = MockImagesUsecase();
    mockConnectivity = MockConnectivity();
    imagesCubit = ImagesCubit(mockImagesUsecase, mockConnectivity);
  });

  tearDown(() {
    imagesCubit.close();
  });

  const testImage = ImageEntity(
    title: 'Test Movie 1',
    date: '01 June 2023',
    explanation: 'Test Explanation 1',
    imgUrl: 'http://www.example1.com',
  );

  test(
    'initial state should be empty',
    () => expect(
      imagesCubit.state,
      ImagesInitial(),
    ),
  );

  blocTest<ImagesCubit, ImagesStates>(
    'emits ImagesLoaded when internet is available and usecase returns images',
    setUp: () {
      when(mockImagesUsecase.getImages()).thenAnswer(
        (_) async => const Right([testImage]),
      );
      when(mockConnectivity.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.mobile,
      );
      when(mockConnectivity.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.wifi,
      );
    },
    build: () => imagesCubit,
    act: (cubit) async => await cubit.getImages(),
    expect: () => [
      ImagesLoading(),
      const ImagesLoaded([testImage]),
    ],
  );

  blocTest<ImagesCubit, ImagesStates>(
    'emits ImagesLoaded with cached images when internet is unavailable',
    setUp: () {
      when(mockImagesUsecase.getCachedImages()).thenAnswer(
        (_) async => [testImage],
      );
      when(mockConnectivity.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.none,
      );
    },
    build: () => imagesCubit,
    act: (cubit) async => await cubit.getImages(),
    expect: () => [
      ImagesLoading(),
      const ImagesLoaded([testImage]),
    ],
  );

  blocTest<ImagesCubit, ImagesStates>(
    'emits ImagesError when usecase returns a failure',
    setUp: () {
      when(mockConnectivity.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.wifi,
      );
      when(mockImagesUsecase.getImages()).thenAnswer(
        (_) async => const Left(
          Failure('Test Failure'),
        ),
      );
    },
    build: () => imagesCubit,
    act: (cubit) => cubit.getImages(),
    expect: () => [
      ImagesLoading(),
      const ImagesError('Test Failure'),
    ],
  );
}
