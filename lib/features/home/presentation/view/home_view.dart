import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/constant.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacer.dart';
import 'package:news_app/features/home/presentation/logic/news_cubit.dart';
import 'package:news_app/features/home/presentation/view/widgets/article_card_widget.dart';
import 'package:news_app/features/home/presentation/view/widgets/category_item.dart';
import 'package:news_app/features/home/presentation/view/widgets/search_text_field.dart';
import 'package:news_app/features/home/presentation/view/widgets/top_head_line_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lavender,
        toolbarHeight: 68.h,
        elevation: 0.0,
        title: Text(
          'Explore'.tr(),
          style: AppTextStyles.title,
        ),
        actions: [
          SearchTextField(),
          IconButton(
              onPressed: () {
                if (AppConstants.currentLanguage == 'en') {
                  AppConstants.currentLanguage = 'ar';
                } else {
                  AppConstants.currentLanguage = 'en';
                }
                setState(() {
                  context.setLocale(Locale(AppConstants.currentLanguage));
                });
              },
              icon: const Icon(
                Icons.language_outlined,
                color: AppColors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state) {
            if (state is NewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is NewsLoaded) {
              final articles = state.articles;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  //categories
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const HeightSpace(16),
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 32.w),
                          child: SizedBox(
                            height: 40.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                CategoryItem(
                                    categoryName: 'Travel',
                                    onTap: () {
                                      context.push(AppRoutes.searcResultView,
                                          extra: 'Travel');
                                    }),
                                CategoryItem(
                                    categoryName: 'Technology',
                                    onTap: () {
                                      context.push(AppRoutes.searcResultView,
                                          extra: 'Technology');
                                    }),
                                CategoryItem(
                                    categoryName: 'Business',
                                    onTap: () {
                                      context.push(AppRoutes.searcResultView,
                                          extra: 'Business');
                                    }),
                                CategoryItem(
                                    categoryName: 'Entertainment',
                                    onTap: () {
                                      context.push(AppRoutes.searcResultView,
                                          extra: 'Entertainment');
                                    }),
                              ],
                            ),
                          ),
                        ),
                        const HeightSpace(24),
                      ],
                    ),
                  ),

                  // Top Headline (article 0)
                  if (articles.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Column(
                          children: [
                            TopHeadLineItem(
                              onTap: () {
                                context.push(
                                  AppRoutes.newsDetails,
                                  extra: articles[0],
                                );
                              },
                              imageUrl: articles[0].urlToImage ?? '',
                              title: articles[0].title,
                              name: articles[0].author ?? 'Unknown',
                              date: articles[0].publishedAt,
                            ),
                            const HeightSpace(24),
                          ],
                        ),
                      ),
                    ),

                  // Rest of articles
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final article = articles[index + 1];
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
                        childCount:
                            articles.length > 1 ? articles.length - 1 : 0,
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is NewsError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text("No data"));
            }
          },
        ),
      ),
    );
  }
}
