import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloudwalk_assessment/app/core/utilities/date_format.dart';
import 'package:cloudwalk_assessment/app/core/utilities/sizing.dart';
import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/text_theme.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)?.settings.arguments as ImageEntity;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: photo.title,
                  child: CachedNetworkImage(
                    imageUrl: photo.hdUrl,
                    fit: BoxFit.cover,
                    height: Sizing.screenHeight(context) / 2,
                    width: double.infinity,
                  ),
                ),
                SafeArea(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.title,
                    style: AppTextTheme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    FormatDate.format(photo.date),
                    style: AppTextTheme.textTheme.headlineSmall?.copyWith(
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    photo.explanation,
                    style: AppTextTheme.textTheme.bodyLarge?.copyWith(
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
