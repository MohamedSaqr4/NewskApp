import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/search_result/data/repos/search_result_repo.dart';
import 'package:news_app/features/search_result/presentation/logic/search_result_state.dart';
class SearchResultCubit extends Cubit<SearchResultState> {
  final SearchResultRepository repository;
   SearchResultCubit(this.repository) : super(SearchResultInitial());
  Future<void> fetchSearchResults(String content) async {
    emit(SearchResultLoading());
    try {
      final List<Article> articles =
          await repository.searchArticles(content: content);
      emit(SearchResultLoaded(articles));
    } catch (e) {
      emit(SearchResultError(e.toString()));
    }
  }
}
