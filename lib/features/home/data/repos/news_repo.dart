import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/core/errors/server_exceptions.dart';

class NewsRepository {
  final ApiConsumer api;
  NewsRepository(this.api);

  Future<List<Article>> getTopHeadlines({String country = 'us'}) async {
    try {
      final response = await api.getRequest(
        EndPoints.topHeadLines,
        queryParameters: {
          'country': country,
        },
      );
final newsResponse = NewsResponse.fromJson(response).articles;
      return newsResponse;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error in NewsRepository: $e');
    }
  }
}
