import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSeller extends StatefulWidget {
  const BestSeller({Key? key}) : super(key: key);

  @override
  State<BestSeller> createState() => _BestSellerState();
}

class _BestSellerState extends State<BestSeller> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhonesListCubit, PhonesState>(
      builder: (context, state) {
        PhoneEntity phones = const PhoneEntity(homeStore: [], bestSeller: []);
        if (state is PhonesLoading) {
          return _loadingIndicator();
        } else if (state is PhonesLoaded) {
          phones = state.phonesList;
        } else {
          return _loadingIndicator();
        }
        return GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          shrinkWrap: true,
          childAspectRatio: 1 / 1.3,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 10,
          children: List.generate(phones.bestSeller.length, (index) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/detail_page');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            phones.bestSeller[index].picture,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                          Align(
                            alignment: const Alignment(1.5, 1),
                            child: RawMaterialButton(
                                elevation: 2.0,
                                fillColor: Colors.white,
                                padding: const EdgeInsets.all(5.0),
                                shape: const CircleBorder(),
                                onPressed: () {},
                                child: phones.bestSeller[index].isFavorites
                                    ? const Icon(Icons.favorite)
                                    : const Icon(Icons.favorite_border)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '\$${phones.bestSeller[index].priceWithoutDiscount}',
                              style: const TextStyle(
                                fontFamily: 'MarkProBold',
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              '\$${phones.bestSeller[index].discountPrice}',
                              style: const TextStyle(
                                  fontFamily: 'MarkProBold',
                                  fontSize: 14,
                                  decoration: TextDecoration.lineThrough,
                                  color: Color(0xFFCCCCCC)),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          phones.bestSeller[index].title,
                          style: const TextStyle(
                            fontFamily: 'MarkPro',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
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


// PageView.builder(
//           itemCount: phones.homeStore.length,
//           pageSnapping: true,
//           controller: _pageController,
//           onPageChanged: (page) {
//             setState(() {
//               activePage = page;
//             });
//           },
//           itemBuilder: (context, pagePosition) {
//             return Stack(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(left: 10, right: 10),
//                   width: MediaQuery.of(context).size.width,
//                   height: 182,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.network(
//                       phones.homeStore[pagePosition].picture,
//                       fit: BoxFit.cover,
//                       alignment: FractionalOffset.topCenter,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );