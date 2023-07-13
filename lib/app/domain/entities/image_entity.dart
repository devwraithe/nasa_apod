import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String title, date, explanation, hdUrl;

  const ImageEntity({
    required this.title,
    required this.date,
    required this.explanation,
    required this.hdUrl,
  });

  @override
  List<Object> get props => [title, date, explanation, hdUrl];
}
