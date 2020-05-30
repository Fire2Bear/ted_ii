import 'package:dio/dio.dart';

/// a classic repository
class AddressRepository {
  static final String apiUrl = "https://api-adresse.data.gouv.fr";
  Dio _dio;

  AddressRepository() {
    BaseOptions options = BaseOptions(
        baseUrl: apiUrl, connectTimeout: 5000, receiveTimeout: 3000);
    this._dio = Dio(options);
  }

  Future<Response> getAddresses(String search) {
    return _dio.get("/search/?q=$search&limit=15");
  }
}
