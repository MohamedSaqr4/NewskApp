import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_colors.dart';

class HandelNetworkImage extends StatelessWidget {
  const HandelNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width, required this.borderRadius, this.boxFit,

  });

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          height: height.h,
          width: width.w,
          color: AppColors.lavender,
          child: const Icon(
            Icons.image_not_supported,
            size: 60,
            color: AppColors.red,
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: height.h,
        width: width.w,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          height: height.h,
          width: width.w,
          color: Colors.grey,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.lavender,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height.h,
          width: width.w,
          color: AppColors.lavender,
          child: const Icon(
            Icons.image_not_supported,
            size: 60,
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
