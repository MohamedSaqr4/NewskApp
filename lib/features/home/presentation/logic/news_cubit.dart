import 'package:bloc/bloc.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/data/repos/news_repo.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository repo;
  NewsCubit(this.repo) : super(NewsInitial());
  
  Future<void> fetchTopHeadlines() async {
    emit(NewsLoading());
    try {
      final articles = await repo.getTopHeadlines();
      emit(NewsLoaded(articles));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
