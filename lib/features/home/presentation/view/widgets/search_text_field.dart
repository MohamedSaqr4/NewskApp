import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/app_routes.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          showTextField
              ? CustomTextFormField(
                  width: 230.w,
                  hintText: 'Search'.tr(),
                  onFieldSubmitted: (value) {
                    if (value.isNotEmpty) {
                      context.push(
                        AppRoutes.searcResultView,
                        extra: value,
                      );
                      setState(() {
                        showTextField = false;
                      });
                    }
                  },
                )
              : const SizedBox.shrink(),
          IconButton(
            onPressed: () {
              setState(() {
                showTextField = !showTextField;
              });
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
