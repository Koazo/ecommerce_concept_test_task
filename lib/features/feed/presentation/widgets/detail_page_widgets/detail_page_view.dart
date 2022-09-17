import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/detail_info_cubit/detail_info_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/detail_info_cubit/detail_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageView extends StatefulWidget {
  const DetailPageView({super.key});

  @override
  State<DetailPageView> createState() => _DetailPageViewState();
}

class _DetailPageViewState extends State<DetailPageView> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 999);
  }

  late PageController _pageController;
  int activePage = 999;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailInfoCubit, DetailInfoState>(
      builder: (context, state) {
        DetailInfoEntity detailInfo = const DetailInfoEntity(
            cPU: '',
            camera: '',
            capacity: [],
            color: [],
            id: '',
            images: [],
            isFavorites: true,
            price: 1,
            rating: 1,
            sd: '',
            ssd: '',
            title: '');
        if (state is DetailInfoLoading) {
          return _loadingIndicator();
        } else if (state is DetailInfoLoaded) {
          detailInfo = state.detailInfo;
        } else {
          return _loadingIndicator();
        }
        return SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            pageSnapping: true,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == activePage;
              return slider(detailInfo.images, pagePosition, active,
                  detailInfo.images.length);
            },
          ),
        );
      },
    );
  }

  Widget slider(images, pagePosition, active, length) {
    double margin = active ? 10 : 40;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(2, 4),
          )
        ],
        image: DecorationImage(
            image: NetworkImage(
              images[pagePosition % length],
            ),
            fit: BoxFit.fill),
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.mainOrange,
      ),
    );
  }
}
