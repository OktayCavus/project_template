import 'package:dio/dio.dart';

abstract class INetworkService {
  Future<Response> get(
      {required String url,
      Map<String, dynamic>? query,
      Map<String, String>? headers});
  Future<Response> post(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, String>? headers});
  Future<Response> put(
      {required String url,
      Map<String, dynamic>? data,
      Map<String, String>? headers});
  Future<Response> delete({required String url, Map<String, String>? headers});
}
