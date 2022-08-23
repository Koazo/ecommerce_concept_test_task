// import 'package:flutter/material.dart';

// Widget bestSellerGrid(BuildContext context) {
//   return FutureBuilder<Phones>(
//     future: phones,
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) {
//         return const Center(
//           child: CircularProgressIndicator(
//             color: Color(0xffff6e4e),
//           ),
//         );
//       } else {
//         return GridView.count(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           crossAxisCount: 2,
//           childAspectRatio: 1 / 1.5,
//           crossAxisSpacing: 20.0,
//           mainAxisSpacing: 10,
//           padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//           children: List.generate(snapshot.data!.bestSeller!.length, (index) {
//             return Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10),
//                 ),
//                 color: Colors.white,
//               ),
//               child: InkWell(
//                 onTap: () {
//                   setState(() {
//                     Navigator.pushNamed(context, '/detail_page');
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Column(
//                     children: [
//                       Stack(
//                         children: [
//                           Image.network(
//                             snapshot.data!.bestSeller![index].picture!,
//                             height: 150,
//                             fit: BoxFit.contain,
//                           ),
//                           Align(
//                             alignment: const Alignment(1.5, 1),
//                             child: RawMaterialButton(
//                                 elevation: 2.0,
//                                 fillColor: Colors.white,
//                                 padding: const EdgeInsets.all(5.0),
//                                 shape: const CircleBorder(),
//                                 onPressed: () {
//                                   setState(() {
//                                     _currentIndex = index;
//                                     _favoriteItem = !_favoriteItem;
//                                   });
//                                 },
//                                 child: _currentIndex == index && _favoriteItem
//                                     ? const Icon(Icons.favorite)
//                                     : const Icon(Icons.favorite_border)),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             top: 8.0, right: 8.0, bottom: 8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               '\$${snapshot.data!.bestSeller![index].priceWithoutDiscount}',
//                               style: const TextStyle(
//                                 fontFamily: 'MarkProBold',
//                                 fontSize: 20,
//                               ),
//                             ),
//                             Text(
//                               '\$${snapshot.data!.bestSeller![index].discountPrice}',
//                               style: const TextStyle(
//                                   fontFamily: 'MarkProBold',
//                                   fontSize: 14,
//                                   decoration: TextDecoration.lineThrough,
//                                   color: Color(0xFFCCCCCC)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           snapshot.data!.bestSeller![index].title!,
//                           style: const TextStyle(
//                             fontFamily: 'MarkPro',
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//         );
//       }
//     },
//   );
// }
