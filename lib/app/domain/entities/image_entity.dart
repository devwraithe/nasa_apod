import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String title, date, explanation, imgUrl;

  const ImageEntity({
    required this.title,
    required this.date,
    required this.explanation,
    required this.imgUrl,
  });

  @override
  List<Object> get props => [title, date, explanation, imgUrl];
}
