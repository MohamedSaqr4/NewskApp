import 'package:news_app/core/api/api_consumer.dart';
import 'package:news_app/core/api/end_points.dart';
import 'package:news_app/core/constant.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/core/errors/server_exceptions.dart';

class SearchResultRepository {
  final ApiConsumer api;
  SearchResultRepository(this.api);
  Future<List<Article>> searchArticles({required String content}) async {
    try {
      final response = await api.getRequest(
        EndPoints.everything,
        queryParameters: {
          'q': content,
          'language': AppConstants.currentLanguage,
        },
      );
      final searchResultNews = NewsResponse.fromJson(response).articles;
      return searchResultNews;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw Exception('Unexpected error in NewsRepository: $e');
    }
  }
}
