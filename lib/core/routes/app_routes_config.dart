import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/data/repos/news_repo.dart';
import 'package:news_app/features/home/presentation/logic/news_cubit.dart';
import 'package:news_app/features/home/presentation/view/home_view.dart';
import 'package:news_app/features/news_details/presentation/view/news_view_details.dart';
import 'package:news_app/features/search_result/data/repos/search_result_repo.dart';
import 'package:news_app/features/search_result/presentation/logic/search_result_cubit.dart';
import 'package:news_app/features/search_result/presentation/views/search_result_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: false,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) {
        return BlocProvider(
          create: (context) => NewsCubit(sl<NewsRepository>()),
          child: const HomeView(),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.searcResultView,
      builder: (context, state) {
        final content = state.extra as String? ?? 'news';
        return BlocProvider(
          create: (context) => SearchResultCubit(sl<SearchResultRepository>()),
          child: SearchResultView(content: content),
        );
      },
    ),
    GoRoute(
      path: AppRoutes.newsDetails,
      builder: (context, state) {
        final article = state.extra as Article;
        return NewsViewDetails(article: article);
      },
    ),
  ],
);
