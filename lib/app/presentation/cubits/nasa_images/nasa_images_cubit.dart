import 'package:cloudwalk_assessment/app/domain/usecases/images_usecase.dart';
import 'package:cloudwalk_assessment/app/presentation/cubits/nasa_images/nasa_images_states.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagesCubit extends Cubit<ImagesStates> {
  final NasaImagesUsecase _usecase;
  final Connectivity connectivity;

  ImagesCubit(this._usecase, this.connectivity) : super(ImagesInitial());

  Future<void> getImages() async {
    emit(ImagesLoading());

    try {
      final connectivityResult = await connectivity.checkConnectivity();
      final hasInternet = connectivityResult != ConnectivityResult.none;

      if (hasInternet) {
        final result = await _usecase.execute();
        print("Has Internet? $hasInternet");
        emit(
          result.fold(
            (failure) => ImagesError(failure.message),
            (images) {
              _usecase.storeImage(images);
              return ImagesLoaded(images);
            },
          ),
        );
      } else {
        print("internet checker - $hasInternet");
        final cachedImages = await _usecase.getCachedImages();
        print("cached images - ${cachedImages}");
        // emit stops the loading
        emit(ImagesLoaded(cachedImages));
      }
    } catch (error) {
      emit(ImagesError(error.toString()));
    }

    // final result = await _usecase.execute();
    // emit(
    //   result.fold(
    //     (failure) => ImagesError(failure.message),
    //     (images) => ImagesLoaded(images),
    //   ),
    // );
  }
}
