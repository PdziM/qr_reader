import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/objects/custom_exception.dart';
import '../service.dart';

HttpClientService newHttpClientService(Dio dio) => _HttpClientService(dio);

class _HttpClientService extends HttpClientService {
  _HttpClientService(this._dio) {
    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: onRequest,
        onError: onError,
        onResponse: onResponse,
      ),
      LogInterceptor(
        requestHeader: true,
        responseBody: true,
        request: true,
        requestBody: false,
        responseHeader: true,
      ),
    ]);
  }

  final Dio _dio;

  @override
  Dio get dio => _dio;

  Options options = Options(
    validateStatus: (status) {
      return true;
    },
  );

  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({'Content-Type': 'application/json'});

    handler.next(options);
  }

  void onError(DioException error, ErrorInterceptorHandler handler) async {
    handler.next(error);
  }

  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  Future<Either<CustomException, Response>> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(message: e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          message:
              "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.post(path,
          data: data, queryParameters: queryParameters, options: options);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(message: e.message ?? 'Erro Inesperado'));
    } catch (e) {
      return Left(CustomException(
          message:
              "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.put(path, data: data, queryParameters: queryParameters);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(message: e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          message:
              "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.patch(path, data: data, queryParameters: queryParameters);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(message: e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          message:
              "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  @override
  Future<Either<CustomException, Response>> delete(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.delete(path, data: data, queryParameters: queryParameters);
      return _getResult(response);
    } on DioException catch (e) {
      return Left(CustomException(message: e.message ?? ''));
    } catch (e) {
      return Left(CustomException(
          message:
              "Por favor verifique sua conexão com a internet ${e.toString()}"));
    }
  }

  Either<CustomException, Response> _getResult(Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok ||
            HttpStatus.created ||
            HttpStatus.badRequest ||
            HttpStatus.partialContent:
        return Right(response);
      case HttpStatus.unauthorized:
        return Left(
            CustomException(message: "Por favor faça o login novamente"));
      case HttpStatus.gatewayTimeout:
        return Left(CustomException(
            message: "Por favor verifique sua conexão com a internet"));
      default:
        return Left(CustomException(
            message:
                "Por favor verifique sua conexão com a internet ${response.statusCode}"));
    }
  }
}
