import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacer.dart';
import 'package:news_app/features/home/data/models/article_model.dart';
import 'package:news_app/features/home/presentation/view/widgets/handel_network_image.dart';

class NewsViewDetails extends StatelessWidget {
  const NewsViewDetails({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                HandelNetworkImage(
                  borderRadius: 0,
                  imageUrl: article.urlToImage ?? '',
                  height: 316.h,
                  width: double.infinity,
                  boxFit: BoxFit.fill,
                ),
                Positioned(
                  top: 40.h,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 16.w),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.gray,
                        size: 30.sp,
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 210.h,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(32.r),
                        right: Radius.circular(32.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HeightSpace(24),
                        Text(
                          article.title,
                          style: AppTextStyles.subtitle,
                          textAlign: TextAlign.start,
                        ),
                        const HeightSpace(16),
                        Text(
                          "${article.author ?? "Unknown"} · ${article.publishedAt}",
                          style: AppTextStyles.gray12w400,
                        ),
                        const HeightSpace(24),
                        Text(
                          article.content ?? '',
                          style: AppTextStyles.black16w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
