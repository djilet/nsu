import 'package:dio/dio.dart';
import 'package:nsu_cab/services/token_storage/token_storage.dart';

enum HttpMethod { POST, GET, PUT, DELETE }

const BASE_URL = "https://rickandmortyapi.com/api/";

class HttpService {
  Dio? _dio;

  final ITokenStorage iTokenStorage;

  HttpService({required this.iTokenStorage}) : super() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        headers: {"Content-Type": "application/json"},
      ),
    );
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) async {
          await iTokenStorage.writeToken(DateTime.now().toString());
          final token = await iTokenStorage.getToken() ?? '';

          print(token);

          requestOptions.headers["Authorization"] = "Bearer $token";

          return handler.next(requestOptions);
        },
        onError: (err, handler) {
          if (err.response?.statusCode == 401) {
            _retry(err.requestOptions);
          }
          return handler.next(err);
        },
      ),
    );
  }

  Future<Response> request({
    required String url,
    required HttpMethod method,
    Map<String, dynamic>? params,
  }) async {
    Response response;

    try {
      switch (method) {
        case HttpMethod.POST:
          response = await _dio!.post(url, data: params);
          break;
        case HttpMethod.DELETE:
          response = await _dio!.delete(url);
          break;
        case HttpMethod.PUT:
          response = await _dio!.put(url, data: params);
          break;
        default:
          response = await _dio!.get(url, queryParameters: params);
          break;
      }

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return _dio!.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
