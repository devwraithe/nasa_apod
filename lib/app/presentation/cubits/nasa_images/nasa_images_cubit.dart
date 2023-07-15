import 'package:cloudwalk_assessment/app/domain/usecases/images_usecase.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesCubit extends Cubit<ImagesStates> {
  final NasaImagesUsecase _usecase;
  ImagesCubit(this._usecase) : super(ImagesInitial());

  Future<void> getImages() async {
    emit(ImagesLoading());
    final result = await _usecase.execute();
    emit(
      result.fold(
        (failure) => ImagesError(failure.message),
        (images) => ImagesLoaded(images),
      ),
    );
  }
}
