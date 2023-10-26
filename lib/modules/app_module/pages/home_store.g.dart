// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$appResponseAtom =
      Atom(name: '_HomeStoreBase.appResponse', context: context);

  @override
  AppResponse<List<BreedsModel>> get appResponse {
    _$appResponseAtom.reportRead();
    return super.appResponse;
  }

  @override
  set appResponse(AppResponse<List<BreedsModel>> value) {
    _$appResponseAtom.reportWrite(value, super.appResponse, () {
      super.appResponse = value;
    });
  }

  late final _$appResponsePhotosAtom =
      Atom(name: '_HomeStoreBase.appResponsePhotos', context: context);

  @override
  AppResponse<List<BreedsPhotoModel>> get appResponsePhotos {
    _$appResponsePhotosAtom.reportRead();
    return super.appResponsePhotos;
  }

  @override
  set appResponsePhotos(AppResponse<List<BreedsPhotoModel>> value) {
    _$appResponsePhotosAtom.reportWrite(value, super.appResponsePhotos, () {
      super.appResponsePhotos = value;
    });
  }

  late final _$breedsListAtom =
      Atom(name: '_HomeStoreBase.breedsList', context: context);

  @override
  List<BreedsModel>? get breedsList {
    _$breedsListAtom.reportRead();
    return super.breedsList;
  }

  @override
  set breedsList(List<BreedsModel>? value) {
    _$breedsListAtom.reportWrite(value, super.breedsList, () {
      super.breedsList = value;
    });
  }

  late final _$breedsPhotoAtom =
      Atom(name: '_HomeStoreBase.breedsPhoto', context: context);

  @override
  List<BreedsPhotoModel>? get breedsPhoto {
    _$breedsPhotoAtom.reportRead();
    return super.breedsPhoto;
  }

  @override
  set breedsPhoto(List<BreedsPhotoModel>? value) {
    _$breedsPhotoAtom.reportWrite(value, super.breedsPhoto, () {
      super.breedsPhoto = value;
    });
  }

  late final _$fetchBreedsAsyncAction =
      AsyncAction('_HomeStoreBase.fetchBreeds', context: context);

  @override
  Future<List<BreedsModel>?> fetchBreeds() {
    return _$fetchBreedsAsyncAction.run(() => super.fetchBreeds());
  }

  late final _$fetchBreedsPhotosAsyncAction =
      AsyncAction('_HomeStoreBase.fetchBreedsPhotos', context: context);

  @override
  Future<List<BreedsModel>?> fetchBreedsPhotos({required String id}) {
    return _$fetchBreedsPhotosAsyncAction
        .run(() => super.fetchBreedsPhotos(id: id));
  }

  @override
  String toString() {
    return '''
appResponse: ${appResponse},
appResponsePhotos: ${appResponsePhotos},
breedsList: ${breedsList},
breedsPhoto: ${breedsPhoto}
    ''';
  }
}
