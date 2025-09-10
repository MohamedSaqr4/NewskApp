import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/home/presentation/view/widgets/article_card_widget.dart';
import 'package:news_app/features/search_result/presentation/logic/search_result_cubit.dart';
import 'package:news_app/features/search_result/presentation/logic/search_result_state.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key, required this.content});
  final String content;

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  @override
  void initState() {
    super.initState();
    context.read<SearchResultCubit>().fetchSearchResults(widget.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results'.tr(),
          style: AppTextStyles.subtitle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22.sp,
          ),
          onPressed: context.pop,
        ),
      ),
      body: BlocBuilder<SearchResultCubit, SearchResultState>(
        builder: (context, state) {
          if (state is SearchResultLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SearchResultLoaded) {
            final articles = state.articles;
            if (articles.isEmpty) {
              return Center(child: Text("No Results Found".tr()));
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final article = articles[index];
                        return ArticleCard(
                          onTap: () {
                            context.push(
                              AppRoutes.newsDetails,
                              extra: article,
                            );
                          },
                          imageUrl: article.urlToImage ?? '',
                          title: article.title,
                          name: article.author ?? 'Unknown',
                          date: article.publishedAt,
                        );
                      },
                      childCount: articles.length,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is SearchResultError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("Search for articles"));
          }
        },
      ),
    );
  }
}
