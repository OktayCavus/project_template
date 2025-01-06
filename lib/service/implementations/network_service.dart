// services/implementations/network_service_impl.dart
import 'package:dio/dio.dart';
import 'package:get_it_injectable_example/service/interfaces/i_network_service.dart';

import 'package:injectable/injectable.dart';

@injectable
class NetworkServiceImpl implements INetworkService {
  final Dio _dio;

  NetworkServiceImpl(this._dio);

  @override
  Future<Response> get(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query,
      Map<String, String>? headers}) {
    return _dio.get(
      url,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response> post(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) {
    return _dio.post(
      url,
      data: data,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response> put(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, String>? headers}) {
    return _dio.put(
      url,
      data: data,
      options: Options(headers: headers),
    );
  }

  @override
  Future<Response> delete({required String url, Map<String, String>? headers}) {
    return _dio.delete(
      url,
      options: Options(headers: headers),
    );
  }
}
