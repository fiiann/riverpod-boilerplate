import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/feature/auth/model/login_response.dart';
import 'package:flutter_boilerplate/feature/home/model/book.dart';
import 'package:flutter_boilerplate/shared/constants/endpoint.dart';
import 'package:flutter_boilerplate/shared/network/dio/dio_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';

part 'api_provider.g.dart';

final apiProvider = Provider<ApiProvider>((ref) {
  final dio = ref.watch(dioRepositoryProvider);
  return ApiProvider(dio);
});

@RestApi(baseUrl: Endpoint.baseUrl)
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @POST(Endpoint.login)
  Future<LoginResponse> login({@Body() required LoginRequest request});

  @GET(Endpoint.books)
  Future<List<Book>> fetchBook();
}
