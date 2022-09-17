import 'package:ecommerce_concept/common/constants/app_colors.dart';
import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_cubit.dart';
import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotSalesCarousel extends StatefulWidget {
  const HotSalesCarousel({Key? key}) : super(key: key);

  @override
  State<HotSalesCarousel> createState() => _HotSalesCarouselState();
}

class _HotSalesCarouselState extends State<HotSalesCarousel> {
  late PageController _pageController;
  int activePage = 1;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1);
    super.initState();
  }

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
        return SizedBox(
          height: 182,
          child: PageView.builder(
            itemCount: phones.homeStore.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                activePage = page;
              });
            },
            itemBuilder: (context, pagePosition) {
              return Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 182,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        phones.homeStore[pagePosition].picture,
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                  pagePosition != 1
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 35,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              phones.homeStore[pagePosition].isNew
                                  ? Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color(0xFFFF6E4E),
                                      ),
                                      height: 40,
                                      width: 40,
                                      child: const Center(
                                        child: Text(
                                          'New',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontFamily: 'MarkProBold',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 40,
                                    ),
                              const SizedBox(
                                height: 13,
                              ),
                              Text(
                                phones.homeStore[pagePosition].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'MarkProBold'),
                              ),
                              Text(
                                phones.homeStore[pagePosition].subtitle,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.only(left: 30, right: 30),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Buy now!',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'MarkProBold',
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 35, bottom: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.only(left: 30, right: 30),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Buy now!',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'MarkProBold',
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              );
            },
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

// Widget hotSalesCarousel() {
//   return SizedBox(
//     height: 182,
//     child: FutureBuilder<Phones>(
//       future: phones,
//       builder: (context, snapshot) {
//         return PageView.builder(
//           itemCount: images.length,
//           pageSnapping: true,
//           controller: _pageController,
//           onPageChanged: (page) {
//             setState(() {
//               activePage = page;
//             });
//           },
//           itemBuilder: (context, pagePosition) {
//             late bool isNew;
//             if (snapshot.data?.homeStore?[pagePosition].isNew == null) {
//               isNew = false;
//             } else {
//               isNew = snapshot.data!.homeStore![pagePosition].isNew!;
//             }
//             if (!snapshot.hasData) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Color(0xffff6e4e),
//                 ),
//               );
//             } else {
//               return Stack(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 10, right: 10),
//                     width: MediaQuery.of(context).size.width,
//                     height: 182,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.network(
//                         snapshot.data!.homeStore![pagePosition].picture!,
//                         fit: BoxFit.cover,
//                         alignment: FractionalOffset.topCenter,
//                       ),
//                     ),
//                   ),
//                   pagePosition != 1
//                       ? Padding(
//                           padding: const EdgeInsets.only(
//                             top: 10,
//                             left: 35,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               isNew
//                                   ? Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(50),
//                                         color: const Color(0xFFFF6E4E),
//                                       ),
//                                       height: 40,
//                                       width: 40,
//                                       child: const Center(
//                                         child: Text(
//                                           'New',
//                                           style: TextStyle(
//                                             decoration:
//                                                 TextDecoration.underline,
//                                             fontFamily: 'MarkProBold',
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   : const SizedBox(
//                                       height: 40,
//                                     ),
//                               const SizedBox(
//                                 height: 13,
//                               ),
//                               Text(
//                                 snapshot.data!.homeStore![pagePosition].title!,
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 25,
//                                     fontFamily: 'MarkProBold'),
//                               ),
//                               Text(
//                                 snapshot
//                                     .data!.homeStore![pagePosition].subtitle!,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 11,
//                                 ),
//                               ),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   padding:
//                                       MaterialStateProperty.all<EdgeInsets>(
//                                     const EdgeInsets.only(left: 30, right: 30),
//                                   ),
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Buy now!',
//                                   style: TextStyle(
//                                       fontSize: 13,
//                                       fontFamily: 'MarkProBold',
//                                       color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       : Padding(
//                           padding: const EdgeInsets.only(
//                               top: 10, left: 35, bottom: 5),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   padding:
//                                       MaterialStateProperty.all<EdgeInsets>(
//                                     const EdgeInsets.only(left: 30, right: 30),
//                                   ),
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Buy now!',
//                                   style: TextStyle(
//                                       fontSize: 13,
//                                       fontFamily: 'MarkProBold',
//                                       color: Colors.black),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                 ],
//               );
//             }
//           },
//         );
//       },
//     ),
//   );
// }
