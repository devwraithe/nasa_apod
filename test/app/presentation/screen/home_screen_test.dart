import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/images_cubit.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/images_states.dart';
import 'package:cloudwalk_assessment/app/presentation/screens/home_screen.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../core/helpers/test_helper.mocks.dart';

void main() {
  late MockImagesCubit imagesCubit;

  setUp(() {
    imagesCubit = MockImagesCubit();
  });

  group('Home screen', () {
    const imageEntity = ImageEntity(
      title: 'Test Title',
      hdUrl: 'https://example.com/image.jpg',
      date: "01 June 2023",
      explanation: 'Test Explanation',
    );

    testWidgets('should display the title and search field', (tester) async {
      // Stub the stream and state method in the mock
      when(imagesCubit.stream).thenAnswer((_) => const Stream.empty());
      when(imagesCubit.state).thenReturn(const ImagesLoaded([imageEntity]));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ImagesCubit>.value(
            value: imagesCubit,
            child: const HomeScreen(),
          ),
        ),
      );

      expect(find.text('Astronomia'), findsOneWidget);
      expect(find.byType(SearchField), findsOneWidget);
    });

    //   testWidgets('display the photo cards on ImagesLoaded', (tester) async {
    //     when(imagesCubit.stream).thenAnswer(
    //       (_) => Stream.value(
    //         const ImagesLoaded(
    //           [imageEntity],
    //         ),
    //       ),
    //     );
    //
    //     when(imagesCubit.state).thenReturn(
    //       const ImagesLoaded(
    //         [imageEntity],
    //       ),
    //     );
    //
    //     final testableHomeScreen = TestableHomeScreen();
    //
    //     testableHomeScreen.foundImages = [
    //       imageEntity
    //     ]; // Set the value of foundImages
    //
    //     await tester.pumpWidget(
    //       MaterialApp(
    //         home: BlocProvider<ImagesCubit>.value(
    //           value: imagesCubit,
    //           child: const HomeScreen(),
    //         ),
    //       ),
    //     );
    //
    //     expect(find.byType(RefreshIndicator), findsOneWidget);
    //     expect(find.byType(ListView), findsOneWidget);
    //     expect(find.byType(PhotoCard), findsWidgets);
    //   });
    //
    //   testWidgets('should display the "Load More" button when images are loaded',
    //       (tester) async {
    //     when(imagesCubit.state).thenReturn(
    //       const ImagesLoaded(
    //         [imageEntity, imageEntity, imageEntity],
    //       ),
    //     );
    //
    //     await tester.pumpWidget(
    //       MaterialApp(
    //         home: BlocProvider<ImagesCubit>.value(
    //           value: imagesCubit,
    //           child: HomeScreen(),
    //         ),
    //       ),
    //     );
    //
    //     expect(find.text('Load More'), findsOneWidget);
    //   });
    //
    //   testWidgets(
    //       'should navigate to the detail screen when a photo card is tapped',
    //       (tester) async {
    //     when(imagesCubit.state).thenReturn(
    //       ImagesLoaded([imageEntity]),
    //     );
    //
    //     await tester.pumpWidget(
    //       MaterialApp(
    //         home: BlocProvider<ImagesCubit>.value(
    //           value: imagesCubit,
    //           child: HomeScreen(),
    //         ),
    //       ),
    //     );
    //
    //     await tester.tap(find.byType(PhotoCard));
    //     await tester.pumpAndSettle();
    //
    //     expect(find.text('Detail Screen'), findsOneWidget);
    //   });
  });
}
