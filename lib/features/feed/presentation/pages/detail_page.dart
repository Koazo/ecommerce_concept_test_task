import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/detail_page_widgets/custom_app_bar.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/detail_page_widgets/detail_page_content.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/detail_page_widgets/detail_page_view.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: const [
          DetailPageView(),
          SizedBox(height: 10),
          DetailPageContent(),
        ],
      ),
    );
  }
}
