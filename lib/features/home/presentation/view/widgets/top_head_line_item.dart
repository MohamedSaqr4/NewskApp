import 'package:flutter/material.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacer.dart';
import 'package:news_app/features/home/presentation/view/widgets/handel_network_image.dart';

class TopHeadLineItem extends StatelessWidget {
  const TopHeadLineItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.date,
    required this.title, this.onTap,
  });
  final String imageUrl;
  final String title;
  final String name;
  final String date;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HandelNetworkImage(
              borderRadius: 8,
              imageUrl: imageUrl,
              height: 206,
              width: double.infinity),
          const HeightSpace(16),
          Text(
            title,
            style: AppTextStyles.subtitle,
          ),
          const HeightSpace(12),
          Text(
            "$name . $date",
            style: AppTextStyles.gray12w400,
          ),
          const HeightSpace(16),
        ],
      ),
    );
  }
}
