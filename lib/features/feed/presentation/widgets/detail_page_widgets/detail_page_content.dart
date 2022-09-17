import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/detail_info_entity.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/detail_info_cubit/detail_info_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/detail_info_cubit/detail_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPageContent extends StatefulWidget {
  const DetailPageContent({super.key});

  @override
  State<DetailPageContent> createState() => _DetailPageContentState();
}

class _DetailPageContentState extends State<DetailPageContent>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 3,
      vsync: this,
    );
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
        return Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 20,
                  ),
                  child: Row(
                    children: [
                      Text(
                        detailInfo.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF010035),
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: Icon(
                              detailInfo.isFavorites
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.redAccent,
                              size: 18,
                            )),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: const Color(0xFFFF6E4E),
                    tabs: const [
                      Tab(
                        child: Text(
                          'Shop',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'MarkProBold',
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Features',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.memory,
                                  color: Color(0xFFB7B7B7),
                                  size: 28,
                                ),
                                Text(
                                  detailInfo.cPU,
                                  style: const TextStyle(
                                      color: Color(0xFFB7B7B7), fontSize: 11),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Color(0xFFB7B7B7),
                                  size: 28,
                                ),
                                Text(
                                  detailInfo.camera,
                                  style: const TextStyle(
                                      color: Color(0xFFB7B7B7), fontSize: 11),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.memory_outlined,
                                  color: Color(0xFFB7B7B7),
                                  size: 28,
                                ),
                                Text(
                                  detailInfo.ssd,
                                  style: const TextStyle(
                                      color: Color(0xFFB7B7B7), fontSize: 11),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.sd_card_outlined,
                                  color: Color(0xFFB7B7B7),
                                  size: 28,
                                ),
                                Text(
                                  detailInfo.sd,
                                  style: const TextStyle(
                                      color: Color(0xFFB7B7B7), fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Soon',
                          style:
                              TextStyle(fontSize: 30, color: Color(0xFFB7B7B7)),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Soon',
                          style:
                              TextStyle(fontSize: 30, color: Color(0xFFB7B7B7)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 145,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          'Select color and capacity',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        child: Row(
                          children: [
                            Container(
                              height: 39.29,
                              width: 39.29,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: HexColor(detailInfo.color[0])),
                              child: const Icon(
                                Icons.check_rounded,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            Container(
                              height: 39.29,
                              width: 39.29,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: HexColor(detailInfo.color[1]),
                              ),
                            ),
                            const SizedBox(
                              width: 95,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xffff6e4e))),
                              child: Text(detailInfo.capacity[0] + ' GB'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              detailInfo.capacity[1] + ' GB',
                              style: const TextStyle(color: Color(0xFF8D8D8D)),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: 335,
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xffff6e4e))),
                            child: Text(
                              'Add to Cart                 \$${detailInfo.price}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'MarkProBold',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
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

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

typedef RatingChangeCallback = void Function(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
      );
    }
    return InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
