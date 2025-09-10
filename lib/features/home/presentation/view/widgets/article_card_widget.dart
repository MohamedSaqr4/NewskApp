import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacer.dart';
import 'package:news_app/features/home/presentation/view/widgets/handel_network_image.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.title,
    this.onTap,
  });
  final String imageUrl;
  final String title;
  final String name;
  final String date;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 238.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const HeightSpace(1),
                    Text(
                      "$name . $date",
                      style: AppTextStyles.gray12w400,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              HandelNetworkImage(
                  borderRadius: 8, imageUrl: imageUrl, height: 80, width: 112),
            ],
          ),
        ),
      ),
    );
  }
}
