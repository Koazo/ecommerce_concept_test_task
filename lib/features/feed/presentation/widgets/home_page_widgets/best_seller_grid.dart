// import 'package:ecommerce_concept/common/constants/app_colors.dart';
// import 'package:ecommerce_concept/features/feed/domain/entities/phone_entity.dart';
// import 'package:ecommerce_concept/features/feed/presentation/bloc/phone_list_cubit/phone_list_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BestSellerGrid extends StatefulWidget {
//   const BestSellerGrid({Key? key}) : super(key: key);

//   @override
//   State<BestSellerGrid> createState() => _BestSellerGridState();
// }

// class _BestSellerGridState extends State<BestSellerGrid> {
//   int? _currentIndex;
//   bool _favoriteItem = false;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(builder: ((context, state) {
//       PhoneEntity phones = const PhoneEntity(homeStore: [], bestSeller: []);
//       if (state is PhonesLoading) {
//         return _loadingIndicator();
//       } else if (state is PhonesLoaded) {
//         phones = state.phonesList;
//       }
//       return GridView.count(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         crossAxisCount: 2,
//         childAspectRatio: 1 / 1.5,
//         crossAxisSpacing: 20.0,
//         mainAxisSpacing: 10,
//         padding:
//             const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
//         children: List.generate(phones.bestSeller.length, (index) {
//           return Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               color: Colors.white,
//             ),
//             child: InkWell(
//               onTap: () {
//                 //Navigator.pushNamed(context, '/detail_page');
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Column(
//                   children: [
//                     Stack(
//                       children: [
//                         Image.network(
//                           phones.bestSeller[index].picture,
//                           height: 150,
//                           fit: BoxFit.contain,
//                         ),
//                         Align(
//                           alignment: const Alignment(1.5, 1),
//                           child: RawMaterialButton(
//                               elevation: 2.0,
//                               fillColor: Colors.white,
//                               padding: const EdgeInsets.all(5.0),
//                               shape: const CircleBorder(),
//                               onPressed: () {
//                                 _currentIndex = index;
//                                 _favoriteItem = !_favoriteItem;
//                               },
//                               child: _currentIndex == index && _favoriteItem
//                                   ? const Icon(Icons.favorite)
//                                   : const Icon(Icons.favorite_border)),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 8.0, right: 8.0, bottom: 8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             '\$${phones.bestSeller[index].priceWithoutDiscount}',
//                             style: const TextStyle(
//                               fontFamily: 'MarkProBold',
//                               fontSize: 20,
//                             ),
//                           ),
//                           Text(
//                             '\$${phones.bestSeller[index].discountPrice}',
//                             style: const TextStyle(
//                                 fontFamily: 'MarkProBold',
//                                 fontSize: 14,
//                                 decoration: TextDecoration.lineThrough,
//                                 color: Color(0xFFCCCCCC)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         phones.bestSeller[index].title,
//                         style: const TextStyle(
//                           fontFamily: 'MarkPro',
//                           fontSize: 12,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//       );
//     }));
//   }

//   Widget _loadingIndicator() {
//     return const Center(
//       child: CircularProgressIndicator(
//         color: AppColors.mainOrange,
//       ),
//     );
//   }
// }

// // Widget bestSellerGrid(BuildContext context) {
// //   return FutureBuilder<Phones>(
// //     future: phones,
// //     builder: (context, snapshot) {
// //       if (!snapshot.hasData) {
// //         return const Center(
// //           child: CircularProgressIndicator(
// //             color: Color(0xffff6e4e),
// //           ),
// //         );
// //       } else {
// //         return GridView.count(
// //           physics: const NeverScrollableScrollPhysics(),
// //           shrinkWrap: true,
// //           crossAxisCount: 2,
// //           childAspectRatio: 1 / 1.5,
// //           crossAxisSpacing: 20.0,
// //           mainAxisSpacing: 10,
// //           padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
// //           children: List.generate(snapshot.data!.bestSeller!.length, (index) {
// //             return Container(
// //               decoration: const BoxDecoration(
// //                 borderRadius: BorderRadius.all(
// //                   Radius.circular(10),
// //                 ),
// //                 color: Colors.white,
// //               ),
// //               child: InkWell(
// //                 onTap: () {
// //                   setState(() {
// //                     Navigator.pushNamed(context, '/detail_page');
// //                   });
// //                 },
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(left: 10),
// //                   child: Column(
// //                     children: [
// //                       Stack(
// //                         children: [
// //                           Image.network(
// //                             snapshot.data!.bestSeller![index].picture!,
// //                             height: 150,
// //                             fit: BoxFit.contain,
// //                           ),
// //                           Align(
// //                             alignment: const Alignment(1.5, 1),
// //                             child: RawMaterialButton(
// //                                 elevation: 2.0,
// //                                 fillColor: Colors.white,
// //                                 padding: const EdgeInsets.all(5.0),
// //                                 shape: const CircleBorder(),
// //                                 onPressed: () {
// //                                   setState(() {
// //                                     _currentIndex = index;
// //                                     _favoriteItem = !_favoriteItem;
// //                                   });
// //                                 },
// //                                 child: _currentIndex == index && _favoriteItem
// //                                     ? const Icon(Icons.favorite)
// //                                     : const Icon(Icons.favorite_border)),
// //                           ),
// //                         ],
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(
// //                             top: 8.0, right: 8.0, bottom: 8.0),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               '\$${snapshot.data!.bestSeller![index].priceWithoutDiscount}',
// //                               style: const TextStyle(
// //                                 fontFamily: 'MarkProBold',
// //                                 fontSize: 20,
// //                               ),
// //                             ),
// //                             Text(
// //                               '\$${snapshot.data!.bestSeller![index].discountPrice}',
// //                               style: const TextStyle(
// //                                   fontFamily: 'MarkProBold',
// //                                   fontSize: 14,
// //                                   decoration: TextDecoration.lineThrough,
// //                                   color: Color(0xFFCCCCCC)),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Align(
// //                         alignment: Alignment.centerLeft,
// //                         child: Text(
// //                           snapshot.data!.bestSeller![index].title!,
// //                           style: const TextStyle(
// //                             fontFamily: 'MarkPro',
// //                             fontSize: 12,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           }),
// //         );
// //       }
// //     },
// //   );
// // }
