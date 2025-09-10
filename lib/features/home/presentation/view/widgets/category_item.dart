import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryName, this.onTap});

  final String categoryName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(56.r),
      focusColor: AppColors.lavender,
      child: Container(
        margin: EdgeInsetsDirectional.only(end: 12.w),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lavender, width: 1.sp),
          borderRadius: BorderRadius.circular(56.r),
        ),
        child: Text(
          categoryName.tr(),
          style: AppTextStyles.subtitle.copyWith(fontSize: 14.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
