import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_assessment/app/core/theme/colors.dart';
import 'package:cloudwalk_assessment/app/core/theme/text_theme.dart';
import 'package:cloudwalk_assessment/app/presentation/widgets/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'should display the photo card with correct title, date, and image',
      (tester) async {
    const title = 'Photo Title';
    const date = '2023-07-13';
    const imageUrl = 'https://example.com/photo.jpg';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PhotoCard(
            title: title,
            date: date,
            image: imageUrl,
            onTap: () {},
          ),
        ),
      ),
    );

    // Find the PhotoCard widget
    final cardFinder = find.byType(PhotoCard);
    expect(cardFinder, findsOneWidget);

    // Find the CachedNetworkImage widget inside the PhotoCard
    final imageFinder = find.descendant(
      of: cardFinder,
      matching: find.byType(CachedNetworkImage),
    );
    expect(imageFinder, findsOneWidget);

    // Verify the properties of the CachedNetworkImage widget
    final cachedNetworkImage = tester.widget<CachedNetworkImage>(imageFinder);
    expect(cachedNetworkImage.imageUrl, imageUrl);
    expect(cachedNetworkImage.fit, BoxFit.cover);
    expect(cachedNetworkImage.filterQuality, FilterQuality.high);
    expect(cachedNetworkImage.height, 240);
    expect(cachedNetworkImage.width, double.infinity);

    // Find the Text widgets inside the PhotoCard
    final titleFinder = find.descendant(
      of: cardFinder,
      matching: find.text(title),
    );
    final dateFinder = find.descendant(
      of: cardFinder,
      matching: find.text(date),
    );
    expect(titleFinder, findsOneWidget);
    expect(dateFinder, findsOneWidget);

    // Verify the styles of the Text widgets
    final titleText = tester.widget<Text>(titleFinder);
    expect(titleText.style, AppTextTheme.textTheme.headlineMedium);

    final dateText = tester.widget<Text>(dateFinder);
    expect(dateText.style,
        AppTextTheme.textTheme.bodyLarge?.copyWith(color: AppColors.grey));
  });
}
