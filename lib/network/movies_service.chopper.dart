// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MoviesServices extends MoviesServices {
  _$MoviesServices([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MoviesServices;

  @override
  Future<Response<Result<PopularMoviesRemote>>> getPopularMovies() {
    final $url = '/3/movie/popular';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<Result<PopularMoviesRemote>, PopularMoviesRemote>($request);
  }
}
