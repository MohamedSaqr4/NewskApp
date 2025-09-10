import 'package:news_app/features/home/data/models/article_model.dart';

abstract class SearchResultState {}

class SearchResultInitial extends SearchResultState {}

class SearchResultLoading extends SearchResultState {}

class SearchResultLoaded extends SearchResultState {
  final List<Article> articles;
  SearchResultLoaded(this.articles);
}

class SearchResultError extends SearchResultState {
  final String message;
  SearchResultError(this.message);
}
