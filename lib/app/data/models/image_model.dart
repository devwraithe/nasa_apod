import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  final String title, date, explanation, imgUrl;

  const ImageModel({
    required this.title,
    required this.date,
    required this.explanation,
    required this.imgUrl,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      title: json['title'],
      date: json['date'],
      explanation: json['explanation'],
      imgUrl: json['hdurl'],
    );
  }

  ImageEntity toEntity() {
    return ImageEntity(
      title: title,
      date: date,
      explanation: explanation,
      imgUrl: imgUrl,
    );
  }

  @override
  List<Object> get props => [title, date, explanation, imgUrl];
}
