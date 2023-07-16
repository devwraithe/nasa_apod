import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_assessment/app/core/utilities/errors/failure.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/images_states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/helpers/test_helper.mocks.dart';

void main() {
  late MockNasaImagesUsecase mockUsecase;
  late ImagesCubit cubit;

  setUp(() {
    mockUsecase = MockNasaImagesUsecase();
    cubit = ImagesCubit(mockUsecase);
  });

  final imagesList = [
    const ImageEntity(
      title: 'Test Movie 1',
      date: '01 June 2023',
      explanation: 'Test Explanation 1',
      hdUrl: 'http://www.example1.com',
    ),
    const ImageEntity(
      title: 'Test Movie 2',
      date: '02 June 2023',
      explanation: 'Test Explanation 2',
      hdUrl: 'http://www.example2.com',
    ),
  ];

  test(
    'initial state should be empty',
    () => expect(cubit.state, ImagesInitial()),
  );

  group("images bloc", () {
    blocTest<ImagesCubit, ImagesStates>(
      "show loading and loaded",
      setUp: () => when(mockUsecase.execute()).thenAnswer(
        (_) async => Right(imagesList),
      ),
      build: () => cubit,
      act: (cubit) => cubit.getImages(),
      expect: () => <ImagesStates>[
        ImagesLoading(),
        ImagesLoaded(imagesList),
      ],
      verify: (bloc) {
        verify(mockUsecase.execute()).called(1);
      },
    );

    blocTest<ImagesCubit, ImagesStates>(
      "show loading and error",
      setUp: () => when(mockUsecase.execute()).thenAnswer(
        (_) async => const Left(Failure("Error retrieving images")),
      ),
      build: () => cubit,
      act: (cubit) => cubit.getImages(),
      expect: () => <ImagesStates>[
        ImagesLoading(),
        const ImagesError("Error retrieving images"),
      ],
      verify: (bloc) {
        verify(mockUsecase.execute()).called(1);
      },
    );
  });
}
