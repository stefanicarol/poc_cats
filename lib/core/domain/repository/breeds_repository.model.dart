import 'package:dio/dio.dart';
import '../../data/endpoints_consts.dart';
import '../model/breeds_model.dart';
import '../model/breeds_photo_model.dart';

class BreedsRepository {
  final dio = Dio();

  Future<List<BreedsModel>> featch() async {
    try {
      final response = await dio.get(Endpoints.urlApi + Endpoints.breeds);

      return response.data
          .map<BreedsModel>((json) => BreedsModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BreedsPhotoModel>> featchPhoto({required String id}) async {
    try {
      final response =
          await dio.get(Endpoints.urlApi + Endpoints.breedsPhotos + id);

      return response.data
          .map<BreedsPhotoModel>((json) => BreedsPhotoModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
