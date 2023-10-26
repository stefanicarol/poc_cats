import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/domain/model/breeds_model.dart';
import '../../../core/domain/model/breeds_photo_model.dart';
import '../../../core/domain/repository/breeds_repository.model.dart';
import '../../../core/exception/app_response_model.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final repository = Modular.get<BreedsRepository>();

  @observable
  AppResponse<List<BreedsModel>> appResponse = AppResponse();

  @observable
  AppResponse<List<BreedsPhotoModel>> appResponsePhotos = AppResponse();

  @observable
  List<BreedsModel>? breedsList;

  @observable
  List<BreedsPhotoModel>? breedsPhoto;

  @action
  Future<List<BreedsModel>?> fetchBreeds() async {
    appResponse = AppResponse.loading(message: "loading...");
    breedsList = await repository.featch();
    appResponse = AppResponse.completed(breedsList, message: "completed...");
    return breedsList;
  }

  @action
  Future<List<BreedsModel>?> fetchBreedsPhotos({required String id}) async {
    appResponsePhotos = AppResponse.loading(message: "loading...");
    breedsPhoto = await repository.featchPhoto(id: id);
    appResponsePhotos =
        AppResponse.completed(breedsPhoto, message: "completed...");
    return breedsList;
  }
}
