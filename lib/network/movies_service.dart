// 1
import 'package:chopper/chopper.dart';
import 'package:firstflutter/network/model/model_response.dart';
import 'model/popular_movies_remote.dart';
import 'model_converter.dart';

part 'movies_service.chopper.dart';

const String apiKey = '658680e409a5e9e11988f3e49361edae';
const String apiId = '<Your Id here>';
const String apiUrl = 'https://api.themoviedb.org';

// 1
@ChopperApi()
// 2
abstract class MoviesServices extends ChopperService {
  @Get(path: "/3/movie/popular")
  Future<Response<Result<PopularMoviesRemote>>> getPopularMovies();

  static MoviesServices create() {
    final client = ChopperClient(
      baseUrl: apiUrl,
      interceptors: [_addQuery, HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: const JsonConverter(),
      services: [
        _$MoviesServices(),
      ],
    );
    return _$MoviesServices(client);
  }

}
Request _addQuery(Request req) {
  // 1
  final params = Map<String, dynamic>.from(req.parameters);
  // 2
  //params['app_id'] = apiId;
  params['api_key'] = apiKey;
  // 3
  return req.copyWith(parameters: params);
}

