import 'package:cloudwalk_assessment/app/domain/entities/image_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ImagesStates extends Equatable {
  const ImagesStates();
  @override
  List<Object> get props => [];
}

class ImagesInitial extends ImagesStates {}

class ImagesLoading extends ImagesStates {}

class ImagesLoaded extends ImagesStates {
  final List<ImageEntity> result;
  const ImagesLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class ImagesError extends ImagesStates {
  final String message;
  const ImagesError(this.message);

  @override
  List<Object> get props => [message];
}
