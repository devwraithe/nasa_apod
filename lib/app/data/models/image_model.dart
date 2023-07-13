import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final String title, date, explanation, hdUrl;

  const ImageModel({
    required this.title,
    required this.date,
    required this.explanation,
    required this.hdUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      title: json['title'],
      date: json['date'],
      explanation: json['explanation'],
      hdUrl: json['hdurl'],
    );
  }

  ImageEntity toEntity() {
    return ImageEntity(
      title: title,
      date: date,
      explanation: explanation,
      hdUrl: hdUrl,
    );
  }

  @override
  List<Object> get props => [title, date, explanation, hdUrl];
}
