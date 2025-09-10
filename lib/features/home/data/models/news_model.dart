import 'package:news_app/features/home/data/models/article_model.dart';
class NewsResponse {
    String status;
    int totalResults;
    List<Article> articles;

    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
 
}
