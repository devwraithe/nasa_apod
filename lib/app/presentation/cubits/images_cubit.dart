import 'package:cloudwalk_assessment/app/domain/usecases/get_cached_images_usecase.dart';
import 'package:cloudwalk_assessment/app/domain/usecases/get_images_usecase.dart';
import 'package:cloudwalk_assessment/app/domain/usecases/update_local_db_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'images_states.dart';

class ImagesCubit extends Cubit<ImagesStates> {
  final GetImagesUsecase _getImagesUsecase;
  final GetCachedImagesUsecase _getCachedImagesUsecase;
  final UpdateLocalDbUsecase _updateLocalDbUsecase;
  final Connectivity connectivity;

  ImagesCubit(
    this._getImagesUsecase,
    this._getCachedImagesUsecase,
    this._updateLocalDbUsecase,
    this.connectivity,
  ) : super(ImagesInitial());

  Future<void> getImages() async {
    emit(ImagesLoading());
    try {
      final connectivityResult = await connectivity.checkConnectivity();
      final hasInternet = connectivityResult != ConnectivityResult.none;

      if (hasInternet) {
        final result = await _getImagesUsecase.execute();
        debugPrint("[Internet is Available, Access Remote Datasource]");
        emit(
          result.fold(
            (failure) => ImagesError(failure.message),
            (images) {
              _updateLocalDbUsecase.execute(images);
              return ImagesLoaded(images);
            },
          ),
        );
      } else {
        debugPrint("[Internet is Unavailable, Access Local Datasource]");
        final cachedImages = await _getCachedImagesUsecase.execute();
        emit(ImagesLoaded(cachedImages));
      }
    } catch (error) {
      emit(ImagesError(error.toString()));
    }
  }
}
