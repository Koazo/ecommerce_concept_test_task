import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/categories.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/custom_app_bar.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/custom_navigation_bar.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/hot_sales_carousel.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/best_seller.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/ui/best_seller_ui.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/ui/hotsales_ui.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/ui/search_ui.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/shop_filter.dart';
import 'package:ecommerce_concept/features/feed/presentation/widgets/home_page_widgets/ui/select_categories_ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar([ShopFilter(context: context)]),
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: const CustomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            selectCategoriesUI(),
            const Categories(),
            searchUI(),
            hotSalesUI(),
            const HotSalesCarousel(),
            bestSellerUI(),
            const BestSeller(),

            //BestSellerGrid(),
          ],
        ),
      ),
    );
  }
}
