import 'package:cloudwalk_assessment/app/domain/usecases/images_usecase.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utilities/errors/failure.dart';

class ImagesCubit extends Cubit<ImagesStates> {
  final NasaImagesUsecase _usecase;
  ImagesCubit(this._usecase) : super(ImagesInitial());

  Future<void> getImages() async {
    emit(ImagesLoading());
    try {
      final result = await _usecase.execute();
      emit(
        result.fold(
          (failure) => ImagesError(failure.message),
          (success) => ImagesLoaded(success),
        ),
      );
    } on ServerFailure catch (e) {
      debugPrint(e.toString());
      ImagesError(e.toString());
    } on ConnectionFailure catch (e) {
      debugPrint(e.toString());
      ImagesError(e.toString());
    } catch (e) {
      debugPrint(e.toString());
      ImagesError(e.toString());
    }
  }
}
