import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sixam_mart/api/api_client.dart';
import 'package:sixam_mart/features/auth/domain/models/store_body_model.dart';
import 'package:sixam_mart/features/auth/domain/reposotories/store_registration_repository_interface.dart';
import 'package:sixam_mart/util/app_constants.dart';

class StoreRegistrationRepository implements StoreRegistrationRepositoryInterface {
  final ApiClient apiClient;
  StoreRegistrationRepository({required this.apiClient});

  @override
  Future<Response> registerStore(StoreBodyModel store, XFile? logo, XFile? cover, XFile? pickedTax, XFile? pickedRegistration) async {
    Response response = await apiClient.postMultipartData(
      AppConstants.storeRegisterUri, store.toJson(), [MultipartBody('logo', logo), MultipartBody('cover_photo', cover),
      MultipartBody('tax_document', pickedTax), MultipartBody('registration_document', pickedRegistration)],
    );
    return response;
  }

  @override
  Future<bool> checkInZone(String? lat, String? lng, int zoneId) async {
    Response response = await apiClient.getData('${AppConstants.checkZoneUri}?lat=$lat&lng=$lng&zone_id=$zoneId');
    if(response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }


  @override
  Future add(value) {
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    throw UnimplementedError();
  }

  @override
  Future get(String? id) {
    throw UnimplementedError();
  }

  @override
  Future getList({int? offset}) {
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body, int? id) {
    throw UnimplementedError();
  }

}